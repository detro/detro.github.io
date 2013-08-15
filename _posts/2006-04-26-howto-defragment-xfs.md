---
layout: post
author: detro
published: true
title: "Howto defragment XFS"
tags: [sun, linux, howto, operating-systems, it, opensource, curiosity, english, sw]
date: "2006-04-26 13:46:28"
updated: "2006-04-26 13:46:28"
permalink: /2006/04/26/howto-defragment-xfs/
---

After the <a href="http://www.detronizator.org/2006/04/24/filesystems-serious-and-realistic-comparison/">coronation as the best (imho ;) ) file-system for *nix systems</a>, <a href="http://bitubique.com/content/view/45/50/">BitUbique post an howto defragment an XFS partition</a>.

Simplest and fastest way?
<blockquote><code>sudo xfs_fsr -v /dev/hda1</code></blockquote>


