---
layout: post
author: detro
published: true
title: "GhostDriver: almost 50%"
tags: [phantomjs, guidelines, lavender, update, merge, opensource, contribution, ghostdriver]
date: "2012-06-26 07:53:18"
updated: "2012-06-26 07:53:18"
permalink: /2012/06/26/GhostDriver-almost-50
---

This post is long overdue. It's weeks that I HAVE TO write it and
yet couldn't find the time to put it together. Oh well, better late than...

Since my talk about
[GhostDriver at the Selenium Conference 2012](http://blog.ivandemarino.me/2012/05/01/Me-the-Selenium-Conference-2012)
I have
received lots of interest from the community about
[GhostDriver](https://github.com/detro/ghostdriver/): finally a
[WebDriver](http://code.google.com/p/selenium/) for
[PhantomJS](http://phantomjs.org).

If you haven't followed me so far, a quick _catch up_: I'm working to implement
the [WebDriver WireProtocol](http://code.google.com/p/selenium/wiki/JsonWireProtocol)
on the top of PhantomJS, so to leverage our favorite
**headless browser**. The project is proceeding, even though not as fast
as I would have liked: you can find details about the current status
in the "official" [README.md](https://github.com/detro/ghostdriver/blob/master/README.md)
and/or checking out the
["Implemented Commands" spreadsheet](https://docs.google.com/spreadsheet/ccc?key=0Am63grtxc7bDdGNqX1ZPX2VoZlE2ZHZhd09lNDkzbkE).

<div class="img">
<img src="http://digilander.libero.it/yappappeo/mezzopienomezzovuoto.jpg" "Half full or half empty?" />
</div>

**We have implemented almost 50% of the WireProtocol**. Not as far as I'd like
this to be, but with my current workload it's a good thing it's moving.

## Contributions, finally!

I say "We" because I have been joined by
[Alex Anderson](https://github.com/alxndrsn): Alex has quietly started
submitting patch and providing a very good push toward completion. He is
contributing many commands and spotting bugs. He has even created
a [dedicated test suite](https://github.com/alxndrsn/webdriver-geb-tests),
written using [Geb](http://www.gebish.org/).

Others are trying to help as well, and that is great. I only ask a couple
of things to a potential contributor:

* stick with the coding style I have set
* if you can't "infer" my coding style, we have a problem already
* if you want to make a radical change, be ready to motivate it
* code speaks better than any promise
* tests are a great way to start your contributions
* this is not a democracy (sorry), but win me with reasoning
and I'll bend backward to do what you suggest

Am I being too demanding? :)

## Changes to PhantomJS needed

GhostDriver is being a great "benchmark" for PhantomJS: having to implement
a protocol that is designed for real browsers, current limitations
of PhantomJS are popping out.

If you have took a look at the README I mention above, you have probably
noticed that to run GhostDriver you need to use my personal branch of PhantomJS
called [ghostdriver-dev](https://github.com/detro/phantomjs/tree/ghostdriver-dev).
That contains changes to make PhantomJS
do what the WireProtocol demands.

I have managed to merge the current status of this branch back into PhantomJS
and it's part of the
[freshly baked 1.6 "Lavender"](http://ariya.ofilabs.com/2012/06/phantomjs-1-6-lavender.html).
Some interesting new features are:

* Page rendering to Base64: `page.renderBase64(format = "png")`
* Page `frame` and `iframe` navigation: `page.switchToFrame("frame_name")`
* Callbacks for `window.confirm(message)` and `window.prompt(text, value)`
* Info about the hosting Operating System: `require("system")["os"]`

## What's coming

Well, while Alex is pushing in new commands, my next focus is windows handling:
a WebDriver needs to be able to manipulate and move focus of execution across
all the open windows. That's another thing that requires work on the PhantomJS
side, as we currently don't support that.

But Qt is awesome and I'm confident it's doable and will probably be not
that hard.

Wish us good luck: we are not there yet, but we are well motivated.

## Can I ask you a favor?

If you plan to use GhostDriver inside your project,
could you please leave a comment? Who are you? What you work on? How is GhostDriver going to be useful for you?

Thanks. Knowing stuff like that would give me some perspective.

