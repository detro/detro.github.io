---
layout: post
author: detro
published: true
title: "Snippet: fix Screen Orientation in a Qt/S60 app"
tags: [snippet, orientation, screen, nokia, howto, it, symbian, english, s60, qt]
date: "2009-08-11 08:58:10"
updated: "2009-08-11 08:58:10"
permalink: /2009/08/11/snippet-fix-screen-orientation-in-a-qts60-app/
---

I follow the <a href="mailto:qts60-feedback@trolltech.com">Qt/S60 Mailing list</a>, that is turning out to be a very interesting and active ML, and the <a href="http://labs.trolltech.com/blogs/">Qt Labs blog</a>, always full of very good code, written directly by the guys of <a href="http://www.qtsoftware.com/">Qt Software</a>. I thought could be nice to start to post some of the stuff I'm learning.

<div class="highlight"><pre><span class="cp">#include &lt;eikenv .h&gt;</span>
<span class="cp">#include &lt;eikappui .h&gt;</span>
<span class="cp">#include &lt;aknenv .h&gt;</span>
<span class="cp">#include &lt;aknappui .h&gt;</span>
<span class="c1">// ...</span>
<span class="c1">// lock orientation</span>
<span class="n">CAknAppUi</span><span class="o">*</span> <span class="n">appUi</span> <span class="o">=</span> <span class="k">static_cast</span><span class="o">&lt;</span><span class="n">caknappui</span> <span class="o">*&gt;</span><span class="p">(</span> <span class="n">CEikonEnv</span><span class="o">::</span><span class="n">Static</span><span class="p">()</span><span class="o">-&gt;</span><span class="n">AppUi</span><span class="p">()</span> <span class="p">);</span>
<span class="k">if</span> <span class="p">(</span> <span class="n">appUi</span> <span class="p">)</span> <span class="c1">//&lt; Actually, this will always pass. It&#39;s a &quot;static_cast&quot; after all...</span>
<span class="p">{</span>
   <span class="n">appUi</span><span class="o">-&gt;</span><span class="n">SetOrientationL</span><span class="p">(</span> <span class="n">CAknAppUi</span><span class="o">::</span><span class="n">EAppUiOrientationPortrait</span> <span class="p">);</span>
<span class="p">}</span>
<span class="c1">// ...</span>
</pre></div>


Today's source is: <a href="http://discussion.forum.nokia.com/forum/showthread.php?t=164499">Nokia Forum</a>.</caknappui></aknappui></aknenv></eikappui></eikenv>
