---
layout: post
author: detro
published: true
title: "GhostDriver: a quick update"
tags: [ghostdriver, window, open, update, phantomjs]
date: "2012-07-19 08:33:17"
updated: "2012-07-19 08:33:17"
permalink: /2012/07/19/GhostDriver-a-quick-update
---

For whom might concern.

Development of [GhostDriver](https://github.com/detro/ghostdriver) has been "slowed down" in the past 2/3 weeks for unforeseen heavy work schedule.

The project is not dead AT ALL. Actually, important work has been done: I have implemented **support for `window.open()` handling** into the current [PhantomJS](https://github.com/ariya/phantomjs) master.

This new feature in PhantomJS is KEY to unlock a whole set of functionalities that before we couldn't implement in GhostDriver. So, while WebDriver Wire Protocol Commands were not added, a key *blocker* has been removed.

As usual, if you are playing around or plan to contribute to GhostDriver, the info about the right branch of PhantomJS to use are in the [official README](https://github.com/detro/ghostdriver/blob/master/README.md).

_Stay tuned._
