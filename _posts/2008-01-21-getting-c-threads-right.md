---
layout: post
author: detro
published: true
title: "Getting C++ Threads Right"
tags: [curiosity, devtools, hp, projects, english]
date: "2008-01-21 16:46:33"
updated: "2008-01-21 16:46:33"
permalink: /2008/01/21/getting-c-threads-right/
---

<img src="http://www.hpl.hp.com/personal/Hans_Boehm/Hans_Boehm.jpg" alt="Hans Boehm" align="right" /><a href="http://www.hpl.hp.com/personal/Hans_Boehm/">Hans Boehm</a> has given a very interesting lecture on "Getting C++ Threads Right" at Google last month.  The lecture is available in video format from <a href="http://www.youtube.com/watch?v=mrvAqvtWYb4">here</a>

<blockquote><strong>ABSTRACT</strong>

The advent of multicore processors has generated profound debate on the merits of writing parallel programs with threads and locks. Nonetheless, for many application domains, this remains the standard paradigm for writing parallel programs, and at the moment, there is no apparent universal replacement. And it is the focus of this talk.

Somewhat surprisingly, there are a number of often subtle, but generally fixable, industry-wide problems with current approaches to threads programming. We'll focus on probably the most widely used environments, consisting of C or C++ with a standard threads library. Problems span the spectrum from system libraries through language implementations through supporting hardware. They get in the way both in that they often make it difficult to write 100% reliable multi-threaded software, and in that they confuse even the basics of the programming model, thus making it hard to teach. A surprising number of "experts" do not understand the basic rules. Arguably, these problems really need to be addressed to even allow a meaningful comparison to other parallel programming approaches.

Since solutions to these problems generally require a coordinated industry effort, we helped to persuade the C++ standards committee to address them by pursuing a coherent approach to threads in the next C++ standard. The talk will outline some of the proposed solutions, and give an update on this effort.

Speaker: Hans Boehm
Hans Boehm is a member of the advanced architecture group at HP Labs. He has worked on many aspects of programming language design and implementation, including garbage collection and concurrency, and he was HP's representative to the effort to redesign Java's memory model. He is a past Chair of ACM SIGPLAN, and is an ACM Distinguished Scientist.
</blockquote>

The slides for the lecture are available from: <a href="http://www.hpl.hp.com/personal/Hans_Boehm/misc_slides/c++threads.pdf">http://www.hpl.hp.com/personal/Hans_Boehm/misc_slides/c++threads.pdf</a>.
<!--more-->
Hans Boehm is the main author of the C++ concurrency memory model proposed for standardization, which is the most important essential for concurrency support in [en:C++0x].  See [en:Bjarne Stroustrup]'s paper "Evolving a language in and for the real world: C++ 1991-2006" (<a href="http://www.research.att.com/~bs/hopl-almost-final.pdf">http://www.research.att.com/~bs/hopl-almost-final.pdf</a>) for more information on why concurrency support was not added to [en:C++98] and the current directions and work for C++0x, and Hans Boehm's paper "Threads Cannot be Implemented as a Library" (<a href="http://www.hpl.hp.com/personal/Hans_Boehm/misc_slides/pldi05_threads.pdf">http://www.hpl.hp.com/personal/Hans_Boehm/misc_slides/pldi05_threads.pdf</a>) for a brief presentation of some of the problems.

Hans Boehm is also the main author of the <a href="http://en.wikipedia.org/wiki/Boehm_garbage_collector">current C++ evolution work to add support for transparent programmer-directed garbage collection to C++, which will likely be adopted for C++0x</a>.
