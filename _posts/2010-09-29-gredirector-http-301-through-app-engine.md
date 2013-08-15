---
layout: post
author: detro
published: true
title: "gredirector - 'HTTP 301' through App Engine"
tags: [code, http, script, python, github, source, memcache, permanent, url, redirection, appengine]
date: "2010-09-29 00:00:29"
updated: "2010-09-29 00:00:29"
permalink: /2010/09/29/gredirector---HTTP-301-through-App-Engine
---

When I decided to [migrate to this new blog](http://blog.ivandemarino.me/2010/08/30/Hello-World-again) I was confronted by a very important issue: how do I make sure that the (already modest) traffic going to `http://www.detronizator.org/*` would be redirected to this new URL?

<div style="text-align: center; margin: 10px; ">
<img src="http://www.hellboundbloggers.com/wp-content/uploads/2009/05/301-Redirection.jpg" title="301 Redirection" />
<br />
_301 Redirection_
</div>

I started searching and I found [this article by Danny Tuppeny](http://blog.dantup.com/2010/01/generic-redirection-script-for-google-app-engine) on how to use a [Google App Engine](http://code.google.com/appengine/) application to do the trick.

So, what I did was to take his code and started putting it in place for me at [http://redirector.ivandemarino.me](http://redirector.ivandemarino.me). But because I'm a Software Developer that likes to make elegant stuff, I noticed that quite few things were missing:

* It didn't use any **[Memcache](http://memcached.org/)**, so Destination URL were _always_ regenerated
* **Logging** was poor
* Was not really configurable
* Destination URL were not Checked (i.e. _test if it exists_) before Redirection

### Introducing `gredirector`
[gredirector](http://github.com/detro/gredirector) is an App Engine project that lets you set up your personal **HTTP Redirect HUB**, with a lot of emphasys on:

* Speed
* Configurability (but it could be pushed a even more)
* Logging

It's a very very simple application, but I think serves well it's purpose. See here the main code:


```python
# /main.py
# ...
# Main Request Handler
class MainHandler(webapp.RequestHandler):
   def get(self):
      # Perform redirect
      url = get_redirect_url(self.request.url);

      # Check that we were able to build a URL and that this URL actually exists
      if url and (check_url_exists(url) if config.CHECK_URL_EXISTANCE else True):
         logging.info("Redirecting URL '%s' to URL '%s'" % (self.request.url, url) );
         self.redirect(url, permanent=True);
      else:
         # Log that we didn't know what this was, and redirect to a good default
         logging.error("Unable to Redirect URL '%s'" % (self.request.url) );
         if config.ERROR_EMAIL_ACTIVE:
            mail.send_mail_to_admins(
               sender=config.ERROR_EMAIL_SENDER,
               subject=config.ERROR_EMAIL_SUBJECT,
               body=config.ERROR_EMAIL_BODY + self.request.url
            );
         self.redirect(config.DEFAULT_URL, permanent=True);
# ...
```


As you can see, it works in few simple steps:

1. Generate a Destination URL
2. If it's Valid and it Exists (optional) do 3. else 4.
3. Redirect
4. Log error and redirect to Default URL

#### URL generation
To generate the URL, it uses the mapping from the `config.py` file. Here is a portion of an example configuration:


```python
# /config.py
# ...
# Default URL: if no Redirect URL can be generated, traffic will be diverted here
DEFAULT_URL = 'http://default.new-domain.com/'

# Mapping of Source URLs to Target URLs.
# You can choose to map in 2 ways:
#    1) to the new URL maintaining the same Path (i.e. 'www.old.com/p/a/t/h/index.html -> www.new.com/p/a/t/h/index.html')
#    2) or to discard the Path (i.e. 'www.old.com/p/a/t/h/index.html -> www.new.com')
# Format:
#    URLS = { 'Old Domain': ('New Domain', 'Discard URL Path part and Redirect to Root?'), ... }
URLS = {
   '%s.appspot.com' % (os.environ['APPLICATION_ID']) : ('www.new-domain.com', False),
   'www.old-domain.com' : ('www.new-domain.com', False),
	'downloads.old-domain.com': ('downloads.new-domain.com', False),
	'stuff.old-domain.com': ('stuff.new-domain.com', True),
};
# ...
```


The code that actually generates the URL is:


```python
# /main.py
# ...
# Generates the URL to redirect to
def get_redirect_url(url):
   # Search the Memcache
   memcachekey = "get_redirect_url-" + url;
   result = memcache.get(memcachekey) if config.MEMCACHE_ACTIVE else None;
   
   # Nothing in Memcache
   if ( result == None ):
      logging.debug("Redirect for URL '%s' not in Memcache" % (url) );
      scheme, netloc, path, query, fragment = urlparse.urlsplit(url);
	
      # Discard any port number from the hostname
      netloc = netloc.split(':', 1)[0];
	
   	# Fix empty paths to be just '/' for consistency
      if path == '':
         path = '/';
	
   	# Check if we have a mapping for this domain
      if netloc in config.URLS:
         # Grab the redirect info tuple
         redirect_info = config.URLS[netloc];
         # Root redirects
         if redirect_info[1]:
            result = 'http://' + redirect_info[0] + '/';
            logging.debug("Redirecting to Root: " + result);
         # Paths
         else:
            result = urlparse.urlunsplit(['http', redirect_info[0], path, query, fragment]);
            logging.debug("Redirecting to Precise Path: " + result);
      # No mapping, so return None
      else:
         logging.debug("No Mapping found for: " + url);
         result = None;
   	
      # Store the result in Memcache for config.MEMCACHE_EXPIRES_IN_SECONDS
      memcache.set(memcachekey, result, time=config.MEMCACHE_EXPIRES_IN_SECONDS);

   return result;
# ...
```


As you can see, the results are stored in Memcache and reused until expired. A **major speed improvement** if you ask me.

#### How do you check the URL?

Yes, I also said that I added a check to see if a Destination URL actually exists, before serving the Redirect. Well, App Engine provides a very nice package, `google.appengine.api.urlfetch`, and I used it this way:


```python
# /main.py
# ...
# Check if a URL exists, trying a URL Fetch
def check_url_exists(url):
   # Search the Memcache
   memcachekey = "check_url_exists-" + url;
   result = memcache.get(memcachekey) if config.MEMCACHE_ACTIVE else None;
   
   # Nothing in Memcache
   if ( result == None ):
      logging.debug("Existence of URL '%s' not in Memcache" % (url) );
      try:
         response = urlfetch.fetch(url, allow_truncated=True, deadline=10); # Wait as much as possible: 10 sec
         if ( response.status_code == 200 ):
            logging.debug("Verified URL '%s' existence" % (url));
            result = True;
         else:
            logging.error("Unable to Verify URL '%s' existence" % (url));
            result = False;
      except:
         # In case of InvalidURLError or DownloadError
         logging.error("Exception while Verifying URL '%s' existence" % (url));
         result = False;
      
      # Store the result in Memcache for config.MEMCACHE_EXPIRES_IN_SECONDS
      memcache.set(memcachekey, result, time=config.MEMCACHE_EXPIRES_IN_SECONDS);
   
   return result;
# ...
```


### Try it out
This is an App Engine application, so just clone/fork it from [http://github.com/detro/gredirector](http://github.com/detro/gredirector), personalize the `config.py` and push it out on. If you are not a complete newbie to App Engine, it should be really really simple.

301 Happy Redirecting ;-).
