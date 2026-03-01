---
layout: post
author: detro
title: "Take a look at Gnome 2.14"
tags: [english, sw, it, opensource, linux, projects]
date: "2006-02-18T10:56:25Z"
---

[Davyd Madeley](http://www.gnome.org/~davyd/) has released a ["coming soon features list" of Gnome 2.14](http://www.gnome.org/~davyd/gnome-2-14/).

Really interesting new features for Gnome users: 
	

* Speed improvement in <ins datetime="2006-02-18T09:27:41+00:00">Memory Allocation System</ins> (Gnome use a dedicated subsystem for this stuff), using a new mem-allocator called <strong>GSlice</strong> (follow a benchmark), and in Font Rendering (<strong>Gnome Terminal will be fastest of XTerm 8O </strong>)

	* some Administrative tools

	* improvement to the integrated search system (expecially for [Beagle](http://beaglewiki.org/Main_Page)-Enabled linux-box)

	* Metacity improvement (<strong>it will use OpenGL... but I don't know if this means the integration with [Xgl/Compiz](http://www.detronizator.org/2006/02/11/xgl-opengl-sempre-piu-prepotentemente-sui-nostri-desktop/)</strong>)

	* ... and much [more](http://www.gnome.org/~davyd/gnome-2-14/)

Here, a little benchmark for the new mem-allocator:


>> ![mem allocator benchmark](http://www.gnome.org/~davyd/gnome-2-14/images/gmemchunk.png)
> <em>Performance comparison of GMemChunk (older allocator),
> Malloc and GSlice with 1, 5, 10 and 20 threads each
> doing 1 million allocations and deallocations of a GList.</em>




Source, [OSSBlog](http://ossblog.it/).

