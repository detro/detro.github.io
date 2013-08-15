---
layout: post
author: detro
published: true
title: "Git-over-SSH through Socks 5 Proxy on Windows"
tags: [git, script, personal, work, it, tunnelling, windows, socks5, proxy, english, utility, bash, ssh]
date: "2009-08-13 10:01:52"
updated: "2009-08-13 10:01:52"
permalink: /2009/08/13/git-over-ssh-through-socks-5-proxy-on-windows/
---

Because of my work, I use crappy M$ Windows in my office. And we are behind a bidirectional firewall.

So, how do you do if you need to pull/push code with Git-over-SSH in this scenario? You need a Socks 5 that passes the firewall, and some scripting.

First, you need to install:
<ul>
<li>Git on Windows - <a href="http://code.google.com/p/msysgit/">http://code.google.com/p/msysgit/</a></li>
<li>Connect.c - <a href="http://bent.latency.net/bent/darcs/goto-san-connect-1.85/src/connect.html">http://bent.latency.net/bent/darcs/goto-san-connect-1.85/src/connect.html</a></li>
</ul>

Then, you need a script that connects to the Socks 5 server. Like:
[sourcecode lang='bash']
#!/bin/sh
# Filename: /path/to/socks-gw.sh
# This script connects to a SOCKS proxy using Connect.c
/path/to/connect.exe -S your.socks5.server:1080 $@
```


A script that opens an SSH connection using the connection opened by the previous script:
[sourcecode lang='bash']
#!/bin/sh
# Filename: /path/to/socks-ssh.sh
# This script opens an SSH connection through a SOCKS server
ssh -o ProxyCommand="/path/to/socks-gw.sh %h %p" $@
```


Finally, another script that you need to source in the same Bash session you are going to use Git:
[sourcecode lang='bash']
#!/bin/sh
# Filename: /path/to/enable_socks5_proxy_for_git.sh
# This script sets Git to use the SOCKS proxy
export GIT_SSH="/path/to/socks-ssh.sh"
export GIT_PROXY_COMMAND="/path/to/socks-gw.sh"
```

Again, don't forget to source this script before using Git.

Thanks to <a href="http://threebytesfull.com/2008/04/git-with-and-without-proxy/">ThreeBytesFull</a>, from which I re-adapted the scripts to work on Windows.
