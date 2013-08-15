---
layout: post
author: detro
published: true
title: "Loop Rebooting iPhone: how to fix it"
tags: [reset, restore, apple, personal, fix, jailbreak, it, sync, itunes, iphone, curiosity, english, utility]
date: "2008-04-02 23:04:41"
updated: "2008-04-02 23:04:41"
permalink: /2008/04/02/loop-rebooting-iphone-how-to-fix-it/
---

I was playing with my <a href="http://www.ziphone.org/">Jailbroken</a> <a href="http://www.apple.com/iphone/">iPhone</a> when I decided to install <a href="http://www.openssh.org/">OpenSSH</a> and login. 1 minute after I discovered there is a password I should use to login:
<ul>
<li>for user <code>root</code> is <code>alpine</code></li>
<li><del>for user <code>mobile</code> is <code>dottie</code></del></li>
</ul>

After I connected to my loved iPhone trough SSH (don't be impatient: it takes a minute or two for it's ARM cpu to generate the Keys), I changed straightaway the password for both the above named users (using just <code>passwd</code>).

That practically screwed my Apple jewel: as soon as rebooted it entered in a "Loop Rebooting" status, that made it impossible to use.
Why? Because, of course, it's a Unix system, and the Graphical Interface itself (and I'm sure also other applications) need to "log-in" in the system. Changing the password in the "normal way" made an un-fixable mess.

So, how to fix this? Simple! <strong>Just reset the Phone.</strong>
The steps to follow are:
<ol>
<li>Connect your phone to the Mac/WinPC you last synched it</li>
<li>Hold down the <strong>top right button <code>[SCREEN-LOCK button]</code></strong> and the <strong>round bottom middle button <code>[HOME button]</code></strong> for about 10 seconds waiting for the screen to turn off</li>
<li>When the screen turn off, release ONLY the <strong>top right button</strong> and continue to hold until iTunes recognize it and put it in <em>Recovery Mode</em></li>
<li>Follow the iTunes instruction to Recover it</li>
<li>Note that iTunes will <strong>also</strong> ask if you want to restore iPhone in the status it was at the last Sync or just clean it completelly (thanks <a href="http://www.apple.com/">Apple</a> to be so Great!)</li>
</ol>

Now my iPhone can be Jailbroken, again! ;)
