---
layout: post
author: detro
published: true
title: "Bloggart: what's coming"
tags: [upcoming, python, feature, sitemap, bloggart, page, appengine]
date: "2011-01-10 00:45:45"
updated: "2011-01-10 00:45:45"
permalink: /2011/01/10/Bloggart-what-s-coming
---

Dear Bloggart belovers (like there were any out there...), this is a quick update on what's happening with [my Bloggart fork](https://github.com/detro/bloggart). Yes, **fork** - this is now the correct way to calling it.

Initially I was just touching and modelling the software to my personal needs. Now I'm really going in my own direction.

Anyway, let's stay focused. I was here to tell you about a couple of new things that are coming to Bloggart.

# Pages
If there is one thing that I really don't like of Bloggart, is the total absence of **pages** as a type of content. Pages that can be used to serve content like:

* a description of yourself
* a "homepage" for a project
* an "about me" page
* a "curriculum vitae" or "resume" page
* even a hierarchy of pages(!)

and alike.

Yes, structurally we are talking of something **very similar** to a post - but a post has things like "comments", "tags", "links to previous/next" posts and so forth. Maybe I'm too picky (or too old school) (or too _wordpressy_). But that's what I like.

So, I'm adding support for Page content. It's a bit tricky, because Bloggart was designed with Posts in mind, but it's happening.

# A better `sitemap.xml`
[Sitemaps](http://en.wikipedia.org/wiki/Sitemaps) are currently the best way of making your website easy to crawl for search engine, ensuring always a good positioning in search result (given that your content is relevant ;-) ).

The current version of Bloggart generates **a very basic `sitemap.xml`** (you can see mine [here](http://blog.ivandemarino.me/sitemap.xml)). Just the links without any other metadata:


```xml
<?xml version="1.0" encoding="UTF-8"?> 
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"> 
  
    <url> 
      <loc>http://blog.ivandemarino.me/</loc> 
    </url> 
  
    <url> 
      <loc>http://blog.ivandemarino.me/2004/11/15/il-mio-nuovo-blogger-my-new-blogger/</loc> 
    </url> 
    <!-- ... -->
</urlset>
```


A bit too simple if you ask me. There are other informations that should be there, like `<lastmod>` and `<priority>`.

As you know (you do? of course you do! you _love_ Bloggart, otherwise you'd not be reading this :-P), Bloggart serves static content, that has been previously generated and stored in the App Engine Datastore (and Memcache).

Problem is, currently the content gets _"statically stored"_ without any **type** information. And I need that type (in addition to other metadata) to generate a better sitemap.

So, that's what I'm adding.

# Want to see what's going on?
If you are interested in following what's happening to Bloggart, [follow it on github](https://github.com/detro/bloggart) or just take a look to the [latest commits on the "master" branch](https://github.com/detro/bloggart/commits/master).

If you like bloggart or just use it, please let me know with comments or [message me on github](https://github.com/inbox/new/detro).
