---
layout: post
author: detro
published: true
title: "My Rhinoceros likes WebSocket, not leafs"
tags: [w3c, java, javascript, rhino, api, specs, websockets]
date: "2012-02-14 02:03:43"
updated: "2012-02-14 02:03:43"
permalink: /2012/02/14/My-Rhinoceros-likes-WebSocket-not-leafs
---

Last week I started implementing [W3C Sockets API](http://dev.w3.org/html5/websockets/) into a Rhino based JavaScript runtime.

It seems like _plumbing_ API from one environment to another is one of the activity I do the most. And if you dare doing a joke about my Italian-ness and Super Mario... you will be pointed in the direction of the door.

Here I want to share a couple of findings.

## Rhino is not bad at all

Yes, I said it. And who has worked in the past with me, knows how my opinion are hard to change. But they do sometimes, fortunately.

<div class="img">
<img src="http://www.buddycom.com/animal/special/rhino/rhino.jpg" />
a big one...
</div>

I'm accustomed to [QtScript](http://developer.qt.nokia.com/doc/qt-4.8/qtscript.html) and [QtWebKit](http://developer.qt.nokia.com/doc/qt-4.8/qtwebkit.html): those are the javascript runtime API/environment I used the most. But I have to give credit to this very good piece of software from the Mozilla Foundation.

In facts, [Rhino](http://www.mozilla.org/rhino/doc.html) is not bad at all. I was initially very dubious of his quality (Java, ehm...) but I have to slap my own hand: it not only provides good execution time, but it also has a very, VERY nice API. And [Neustar Webmetrics](http://www.webmetrics.com/) runs it's whole business on it!

What I liked the most? **2 things**:

* One, the fact that to create a JavaScript read-only property named, say, `prop` you just have to provide `getProp` method. And if you want the property to be writable, provide a `setProp`. The engine will take care of mapping `L-VALUES` or `R-VALUES` usages to the correct getter/setter.
* Two, the `NativeFunction` Class is neat and easy to use: extremely simple to allow the scripter to provide an event handler. Almost _brain-dead-simple_.

## Java-WebSocket
[Nathan Rajlich](http://tootallnate.net/) has made available on GitHub a good (not yet complete, though) [implementation of WebSockets in Java](https://github.com/TooTallNate/Java-WebSocket). The API is simple, reflects _more or less_ the W3C specs, and does the job.

<div class="img">
<img src="http://warmcat.com/websocket-lifecycle.png" />
the fun of WebSocket handshake
</div>

I used it with a couple of Node WebSocket implementations ([miksago's](https://github.com/miksago/node-websocket-server) and [einaros'](https://github.com/einaros/ws)), and it's the only one that managed to negotiate a connection and transmit stuff without issues.

There are not many implementation of WebSockets out there yet (particularly for Java). I believe the main reason being the unstable and still-changing specs (take a look at [this table](http://en.wikipedia.org/wiki/WebSocket#Browser_support)).

So, KUDOS to Nathan!

**P.S.** A beer if you can write in the comment where the name **Rhino** originally comes from. A hint: you must have _studied_ JavaScript BEFORE jQuery was cool and XHR was yet to become a superstar.
