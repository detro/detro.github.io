---
layout: post
author: detro
title: "Speed up Mail.app"
tags: [macosx, howto, it, opensource, english, devtools]
date: "2007-03-05T12:06:06Z"
aliases:
  - /2007/03/05/speed-up-mail-app
  - /2007/03/speed-up-mail-app
---



![Mail.app icon](http://images.apple.com/macosx/features/mail/images/indextop20050412.jpg)
+
![SQLite logo](http://www.sqlite.org/sqlite.gif)
+
<code>vacuum</code>
=
BRRRRRUUUUUUUUUMMMMM!


Anyone that use Mail.app (the "official" mail client on [en:Mac OS X]) knows that the greater mailboxes become, the slower Mail.app goes. I don't know how many email I have, but the oldest is from the 2002 (I have cutted older because they became useless).

Today, I found an interesting link on [TUAW](http://www.tuaw.com/2007/03/01/speed-up-your-mail-app/): [A faster way to speed up Mail.app](http://www.hawkwings.net/2007/03/01/a-faster-way-to-speed-up-mailapp/) on [Hawk Wings](http://www.hawkwings.net/2007/03/01/a-faster-way-to-speed-up-mailapp/).

Starting from that tips, I have expanded it to <code>vacuum</code> every table in the [SQLite3](http://www.sqlite.org/) database used from Mail.app to index our emails.

Continue to see the mini-howto. <!--more-->

* Step 01: Quit Mail.app (<strong>and backup your <code>~/Library/Mail</code></strong> - nd [Nemo](http://blog.neminis.org/))

* Step 02: Open Terminal.app

* Step 03: type <code>cd ~/Library/Mail</code> (the configuration directory of Mail.app)

* Step 04: type <code>sqlite3 Envelope\ Index</code> (Opens the console of SQLite3 on the index-db of Mail.app)

* Step 05: type <code>.table</code> to list every table in the db (<code>.help</code> for help)

* Step 06: type <code>vacuum X</code> where <code>X</code> is the name of the table you want to optimize (every table listed in the Step 05)

* Step 07: <code>CTRL+D</code> to quit the console of SQLite3

* Step 08: Start Mail.app and enjoy the speed-bump!

Frankly: I don't assume responsability of problems, damage or other things that will happen to your Mail.app if you do it in the wrong way. It's is NOT an howto from Apple: it's from one that knows something about [en:RDBMS].
