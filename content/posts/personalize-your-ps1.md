---
layout: post
author: detro
title: "Personalize your $PS1"
tags: [code, prompt, cli, personal, personalization, howto, it, terminal, curiosity, english, bash, utility]
date: "2008-04-21T00:00:00Z"
aliases:
  - /2008/04/21/personalize-your-ps1
  - /2008/04/personalize-your-ps1
---



![](http://4.bp.blogspot.com/_Zfnd5XZP80Y/S8S8ZPTdVvI/AAAAAAAABg8/dfnIlEXmDJM/s1600/Picture+2.png)
Fancy $PS1 setting



The code to make the [Bash](http://www.gnu.org/software/bash/) prompt looks like mine is (<code>~/.bashrc</code>):

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


Thanks to [Bash Prompt HOWTO](http://www.gilesorr.com/bashprompt/howto/).
