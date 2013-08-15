---
layout: post
author: detro
published: true
title: "Rename Subdirectories in a Tree: the Bash way"
tags: [rename, task, script, subdirectory, tree, automation, easy, directory, bash]
date: "2010-09-30 15:34:45"
updated: "2010-09-30 15:36:07"
permalink: /2010/09/30/Rename-Subdirectories-in-a-Tree-the-Bash-way
---

My granma always used to say every time she was recompiling the [Linux Kernel](http://www.kernel.org) of her wash machine:

> Bash Scripting is GREAT!
> Be sure you learn it.
> One day will understand why it can make your life much easier.

And she was right! I'm not an [Bash](http://tiswww.case.edu/php/chet/bash/bashtop.html) expert, but when I spend that _10 minutes_ putting together that scripts that _makes that tedious task _piece of cake_, the satisfaction is as tick as a Mug of Coffee.

Today I got this new colleague having to rename a lot of specific directories in a deep directory tree, and I decided to help.

Here is the full code:

```bash
#!/bin/bash
# Simple Bash script to recursively rename Subdirectories in a Tree.
# Author: Ivan De Marino <ivan.demarino@betfair.com>
#
# Usage:
#    rename_subdirs.sh <starting directory> <new dir name> <old dir name>

usage () {
   echo "Simple Bash script to recursively rename Subdirectories in a Tree."
   echo "Author: Ivan De Marino <ivan.demarino@betfair.com>"
   echo
   echo "Usage:"
   echo "   rename_subdirs.sh <starting directory> <old dir name> <new dir name>"
	
   exit 1
}

[ "$#" -eq 3 ] || usage

recursive()
{
   cd "$1"
   for dir in *
   do
      if [ -d "$dir" ]; then
         echo "Directory found: '$dir'"
         ( recursive "$dir" "$2" "$3" )
         if [ "$dir" == "$2" ]; then
            echo "Renaming '$2' in '$3'"
            mv "$2" "$3"
         fi;
      fi;
   done
}

recursive "$1" "$2" "$3"
```


Clean and Fun: I learned how to do recursion in Bash.

Happy (Bash) Scripting.
