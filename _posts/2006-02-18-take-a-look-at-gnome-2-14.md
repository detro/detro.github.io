---
layout: post
author: detro
published: true
title: "Take a look at Gnome 2.14"
tags: [english, sw, it, opensource, linux, projects]
date: "2006-02-18 10:56:25"
updated: "2006-02-18 10:56:25"
permalink: /2006/02/18/take-a-look-at-gnome-214/
---

<a href="http://www.gnome.org/~davyd/">Davyd Madeley</a> has released a <a href="http://www.gnome.org/~davyd/gnome-2-14/">"coming soon features list" of Gnome 2.14</a>.

Really interesting new features for Gnome users: 
	<ul>
<li>Speed improvement in <ins datetime="2006-02-18T09:27:41+00:00">Memory Allocation System</ins> (Gnome use a dedicated subsystem for this stuff), using a new mem-allocator called <strong>GSlice</strong> (follow a benchmark), and in Font Rendering (<strong>Gnome Terminal will be fastest of XTerm 8O </strong>)</li>
	<li>some Administrative tools</li>

	<li>improvement to the integrated search system (expecially for <a href="http://beaglewiki.org/Main_Page">Beagle</a>-Enabled linux-box)</li>

	<li>Metacity improvement (<strong>it will use OpenGL... but I don't know if this means the integration with <a href="http://www.detronizator.org/2006/02/11/xgl-opengl-sempre-piu-prepotentemente-sui-nostri-desktop/">Xgl/Compiz</a></strong>)</li>
	<li>... and much <a href="http://www.gnome.org/~davyd/gnome-2-14/">more</a></li></ul>

Here, a little benchmark for the new mem-allocator:
<blockquote>
<img src="http://www.gnome.org/~davyd/gnome-2-14/images/gmemchunk.png" alt="mem allocator benchmark" />
<em>Performance comparison of GMemChunk (older allocator),
Malloc and GSlice with 1, 5, 10 and 20 threads each
doing 1 million allocations and deallocations of a GList.</em>
</blockquote>

Source, <a href="http://ossblog.it/">OSSBlog</a>.




