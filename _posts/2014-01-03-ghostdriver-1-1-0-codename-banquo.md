---
layout: post
published: true
title: "GhostDriver 1.1.0: codename \"Banquo\""
tags: [ghostdriver, phantomjs, release, changes, info, banquo]
---

It's long overdue. Last time I have cut a release of GhostDriver
([1.0.4](https://github.com/detro/ghostdriver/releases/tag/1.0.4))
was... July 2013.
And [blogged about it](https://ivandemarino.me/2013/08/10/GhostDriver-1-0-4-blog-migration-and-blogging-too-little/)
only in August!!!
I gotta take a look at my GitHub commits over the 2013: something tells me that
_year-in-commits_ nicely overlaps with my eventful 2013.
But let's try to stay on topic.

So, [GhostDriver 1.1.0](https://github.com/detro/ghostdriver/releases/tag/1.1.0),
codename _["Banquo"](http://en.wikipedia.org/wiki/Banquo)_.
This time the codename was picked by my wife - fitting, given how important she
has become this year for Leonardo and Me.

I know, I keep going off topic. Sorry...

As I'm writing, this new version hasn't been imported into PhantomJS yet,
but it will be very soon. Definitely before next release of PhantomJS. And please,
don't ask me about that - there is the
[PhantomJS Google Group](https://groups.google.com/d/forum/phantomjs)
for this kind of questions (I have
[just opened a discussion](https://groups.google.com/forum/#!topic/phantomjs/ouFiiB1UoLw)
about this).

# What's new in 1.1.0

For a complete, up-to-date list of changes in the releases of
GhostDriver, please DO take a look at the
[`CHANGELOG`](https://github.com/detro/ghostdriver/blob/master/CHANGELOG.md).

Here is a _cut&paste_ for 1.1.0:

* ENHANCEMENT #293: Import Selenium 2.39.0 WebDriver Atoms
* ENHANCEMENT: `/maximize` window will set the window size to 1336x768,
currently most common resolution online (see [statcounter](http://gs.statcounter.com/#resolution-ww-monthly-201307-201312))
* ENHANCEMENT #275: **Implemented Browser and Network (HAR) Logging types**
* FIXED #284: Attempt to wait for Page to Load if input causes form submit
* FIXED #291: Throw exception when attempting to set invalid timeout value
* FIXED #259: Fix issue regarding mouse clicks
* ENHANCEMENT #290: Enabled support for "Keep Alive" HTTP connections
* ENHANCEMENT #262: **Allow access to PhantomJS API from WebDriver (Driver part)**

As you might have noticed, I have highlighted 2 entries above...

## Browser and Network (HAR) Logging

One _difficulty_ of working with an headless browser is: there is no
direct way to look at the browser and try to understand what it's doing. It's
pretty much a black-box and debugging your tests against it might be hard.

Logging was already implemented, but the only way to grab the output was via
**standard output/error redirect**. Not always suitable for the client-server
architecture of WebDriver.

The WebDriver WireProtocol defines a
[set of API to access LOGs](https://code.google.com/p/selenium/wiki/JsonWireProtocol#/session/:sessionId/log)
of different type.
The _logtype_ `client` is implemented by the binding. The `driver` should
provide a view into the _inner guts_ of the WebDriver implementation. The
`browser` essentially is the _console_ of the browser. The `server`... I'm
not sure.
In GhostDriver 1.1.0 we have added support for 2: `browser` and `har`.

_HAR???_ Yes, [HAR - HTTP Archive](http://www.softwareishard.com/blog/har-12-spec/).
While I explained already the browser log-type, `har` will return a single-entry
log, with the HAR of the current webpage, since the first load (it's cleared
at every `unload` event).

Support for the other logtypes might come in the future (the `driver` type should
be simple enough).

A great **THANK YOU** goes to [Dmitry Balabka (torinaki)](https://github.com/torinaki)
and [Wouter Groeneveld (wgroeneveld)](https://github.com/wgroeneveld) for their
key contributions. _Keep it coming guys!_

## Access to PhantomJS API

This feature that has been requested SO MANY FREAKING TIMES!!!

PhantomJS has [a rich set of API](https://github.com/ariya/phantomjs/wiki/API-Reference)
to control and tune the internal WebKit core.
Access to the plethora of API that PhantomJS has was always high, since the
beginning of the GhostDriver project.

While some see GhostDriver/PhantomJS as _just_ a WebDriver implementation against
a non-production browser, others see this as a way to easily control PhantomJS
from another software.
The issue was that the WebDriver Protocol is _tuned_ for a specific scenario: emulate
user interaction with a browser. PhantomJS is a bit less of a browser, and more
of a **scriptable browser engine**. And it's very useful in scenarios also not
strictly related to testing and user interaction.

This API allows to send a string of JavaScript, written for PhantomJS, and be
interpreted within the context of a WebDriver Page. In other words, for the given
script the `this` variable is initialized to be the current Page.

 The format of this _WebDriver Protocol Extension_:

```
HTTP POST /session/:id/phantom/execute
{
    "script"    : SCRIPT_SCRIPT
    "args"      : [ARRAY_OF_JS_BASIC_TYPES]
}
```

To see an example use of this API, check out
[this example](https://github.com/detro/ghostdriver/blob/master/test/java/src/test/java/ghostdriver/PhantomJSCommandTest.java).

This new API was **entirely developed** by
[Mark Watson (watsonmw)](https://github.com/watsonmw),
ex-colleague of mine at
[Neustar](https://ivandemarino.me/2011/12/14/Crossing-the-pond/)
and awesome chap.

# What do I have left to do

As I write this, I still have to finish up a couple of tasks to consider 1.1.0
fully released:

* <del>Commit 1.1.0 Java Bindings's JAR to the Selenium repository</del>
[DONE](https://code.google.com/p/selenium/source/detail?r=6146f3a5bec6bd28747e91a07cacd75a3db589f2)
* <del>Import 1.1.0 into PhantomJS</del>
[DONE](https://github.com/ariya/phantomjs/pull/11877)
* <del>Tag 1.1.0 on the repository</del>
[DONE](https://github.com/detro/ghostdriver/releases/tag/1.1.0)

I could have waited for those tasks to be complete... but I felt like this
was overdue and I wanted to share a _status report_ as soon as I could.

Also, it gives me _closure_ for this blog post.


