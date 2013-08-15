---
layout: post
author: detro
published: true
title: "GhostDriver, 90% and priorities"
tags: [webdriver, phantomjs, update, strategy, opensource, release, ghostdriver]
date: "2012-10-04 17:26:50"
updated: "2012-10-23 14:41:38"
permalink: /2012/10/05/GhostDriver-90-and-priorities
---

Last few weeks have been HECTIC to say the least. Work on [GhostDriver](https://github.com/detro/ghostdriver) and [related PhantomJS improvements](https://github.com/detro/phantomjs/tree/ghostdriver-dev) has been very intense.

We just shipped [PhantomJS 1.7](http://ariya.ofilabs.com/2012/09/phantomjs-1-7-blazing-star.html), and work for 1.8 is already started (check out the `ghostdriver-dev` branch I linked above).

GhostDriver has reached almost 90% completion for 1.0, and the code is being **hardened**, thanks also to the amazing work that [Jim Evans](http://jimevansmusic.blogspot.co.uk/) is doing at spotting issues and, a lot of times, providing fixes. GhostDriver is getting better and better thanks to you Jim.

## Yes, but in short, what's left to do?

Based on [my plan](https://docs.google.com/spreadsheet/ccc?key=0Am63grtxc7bDdGNqX1ZPX2VoZlE2ZHZhd09lNDkzbkE), to release 1.0 I'm missing "only":

* Handling of `window.alert`, `window.confirm` and `window.prompt`
* Handling of `LocalStorage` and `SessionStorage`
* Handling fo `/log` commands

Recently though I have been thinking and discussing with others and I decided that I'd delay the support for those 3 things in favour of:

* Fix issues related to Mouse interaction
* Integrate GhostDriver into PhantomJS itself (I need to prepare a plan with [Ariya](ariya.ofilabs.com))
* Providing a Java Binding (Jim Evans already pushed a .Net binding into the Selenium codebase)
* Code hardening

## WHAAAAT? Are you crazy? No "alert()"?

Yeah, I know. While `LocalStorage` can be seen as _nice-to-have_ features for `1.0`, being able to interact with `alert()` (and relata) is a big deal.

The issue there is that the current PhantomJS doesn't provide an easy way to implement those commands: while PhantomJS does provide support for `alert`, `prompt` and `confirm` (I wrote them myself!),  it will probably require quite some work to "adapt" PhantomJS/GhostDriver to the way the WebDriver API work for those things.

In short: PhantomJS allows you to register a `onAlert/onConfirm/onPrompt` callback to handle those events - WebDriver treats those as a "state" in which the Window is. Maybe I could write a never-returning callback? I don't know, it requires time to think about the best solution.

And that the point: I think I got no time now.
 
## The best thing I can do right now

**Time** is key here.

I think the best thing I can do right now for the **PhantomJS WebDriver project future**, is to release a 1.0 version, with the hope it will receive enough _road test_, so that 1.1 and later can be better, comprehensive, more _WebDriver-worthy_.

Ah, and did I mention that I'm moving to [Amazon LoveFilm](http://corporate.blog.lovefilm.com/)? But that's for another post...
