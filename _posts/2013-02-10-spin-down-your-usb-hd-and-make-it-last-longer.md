---
layout: post
author: detro
published: true
title: "Spin-down your USB HD and make it last longer "
tags: [sdparm, spindown, usb, mediacenter, diskstats, hd, xbmc, external]
date: "2013-02-10 13:27:49"
updated: "2013-02-10 13:27:49"
permalink: /2013/02/10/Spin-down-your-USB-HD-and-make-it-last-longer
---

I have built for myself a simple Media Center, based on [Zotac ZBOX ID41 Plus](http://www.zotacusa.com/zbox-id41-plus.html), [XBMC-Live](http://wiki.xbmc.org/index.php?title=XBMCbuntu), [Transmission](http://www.transmissionbt.com/), [Flirc](http://flirc.tv/) and other useful stuff. The idea is having a low-energy consumption machine that I control with a remote. And it has to be always on.

One thing I was concerned about is how to deal with my external HD connected to it: I'm of course expecting those to eventually fail if they are always spinning.

<div class="img">
<img src="http://www.colourbox.com/preview/2111168-646188-read-data-on-hard-disk-with-spinning-hard-disk.jpg" />
</div>

Well, a bit of scripting and cron can go a long way. Here is my solution.

### Step 1: dependencies

Just install [sdparm](http://linux.die.net/man/8/sdparm) and you should be all set, at least on a "normal" Linux box where [Cron](http://en.wikipedia.org/wiki/Cron) is already configured.

### Step 2: scripting `FTW`

Put a script like this somewhere in your system. I have it in my `~/bin`:

```bash
# !/bin/sh

# Only ROOT can run this
if [ "$(id -u)" != "0" ]; then
        echo “This script must be run as root” 1>&2
        exit 1
fi

STATE_FILENAME=state_$1.spindown
PREV_STATE_FILENAME=prev_state_$1.spindown

# Get new state from diskstats
NEWstate=$(cat /proc/diskstats | grep $1)
echo $NEWstate > "$STATE_FILENAME"

# compare md5 sums
md5new=$(md5sum $STATE_FILENAME | sed 's/ .*//')
md5old=$(md5sum $PREV_STATE_FILENAME | sed 's/ .*//')

# if no changes, power down
if [ "$md5new" = "$md5old" ]; then
        sdparm --flexible --command=stop /dev/$1 &>/dev/null
fi

# Write current state to file
echo $NEWstate > "$PREV_STATE_FILENAME"
```


A very basic and simple one, isn't it?
What it does is just probe `/proc/diskstats` virtual file to get info about the recent activity of a disk. If it has not changed in the last 30 minutes, than it's time to use `sdparm` to send a stop command `--command=stop`. That's it.

### Step 3: Cron-it-up!

Add the following lines to your `/etc/crontab`:


```bash
*/30 *   * * *   root   sh /home/xbmc/bin/spindown/spindown.sh sda
*/30 *   * * *   root   sh /home/xbmc/bin/spindown/spindown.sh sdb
*/30 *   * * *   root   sh /home/xbmc/bin/spindown/spindown.sh sdc
*/30 *   * * *   root   sh /home/xbmc/bin/spindown/spindown.sh sdd
*/30 *   * * *   root   sh /home/xbmc/bin/spindown/spindown.sh sde
```


The above lines execute the script against `sda`, `sdb`, `sdc`, `sdd` and `sde`.

That's it. I have been using this method for almost 2 years not, and  thought it might be helpful to others.

