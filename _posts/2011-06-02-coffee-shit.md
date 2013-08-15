---
layout: post
author: detro
published: true
title: "Coffee-Shit"
tags: [code, language, coffeescript, javascript, culture, interpreter, developers, bullshit]
date: "2011-06-02 11:50:15"
updated: "2011-06-02 12:24:10"
permalink: /2011/06/02/Coffee-Shit
---

I had it. I'm sick and tired of this nonsense. People, Devs in the
specific, should pull their head out of their ass right now and act
like adults.

What am I on about? I'm about re-factored, recompiled languages. Stuff like
CoffeShit (yeah, [Coffee-SHIT](http://jashkenas.github.com/coffee-script/) - so what?).

## Who the fuck cares?

Come on people, are we really saying that the grammar of a language
makes you a better/smarter/faster developer? **This is BULLSHIT!** Grammar has nothing to do with the quality of your code or with your
development speed. NOTHING!

<div class="img">
<img src="http://upload.wikimedia.org/wikipedia/commons/8/83/Indonesian_farmer_shows_coffee_beans_already_digested_by_Asian_Palm_Civet%2C_but_before_cleaning_and_roasting.jpg" alt="Kopi Luwak" />
_"Kopi Luwak"_ aka Civet Shit Coffee - [it's true, I read it on Wikipedia!](http://en.wikipedia.org/wiki/Kopi_Luwak)
</div>

If you are a shit-head, a language is not going to make you brilliant. It might get you to do a speech in a conference no one cares about, where you can brag for 15m about:
<blockquote>
Oh, I started to use CoffeScript for my coding and it's brilliant and shit!
My productivity gone out and shit!

My girlfriend left me for a C++ developer but I don't give a shit, because I'm free of **semicolons** and **brackets**!

Now I can really develop great stuff.
</blockquote>

If you ever said (or thought) stuff like the above, you are a retard! Getting rid of semicolons or brackets will not take away all your childhood dramas, all the times in which your personal bully kicked you in the nuts, or all the times in which your mother in law says to your wife:
<blockquote>
Darling, I know you love him, but he is ugly as shit!
</blockquote>

Brackets and Semicolons are for sanity. For order. For organisation. And they are there because they make the life of the code easier, as he can code with more freedom. **YES! MORE FREEDOM!** - If you think about it, you know I'm right.

## Man up, you _sissy_!

Decisive factors that can really make a difference in your developer life are instead things like:

* A proper, well organised, rich API
* An _easy-to-live-with_ SDK
* A good Platform Abstraction
* A [new approach to Concurrency](http://golang.org/doc/effective_go.html#concurrency)
* A [loosely coupled Publish-Subscribe implementation in compiled languages](http://doc.qt.nokia.com/4.7/signalsandslots.html) ([this as well](http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/ObjCTutorial/06Controller/06Controller.html))
* A fast write-compile-test roundtrip
* An editor that doesn't get in the way
* `Makefile`

"Not having to type brackets" or "being free from semicolons" is
just an excuse: people that enjoy or are serious about their _task_, don't give a shit about this stuff. Ever!

Only the ego-maniac, time-wasters, bored developers think that adopting
something like CoffeeShit can make them better/faster. Is because they have no idea on how to learn or improve, so they look for _someone else's recipe_ to make themselves better. **Sad people indeed**.

Of course, this doesn't apply to everything: better languages for
specific domains/fields do come along sometimes and make stuff
better/easier, but it's never because of the grammar.

## `Better Dev Environment == Better Dev Experience == Better Dev Performance`

If you can experience the above, than you are doing well. Yes, you still don't get to sleep with _Jennifer Aniston_, but you might be closer to that (hey, statistics wise, I'm not saying anything wrong here!).

There are multiple example in the industry that demonstrate this to be true.

#### iOS SDK
Symbian invented the concept of Apps for Mobile a trillion years ago, but the SDK was **pure shit**. Apple came along, made the iOS SDK (after having seen how easily people started making one anyway :-P) and they now rule the world.

#### Ubuntu
Linux has been around for decades, but a lot of tech-savvy people never adopted it, and stick with Windows, because it was too painful to have to deal with all the intricacies of Linux, if your only aim was to code in a stable, fast, reliable environment.

There was (and still is) a multitude of Linux distro that aim at making the experience better, but we had to wait for Canonical to came along to see massive adoption from "skeptics".

#### PHP
Perl has been for quite sometime the only scripting language for web development. But was not as easy. Rasmus Lerdorf invented PHP and kicked everyone in the nuts. Yes, PHP has problems and can turn any mongoloid into "I'm a web dev" but... _with great power comes great responsibilities_.

#### Less or SASS
[Less](http://lesscss.org/) and [Sass](http://sass-lang.com/) are 2 very good examples of how to do stuff like this right! They do compile down to CSS ultimately, but they have **A MASSIVE VALUE ADDED**. Ask any modern web dev and he will tell you why. No time here.

## Closing

By the way, I do **love** semicolons and brackets, and I believe that Python-ers fixation for not using them is correctly defined as _wanking_. But I also believe that if a community/team agrees on a coding standard, is good to stick with it.

I might _still complain_ about it, but I'd definitely stick.

Also, try to go through the examples of [Coffee-Shit](http://jashkenas.github.com/coffee-script/) and see for yourself that in some cases, like "conditional assignment", it actually requires more keystrokes than the generated JavaScript. **And that is just plain funny!**

**P.S.:** Sorry, I had to. Yesterday I found myself trying to do some examples conversion for [PhantomJS 1.2](https://github.com/ariya/phantomjs) (btw, you should check it out!), and after being done with the JavaScripts, I thought I might try to do the CoffeeShit versions. But I quickly found myself puzzled about _why I was doing the same thing again, but in a less clean, more arcane grammar_. So I gave up. Luckily there are people like Robert, with manners, that [did it instead of me](https://groups.google.com/d/topic/phantomjs/75pZwHaxdEA/discussion).

**P.P.S.:** Please, never come to an interview with me having in your CV that you are an expert of CoffeeShit. Even worse, don't do it and say that _you don't know much JavaScript_. I might kill you on the post. It's like when people assume that `$("#id")` is the JavaScript way to find a node by ID in the DOM. It get's a lot of people at the door.

**P.P.P.S.:** I know it might hard to believe, but this article doesn't want, in any way, attack the good work of [Jeremy Ashkenas](https://github.com/jashkenas). His implementation of CoffeeScript, and the way he clearly documented (and in a very stylish manner) is remarkable and deserves all my respect (and yours too). This is about a higher concept: hope Jeremy gets it, and this doesn't sound as a "personal" attack.
