---
layout: post
author: detro
published: true
title: "Job's (a bit) wrong"
tags: [steve-jobs, open-letter, flash, adobe, apple, css, personal, javascript, it, libraries, frameworks, html5, english, technology, thoughts, view]
date: "2010-05-02 11:30:14"
updated: "2010-05-02 11:30:14"
permalink: /2010/05/02/jobs-a-bit-wrong/
---

This is a set of commets to some of the asserts made by <a href="http://en.wikipedia.org/wiki/Steve_Jobs">Steve</a> <a href="http://www.apple.com/pr/bios/jobs.html">Jobs</a> in his <a href="http://www.apple.com/hotnews/thoughts-on-flash/">Thoughts on Flash</a>.

<h3>Safari has just ~5.5% of web users share</h3>
<blockquote>
[...] Apple even creates open standards for the web. For example, Apple began with a small open source project and created WebKit, a complete open-source HTML5 rendering engine that is the heart of the Safari web browser used in all our products. WebKit has been widely adopted. Google uses it for Android’s browser, Palm uses it, Nokia uses it, and RIM (Blackberry) has announced they will use it too. <strong>Almost every smartphone web browser other than Microsoft’s uses WebKit.</strong> By making its WebKit technology open, Apple has set the standard for mobile web browsers. [...]
</blockquote>
Ehm, what about <a href="https://developer.mozilla.org/en/Gecko">Netscape Gecko</a>? It's not just <a href="http://www.mozilla.com/en-US/firefox/firefox.html">Firefox</a> and it's share of web users, <a href="http://en.wikipedia.org/wiki/Usage_share_of_web_browsers">much larger than the one of Safari</a>, but also the fact that the <a href="http://www.mozilla.org/foundation/">Mozilla Foundation</a> is very much involved in building (<a href="http://www.w3.org/">W3C</a>) standards like <em>HTML5 et similia</em>.
I can see that you used the word <em>"Almost"</em>, but that's not a good start: Steve, let's try to be more <strong>fair</strong> here.
<!--more-->
<h3>The web is larger then any website</h3>
<blockquote>
[...]
What they don’t say is that almost all this video is also available in a more modern format, H.264, and viewable on iPhones, iPods and iPads. [...]
iPhone, iPod and iPad users aren’t missing much video.
[...]
</blockquote>
There is a small, polite, fair, but <a href="http://yro.slashdot.org/story/10/04/30/237238/Steve-Jobs-Hints-At-Theora-Lawsuit">very very important <em>"war"</em></a> going on in the area of <a href="http://en.wikipedia.org/wiki/HTML5_video">HTML5 video</a>: <a href="http://www.google.com/">Google</a>, <a href="http://www.apple.com/">Apple</a>, <a href="http://www.mozilla.org/">Mozilla</a>, <a href="http://www.microsoft.com">Microsoft</a>, <a href="http://www.opera.com">Opera</a> and other browser manufacturers are all trying to figure out the best video format for the web. And they are all pushing for their own interest. They are been quite <a href="http://www.engadget.com/2010/04/30/microsoft-weighs-in-the-future-of-the-web-is-html5/">"good boys"</a> for now, and the ultimate focus is to please users, but <strong>still</strong> we need to understand if is going to be <a href="http://www.theora.org/">Theora</a>, <a href="http://www.apple.com/quicktime/technologies/h264/">H.264</a> or... something else.

Until we have all figured out, then, it's not correct to says that <a href="http://www.adobe.com/products/flash/">Flash</a> is obsolete/useless, The web is very large, much larger then all the video-centric websites that Steve's citing. <strong>And Flash has been THE technology that made video-streaming large and successful as it is today. Period.</strong> We should all see that.

<h3>There is Touch, so we all have to learn HTML5</h3>
<blockquote>
[...]
Most Flash websites will need to be rewritten to support touch-based devices. If developers need to rewrite their Flash websites, why not use modern technologies like HTML5, CSS and JavaScript?
[...]
</blockquote>
I LOVE HTML5 (and related technologies). I really do. And in my work I focused on <em>"the C++ side"</em> of this stuff in the last 2yy. It's <em>"my thing"</em>. But <strong>here Jobs is just plain lame</strong>. Developers should move away from Flash, now that they have to "deal" with touch-based UIs where there is no concept of "hover". <strong>SERIOUSLY?</strong> Again, just plain lame excuse.

<h3>Cross-platform don't necessarily means Out-of-Date</h3>
<blockquote>
[...]
Adobe also wants developers to adopt Flash to create apps that run on our mobile devices.

We know from painful experience that letting a third party layer of software come between the platform and the developer ultimately results in sub-standard apps and hinders the enhancement and progress of the platform. If developers grow dependent on third party development libraries and tools, they can only take advantage of platform enhancements if and when the third party chooses to adopt the new features.
[...]
Our motivation is simple – we want to provide the most advanced and innovative platform to our developers, and we want them to stand directly on the shoulders of this platform and create the best apps the world has ever seen. We want to continually enhance the platform so developers can create even more amazing, powerful, fun and useful applications. Everyone wins – we sell more devices because we have the best apps, developers reach a wider and wider audience and customer base, and users are continually delighted by the best and broadest selection of apps on any platform.
</blockquote>
OK, I can give you this one Steve. If you <strong>SOLELY</strong> build on the top of 3rd party libraries, you get behind compared to what the platform evolutions are. That's a fact.
But not every library is like that. In the case of stuff like <strong>Java</strong> or Flash, you are right: application's developers need to wait for who provides the library to get it Up-to-Date. And that sucks big time. But not every technology is like that.
There are tons of C/C++ based libraries that can be a mix: a bit of 3rd-party library, and a bit of platform-specific APIs.

A simple example is if you think of the classical <a href="http://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller">MVC Design Pattern</a>: the View (User Interface) could be based on the platform <strong>supa-dupa features</strong>, while the Model (Business Logic) can be a mobile, cross-platform engine. And that could give to developers a very big advantage. And, actually, already does.

<h3>Conclusions</h3>
Technology wise, I personally HATE Flash websites. I wish I could extract the video part of Flash and have only that installed. And I also wish that stuff like HTML5 Video get's mature, good, stable, available everywhere. And this is already taking shape. But this "open letter" from Jobs... I just don't like it.

Again, I really love Apple and their products. But iPhone is not the only mobile phone out there. The future is bright, nice, interesting and everything. <strong>But trash the current to speed-up the future? Is that a good strategy?</strong>

<strong>Keep Flash out of MY Mobile Safari browser</strong>: that's your platform, and you have the right to do whatever you want with that. <em>And I'll still be a very happy customer and a devoted engineer, that admires the product and the producer.</em> But allow developers to use whatever they want: <strong>leave to the market the role to pick the best and trash the rubbish.</strong>

That's the <em>"set of thoughts that grew on the top of my mind"</em> after reading Steve's letter. Of course, assuming we believe it's all from Steve himself: I'm not really sure if it's not just an Apple strategy to make messages <em>"coming from Steve Jobs"</em>, so that all the <em>blind-Apple-addicts</em> (like I was not one of them :-P) will take it as <em>"His speech</em>". But this is probably another interesting discussion of it own.
