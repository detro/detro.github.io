---
layout: post
author: detro
published: true
title: "QDetroBro: Experimenting with Qt on S60"
tags: [git, qt, personal, nokia, githum, it, experiment, version, english, commit, s60, browser]
date: "2009-08-13 11:23:44"
updated: "2009-08-13 11:23:44"
permalink: /2009/08/13/qdetrobro-experimenting-with-qt-on-s60/
---

The best way to learn a new language or a new framework is to find an idea and implement it. So I'm doing for <a href="http://qt.nokia.com/">Qt</a> on <a href="http://en.wikipedia.org/wiki/S60_(software_platform)">S60</a>. So I decided to implement a dummy browser that has some <em>smart/attractive/peculiar/interesting/funny</em> bits. <strong>QDetroBro</strong>

Because I'm lazy to package and attach code, and because is always good the evolution of a project from the ground-up, I decided to post it on <a href="http://github.com/detronizator/">my GitHub account</a>. You can find it at: <a href="http://github.com/detronizator/QDetroBro/tree/master">http://github.com/detronizator/QDetroBro/tree/master</a>.

It passed through 3 major phases:
<ol>
<li><strong>v0.1-beta</strong> - Ultra-dummy browser with very "boring" UI. The entire code was in only 1/2 classes (power of Qt and Signal-Slots). Commit: <a href="http://github.com/detronizator/QDetroBro/commit/f49bddfca9aad683dcc428aa995dc16ec94d8cf5">f49bd...</a></li>
<li><strong>v0.2-beta</strong> - A lot of interesting new bits, like Animations, Stylesheet-themed Widgets and so on. Commit: <a href="http://github.com/detronizator/QDetroBro/commit/dae20c68d6a9ace16ff9f83fce3e8cc82886381a">dae20...</a></li>
<li><strong>v0.2.2-beta</strong> - The current release. Commit: <a href="http://github.com/detronizator/QDetroBro/commit/240c5cc0c06423ae44e4d61347c41201997bf57c">240c5...</a></li>
</ol>

If you want to take a look at it to see what <a href="http://qt.gitorious.org/+qt-s60-developers/qt/qt-s60">Qt o</a><a href="http://pepper.troll.no/s60prereleases/">n S60</a> can enable, please do. You can download the latest build from <a href="http://github.com/detronizator/QDetroBro/zipball/43f3dcdfce67856002495073b878b8fbbc91cb8d">here</a>.

Ah, of course there are requirements to run Qt code on S60. You find what to install on your phone <a href="http://pepper.troll.no/s60prereleases/">here (<em>"Demos for your S60"</em> section)</a>.
