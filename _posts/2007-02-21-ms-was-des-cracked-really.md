---
layout: post
author: detro
published: true
title: "MS: «Was DES cracked? Really?»"
tags: [curiosity, personal, it, windows, laugh, english, microsoft]
date: "2007-02-21 10:43:30"
updated: "2007-02-21 10:43:30"
permalink: /2007/02/21/ms-was-des-cracked-really/
---

<img src="http://www.cepolina.com/freephoto/f/other.food/cracker.snack.bread.jpg" alt="cracker... ;)" align="right" width="100" />
Yeasterday <a href="http://blog.neminis.org/">Nemo</a> and I have found a post on <a href="http://www.ossblog.it/post/2033/ophcrack-vista-password-cracking">OSSBlog</a> about the new release of <a href="http://ophcrack.sourceforge.net/">ophcrack 2.3.4</a>.

<blockquote>
Ophcrack is a Windows password cracker based on rainbow tables. It is a very efficient implementation of rainbow tables done by the inventors of the method. It comes with a GTK+ Graphical User Interface and runs on [en:Windows], [en:Mac OS X] (Intel CPU) as well as on [en:Linux].
</blockquote>

In the last release, ophcrack supports [en:Windows Vista|Vista]. Mmmm... sounds strange. <!--more-->

But it's true. And its because Vista is based on [en:LM_hash]... too. Reading the article on [en:LM_hash|Wikipedia about LM_hash]:
<blockquote>
[...]
<strong>Security weaknesses</strong>
Although it is based on DES, a reasonably secure block cipher, the LM hash can easily be cracked due to two weaknesses in its implementation.
[...]
Because LM hash does not include salt, a time-memory trade-off cryptanalysis attack, such as rainbow tables, is also feasible. In 2003, Ophcrack, an implementation of the rainbow table technique, was published. It specifically targets the weaknesses of LM encryption, and includes pre-computed data sufficient to crack virtually all alphanumeric LM hashes in a few seconds. Many cracking tools, e.g. RainbowCrack, L0phtCrack and Cain, now incorporate similar attacks and make cracking of LM hashes trivial.
To address the security weaknesses inherent in LM encryption, Microsoft introduced the NTLM algorithm with Windows NT 3.1. While LAN Manager is considered obsolete and current Windows operating systems use the stronger NTLM hashing method, all Windows systems still compute and store the LAN Manager hash by default for compatibility with LAN Manager and Windows Me or earlier clients. It is considered good security practice to disable this feature where it isn’t needed. Microsoft claims that support for LM will be completely eliminated in the new Windows Vista operating system.
</blockquote>

So, does [en:Microsoft|M$] know that it's a very old and very "weak" algorithm? What about the <strong>famous and "<em>wowed</em>"</strong> security of Vista? Ok, the physical [en:Computer_security|security] is not possible (if I have physical access to a machine... software security is pratically useless), but... why they continue to use a so poor technology? Why If theyrself have tried to improve the strength of the algorithm in the past? 

Why they are so [en:Idiot|IDIOT]?!?!?!?!? Why a plenty of [en:Moron (psychology)|MORONS] owns the Personla Computer Market-Share?!?!?!?!?
