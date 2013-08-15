---
layout: post
author: detro
published: true
title: "Apple TV 3.x with Boxee, USB Storage and AFP: a Non-How-To"
tags: [boxee, usb, tv, appletv, mediacenter, afp, apple]
date: "2010-10-23 11:20:13"
updated: "2010-10-23 11:20:13"
permalink: /2010/10/23/Apple-TV-3-x-with-Boxee-USB-Storage-and-AFP-a-Non-How-To
---

Our lounge recently welcomed an [Apple TV first generation](http://en.wikipedia.org/wiki/Apple_TV#First_generation). It's a simple, slick, beautiful piece of hardware. It's Intel-based, has [good hardware specs](http://en.wikipedia.org/wiki/Apple_TV#First_generation) and has all the necessary output ports that a modern media center should have. And can do 1080p because is powerful enough: [the new one can't](http://www.theinquirer.net/inquirer/news/1727694/apple-tv-hd).

<div align="center">
<img src="http://watchinternetvideoontv.com/images/apple_tv_plus_boxee.png" /><br />
Very self explanatory
</div>

I bought with one aim in mind: [Boxee](http://www.boxee.tv/)! This media center project is just super, and I wanted something to run it on. Initially I though about a Mac Mini, but figured out that was too expensive (even a 2nd hand one) to do _"just"_ mediacenter.

Also, I needed it to do an extra couple of things:

* It should be able to read and write from an external USB drive (what is currently 500GB of Media attached to my iMac)
* It should be able to share the USB mounted volume over the network with something like FTP or, better, [AFP](http://en.wikipedia.org/wiki/Apple_Filing_Protocol)

### Step 1: Install Boxee

It's very very easy. It's very well explained [here](http://boxee.zendesk.com/entries/171765-apple-tv-installation). In short:

1. Making the patchstick
    * Insert a "[bootable](http://boxee.zendesk.com/entries/173411-apple-tv-usb-flash-drive-compatibility-list)" USB drive into your PC/Mac
    * Run the [ATVUSB-Creator](http://code.google.com/p/atvusb-creator/)
    * Create Patchstick
    * Remove the USB drive and **plug it into your Apple TV**
2. Installing
    * Power on your Apple TV and the patchstick will run the ATV bootloader
    * After the bootloader finishes (read the stuff at the bottom of the screen), remove it and restart your Apple TV
    * It now has options for **Boxee / XBMC** and for **Launcher** on the main menu
    * **Browse the Launcher** and Upgrade everything in there 
    * **Click Boxee** to launch it
    * Now go to [first time use](http://boxee.zendesk.com/entries/185575-first-time-use) to continue the installation process

Now, have fun with Boxee for a while, set up an account if you don't have one, go on [the website](http://www.boxee.tv), register your feeds, twitter, facebook and what not account. Done? OK, close Boxee on the Apple TV: there is a lot to do.

### Step 2: Install NitoTV

Your Apple TV is now accessible through SSH. The USB Patchstick did it for you!

* IP Address: It's in the network configuration/panel of your Apple TV (make it static!)
* Username: **frontrow**
* Password: **frontrow**

Through SSH we are going to *ROCK* it!

...

**Wait a minute**: it's going to take a LOOOONG time to write all the instructions. _That sucks!_ I don't want to do that! :-(

OK, so, here is the deal. The URL where to find all the instruction you need is this: [http://wiki.awkwardtv.org/wiki/Take_2_Full_Update](http://wiki.awkwardtv.org/wiki/Take_2_Full_Update). On this wiki there are step by step instructions.

Personally, I just followed section "[Alternate 3 to 8](http://wiki.awkwardtv.org/wiki/Take_2_Full_Update#Alternate_3_to_8)": it was all I needed.

### _Hey, this How-To sucks dude!_

Yes, I know. But I really can't be asked to write a lot of boring instructions, given that those are all very well documented already. So, be sure you check out all the URL I posted here. If you can't figure out how to use them, well, you shouldn't be trying: you will just end up having to [factory restore your Apple TV](http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=factory+restore+apple+tv).

Let's do like this: this is not an _"How-To"_, this is more like a collection of useful links. Eh? EH?! It's a **_"Non-How-To"_** What about that now! This post now sounds great, doesn't it?!!? :-D

### Credits

Thanks to all the folks contributing to [http://wiki.awkwardtv.org/](http://wiki.awkwardtv.org/wiki/Main_Page): without those resources I would have never be able to do it.
