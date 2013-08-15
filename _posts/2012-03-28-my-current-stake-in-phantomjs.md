---
layout: post
author: detro
published: true
title: "My current stake in PhantomJS"
tags: [conference, webdriver, phantomjs, selenium, repl, london, opensource, ghostdriver]
date: "2012-03-28 10:38:13"
updated: "2012-03-30 11:06:03"
permalink: /2012/03/28/My-current-stake-in-PhantomJS
---

I have been spending a lot of time on PhantomJS in the last couple of months. But feels like I could have done much more: there are so many interesting issues to work on in the [official tracker](http://code.google.com/p/phantomjs/issues/list).

** Hey, why don't you [give us a hand](http://code.google.com/p/phantomjs/wiki/ContributionGuide)? :) **

<div class="img">
<img src="http://farm1.staticflickr.com/103/262840712_aca950e48c_z.jpg?zz=1" alt="My stake" />
Some English expressions still puzzle me...  
</div>

Here is where my stake is.

## REPL

I just finished putting down a new wiki page that explains a bit about the REPL and how it works. [Give it a read](http://code.google.com/p/phantomjs/wiki/InteractiveModeREPL) and let me know if you want more clarification.

I can already see few problems with it, as it doesn't always behave as I want. I'm sure this is the beginning of the work on this feature, not the end. But it is a good start.

## GhostDriver

[Issue #49 - "Integrate with WebDriver"](http://code.google.com/p/phantomjs/issues/detail?id=49) was opened in February 29 2011! Yes, more than 1 year ago.

So, last week I started hacking away on a new idea: now that PhantomJS has the `webserver` moduel (i.e. `require("webserver").create()`), it is possible to implement the full [WebDriver Wire Protocol](http://code.google.com/p/selenium/wiki/JsonWireProtocol) and have PhantomJS act as a back-end for `RemoteWebDriver`.

That's when [GhostDriver](https://github.com/detro/ghostdriver) was born.

The code is very young, and the list of TODO is as long as the amount of code written, but you can already:

* Start the RemoteWebDriver Server
* Run the "Getting Started" example

if you already have PhantomJS on your system and you have Maven to build the example.

Speed-wise, there is no comparison: respect to use [FirefoxDriver](http://code.google.com/p/selenium/wiki/FirefoxDriver), **the test takes between a 1/5 and a 1/10 of the time**. When you launch GhostDriver on the side and than make the test hit it, it's when you get the maximum performances.

Give it a go and let me know if the instructions provided are clear enough.

## Selenium Conference 2012, London, UK

I managed to get a talk accepted for the [Selenium Conference 2012](http://www.seleniumconf.org/speakers/), that this year will be hosted in London at the "IET London: Savoy Place" ([tickets here](http://www.seleniumconf.org/tickets/) / [venue](http://www.seleniumconf.org/venue/)).

<div class="img">
<img src="http://www.seleniumconf.org/wp-content/uploads/2012/02/300x250_speaking.jpg" alt="Selenium Conference 2012 - I'm Speaking" />
Yes, I'm :)
</div>

The title of my talk couldn't be more _ostentatious_:
<blockquote>
"Speed Up Your Selenium Tests with PhantomJS, The Headless Browser"

<strong>Ivan De Marino</strong> / Senior Software Engineer at Neustar Webmetrics
</blockquote>

like I have any idea of what I'm talking about.

Anyway, if you come along and say hi, I'll be pleased. Hopefully I won't bore anyone to death.
