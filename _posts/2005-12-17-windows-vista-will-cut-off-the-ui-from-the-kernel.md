---
layout: post
author: detro
published: true
title: "Windows Vista will cut off the UI from the Kernel"
tags: [windows, sw, microsoft, curiosity, english]
date: "2005-12-17 10:43:17"
updated: "2005-12-17 10:43:17"
permalink: /2005/12/17/vista-cut-off-ui-from-kernel/
---

<blockquote>... The company has already announced to developers that most drivers, including graphics, will run in user mode - which means that they don't get access to the privileged kernel mode (or Ring 0). At this level, a process can do anything it likes, including overwriting memory that doesn't belong to it. The result of such overwriting by (usually) buggy code is often a system crash. So the move should result in greater reliability, because crashing drivers cause some 89 per cent of system crashes in Windows XP, according to Microsoft. When run in user mode, they won't be able to bring down the entire system...</blockquote>

Full article on <a href="http://www.techworld.com/news/index.cfm?RSS&NewsID=5002">Techworld.com</a>.

This is, obviously, the better news that we can hear from MS. Only two observations:
<ol>
<li>It's the truth? We can't see that. We can only see the "interface" to that (the kernel interface) and no one can "assure" us about "what's behind the wall".</li>
<li>How many time to study the <a href="http://books.google.it/books?q=operating+systems&oi=print">books</a>, Bill?</li>
</ol>


