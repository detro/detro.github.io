---
layout: post
author: detro
published: true
title: "From Wordpress to Bloggart"
tags: [code, python, blog, export, migration, wordpress, bloggart, appengine, opensource]
date: "2010-10-11 22:32:25"
updated: "2010-10-11 22:32:25"
permalink: /2010/10/12/From-Wordpress-to-Bloggart
---

This post has been in my "TODO list" long enough. It's time to put it in words.
Let's go!

As you probably know, [I decided to give up Wordpress.org](http://blog.ivandemarino.me/2010/08/30/Hello-World-again)
in favour of [Bloggart on App Engine](http://github.com/detro/bloggart). A great choice so far I must say.

<div style="text-align: center; ">
<img src="http://farm4.static.flickr.com/3646/3482243965_02d4129590_b.jpg" alt="Migration" style="width: 500px; "/>
<br />
<em>Migration, a proper one</em>
</div>

### What I wanted to achieve
My aim was to migrate more than 6 years of content (posts _and_ comments) from my previous blog at **detronizator.org** into a bloggart installation.
Why bloggart? [Nick Johnson](http://blog.notdot.net/), the original author of Bloggart on Appengine,
wrote [a series of article](http://blog.notdot.net/2009/10/Writing-a-blog-system-on-App-Engine)
on how to build a nice, little, smart blogging app on App Engine.
At the same time, work on [txty.mobi](http://www.txty.mobi) started to get more and more engaging,
making me a lover (and advocate) of [Google App Engine](code.google.com/appengine/).
Plus, I was interested in "starting from scratch": [Wordpress.org](http://www.wordpress.org)
is a great project, but I just didn't feel it _"mine enough"_. My blog must feel really _mine_:
it's about me after all.

#### Quick and Easy? Not really...
Migrating all _that shit_ from my previous host was clearly not an easy task. Some reasons were:

* My Wordpress installation was sitting on a [MySQL DB](http://www.mysql.com): App Engine is based on [Google Datastore API](http://code.google.com/appengine/docs/python/datastore/)
* I decided to change domain to _ivandemarino.me_: this needed redirection handling, domain transfer and _trying to look not too fool in crawler's eyes_
* Comments: how the hell am I going to handle those given that Bloggart doesn't provide it but relays on [Disqus](http://disqus.com/)?

It took some planning and step-by-step strategy. What follows is an attempt to do exactly that.

#### So, what's this all about?
This post will be a walk-through of what it got to do the Migration.
It will have some of the characteristics of "classic" howtos, but I won't go too much in details when,
in my opinion, a description of a trivial task will be enough.

Expect some code, some [CLI](http://en.wikipedia.org/wiki/Command-line_interface) instructions,
and make sure that you have at least went through
the ["Getting Started" of App Engine](http://code.google.com/appengine/docs/python/gettingstarted/) before doing this:
I can't cover that as well.

### Step 1: Export your Wordpress Data
Let's start easy. What you want to do is to backup your Wordpress blog. [Here is how](http://codex.wordpress.org/WordPress_Backups).

What we really need, though, is an _"XML Export"_ of the blog. [Matt here explains](http://en.blog.wordpress.com/2006/06/12/xml-import-export/) how to do
exactly that. The result in my case was an enormous (for a personal irrelevant blog like mine) **6MB**! Yes, I write a lot of bulls**t! ;)
The result will be something looking like:


```xml
<rss xmlns:excerpt="http://wordpress.org/export/1.0/excerpt/"
    xmlns:content="http://purl.org/rss/1.0/modules/content/"
    xmlns:wfw="http://wellformedweb.org/CommentAPI/"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:wp="http://wordpress.org/export/1.0/"
    version="2.0">
    <channel>
        <title>Your blog title</title>
        <link>http://www.yourblog.com</link>
        <description>Bla bla bla</description>
        <pubDate>Sun, 30 May 2010 19:15:05 +0000</pubDate>
        <!-- ... more info about your blog ... -->
        <wp:category>
            <wp:category_nicename>cat</wp:category_nicename>
            <wp:category_parent/>
            <wp:cat_name>Category</wp:cat_name>
            <wp:category_description>Category Description</wp:category_description>
        </wp:category>
        <!-- ... more category ... -->
        <wp:tag>
            <wp:tag_slug>movie</wp:tag_slug>
            <wp:tag_name>movie</wp:tag_name>
        </wp:tag>
        <!-- ... more tag ... -->
        <item>
            <title>A blog post</title>
            <link>http://www.yourblog.com/2005/12/13/a-blog-post/</link>
            <pubDate>Tue, 13 Dec 2005 11:10:14 +0000</pubDate>
            <dc:creator><![CDATA[You]]></dc:creator>
            <category><![CDATA[Category]]></category>
            <!-- ... body and other stuff -->
        </item>
        <!-- ... more items/articles ... -->    
```


**Save it somewhere safe**. _Why do we need the XML? Isn't the SQL backup enough?_
No, because Bloggart has a nice tool to import the XML export. More about this later.

### Step 2: Clone, Setup and Deploy the new blog
So, you want to get a nice clean installation of Bloggart in the cloud. Open your CLI and type:

```bash
$ git clone git://github.com/detro/bloggart.git
$ cd bloggart
$ git submodule update --init
```


This will clone the latest master of my branch of Bloggart, where I host all my additions, tweaks and changes to Bloggart.
[Nick's original branch](http://github.com/Arachnid/bloggart) hasn't been updated since June 2010.

Now, edit `app.yaml`'s `application: ` field with your **Application Identifier** that you
just created [here](https://appengine.google.com/start/createapp?) (you did it, right?).
Then, edit the `config.py` following the internal comments/documentation; it should be pretty straightforward.
Bear in mind that there are configuration parameters
that are very much related with UI and stuff like that. But also there are parameters like
the [Google Sitemap](https://www.google.com/webmasters/tools/h)
or Disqus: take care of this stuff properly, otherwise you will get just an half-assed blog.

Take particular care of Disqus: once you create a forum (that will be populated by the comments on your new Blog)
(ah, don't forget to note down the **"Disqus Forum Name"**),
and logged in, you will need to retrieve something important: the **"Disqus User Key"**. To do that, once you logged in Disqus,
go at [http://disqus.com/api/get_my_key/](http://disqus.com/api/get_my_key/), and annotate somewhere the key.
You will need this later on as well.

No, I won't go more in details: if you are not **techy enough** to read the comments in the `config.py` and figure out what to do, why are you even reading this?

Well, now you should be ready to deploy!

```bash
$ cd ..
$ appcfg.py update bloggart
```


If you are not interested in migrating, but just starting a blog, then you are done. Your blog is up-and-running already.
Otherwise, read on.

### Step 3: `migrate.py`
The great thing about Open Source software, is that there is almost always someone that had your problem before and found (or built) a solution.
So that you can _stand on shoulders of Giants_. In this case is [Andi Albrecht](http://blog.andialbrecht.de/) that added support for Wordpress migration
in [migrate.py](http://github.com/detro/bloggart/commits/master/migrate.py). This suited my needs (and will probably suite yours).

Unfortunately though, `migrate.py` doesn't come with a great deal of UI. It's just a set of classes. We will have to fill the gap.
But fortunately Google App Engine is not short of surprises.

#### remote_api
[remote_api](http://code.google.com/appengine/articles/remote_api.html) is a module introduced in 1.1.9 that allows
remote access to the App Engine datastore, using the same APIs you know and love from writing App Engine Apps.
What practically does, is provide a python-console that executes code in the context of your remote Application. Isn't that Great?

This great idea is made of two parts:

* a **"handler"**, which you install on the server to handle remote datastore requests
* a **"stub"**, which you set up on the client to translate datastore requests into calls to the remote handler

We already took care of the "handler", already set up in bloggart. You can create your "stub"
following the instruction [here](http://code.google.com/appengine/articles/remote_api.html), or appreciate
that bloggart ALREADY provides one _ready-to-go_ as well: find it at `bloggart/scripts/remote.py`.

#### ready, set, migrate
We are all set for using `migrate.py`. Run `remote.py` and type:

```python
import migrate;
wpmig = migrate.WordpressMigration(path_to_your_wordpress_export_xml, the_disqus_key, the_disqus_forum_name);
wpmig.migrate_all();
```


This will kick off Deferred Tasks that will store in App Engine your blog posts and in Disqus the associated comments.

#### wait, I'm having a problem here
Yes, what I just described might fail. For sure if you have an _Export XML_ that takes **more than 1MB**.
In fact, the `remote_api` are limited to handle HTTP File Uploads **smaller than 1MB**.

Myself I had a file of **almost 7MB**! How did I do then? I Googled, of course, and found
a nice little script called [choppedpress.py](http://www.ogmaciel.com/?p=993).

This little script does something extremely useful:

> ChoppedPress lets you split the WordPress XML export file into smaller files
> that can be used to import your posts, comments, tags and categories into a
> new WordPress installation.

Use it to split your Wordpress Export XML into chunks (remember, smaller than 1MB). Then run the `remote.py`
and do like:

```python
import migrate;
wpmig = migrate.WordpressMigration(path_to_your_wordpress_export_xml-chunk-01, the_disqus_key, the_disqus_forum_name);
wpmig.migrate_all();

wpmig = migrate.WordpressMigration(path_to_your_wordpress_export_xml-chunk-02, the_disqus_key, the_disqus_forum_name);
wpmig.migrate_all();

wpmig = migrate.WordpressMigration(path_to_your_wordpress_export_xml-chunk-03, the_disqus_key, the_disqus_forum_name);
wpmig.migrate_all();
...
```


### Step 4: `301 Permanent Redirect`
Well, you don't necessarily need this, but it helps if you want to retain some of your old traffic.
Setup a `301 Permanent Redirect` from your old URL to the new one.
Need help for this? Just [Google it](http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=setup+301+permanent+redirect).

But if you want a more fine grained control over the redirect, why don't you give a look
at my little project [gredirector](http://github.com/detro/gredirector)?
More info [here](http://blog.ivandemarino.me/2010/09/29/gredirector---HTTP-301-through-App-Engine).
 
### Conclusion
Well, I'm sure this is a very "poor" how to: it could be definitely improved.
But what would be the point if no one reads it?

Instead, if you find it useful and want to know more or just have questions, don't hesitate to leave a message
here and I'll make sure to answer as quickly as I can. I'll even eventually update the post if I find
that a particular aspect needs clarification: THIS will really help to improve the howto, collectively.

I really want to help people take a look at [Bloggart](http://github.com/detro/bloggart), [Nick's](http://blog.notdot.net/) great idea:
it's probably a very small project, but there are so many interesting
things in it, that it's worth caring (if you are like me). This to say that this post is the first of more
that will be focused on some of the new features I'm adding to bloggart.

_Happy Bloggarting ;)_
