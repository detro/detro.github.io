---
layout: post
author: detro
published: true
title: "REPL and HTTP Mapping: ideas to contribute to PhantomJS"
tags: [node, http, phantomjs, stdin, mapping, idea, repl, contribution]
date: "2011-11-01 00:11:47"
updated: "2011-11-01 00:11:47"
permalink: /2011/11/01/REPL-and-HTTP-Mapping-ideas-to-contribute-to-PhantomJS
---

Recently, I'm donating my spare time to the amazing [Stanford Online AI Class](http://www.ai-class.com), and writing down [notes](http://blog.ivandemarino.me/tag/notes) takes time.

But I'm still working, in the spare time of the spare time, on [PhantomJS](http://www.phantomjs.org/). Yes, very slowly, but I'm not stall.

Recently two ideas have come to mind, and it's stuff I'd love to see supported by PhantomJS.

## REPL

From [the Wikipedia article](http://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop):
<blockquote>
A read–eval–print loop (REPL), also known as an interactive toplevel, is a simple, interactive computer programming environment.

[...]

In a REPL, the user may enter expressions, which are then evaluated, and the results displayed.
</blockquote>

What I really like of the REPL, is the idea of launching it and start typing code into it straightaway. No files to create, save and launch. It's very good when you want to quickly toy with a concept/idea, and it's so small it doesn't really _deserves_ a dedicated script file for that.

I haven't finished it yet, but I published my current status on [this branch](https://github.com/detro/phantomjs/tree/dev-repl2). Check it out!

Also, the REPL is truly enabling an even more simple concept: controlling PhantomJS by just piping commands to it through the [STD_IN](http://en.wikipedia.org/wiki/Standard_streams). A **key** aspect to enable easier integration of PhantomJS in larger stacks.

In facts, I discovered that [sgentle](https://github.com/sgentle) has started working on wrapping PhantomJS into a Node module, and released [phantomjs-node](https://github.com/sgentle/phantomjs-node). What struck me is how he had to work out a _communication channel_ between [Node](http://nodejs.org/) and the instances of PhantomJS: he opted for [Socket.io](http://socket.io/).

Socket.io is definitely a _smart_ solution, but phantom is launched as a child process: there must be a better way to let Node and PhantomJS speak, instead of having to pass through the network stack. Right?

And that's where my work on the REPL (and in general into controlling PhantomJS via STD_IN) comes into the picture.

## HTTP Mapping

In our effort to build proper Javascript Testing into [Betfair's new platform](http://beta.betfair.com), a problem arises: how do we mock _effectively_ and _easily_ the service data responses that our code consumes?

Javascript, as many of you know, is not _easy to test_: it normally requires you to run your full stack to be able to test it _fairly_. But we are not giving up, and want to find a solution to be able to test our code, without having to run an entire infrastructure of services, particularly while code is actually developed. The developer has to be able to _work into this loop_:

1. type
2. save
3. run test

So, here is the idea: _what if we could intercept all those HTTP/XHR calls that the Javascript in the page does, and Map them to local files (or even different remotes)?_

PhantomJS source code is already structured to abstract the network access of the [WebPage](http://doc.qt.nokia.com/4.7/qwebpage.html) through a [NetworkAccessManager](http://doc.qt.nokia.com/4.7/qnetworkaccessmanager.html). At the moment we are using it for monitoring and sniffing.

I want to add a functionality to the `webpage` module so that given a file `httpmap.json` that looks like:

```json
[
     {
          "method" : ["GET", "POST"],
          "source" : "http://*.betfair.com/bla/*/test",
          "destination" : "local_file.json"
     },
     {
          "method" : "GET",
          "source" : "http://*.betfair.com/bla/*/api",
          "destination" : [
               "1_local_file.json",
               "2_local_file.json",
               "http://testapi.example.com/bla/api/test"
          ]
     }
]
```


a tester that uses phantom could do something like:

```javascript
var fs = require('fs'),
    page = require('webpage').create(),
    HTTP_MAP = "httpmap.json";

page.setHttpMap(fs.read(HTTP_MAP));

// ... do stuff with page, while the HTTP requests are mapped
```


As you can probably guess, the format of the map offers some extra nifty features:

* the `method` field can be single (a `string`) or multiple (an array of `string`)
* the `destination` field can be a single url (a `string`), or multiple destinations (an array of `string`) that phantom will cycle through at every matching request
* the `source` field accepts [regexp](http://en.wikipedia.org/wiki/Regular_expression), and I'm thinking to add variables

## Help

This are my ideas so far. It would be of GREAT help if you, PhantomJS lover, could spend sometime to review those and suggest accordingly.

**Happy Testing!**
