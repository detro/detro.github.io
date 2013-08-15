---
layout: post
author: detro
published: true
title: "Browser Adaptive CSS with AppEngine"
tags: [google, curiosity, personal, memcache, solution, stylesheets, rendering, optimization, css, template, english, incompatibility, gae, browser, appengine, utility]
date: "2008-09-21 19:56:04"
updated: "2008-09-21 19:56:04"
permalink: /2008/09/21/browser-adaptive-css-with-appengine/
---

<a href="http://www.detronizator.org/2008/08/30/google-appengine-resources/">As I said, I'm doing some stuff with Google AppEngine</a>. And, of course, I'm facing the usual problem of Browser Incompatibility:
<div align="center">
<img src="http://www.detronizator.org/wp-content/uploads/2008/09/firefox_eating_ie.jpg" alt="Browser Incompatibility" />
Browser Incompatibility ;-)
</div>
<blockquote>
=Browser Incompatibilities: the Most Common Problem=
The most common problem for Web Site developers is the fact that every browser treats HTML Tags, CSS and Javascript in it's own way.
This Recipe tries to address one of the problem I faced the most: having a slightly different CSS for every Browser.

=The Usual Solution=
The usual solution is to load every time a different CSS depending on the Browser. But this solution has some side effects:
- It's difficult to Maintain: very hard because every update to the style needs to be applied to multiple files
- It's Boring: for the above reason
- It's Not Cool: again, for the same above reason 
...
</blockquote>

So, what I did is to build a very simple solution, using the Template Engine and applying some of the concepts I learnt studying appengine and <a href="http://www.detronizator.org/2008/09/17/back-from-the-google-developer-day-2008/">at the Google Developer Day 2008</a>.

And, because <a href="http://www.google.com/">Google</a> built this <a href="http://appengine-cookbook.appspot.com/">very simple but useful Google AppEngine Cookbook application</a> (based on appengine itself ;-) ), <a href="http://appengine-cookbook.appspot.com/recipe/browser-adaptive-css/">here is it</a>.
<strong>Enjoy!</strong>
