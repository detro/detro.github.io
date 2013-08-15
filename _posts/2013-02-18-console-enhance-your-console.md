---
layout: post
author: detro
published: true
title: "Console++ - enhance your console"
tags: [npm, console, log, phantomjs, javascript, nodejs, colours, library, enhance, level, ghostdriver, console++]
date: "2013-02-18 01:05:48"
updated: "2013-02-18 01:05:48"
permalink: /2013/02/18/Console---enhance-your-console
---

I need a logger for [GhostDriver](https://github.com/detro/ghostdriver) but I'm too lazy to figure out how to use a nice, proper logging library. Plus I'm a BIG fun of old-school-debugging: I just substituted all the `printf()` calls with `console.log`.

So I decide to make every JavaScript developer _shiver in disgust_ and wrote a small library that enhances the global `console` object.

This tiny library is called [Console++](https://github.com/detro/consoleplusplus) and works with [NodeJS](http://nodejs.org), [PhantomJS](http://phantomjs.org) and any decent JavaScript runtime.

<div class="img">
<img src="https://raw.github.com/detro/consoleplusplus/master/README.pics/console++-1.png" />
</div>

It does output colouring, adds timestamps and log level to the lines, and can be used to redirect the output to other media than the console (just register a callback). On `node`, just type `npm install consoleplusplus` to get started.

It's so simple that the [README](https://github.com/detro/consoleplusplus/blob/master/README.md) is more than enough to use it.

It's under [BSD license](http://en.wikipedia.org/wiki/BSD_licenses), so you can have fun with it.

