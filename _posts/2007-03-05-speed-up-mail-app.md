---
layout: post
author: detro
published: true
title: "Speed up Mail.app"
tags: [macosx, howto, it, opensource, english, devtools]
date: "2007-03-05 12:06:06"
updated: "2007-03-05 12:06:06"
permalink: /2007/03/05/speed-up-mailapp/
---

<div align="center">
<img src="http://images.apple.com/macosx/features/mail/images/indextop20050412.jpg" alt="Mail.app icon" />
+
<img src="http://www.sqlite.org/sqlite.gif" alt="SQLite logo" />
+
<span style="font-size: 2em; "><code>vacuum</code></span>
=
<span style="font-size: 2em; ">BRRRRRUUUUUUUUUMMMMM!</span>
</div>
Anyone that use Mail.app (the "official" mail client on [en:Mac OS X]) knows that the greater mailboxes become, the slower Mail.app goes. I don't know how many email I have, but the oldest is from the 2002 (I have cutted older because they became useless).

Today, I found an interesting link on <a href="http://www.tuaw.com/2007/03/01/speed-up-your-mail-app/">TUAW</a>: <a href="http://www.hawkwings.net/2007/03/01/a-faster-way-to-speed-up-mailapp/">A faster way to speed up Mail.app</a> on <a href="http://www.hawkwings.net/2007/03/01/a-faster-way-to-speed-up-mailapp/">Hawk Wings</a>.

Starting from that tips, I have expanded it to <code>vacuum</code> every table in the <a href="http://www.sqlite.org/">SQLite3</a> database used from Mail.app to index our emails.

Continue to see the mini-howto. <!--more-->

<ol>
<li>Step 01: Quit Mail.app (<strong>and backup your <code>~/Library/Mail</code></strong> - nd <a href="http://blog.neminis.org/">Nemo</a>)</li>
<li>Step 02: Open Terminal.app</li>
<li>Step 03: type <code>cd ~/Library/Mail</code> (the configuration directory of Mail.app)</li>
<li>Step 04: type <code>sqlite3 Envelope\ Index</code> (Opens the console of SQLite3 on the index-db of Mail.app)</li>
<li>Step 05: type <code>.table</code> to list every table in the db (<code>.help</code> for help)</li>
<li>Step 06: type <code>vacuum X</code> where <code>X</code> is the name of the table you want to optimize (every table listed in the Step 05)</li>
<li>Step 07: <code>CTRL+D</code> to quit the console of SQLite3</li>
<li>Step 08: Start Mail.app and enjoy the speed-bump!</li>
</ol>

Frankly: I don't assume responsability of problems, damage or other things that will happen to your Mail.app if you do it in the wrong way. It's is NOT an howto from Apple: it's from one that knows something about [en:RDBMS].
