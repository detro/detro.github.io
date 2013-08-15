---
layout: post
author: detro
published: true
title: "SpotlightFS: example of MacFUSE usage"
tags: [google, apple, macosx, sw, it, opensource, english, projects]
date: "2007-01-30 16:45:21"
updated: "2007-01-30 16:45:21"
permalink: /2007/01/30/spotlightfs-example-of-macfuse-usage/
---

<img src="http://photos1.blogger.com/x/blogger/813/3778/320/669304/Picture%202.jpg" alt="SpotlightFS" align="right" />
I check the <a href="http://googlemac.blogspot.com/">Official Google MacBlog</a> regularly and, yeasterday, I read something interest on it:
<blockquote><a href="http://code.google.com/p/macfuse/wiki/MACFUSE_FS_SPOTLIGHTFS">SpotlightFS</a> is a <a href="http://code.google.com/p/macfuse/">MacFUSE</a> file system that creates true smart folders, where the folders' contents are <strong>dynamically generated</strong> by querying Spotlight. This differs from Finder's version of smart folders, which are really plist files with a ".savedSearch" file extension. <strong>Since SpotlightFS smart folders are true folders, they can be used from anywhere—including the command line!</strong>

SpotlightFS is not very complicated, and it's a good example of what can quickly and easily be done using MacFUSE. Please check out SpotlightFS and the other cool stuff on the newly updated MacFUSE project site.</blockquote>

Wow. Sounds good. A really "dinamically generated" file-system, based on the [en:Spotlight (software)|Spotlight] Engine. It seems to be much too much better of the annoying smart folders and... it's a file-system!!! ;) 

<strong>Edited at 19:32 in the same day of the posting</strong>: I have installed MacFUSE 0.1.9 (quite simple) and tried SpotlightFS and SSHFS also. The first is too heavy for my [en:iBook] (like Spotlight itself... but with the not-marginal difference that the main process of indexing is not interruptable :( ). It also needs a [en:System_Preferences|Preference Panel] to manage complex search query (actually the only available from [en:Macintosh_Finder|Finder] is searching by keyword).
The second is simple to setup and run (very quick) but... it's obviously embryonal and "raw". But, I think that <strong>it's only the beginning</strong> ;) .

