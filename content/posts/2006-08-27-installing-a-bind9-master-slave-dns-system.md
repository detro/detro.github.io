---
layout: post
author: detro
title: "Installing a Bind9 Master/Slave DNS System"
tags: [howto, sw, it, opensource, curiosity, english]
date: "2006-08-27T22:57:38Z"
---

![a forge](http://forge.etueffont.free.fr/enclume10.jpg)


> Welcome
> In this howto we will install 2 bind dns servers, one as the master and the other as a slave server. For security reasons we will chroot bind9 in its own jail.
> Using two servers for a domain is a commonly used setup and in order to host your own domain you are required to have at least 2 domain servers. If one breaks, the other can continue to serve your domain.
> Our setup will use Debian Sarge 3.1 (stable) for its base. A simple clean and up2date install will be enough since we will install the required packages with this howto. 
> In this howto I will use the fictional domain "linux.lan". The nameservers will use 192.168.254.1 and 192.168.254.2 as there ip.
>> Some last words before we begin: I read Joe's howto (also on this site) and some more tuts but none of them worked without some tweaks. Therefor, i made my own howto. And it SHOULD work at once :)



[A interesting howto](http://www.howtoforge.com/debian_bind9_master_slave_system). Take a look ;) .

Source, [OSNews](http://osnews.com/story.php?news_id=15641).
