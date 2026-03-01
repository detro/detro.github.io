---
layout: post
author: detro
title: "QDetroBro: Experimenting with Qt on S60"
tags: [git, qt, personal, nokia, githum, it, experiment, version, english, commit, s60, browser]
date: "2009-08-13T11:23:44Z"
---

The best way to learn a new language or a new framework is to find an idea and implement it. So I'm doing for [Qt](http://qt.nokia.com/) on [S60](http://en.wikipedia.org/wiki/S60_(software_platform)). So I decided to implement a dummy browser that has some <em>smart/attractive/peculiar/interesting/funny</em> bits. <strong>QDetroBro</strong>

Because I'm lazy to package and attach code, and because is always good the evolution of a project from the ground-up, I decided to post it on [my GitHub account](http://github.com/detronizator/). You can find it at: [http://github.com/detronizator/QDetroBro/tree/master](http://github.com/detronizator/QDetroBro/tree/master).

It passed through 3 major phases:

* <strong>v0.1-beta</strong> - Ultra-dummy browser with very "boring" UI. The entire code was in only 1/2 classes (power of Qt and Signal-Slots). Commit: [f49bd...](http://github.com/detronizator/QDetroBro/commit/f49bddfca9aad683dcc428aa995dc16ec94d8cf5)

* <strong>v0.2-beta</strong> - A lot of interesting new bits, like Animations, Stylesheet-themed Widgets and so on. Commit: [dae20...](http://github.com/detronizator/QDetroBro/commit/dae20c68d6a9ace16ff9f83fce3e8cc82886381a)

* <strong>v0.2.2-beta</strong> - The current release. Commit: [240c5...](http://github.com/detronizator/QDetroBro/commit/240c5cc0c06423ae44e4d61347c41201997bf57c)

If you want to take a look at it to see what [Qt o](http://qt.gitorious.org/+qt-s60-developers/qt/qt-s60)[n S60](http://pepper.troll.no/s60prereleases/) can enable, please do. You can download the latest build from [here](http://github.com/detronizator/QDetroBro/zipball/43f3dcdfce67856002495073b878b8fbbc91cb8d).

Ah, of course there are requirements to run Qt code on S60. You find what to install on your phone [here (<em>"Demos for your S60"</em> section)](http://pepper.troll.no/s60prereleases/).
