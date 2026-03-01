---
layout: post
author: detro
title: "Debian on my NSLU2: The Revenge of the Swirl"
tags: [flash, saving, selinux, it, linux, ftp, samba, clock, personal, firmware, nas, hdd, memory, sharing, http, english, curiosity, nslu2, debian, optimization, unslung, hacking]
date: "2008-05-17T21:57:58Z"
aliases:
  - /2008/05/17/debian-on-my-nslu2-the-revenge-of-the-swirl
  - /2008/05/debian-on-my-nslu2-the-revenge-of-the-swirl
---

[After some playing](http://www.detronizator.org/2008/05/11/unslung-on-my-nslu2/) with [Unslung](http://www.nslu2-linux.org/wiki/Unslung/HomePage) on my [Linksys NSLU2](http://www.google.com/search?hl=en&q=linksys+nslu2&btnG=Google+Search&meta=), I realize it was a "very limited solution" for our needs. We need to share 4 (sometimes 5) NTFS (or others) volumes, where everyone of them is 500GB: this is too much even for the modified firmware of Unslung, unable to read the full directory trees (and the contained files) of my massive movie's collection.



<table style="width:194px;"><tr><td align="center" style="height:194px;background:url(http://picasaweb.google.com/f/img/transparent_album_background.gif) no-repeat left">[![](http://lh6.ggpht.com/detronizator/SC9F6fE2BaE/AAAAAAAAA8I/oz-Ujfnmj9g/s160-c/TheDebianNSLU2SReign.jpg)](http://picasaweb.google.com/detronizator/TheDebianNSLU2SReign)</td></tr><tr><td style="text-align:center;font-family:arial,sans-serif;font-size:11px">[The Debian/NSL<wbr></wbr>U2&#39;s Reign](http://picasaweb.google.com/detronizator/TheDebianNSLU2SReign)</td></tr></table>



So, I came back to the [Debian/NSLU2](http://www.nslu2-linux.org/wiki/Debian/HomePage) solution. This time, with all the intention to make it work.
It's quite pointless to report here all the things I did to make it work in the way I want/need. I'll just write down the most important bits:

* Memory Optimization:

* remove <strong>unused kernel modules</strong> (blacklisting in <code>/etc/modprobe.d/blacklist</code>)

* remove <strong>unnecessary services/daemons</strong> (like <code>exim4</code> or <code>nfsd</code>)

* Mount volumes "<code>by-label</code>", to avoid messes in mounting if the <code>/dev</code><code> files associated with the particular devices changes (reboot, unplug/replug, etc.) (take a look at [this page for more info](http://en.opensuse.org/NTFS))</code>

* Use the <code>noatime</code> option in the <code>/etc/fstab</code> file to <strong>avoid the system to update the "last-access" field in the i-nodes</strong>: this is very important to <strong>reduce I/O on Flash memories</strong>

* Reduce the <strong>swappiness</strong> of the kernel (reduce the I/O)

* Install <code>fuse</code> and compile [<code>ntfs-3g</code>](http://www.ntfs-3g.org/) by hand: on Debian stable it's not available yet (I could have used <code>stable-backports</code> but no one compiled <code>ntfs-3g</code> for [en:ARM] :( )

* Configure one [en:Samba] share for Disk. This avoid the problem of Samba calculating "free-space" when the sub-directory of a share is the mount point of a different disk.

* <strong>De-underclock the NSLU2</strong>: the CPU (<strong>XScale-IXP42x Family rev 1 (v5l)</strong>) is soldered to the board with a pin configuration that makes it run half of is speed. I just removed the Resistor that realize that particular configuration. More info [here](http://www.nslu2-linux.org/wiki/HowTo/OverClockTheSlug) and [here](http://www.intel.com/design/network/manuals/252480.htm).

