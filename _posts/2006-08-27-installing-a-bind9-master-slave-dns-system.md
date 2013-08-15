---
layout: post
author: detro
published: true
title: "Installing a Bind9 Master/Slave DNS System"
tags: [howto, sw, it, opensource, curiosity, english]
date: "2006-08-27 22:57:38"
updated: "2006-08-27 22:57:38"
permalink: /2006/08/27/installing-a-bind9-masterslave-dns-system/
---

<img src="http://forge.etueffont.free.fr/enclume10.jpg" alt="a forge" align="right" width="100"/>
<blockquote>Welcome
In this howto we will install 2 bind dns servers, one as the master and the other as a slave server. For security reasons we will chroot bind9 in its own jail.
Using two servers for a domain is a commonly used setup and in order to host your own domain you are required to have at least 2 domain servers. If one breaks, the other can continue to serve your domain.
Our setup will use Debian Sarge 3.1 (stable) for its base. A simple clean and up2date install will be enough since we will install the required packages with this howto. 
In this howto I will use the fictional domain "linux.lan". The nameservers will use 192.168.254.1 and 192.168.254.2 as there ip.

Some last words before we begin: I read Joe's howto (also on this site) and some more tuts but none of them worked without some tweaks. Therefor, i made my own howto. And it SHOULD work at once :)</blockquote>

<a href="http://www.howtoforge.com/debian_bind9_master_slave_system">A interesting howto</a>. Take a look ;) .

Source, <a href="http://osnews.com/story.php?news_id=15641">OSNews</a>.
