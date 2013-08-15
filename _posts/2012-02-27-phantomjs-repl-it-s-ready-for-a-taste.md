---
layout: post
author: detro
published: true
title: "PhantomJS REPL: it's ready for a taste"
tags: [personal, source, REPL, opensource, phantomjs]
date: "2012-02-27 01:39:59"
updated: "2012-02-27 02:00:52"
permalink: /2012/02/27/PhantomJS-REPL-it-s-ready-for-a-taste
---

After 2 months of on-off working on this, I finally managed to make something I'm happy with: a [REPL](http://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop) for [PhantomJS](http://www.phantomjs.org).

The [last post I wrote about this](http://blog.ivandemarino.me/2011/11/01/REPL-and-HTTP-Mapping-ideas-to-contribute-to-PhantomJS) was in November 2011 (!!!). But I started putting code together only in Jan 2012. So, overall, from the first commit until today is almost 2 months.

<div class="img">
<img src="http://ubik.cc/MAOW-Firenze-09/images/repl-loop.png" />
</div>

First thing first: **how do you get to try it?** Well, you can get my fork, switch to the `dev-repl` branch and try it out:

```bash
$ git clone git://github.com/detro/phantomjs.git
$ cd phantomjs
$ git checkout -b dev-repl origin/dev-repl
$ qmake && make
```


You can [download this tarball](https://github.com/detro/phantomjs/zipball/dev-repl). Or you just can come up with your own way to [checkout my branch](https://github.com/detro/phantomjs/tree/dev-repl).

To launch it, just type:

```bash
$ ./bin/phantomjs
>
```


You will be welcomed by a prompt, waiting for your JavaScript code to be evaluated on the spot. Line by line. Like a proper REPL. The ideal companion for your **quick-and-dirty phantomjs-hack-sessions** or **live-coding keynotes**.

The REPL is packed with some good features that I'm sure will please command-line junkies:

* Context-sensitive auto-completions (i.e. push on `TAB` to cycle through suggestions)
* Arrow navigation through the history of what you type
* Permanent history (yes, like any "modern" CLI)
* Editable command line (use `Left` and `Right` to insert characters where you need them)
* Pretty-print of expression result (great to quickly recall the name of a method)

It's not part of the latest PhantomJS, but I plan to file a pull request very soon.

Please, help yourself to it and share your view and feedback.
I did this work specifically to make PhantomJS users happy: so, help me make you happy :)

_Happy REPL-coding!_

**P.S.:** This whole branch would have not made it without the great [linenoise library](https://github.com/antirez/linenoise). In the specific case, I'm using [this fork](https://github.com/tadmarshall/linenoise) because it has more maintenance. **Kudos to everyone involved**.


