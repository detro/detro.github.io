---
layout: post
author: detro
published: true
title: "Unslung on my NSLU2"
tags: [linux, ftp, sharing, http, nslu2, personal, selinux, flash, firmware, it, nas, hdd, samba, english, hacking, debian, unslung]
date: "2008-05-11 11:32:22"
updated: "2008-05-11 11:32:22"
permalink: /2008/05/11/unslung-on-my-nslu2/
---

<img src="http://upload.wikimedia.org/wikipedia/commons/thumb/4/48/Linksys_NSLU2.jpeg/219px-Linksys_NSLU2.jpeg" alt="Linksys (Cisco) NSLU2" align="right" />
Motivated by my friend KM <a href="http://lattecaglioesale.wordpress.com/2007/11/17/la-lumachina/">here (sorry, Italian link)</a>, I decided to buy a <a href="http://www.google.com/search?hl=en&q=linksys+nslu2&btnG=Google+Search&meta=">Linksys NSLU2</a>, a Micro-[en:NAS] based on [en:Linux].
<a href="http://www.linksys.com">Linksys</a> (owned by <a href="http://www.cisco.com">Cisco</a>) released since day one the source code of the tuned <a href="http://www.kernel.org">Linux Kernel</a>, instantly allowing the Open Source community to hack this device in a million of ways.

My requirements are very simple: I need to share something like 6 external HD using either <a href="http://en.wikipedia.org/wiki/Samba_(software)">Samba</a> or FTP+HTTP.

I first tried to use the "out-of-the-box" NSLU2 with the latest firmware, but it's unable to manage more than 2 disks (on an HUB, it just see the first HDD attached).
I then decided to use <a href="http://www.nslu2-linux.org/wiki/Debian/HomePage">Debian/NSLU2</a>, a very rich distribution for [en:ARM] that is just amazing. The only problem? It seems too much for an hardware like NSLU2, plus, after a normal <code>apt-get dist-upgrade</code> something related with [en:SELinux] and <a href="http://vsftpd.beasts.org/">vsftpd</a> happened and I didn't managed to put it all back to work. I should have disabled selinux passing the parameter <code>selinux = 0</code> to the Kernel at boot time but... there is no "easily modifiable" [en:Bootloader] to pass parameters to the kernel at boot time (at least, as far as I know). I suppose that I should modify the kernel, recompile and then re-flash it. Too much for something I want to finish in max 2 days. And the NSLU2 is slow. Very slow. It took something like 12 hours to make the full installation of Debian and flash re-flash the firmware.
Besides, for what I need to do, it's not worth it to do all this.

So, what I decided was to use <a href="http://www.nslu2-linux.org/wiki/Unslung/HomePage">Unslung</a>: a modified version of the plain Linksys kernel with some features, a package manager (rich of a lot of very interesting software optimized for the NSLU2) and that works as a Superset of the original features of the Device.
Just plug disks in it and they are available on the Network. I can control the [en:ACL] through web interface, but it looks "impossible" to give an arbitrary name to the shared disks. But that's enough.

I'll update if I change my mind or if this solutions lasts for longer. ;)
