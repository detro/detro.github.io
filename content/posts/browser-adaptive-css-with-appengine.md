---
layout: post
author: detro
title: "Browser Adaptive CSS with AppEngine"
tags: [google, curiosity, personal, memcache, solution, stylesheets, rendering, optimization, css, template, english, incompatibility, gae, browser, appengine, utility]
date: "2008-09-21T19:56:04Z"
aliases:
  - /2008/09/21/browser-adaptive-css-with-appengine
  - /2008/09/browser-adaptive-css-with-appengine
---

[As I said, I'm doing some stuff with Google AppEngine](http://www.detronizator.org/2008/08/30/google-appengine-resources/). And, of course, I'm facing the usual problem of Browser Incompatibility:


![Browser Incompatibility](http://www.detronizator.org/wp-content/uploads/2008/09/firefox_eating_ie.jpg)
Browser Incompatibility ;-)




>> =Browser Incompatibilities: the Most Common Problem=
> The most common problem for Web Site developers is the fact that every browser treats HTML Tags, CSS and Javascript in it's own way.
> This Recipe tries to address one of the problem I faced the most: having a slightly different CSS for every Browser.
>> =The Usual Solution=
> The usual solution is to load every time a different CSS depending on the Browser. But this solution has some side effects:
> - It's difficult to Maintain: very hard because every update to the style needs to be applied to multiple files
> - It's Boring: for the above reason
> - It's Not Cool: again, for the same above reason 
> ...




So, what I did is to build a very simple solution, using the Template Engine and applying some of the concepts I learnt studying appengine and [at the Google Developer Day 2008](http://www.detronizator.org/2008/09/17/back-from-the-google-developer-day-2008/).

And, because [Google](http://www.google.com/) built this [very simple but useful Google AppEngine Cookbook application](http://appengine-cookbook.appspot.com/) (based on appengine itself ;-) ), [here is it](http://appengine-cookbook.appspot.com/recipe/browser-adaptive-css/).
<strong>Enjoy!</strong>
