---
layout: post
author: detro
published: true
title: "The Android is spreading all around"
tags: [kernel, google, htc, n810, mobile, linux, it, hardware, windows, curiosity, english, touch, android, porting]
date: "2008-12-14 21:51:28"
updated: "2008-12-14 21:51:28"
permalink: /2008/12/14/the-android-is-spreading-all-around/
---

<img src="http://source.android.com/_/rsrc/1224547124755/Home/os-bot-launch2.png" alt="Open Android" align="right" />I was sure that is was just a matter of time, before we started to see Android spreading all around into every possible flavour of Mobile (only?) piece of hardware.

It started when just the first versions of the <a href="http://code.google.com/intl/und/android/download_list.html">SDK</a> were out in the wild: people were "just" recompiling the kernel, and boom! The magic was happening. That was a demonstration of really good and effective layering: just adapting the kernel to the hosting hardware was making it <em>up and running</em>.

Now, with <a href="http://source.android.com/">the source code available to everyone</a>, the porting festival is becoming even larger, with small-medium company, as well as university guys, porting Android everywhere.

<!--more-->
A couple of very interesting example are the <a href="http://www.linuxdevices.com/news/NS3641439368.html">Porting on Nokia 810</a> (<a href="http://www.linuxdevices.com/">LinuxDevices.com</a>) made by <a href="http://www.nthcode.com/pubs/porting-android-to-a-new-device.html">NthCode</a> and the <a href="http://androidguys.com/?p=3070">Porting on HTC Touch</a> from <a href="http://forum.xda-developers.com/showthread.php?t=382265">Martin Johnson</a> (<a href="http://it029000.massey.ac.nz/vogue/">Massey University's student</a>).

The first article is interesting because it discusses the changes made by <a href="http://www.google.com">Google</a> to the <a href="http://www.kernel.org/">vanilla Linux Kernel</a>: it shows how deep into the Linux they went to make it good for Mobile Devices... and how much <a href="http://www.nokia.com">Nokia</a> didn't for the [en:N810].

The second one, instead, shows how simple is, even for a device that is on the market and that runs a completely different [en:Operating System] ([en:Windows Mobile]): this means total absence of any toolchain or Linux driver, neither binary nor open source.
