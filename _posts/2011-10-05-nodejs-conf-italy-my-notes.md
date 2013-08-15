---
layout: post
author: detro
published: true
title: "NodeJS Conf Italy: my notes"
tags: [conference, comment, markdown, italy, nodejs, notes, javascript, brief, slides, conf, presentation, brescia]
date: "2011-10-05 11:10:24"
updated: "2011-10-05 11:10:24"
permalink: /2011/10/05/NodeJS-Conf-Italy-my-notes
---

I'm just back from a very good conference. And for once, I can proudly say, it was organized by Italians!
The host were [WEBdeBS](http://www.webdebs.org/), a web company based in lovely Brescia, and the topic was...
very hot: [Node.JS](http://nodejs.org/).

[Node.JS Conference](http://www.nodejsconf.it/)
([@nodejsconfit](http://twitter.com/nodejsconfit)) ([on joind.in](http://joind.in/event/view/792)) has been hosted in the
[Centro Paolo VI](http://www.centropastoralepaolovi.it/), where talks well complemented by lovely Italian food.
What else can you ask?

<div class="img">
<img src="http://distillery.s3.amazonaws.com/media/2011/09/26/6269a1d200ba4e48a5ebe76a51627b78_7.jpg" width="500" />
A great addition to my collection of "hackshirts"
</div>
Once arrived, we have been welcomed by a prompt start and VERY nice t-shirts, and a sharp,
on time start (a rarity for Italians, I know :P).

I took some notes/bullet-points during the talks, as I usually do at conferences.
So, I'll share them here, adding a little abstract or some comments of mine. Below every section there is a link
the actual notes (in [Markdown](http://daringfireball.net/projects/markdown/) format),
so that you can download and read as you please. Also, where available, I linked the slides.

## 00 - Keynote - Is not supposed to fly... but it does!
The keynote speech was given by... an Erlang expert: Gabriele Lana ([@gabrielelana](http://twitter.com/gabrielelana)).
Expert in high-concurrency and high-reliability, I think he is the perfect speaker to kick-start the
conference.

Who can better talk about Node.JS, a software that surprised everyone since it's birth
for being _"not designed for THAT!"_, if not someone that has learned using it that
_"it suits surprisingly well this role"_. Indeed the recurring theme of the keynote was the
bumblebee, an insect that flies, non the less his body structure doesn't seem to be really suitable.

<div class="img">
<img src="http://i.telegraph.co.uk/multimedia/archive/01398/bumblebee_1398371c.jpg" />
"The bumble bee is not supposed to fly,
but he doesn't know it so it goes on."
</div>

Link to [00-Keynote-It's not supposed to fly but it does.md](http://cl.ly/2F1A26403p0W3j042p1b).
Slides [on SlideShare](http://www.slideshare.net/gabriele.lana/it-is-not-supposed-to-fly-but-it-does).

## 01 - Event based architecture is here to stay, baby!
This was an interesting talk by a very nice and sociable German guy, [Golo Roden](www.goloroden.de).

He introduced a new, fresh perspective to look at "code modularity": look at your code as a computer chip.
Design and code your classes/functions as a fully independent, self contained, easy testable
unit of code. A module that you can introduce in any code environment, and it will still be usable.

Those "chips" will than communicate with the outside world _firing events_. If nothing is there
listening, the code will still work. In other words, 100% of the IO for any module of code becomes
Event Driven.

Also, that would make code easy to test, as mocking will become almost trivial.

After that, he discussed the use of [Coffee Script](http://jashkenas.github.com/coffee-script/), as a language to support "old style"
developers in their transition to Javascript. Some of you might already know
[what I think of Coffee Script](http://blog.ivandemarino.me/2011/06/02/Coffee-Shit), but in all fairness he did mentioned that developers
will quickly hit the _"code in Coffee Script but debug in Javascript"_ barrier, so we are OK ;-).

Something really cool about Golo was his business card:
<div class="img">
<img src="http://distillery.s3.amazonaws.com/media/2011/09/27/3d561db4c98043219f8c8b7bfc2c30ac_7.jpg" width="500" />
Golo Roden business card ROCKS!
</div>

Link to [01-Event Based Architecture is here to stay.md](http://cl.ly/1l25422n2f3c472O431U).

## 02 - Scaling node to 50M requests per day
This talk was from the great guys at [Forward](http://www.forward.co.uk/), a sort of "umbrella company/brand/business creators".

To give the talk were [Andy Kent](http://forwardtechnology.co.uk/andykent) and
[Ryan Greenhall](http://forwardtechnology.co.uk/ryangreenhall).

They presented a bunch of intriguing Open Source projects they use as solutions for their business needs, all based on Node.
Interesting is also all the detailed, data-driven comparison they do between their previous use of Rails, and their current
stack on Node. Of all of them, [creek](https://github.com/andykent/creek) is the one that attracted my attention the most. It seems to be
the perfect instrument if you want to make sense of a stream of live data, fast.

Also it is an interesting talk in general, if you care about
[scalability](http://blog.ivandemarino.me/2011/08/31/What-does-scalability-actually-means)
and how Node can help with that.

Link to [02-Scaling node to 50M requests per day.md](http://cl.ly/2d1o3q1U3j0D0w0k3136).

## 03 - Deploying Cloud9 in Cloud9
Sergi Mansilla [@sergimansilla](http://twitter.com/sergimansilla)
presented Cloud9, and demonstrated how this **amazing project** is _self-hosted_: this means that
they develop it using Cloud9 itself. Also, Cloud9 is opensource, and you can install it on your own server, and, even better,
contribute to it.

It's very much indicated for JS-centric development, but it's not exclusive. Definitely a project I should pay more attention to.
And I think Sergi nailed a very important point in his presentation: **developers carry too much stuff around**. I endorse that and
I also add: it's even worse for JavaScript developers because of how many layers of software you need before your code actually runs!

So, give a good look at Cloud9. I'm thinking it would be perfect for some Node playing around I'm currently doing.

Link to [03-Deploying Cloud9 in Cloud9.md](http://cl.ly/1W3G3G2m1C0r1k0y2i2K).

## Lunch break
Well, we were in Italy: what do expect if not amazing food for the lunch break? I had _mushroom risotto_ and what not in terms of
sour and sweet dishes. But the best things were the _"spuntino"_:

<div class="img">
    <img src="http://distillery.s3.amazonaws.com/media/2011/09/24/11b5585b48024d00b50354928beeba23_7.jpg" width="500" />
    Illy Coffee
</div>

<div class="img">
    <img src="http://distillery.s3.amazonaws.com/media/2011/09/24/5c0fe18cba764cec9ce3d7bc0149d3f1_7.jpg" width="500" />
    Nutella brioche
</div>

They couldn't do anything better on this side: this is the first time I actually enjoy myself with conference food. Normally is
just _"food to survive"_ - this was _"food to enjoy"_.

## 04 - Server Side Javascript - Going all the way
This talk was a bit controversial for me, but still interesting. Oleg Podsechin [@olegpodsechin](http://twitter.com/olegpodsechin)
introduced the "risky" topic
of **Sync vs. Async** conding. And, particularly, discussed how the Async coding pattern doesn't seem to fit very well within
Server Side programming.

He made some examples, like [CRUD](http://en.wikipedia.org/wiki/Create,_read,_update_and_delete) services,
having some issues when coded asynchronously.

Then he introduced his project, [Common Node](http://olegp.github.com/common-node/), a _"Synchronous CommonJS compatibility
layer for Node.js"_. It's built on the top of **Fibers**, introduced by the Asana team in
[this blog post](http://asana.com/2010/10/adding-fibers-to-v8-efficiency-clarity-in-ssjs/).

My opinion on this? Node.js is built around the _"Asynchronousity"_ of Javascript: writing an abstraction layer
on top of it to make it possible to code synchronously defeats the very purpose of using Javascript server side.
If you want to use JavaScript server side just because _"oh, I can reuse what I know"_, then you are doing it for
the wrong reason. I say, **Embrace event driven**.

Also, he presented various benchmark, and all of them showed that Common Node had to pay a price respect to plain Node.
Still, though, a very interesting presentation.

Link to [04-Server side Javascript - Going all the way.md](http://cl.ly/113X1Z3t2a250d1K3G0t).
Slides [on SlideShare](http://www.slideshare.net/olegp/server-side-javascript-going-all-the-way).

## 05 - Going real time with Socket.io
Arnout Kazemier ([@3rdEden](http://twitter.com/3rdEden)) presented [Socket.io](http://socket.io),
a project I know a bit about, but I didn't yet
realized how cool and easy to use was.

What is really superb is how they managed to abstract the transport layer, so that it can automatically pick the best option for
the client browser ([WebSockets](http://en.wikipedia.org/wiki/WebSocket),
[Adobe Flash Sockets](http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/flash/net/Socket.html),
[Comet](http://en.wikipedia.org/wiki/Comet_(programming)), down to [JSONP Polling](http://jsguy.com/?p=103)).
And yes, _it does work on IE >= 5 too__!

Arnout gave us also a sneak pick of the upcoming support for clustering. Well, now there is no excuse for not being real-time.

Link to [05-Going real time with Socket.io.md](http://cl.ly/3G0x2S1u15472v1d0L0E).

## 06 - Back to Data
Ian Jorgensen [@ianjorgensen](http://twitter.com/ianjorgensen) created [PubSub.io](http://pubsub.io/)
(together with Mathias Buus [@mafintosh](http://twitter.com/mafintosh), and that's what he presented.

PubSub.io is revolutionary in the way makes you look at data. Instead of the usual _bucket that you interrogate_ (send a query),
with this you _declare what you are interested in_ (declare a query). The query are published in a **hub**. Data are received by
the hub that delivers a subset of those to the **clients**, based on the query they declared. A total inversion of flux, I say.

But what was really amazing of Ian's presentation where the demo. And in the specific, how he glued
PubSub.io to [Arduino](http://www.arduino.cc/)! Data generated on the board by sensors, was published on a PubSub.io hub (through HTTP),
and that was then published and delivered to a web client of the same hub. Imagine the applications of such _simple_ connection.

Link to [06-Back to Data.md](http://cl.ly/290Y2X0I1F3e2g3b2O3k).
Slides at [pubsub.io/slides](http://pubsub.io/slides).

## Conclusions
It was a very good experience: visiting my home country, in a beautiful city I know little about, eating good food and talking
about cutting edge technology.

Again, I do apologize if my notes are the made of the worst stenography. They are written very quickly, while I try to grab
as much as I can from the speaker. And it is even more difficult when the topic is interesting, because good ideas initiate thinking.

If there is another [nodejsconf.it](http://www.nodejsconf.it/) next year, I'll definitely join in!
