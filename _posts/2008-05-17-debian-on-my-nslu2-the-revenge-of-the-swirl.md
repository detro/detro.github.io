---
layout: post
author: detro
published: true
title: "Debian on my NSLU2: The Revenge of the Swirl"
tags: [flash, saving, selinux, it, linux, ftp, samba, clock, personal, firmware, nas, hdd, memory, sharing, http, english, curiosity, nslu2, debian, optimization, unslung, hacking]
date: "2008-05-17 21:57:58"
updated: "2008-05-17 21:57:58"
permalink: /2008/05/17/debian-on-my-nslu2-the-revenge-of-the-swirl/
---

<a href="http://www.detronizator.org/2008/05/11/unslung-on-my-nslu2/">After some playing</a> with <a href="http://www.nslu2-linux.org/wiki/Unslung/HomePage">Unslung</a> on my <a href="http://www.google.com/search?hl=en&q=linksys+nslu2&btnG=Google+Search&meta=">Linksys NSLU2</a>, I realize it was a "very limited solution" for our needs. We need to share 4 (sometimes 5) NTFS (or others) volumes, where everyone of them is 500GB: this is too much even for the modified firmware of Unslung, unable to read the full directory trees (and the contained files) of my massive movie's collection.

<div align="center">
<table style="width:194px;"><tr><td align="center" style="height:194px;background:url(http://picasaweb.google.com/f/img/transparent_album_background.gif) no-repeat left"><a href="http://picasaweb.google.com/detronizator/TheDebianNSLU2SReign"><img src="http://lh6.ggpht.com/detronizator/SC9F6fE2BaE/AAAAAAAAA8I/oz-Ujfnmj9g/s160-c/TheDebianNSLU2SReign.jpg" width="160" height="160" style="margin:1px 0 0 4px;"/></a></td></tr><tr><td style="text-align:center;font-family:arial,sans-serif;font-size:11px"><a href="http://picasaweb.google.com/detronizator/TheDebianNSLU2SReign" style="color:#4D4D4D;font-weight:bold;text-decoration:none;">The Debian/NSL<wbr></wbr>U2&#39;s Reign</a></td></tr></table>
</div>

So, I came back to the <a href="http://www.nslu2-linux.org/wiki/Debian/HomePage">Debian/NSLU2</a> solution. This time, with all the intention to make it work.
It's quite pointless to report here all the things I did to make it work in the way I want/need. I'll just write down the most important bits:
<ul>
<li>Memory Optimization:
<ul>
<li>remove <strong>unused kernel modules</strong> (blacklisting in <code>/etc/modprobe.d/blacklist</code>)</li>
<li>remove <strong>unnecessary services/daemons</strong> (like <code>exim4</code> or <code>nfsd</code>)</li>
</ul>
</li>
<li>Mount volumes "<code>by-label</code>", to avoid messes in mounting if the <code>/dev</code><code> files associated with the particular devices changes (reboot, unplug/replug, etc.) (take a look at <a href="http://en.opensuse.org/NTFS">this page for more info</a>)</code></li>
<li>Use the <code>noatime</code> option in the <code>/etc/fstab</code> file to <strong>avoid the system to update the "last-access" field in the i-nodes</strong>: this is very important to <strong>reduce I/O on Flash memories</strong></li>
<li>Reduce the <strong>swappiness</strong> of the kernel (reduce the I/O)</li>
<li>Install <code>fuse</code> and compile <a href="http://www.ntfs-3g.org/"><code>ntfs-3g</code></a> by hand: on Debian stable it's not available yet (I could have used <code>stable-backports</code> but no one compiled <code>ntfs-3g</code> for [en:ARM] :( )</li>
<li>Configure one [en:Samba] share for Disk. This avoid the problem of Samba calculating "free-space" when the sub-directory of a share is the mount point of a different disk.</li>
<li><strong>De-underclock the NSLU2</strong>: the CPU (<strong>XScale-IXP42x Family rev 1 (v5l)</strong>) is soldered to the board with a pin configuration that makes it run half of is speed. I just removed the Resistor that realize that particular configuration. More info <a href="http://www.nslu2-linux.org/wiki/HowTo/OverClockTheSlug">here</a> and <a href="http://www.intel.com/design/network/manuals/252480.htm">here</a>.
</li>
</ul>
