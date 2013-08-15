---
layout: post
author: detro
published: true
title: "Git rebase: be a mother, not a plastic surgeon"
tags: [development, git, log, rebase, github, opensource, mother, contribution, surgeon, history]
date: "2012-06-16 15:24:07"
updated: "2012-06-16 21:12:13"
permalink: /2012/06/16/Git-rebase-be-a-mother-not-a-plastic-surgeon
---

Today I'm going to share a little tip about the use of Git.

In contributing to open source projects, it happens sometimes that I have
a long running `branch`; something on which I need to work for more than just
few hours. The kind of work that goes on for weeks, sometimes months.

**UPDATE: ** Matt suggested a [great doc about rebasing](http://git-scm.com/book/en/Git-Branching-Rebasing).

<div class="img">
<img src="http://www.desktopocean.com/file/101/480x800/crop/caring-mother.jpg" alt="Caring mother" height="500" />
There is lol-cat-picture for every need
</div>

Working on a branch is great: it let's you work on a feature, a fix, an
extension in total isolation, being sure you don't disrupt anyone (and don't
embarrass yourself).

## Catching Up

One thing I learned to do in my carrer, is to make sure to keep my development
branch always up to date with what is happening on the `master branch`.
I call it (and I'm not the one that invented it) **_catching up_**.

The frequency of it depends stricktly on how fast the development
flows in your project.

This gives you multiple benefits:

* **no surprises** - test your changes against master as early as posssible
* **no merge-conflict-hell** - solve the conflicts as they happen, small
chunks at a time
* **no waste of time** - if someone else commits stuff that makes your
change useless, you waste no time and go find something else to do

## I'm ready to merge!

At this point, you are excited and can't wait to put your code to good use.
All those hours spent tirelessly on that stupid bug: now I'm ready
for the pay off, the glory, the Nobel (sorry, got too excited there!).

But wait, there is a "small" issue: when you do your `pull request` on
GitHub your **history** is a mess! Commits about the stuff you were working on
is _intertwined_ (nice word this one!) with other people's code.
Plus, every time you did a `catch up`, is now
**a merge from `master` to `master`**. A true mess. I hate it when it happens.

Yes, of course: ultimately your code is clean and all, it's not like
"the code is broken". But it's just very **"ugly"**.

## Why you should care about History

History is more than just a meaningless memorandum that gives a description
to a bunch of bytes you throw to the keyboard and down the repo. History is:

* **documentation** - people can grasp your code better, if they can understand
how the _heck_ did you came up with it
* **personal notes** - do you always remember what you do and why? I don't; I need an aid
* **_curriculum vitae_** - it tells people (or at least me) what is your line of
thought. How do you work, what are your logical steps

Before you start throwing tomato at me: **I'm not going to suggest you
rewrite your history to cover your shame!**

What I'm getting at is that is part of your work to make sure that others can
read your history and understand clearly what's going on.

If that commit with that shameful _fuck up_ is what keeps you awake at night,
I think you have primarily maturity issues to take care of. So maybe the quality
of your history is the least of your concerns right now, and you should focus
on growing up.

If you commit a _fuck up_, leave it there. Fix it with another commit and in
the body of the message explain why that was indeed a fuck up and how great
your code is now.

## Let's sort things out, shall we?

Now, what I'm getting at is that you want to avoid having your commits all
messed up with others work, and you definitely want to avoid useless merge
messages in your history.

Also, you might want to `squash` a couple of your commits while at it: if you
have just added that cool _feature x_, maybe you want the test for that into
the same commit: _it's only logical!_

So, what I suggest you do is you take the branch, starting from it's root, and
**change it's base** - indeed, `rebase` it on the master:


```bash
$ git fetch upstream
...
$ git status
# On branch the-coolest-feature-ever
nothing to commit (working directory clean)
$ git rebase upstream/master
```


What this does, is taking all the commits of your branch, remove
them from where they are, and re-apply them one by one on the top of the current
master (that's why I had that `git fetch upstream`).

If you are not luckly, you will have to re-resolve some conflicts (harden-up!),
but your history will look clean and ready for a _kick-ass pull request_.

Trust me, whoever is going to read that pull request will be happy and grateful.
Particularly the maintainer that is reviewing it!

### While you are at it, fix that typo in the message

`git rebase` is also awesome for fixing the body of your commit messages.
Use:

```bash
$ git rebase -i <COMMIT HASH>
```

to be able to re-touch your history. But
be careful and don't overdue: **don't be a plastic surgeon - just a
mother taking care of it's child**. No one will be upset.
