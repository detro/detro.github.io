---
layout: post
author: detro
published: true
title: "Minification and Templating for Bloggart"
tags: [fork, minification, github, features, blog, line numbers, new, commit, bloggart, templating]
date: "2010-11-26 15:47:53"
updated: "2010-11-26 15:53:23"
permalink: /2010/11/26/Minification-and-Templating-for-Bloggart
---

I'm sick home, but I can't just sit in bed. It's not how I work: I need to do something. So, I decided to give some love to Bloggart and put into proper code some features [I already said](http://blog.ivandemarino.me/2010/11/25/Too-busy-to-blog) I wanted to add.

<div style="text-align: center; margin: 10px;" class="img">
<img src="http://www.greatescapecars.co.uk/images/library/images/Mini01.JPG" />
</div>

I just committed on [my Bloggart fork](https://github.com/detro/bloggart/commits/master) quite a list of things:

* Support for JS and CSS 'Minification' (no obfuscation though)
* Support for JS and CSS 'Templating' (i.e. Being able to use App Engine Djiango Template grammar into JS and CSS files)
* Support for JS and CSS 'Memcaching'
* Show line numbers for '&lt;pre&gt;sourcecode&lt;/pre&gt;' areas in posts

Even though this is simple stuff, two of them stand out I think: **Minification and Templating**. Why? Because even if those are not complex or new, they speed Bloggart up even more! Let me spend a couple of words on it, so that it can be useful for you, even if you are not planning to use Bloggart.

### How I implemented Minification and Templating in Bloggart

The magic is made of 3 parts. First, a new URL handler in the [app.yaml](https://github.com/detro/bloggart/blob/master/app.yaml) file:


```yaml
# ...
- url: /.*\.(css|js)
  script: minifier.py

- url: /static/([^/]+)/(.*)
  static_files: themes/\1/static/\2
  upload: themes/[^/]+/static/.*
# ...
```


This routes requests to CSS and JS files to a new Request Handler, [minifier.py](https://github.com/detro/bloggart/blob/master/minifier.py):


```python
# ...
class CssMinifier( webapp.RequestHandler ):      
   def get( self, requestedCssFilename ):
      cssPath = os.path.join( os.path.dirname( __file__ ), 'themes/%s/%s' % (config.theme, requestedCssFilename) );
      if ( not os.path.exists(cssPath) ):
         util.setErrorResponse(self, 404);
         return;
      
      cssRenderingResult = None;
      if ( config.memcaching ):
         cssRenderingResult = memcache.get(cssPath);
      
      if ( cssRenderingResult is None ):      
         cssRenderingResult = template.render(cssPath, { 'config' : config });

         if ( config.logging_level != logging.DEBUG ):
            cssRenderingResult = cssmin.minify(cssRenderingResult);
         
         memcache.set(cssPath, cssRenderingResult);
         
      self.response.headers['Content-Type'] = 'text/css'
      self.response.out.write( cssRenderingResult );

class JSMinifier( webapp.RequestHandler ):      
   def get( self, requestedJsFilename ):
      jsPath = os.path.join( os.path.dirname( __file__ ), 'themes/%s/%s' % (config.theme, requestedJsFilename) );
      if ( not os.path.exists(jsPath) ):
         util.setErrorResponse(self, 404);
         return;
      
      jsRenderingResult = None;
      if ( config.memcaching ):
         jsRenderingResult = memcache.get(jsPath);
      
      if ( jsRenderingResult is None ):         
         jsRenderingResult = template.render(jsPath, { 'config' : config });

         if ( config.logging_level != logging.DEBUG ):
            jsRenderingResult = jsmin.jsmin(jsRenderingResult);
         
         memcache.set(jsPath, jsRenderingResult);
         
      self.response.headers['Content-Type'] = 'application/javascript'
      self.response.out.write( jsRenderingResult );

application = webapp.WSGIApplication([
                                      ( '(/.*\.js)$', JSMinifier ),
                                      ( '(/.*\.css)$', CssMinifier )
                                      ], debug=True )
# ...
```


The minification is done using a couple of libraries that I'll mention in a second. Templating is transparently applied **BEFORE Minification**, so that the Theme developer (me most probably) can use code like the following to Bundle JS and CSS in as less HTTP Requests as possible:


```
/* CSS code... */
{ % include "another_file.css" % }
/* more CSS code */
```


The actual business logic for the minification is done by [lib/cssmin.py](https://github.com/detro/bloggart/blob/master/lib/cssmin.py) and [lib/jsmin.py from Douglas Crockford](https://github.com/detro/bloggart/blob/master/lib/jsmin.py).

If you are a Python App Engine developer, I hope you find useful this _simple-yet-effectiv_e technique.


