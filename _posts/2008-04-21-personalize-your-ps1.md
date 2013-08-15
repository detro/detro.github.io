---
layout: post
author: detro
published: true
title: "Personalize your $PS1"
tags: [code, prompt, cli, personal, personalization, howto, it, terminal, curiosity, english, bash, utility]
date: "2008-04-21 22:25:19"
updated: "2011-03-21 22:47:47"
permalink: /2008/04/21/personalize-your-ps1/
---

<div class="img">
<img src="http://4.bp.blogspot.com/_Zfnd5XZP80Y/S8S8ZPTdVvI/AAAAAAAABg8/dfnIlEXmDJM/s1600/Picture+2.png" />
Fancy $PS1 setting
</div>

The code to make the <a href="http://www.gnu.org/software/bash/">Bash</a> prompt looks like mine is (<code>~/.bashrc</code>):

```bash
case $TERM in
	xterm*|rxvt*)
		TITLEBAR='\[\033]0;\u@\h:\w\007\]'
		;;
	*)
		TITLEBAR=""
		;;
esac;

PS1="${TITLEBAR}\n\[\033[0;0m\][\033[0;32m\]time: \
\[\033[0m\]\[\033[1;31m\]\t\[\033[0m\]\[\033[0;0m\]]-\
[\[\033[0m\]\[\033[0;32m\]host: \[\033[0m\]\
\[\033[1;31m\]\h\[\033[0m\]\[\033[0;0m\]]-\
[\[\033[0m\]\[\033[0;32m\]user: \[\033[0m\]\[\033[1;31m\]\u\
\[\033[0m\]\[\033[0;0m\]]-[\[\033[0m\]\[\033[0;32m\]bash: \
\[\033[0m\]\[\033[1;31m\]\v\[\033[0;0m\]]\n\
\[\033[0;0m\][\[\033[0;32m\]cwd: \[\033[0m\]\[\033[1;31m\]\w\
\[\033[0m\]\[\033[0;0m\]]# "
```


Thanks to <a href="http://www.gilesorr.com/bashprompt/howto/">Bash Prompt HOWTO</a>.
