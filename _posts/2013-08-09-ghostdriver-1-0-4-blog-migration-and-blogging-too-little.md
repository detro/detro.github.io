---
layout: post
author: detro
published: true
title: "GhostDriver 1.0.4, blog migration and blogging too little"
tags: [github, phantomjs, blog, jekyll, migration, release, bloggart, ghostdriver]
date: "2013-08-09 16:03:47"
updated: "2013-08-09 16:03:47"
permalink: /2013/08/10/GhostDriver-1-0-4-blog-migration-and-blogging-too-little
---

Yes, I'm not blogging enough.
Yes, it's a shame that the world can't read my terrible English on a more regular basis.
Yes, I'm lazy.

Well, here is a quick update for the few eager souls I have let down.

### GhostDriver

I have release [GhostDriver 1.0.4 - "Arghan Div"](https://github.com/detro/ghostdriver/releases/tag/1.0.4). It should be released in the [upcoming PhantomJS 1.9.2](https://github.com/ariya/phantomjs/issues/11452).

<div class="img">
<img src="http://placehold.it/600x150/eee/500&text=1.0.4" />
</div>

The code has been merged already into [PhantomJS master branch](https://github.com/ariya/phantomjs/commit/73bb56084028e1ee902bfedb8bd0443b337c7578) so, if you are really keen on putting your hands on it, just do a `./build.sh` of that branch.

### Blog migration

I'm planning to abandon [my fork of Bloggart](https://github.com/detro/bloggart). I have written a "backupper" that uses Node.JS to download and save locally all the Pages and Posts stored in it. If you use Bloggart and want to "leave" as well, look in [here](https://github.com/detro/bloggart/tree/blogivandemarinome-configuration/backup).

I want to move to a static generated, file stored blog. I initially thought about building it myself, but then I realised I have no time so I'm going to use [Jekyll](http://jekyllrb.com/). First tests look promising. I hope I'll get around to do it. And I want to use GitHub Pages to host it.

I'll probably have to make sure URLs are redirected properly, as I don't know how much of my current hostname structure I can use on GitHub pages.

### Blogging too little

One reason to migrate is that I think I'll write more if I can dump my thoughts into text file and do a `git push`: loading a URL to the Admin interface of this blog and typing in a `textarea` is sort of difficult nowdays.

So that might make me blog more. Or not. I don't know. Will see.

Cheers.
