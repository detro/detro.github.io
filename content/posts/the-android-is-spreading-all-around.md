---
layout: post
author: detro
title: "The Android is spreading all around"
tags: [kernel, google, htc, n810, mobile, linux, it, hardware, windows, curiosity, english, touch, android, porting]
date: "2008-12-14T21:51:28Z"
aliases:
  - /2008/12/14/the-android-is-spreading-all-around
  - /2008/12/the-android-is-spreading-all-around
---

![Open Android](http://source.android.com/_/rsrc/1224547124755/Home/os-bot-launch2.png)I was sure that is was just a matter of time, before we started to see Android spreading all around into every possible flavour of Mobile (only?) piece of hardware.

It started when just the first versions of the [SDK](http://code.google.com/intl/und/android/download_list.html) were out in the wild: people were "just" recompiling the kernel, and boom! The magic was happening. That was a demonstration of really good and effective layering: just adapting the kernel to the hosting hardware was making it <em>up and running</em>.

Now, with [the source code available to everyone](http://source.android.com/), the porting festival is becoming even larger, with small-medium company, as well as university guys, porting Android everywhere.

<!--more-->
A couple of very interesting example are the [Porting on Nokia 810](http://www.linuxdevices.com/news/NS3641439368.html) ([LinuxDevices.com](http://www.linuxdevices.com/)) made by [NthCode](http://www.nthcode.com/pubs/porting-android-to-a-new-device.html) and the [Porting on HTC Touch](http://androidguys.com/?p=3070) from [Martin Johnson](http://forum.xda-developers.com/showthread.php?t=382265) ([Massey University's student](http://it029000.massey.ac.nz/vogue/)).

The first article is interesting because it discusses the changes made by [Google](http://www.google.com) to the [vanilla Linux Kernel](http://www.kernel.org/): it shows how deep into the Linux they went to make it good for Mobile Devices... and how much [Nokia](http://www.nokia.com) didn't for the [en:N810].

The second one, instead, shows how simple is, even for a device that is on the market and that runs a completely different [en:Operating System] ([en:Windows Mobile]): this means total absence of any toolchain or Linux driver, neither binary nor open source.
