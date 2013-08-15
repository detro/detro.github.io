---
layout: post
author: detro
published: true
title: "First Official iPhone SDK Interface Builder Tutorial"
tags: [personal, builder, it, interface, beta, iphone, curiosity, english, release, tutorial, sdk]
date: "2008-04-09 23:08:51"
updated: "2008-04-09 23:08:51"
permalink: /2008/04/09/first-official-iphone-sdk-interface-builder-tutorial/
---

I received this letter from Apple this morning:
<blockquote>
<div align="center"><img src="http://www.macdailynews.com/gfx/article_gfx/080327_iphone_sdk_beta2.jpg" alt="iPhone SDK - new release" /></div>
Log in to the iPhone Dev Center and download the third beta version of the iPhone SDK.

Make sure to take advantage of all the development resources available to you in the <a href="http://developer.apple.com/iphone/">iPhone Dev Center</a>, including updated documentation such as the iPhone OS Programming Guide, <a href="http://developer.apple.com/iphone/library/documentation/iPhone/Conceptual/iPhone101/Articles/chapter_1000_section_1.html">a new tutorial</a> for creating iPhone applications using Interface Builder, and the latest release notes.
</blockquote>

I did so (later on) and I followed the full tutorial.
Finally!!!
Now I can use properly <a href="http://en.wikipedia.org/wiki/Interface_Builder">Interface Builder</a> for my needs: programming using UIKit is quite difficult on the View side. Instead, using Interface Builder is quite easy to just follow the well known <a href="http://en.wikipedia.org/wiki/Model-view-controller">MVC Design Pattern</a>.

Just a little thing to take care: in the sections "<a href="http://developer.apple.com/iphone/library/documentation/iPhone/Conceptual/iPhone101/Articles/chapter_6_section_2.html#//apple_ref/doc/uid/TP40007514-CH8-SW2">The sayHello: Method</a>" and "<a href="http://developer.apple.com/iphone/library/documentation/iPhone/Conceptual/iPhone101/Articles/chapter_6_section_4.html#//apple_ref/doc/uid/TP40007514-CH8-SW6">The String</a>" the tutorial suggest the usage of this "string" object as it is part of the "MyViewController" class. Get rid of it. It's useless and if you try to compile the code with it, it will give you an "<code>undefined reference</code>" error.
How? If you can't do that on your own, why are you still reading me? :P

