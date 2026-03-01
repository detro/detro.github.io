---
layout: post
author: detro
title: "HiEuro 0.2"
tags: [personal, macosx, sw, objective-c, opensource, english, output, projects]
date: "2007-09-09T11:43:27Z"
aliases:
  - /2007/09/09/hieuro-0-2
  - /2007/09/hieuro-0-2
---

Here we are. 0.2.
0.2 of nothing but a "<em>divertissment</em>" which help me to learn better and better the Cocoa Framework, and discover all the magic stuff it does.


![HiEuro screenshot - version 0.2](http://lh3.google.com/detronizator/RuPJaobNCuI/AAAAAAAAAXY/mlFSaV7afIM/s400/HiEuro-0.2%20Screenshot.png)


The release notes is:


> <dl>
> <dt>0.2 (2007-09-09)</dt>
> <dd>
> * Support for Italian, Spanish, French and German (Thanks to [Manu](http://secretum.neminis.org/)).
>> * New "Preferences" panel to set the "Default Currency" to convert from/to and the "Default Currency Ammount" to set at the application startup (Thanks to the [Alhandra's](http://alhandra.wordpress.com/) suggestion).
>> * Remove a Bug in the "German Mark" definition (I wrote "Deutsche Mark" in the English version :P )
>> </dd></dl>



One important aspect I learnt is how to [bind Preferences to the User Defaults](http://developer.apple.com/cocoa/cocoabindings.html) (the Cocoa default preferences system). Pratically, the one that generates, for every app, a file <code>.plist</code> in your <code>~/Library/Preferences</code> directory. Unix-Style joined with Apple-Style.

Who is interested, I updated the [HiEuro page](http://www.detronizator.org/outputs/experiments-with-cocoa/hieuro/) with [Binary](http://downloads.detronizator.org/HiEuro-0.2.dmg) and [Source](http://downloads.detronizator.org/HiEuro-0.2-src.zip) of the version 0.2. so, don't be shy! ;)
