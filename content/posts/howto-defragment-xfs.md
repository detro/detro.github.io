---
layout: post
author: detro
title: "Howto defragment XFS"
tags: [sun, linux, howto, operating-systems, it, opensource, curiosity, english, sw]
date: "2006-04-26T13:46:28Z"
aliases:
  - /2006/04/26/howto-defragment-xfs
  - /2006/04/howto-defragment-xfs
---

After the [coronation as the best (imho ;) ) file-system for *nix systems](http://www.detronizator.org/2006/04/24/filesystems-serious-and-realistic-comparison/), [BitUbique post an howto defragment an XFS partition](http://bitubique.com/content/view/45/50/).

Simplest and fastest way?


> <code>sudo xfs_fsr -v /dev/hda1</code>



