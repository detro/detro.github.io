---
layout: post
author: detro
published: true
title: "Linux Io Scheduler"
tags: [sw, english, howto, it, opensource, curiosity, linux]
date: "2006-04-15 13:22:10"
updated: "2006-04-15 13:22:10"
permalink: /2006/04/15/linux-io-scheduler/
---

<img src="http://www.wlug.org.nz/theme/WLUG05/penguin_head.png" alt="tux" align="right" />
<blockquote>The 2.6 Linux Kernel included selectable IO schedulers. IO Schedulers control the way the kernel commits reads and writes to disks - the intention of providing different schedulers is to allow better optimsation for different classes of workload.

Without an IO scheduler, the kernel would basically just issue each request to disk in the order that it received them. This could result in massive thrashing of the disk subsystem - if one process was reading from one part of the disk, and one writing to another, it would have to seek back and forth across the disk for every operation. The schedulers main goal is to optimise disk access times.

An IO scheduler can use the following techniques to improve performance:

Request merging
    The scheduler merges adjacent requests together to reduce disk seeking
Elevator
    The scheduler orders requests based on their physical location on the block device, and it basically tries to seek in one direction as much as possible.
Prioritisation
    The scheduler has complete control over how it prioritises requests, and can do so in a number of ways

All IO schedulers should also take into account resource starvation, to ensure requests eventually do get serviced!... </blockquote>

Continue on <a href="http://www.wlug.org.nz/LinuxIoScheduler">WLUG</a>.

