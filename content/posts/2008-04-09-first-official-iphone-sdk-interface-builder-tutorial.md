---
layout: post
author: detro
title: "First Official iPhone SDK Interface Builder Tutorial"
tags: [personal, builder, it, interface, beta, iphone, curiosity, english, release, tutorial, sdk]
date: "2008-04-09T23:08:51Z"
---

I received this letter from Apple this morning:


>> 
![iPhone SDK - new release](http://www.macdailynews.com/gfx/article_gfx/080327_iphone_sdk_beta2.jpg)

> Log in to the iPhone Dev Center and download the third beta version of the iPhone SDK.
>> Make sure to take advantage of all the development resources available to you in the [iPhone Dev Center](http://developer.apple.com/iphone/), including updated documentation such as the iPhone OS Programming Guide, [a new tutorial](http://developer.apple.com/iphone/library/documentation/iPhone/Conceptual/iPhone101/Articles/chapter_1000_section_1.html) for creating iPhone applications using Interface Builder, and the latest release notes.




I did so (later on) and I followed the full tutorial.
Finally!!!
Now I can use properly [Interface Builder](http://en.wikipedia.org/wiki/Interface_Builder) for my needs: programming using UIKit is quite difficult on the View side. Instead, using Interface Builder is quite easy to just follow the well known [MVC Design Pattern](http://en.wikipedia.org/wiki/Model-view-controller).

Just a little thing to take care: in the sections "[The sayHello: Method](http://developer.apple.com/iphone/library/documentation/iPhone/Conceptual/iPhone101/Articles/chapter_6_section_2.html#//apple_ref/doc/uid/TP40007514-CH8-SW2)" and "[The String](http://developer.apple.com/iphone/library/documentation/iPhone/Conceptual/iPhone101/Articles/chapter_6_section_4.html#//apple_ref/doc/uid/TP40007514-CH8-SW6)" the tutorial suggest the usage of this "string" object as it is part of the "MyViewController" class. Get rid of it. It's useless and if you try to compile the code with it, it will give you an "<code>undefined reference</code>" error.
How? If you can't do that on your own, why are you still reading me? :P

