---
layout: post
author: detro
published: true
title: "Making Bloggart Sidebar more Flexible"
tags: [configuration, twitter, appengine, new, bloggart, sidebar, google friends connect, block]
date: "2010-09-09 00:55:20"
updated: "2010-09-09 00:55:20"
permalink: /2010/09/09/Making-Bloggart-Sidebar-more-Flexible
---

[Bloggart from Nick Johnson](http://github.com/Arachnid/bloggart) is great. I think I made it clear that I love it (there hasn't been a post so far with a mention about it). But it has some "shortcoming": bits that a person like me, coming from [Wordpress](http://www.wordpress.org), always wishes were there. But no worries, we can always tune Bloggart: it's the great part of Open Source after all.

<div style="text-align: center; ">
<img src="http://farm4.static.flickr.com/3464/3263818786_961f7b7ae4.jpg" alt="Branching" align="center" />
<br />
Nice Branching Metaphor
</div>
<br />
In fact, at [github.com/detro/bloggart](http://github.com/detro/bloggart) you can find **my branch** of Bloggart, where I'm gradually pushing the new functionality I want/need.

I just pushed a commit that changes how the Sidebar is configured: no more just a bunch of links and no more than that. You can now configure your sidebar with 4 types of blocks:

* Links
* Twitter widget
* Google Friend Connect widget
* Generic HTML Code Block

Every one of those blocks has generic and specific options, to tune it the way you want. I think is making it much more flexible.

Enough talking: if you are interested, you will probably find more useful to take a look the [the actual commit](http://github.com/detro/bloggart/commit/5e59541483d7732f31aa505f849e3965b64b156d).

Have fun.
