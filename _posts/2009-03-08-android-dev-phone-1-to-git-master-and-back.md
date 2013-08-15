---
layout: post
author: detro
published: true
title: "Android Dev Phone 1: to GIT Master and Back"
tags: [restore, git, htc, personal, compile, flash, it, terminal, source, google, apn, build, install, english, master, adp1, sdk, dream, android, latest]
date: "2009-03-08 19:15:19"
updated: "2009-03-08 19:15:19"
permalink: /2009/03/08/andoird-dev-phone-1-to-git-master-and-back/
---

<img src="http://3.bp.blogspot.com/_X224WPCBE5o/STsl8k5fpKI/AAAAAAAAAis/qYHiU6r9LQI/s400/android-dev-phone-1.jpg" alt="Android Dev Phone 1" align="right" width="200"/>If you, like me, have a <a href="http://developer.android.com/guide/developing/device.html#dev-phone-1">Android Dev Phone 1</a> ("ADP1" from now on), you are probably wondering how to take the latest version of the <a href="http://source.android.com/">Android Source Code</a>, the <a href="http://android.git.kernel.org/">"GIT Master"</a>, compile and put on your device.

I googled and googled and googled, finding some sparse material. But it's all messed up: sometimes it was incomplete or partial, sometimes it was a matter of formatting/style, it could get very difficult to read. So, this post is my way of making it organic and organized.

Let's get it started!
<!--more-->

<h3>Prepare the Instruments</h3>
To build Android and flash the ADP1 we need different tools and set up some stuff.
Because it would be redundant to explain here how to do every single one of those steps, I will just say what you need and where you find the official documentation to do it:
<ol>
<li><a href="http://d.android.com/sdk/1.1_r1/index.html">Download</a> and <a href="http://d.android.com/sdk/1.1_r1/installing.html">Install</a> the Android SDK</li>
<li><a href="http://d.android.com/guide/developing/device.html#setting-up">Configure the Android SDK for "On Hardware Debuging"</a></li>
<li><a href="http://source.android.com/download">Get the Source of the "GIT Master" from the Official Repository, get ready for Compilation <strong>BUT DO NOT COMPILE YET</strong></a>; this means stop when the how to says to execute the <code>make</code> command</li>
<li>Download and Unzip <a href="http://jf.andblogs.net/">JesusFreke</a> (nice name, isn't it ;-) ) for ADP1; sometimes the ADP1 is also known as "Holiday" device</li>
</ol>

A couple of notes about the last task:
<ul>
<li>JesusFreke is an great hacker that maintain an interesting firmware for both T-Mobile G1 and ADP1</li>
<li>the ADP1 is also known as "Holiday" because is the same device that the Google Employees received during some holiday period from their company as gift; and from there the first unlocked firmware were ripped ;)</li>
</ul>


<h3>Access Points</h3>
Your current devices has the Access Points (APN) already configured. It would be a good idea to bring them on the firmware we are going to build too. Connect your device if you didn't do it already and execute on the command line:
[code lang="bash"]
$ cd [YOUR_ANDROID_SOURCE_ROOT]
$ adb pull /system/etc/apns-conf.xml development/data/etc/apns-conf_sdk.xml
[/code]
This will use the <code>adb</code> command to pull the APNs from the phone: that's why we needed the Android SDK.
<strong>Update:</strong> I think this doesn't really work. But it doesn't matter, does it? We are going to do a full backup of the phone anyway.


<h3>Terminal Emulator (optional step)</h3>
There is a Terminal Emulator application that is installed by default, however it does not appear in the launcher. To <em>stop this madness</em>, edit the file <code>./development/apps/Term/AndroidManifest.xml</code> and add a new <code>&lt;category&gt;</code> to the <code>&lt;intent-filter&gt;</code> section to make it look like:
[code lang="xml"]...
<intent -filter>
   <action android:name="android.intent.action.MAIN" />
   <category android:name="android.intent.category.TEST" />
   <category android:name="android.intent.category.LAUNCHER" />
</intent>
...[/code]
What kind of geek would go around with a Linux-based phone and no Terminal Emulator? ;-)

By the way, inside the directory <code>./development/apps/</code> there are more applications that are probably not "enabled" during the build: feel free to try this out to see if you discover something interesting; and don't forget to let us know in the comments.


<h3>Build for <em>HTC Dream</em> aka <em>T-Mobile G1</em> aka <em>ADP1</em></h3>
The Android uses as default build profile the SDK: means that if you do a build now (remember? the <code>make</code> command), it will build the system image for the <a href="http://www.nongnu.org/qemu/">QEMU Emulator</a> (the one the Android Emulator is based upon).

So, to build for our phone, we need to play a little bit with the build profile. To do so just follow the official how to page about "<a href="http://source.android.com/documentation/building-for-dream">Building for Dream</a>". Of course, "<a href="http://en.wikipedia.org/wiki/HTC_Dream">Dream</a>" is the code name of the device used by <a href="http://en.wikipedia.org/wiki/HTC_Corporation">HTC</a>.

Once ready, <strong>it's time to build!</strong> Give a nice <code>make</code> inside the source root directory and give it <em>10 minutes</em> or <em>several hours</em>: it really depends on your hardware. On my MacBook Unibody 2.0Ghz+4GB Ram it took just 20 minutes ;-)


<h3>Fastboot: the tweezers</h3>
Let's assume that you downloaded the Android's source into the directory <code>/home/me/mydroid</code>: this means that you will then have the built stuff under <code>/home/me/mydroid/out/...</code>; During the building process, one particular executable has been built. It's name is <strong>fastboot</strong> and it sits under [code lang="bash"]/home/me/mydroid/out/host/[your computer platform]/bin/fastboot[/code]

Why is it really important? I'll report here the output of the executable when no parameter is passed:
[code lang="bash"]
$ ./fastboot
usage: fastboot [ {option} ] {command}

commands:
  update {filename}   reflash device from update.zip
  flashall                      'flash boot' + 'flash system'
  ...
  devices                      list all connected devices
  reboot                       reboot device normally
  reboot-bootloader    reboot device into bootloader

options:
  -w                             erase userdata and cache
  -s {serial number} specify device serial number
  -p {product}           specify product name
  -c {cmdline}           override kernel commandline
  -i {vendor id|         specify a custom USB vendor id
[/code]

As you can understand, this is used to flash, reboot, erase, ... the ADP1. To do so, the device needs to be booted in "<em>fastboot mode</em>".

<em><strong>IMPORTANT: You don't need to do this YET, but I explain it here so you can learn how to do it "regardlessly" the usage you make of it.</strong></em>
Anyway, <strong>that's how you go in "fastboot" mode</strong>: from power off, <strong>hold the "camera" button AND the "red/on" button</strong>; this will get you into a mode that says "serial0" with androids on skateboards. Plug in the USB cable and <strong>press the "back" button</strong>; now you should see that the screen shows "fastboot" instead of "serial0".
Try the back button a few more times (and wait a few seconds in between) if you don't see "fastboot".

<div align="center">
<img src="http://farm4.static.flickr.com/3017/3249806989_43c89e7571.jpg" alt="Android in fastboot mode" />
<em>Android in "fastboot" mode</em>
</div>

Understood? Ok, now get ready because we are going to need this stuff.


<h3>Backup: because you never know</h3>
Now, it's time to pay out your curiosity. You are probably puzzling  «<em>WHY THE HELL we need JesusFreke's Images?</em>». Simply because JF distributes his/her (who knows?) image with a recovery image that we can use to boot the phone from like a "live cd" (so, no installation), and use this image to do a complete backup of the current status of the phone. <em>Very handy when the cold times of failure comes</em>.

<div align="center">
<img src="http://farm4.static.flickr.com/3258/3156192431_930b92e59e.jpg" alt="The menu of JesusFreke recovery.img" />
The menu of JesusFreke recovery.img
</div>

What you have to do is:
<ol>
<li>Unzip the JesusFreke you previously downloaded and bear in mind where you put it (for example [code lang="bash"]/home/me/jf/[/code]</li>
<li>Put your ADP1 in "fastboot mode" as shown in the previous section</li>
<li>Now, it's time to boot the phone from the recovery image of JF
[code lang="bash"]
$ cd /home/me/jf/data
$ sudo /home/me/mydroid/out/host/[your computer platform]/bin/fastboot boot recovery.img
[/code]
</li>
<li>Wait for the recovery.img to finish booting and <strong>use the menu on screen to create a backup</strong>; it will be created on the SD card under [code lang="bash"]/nandroid/[/code]</li>
<li>Once done, use the right option on the menu screen to reboot the phone, mount the SD card on your computer and save the backup somewhere safe</li>
</ol>


<h3><em>Let's Roc</em>k, ehm... flash the Phone</h3>
Now we are ready to go! Everything should be already built and we can flash the phone with the latest build. <strong>Put the phone in "fastboot mode"</strong> again and do as follows:
[code lang="bash"]
$ cd /home/me/mydroid/out/target/product/dream
$ sudo /home/me/mydroid/out/host/[your computer platform]/bin/fastboot flash system system.img
sending 'system' (51086 KB)... OKAY
writing 'system'... OKAY
$ sudo /home/me/mydroid/out/host/[your computer platform]/bin/fastboot flash boot boot.img
sending 'boot' (1418 KB)... OKAY
writing 'boot'... OKAY
$ sudo /home/me/mydroid/out/host/[your computer platform]/bin/fastboot flash userdata userdata.img
sending 'userdata' (2 KB)... OKAY
writing 'userdata'... OKAY
$ sudo /home/me/mydroid/out/host/[your computer platform]/bin/fastboot reboot
[/code]

If everything went right, you should have your ADP1 flashed with the latest build of Android up and running.
<strong>Enjoy your Geekyness!</strong>


<h3>Ehm, cooooool! Now <em>how I go back?</em></h3>
Yes, a build made from the repository is not what you would define "a stable release": most probably a lot of stuff doesn't not work (like home button and back button in my case), and applications are missing. <strong>But you can go to your friend and show how "ahead" you are with your "<em>not-yet-released version of Android</em>"</strong>.

But one you are satisfied... or you just have enough of a faulty, incomplete, non-functioning phone, most probably you would like to restore your old, working phone. <strong>Nothing can be easier</strong>:
[code lang="bash"]
$ cd [wherever you stored your nandroid backup]
$ cd [your phone serial name]/[backup timestamp]
$ sudo /home/me/mydroid/out/host/[your computer platform]/bin/fastboot flash system system.img
...
$ sudo /home/me/mydroid/out/host/[your computer platform]/bin/fastboot flash boot boot.img
...
$ sudo /home/me/mydroid/out/host/[your computer platform]/bin/fastboot flash userdata userdata.img (or data.img)
...
$ sudo /home/me/mydroid/out/host/[your computer platform]/bin/fastboot reboot
[/code]

Yes, as you should have expected, exactly the same procedure you followed to flash it with the build you made.
It's called "coherence", and it's normally a great feature ;)


<h3>Now, the easy way for lazy cowards</h3>
There is of course the "<em>do it for me, please</em>" version. The one for "lazy cowards"! :-P
People like JesusFreke, already been very useful here, can really make stuff easier for the rest of us.
<a href="http://jf.andblogs.net/">He/She maintains a blog</a> with regular releases of his Android built, based on the stable releases of Google, but enhanced with some "spicy and yummy" stuff. While I'm writing this the latest build for ADP1 is <a href="http://jf.andblogs.net/2009/03/03/jfv143-rc9/">JFv1.43RC9</a>.

To install it, he decided to make it <em>very very easy</em>: he just uses the procedure that Google made for us. So, what you have to do is:
<ol>
<li>Download the latest JesusFreke</li>
<li>Rename it as "update.zip"</li>
<li>Put on the root directory of the SD Card of your ADP1</li>
<li>Turn off the Phone</li>
<li>Turn it on <strong>while holding the home button</strong></li>
<li>Open the keyboard if closed</li>
<li><strong>Type ALT+L to enable the "logging"</strong></li>
<li><strong>Type ALT+W to wipe your data from the phone (sorry, it's necessary at the first upgrade)</strong></li>
<li><strong>Type ALT+S to apply the update.zip</strong></li>
<li>When done, click HOME+BACK to reboot</li>
</ol>

Now you have the l<strong>atest, official and <u>stable</u></strong> build of Android on your ADP1!!! ;)
This features stuff like Latitude and more!

<strong>Enjoy it for good!</strong> ;-)


<h3>Sources</h3>
<ul>
<li><a href="http://blog.makezine.com/archive/2009/01/taking_android_cupcake_for_a_spin.html">Taking Android "cupcake" out for a spi</a>n</li>
<li><a href="http://antonmelser.org/open-source/backup-install-restore-adp1.html">Backup/install/restore Android on an Android Developer Phone 1 (ADP1)</a></li>
<li><a href="http://jf.andblogs.net/">JesusFreke's AndBlog</a></li>
</ul>

