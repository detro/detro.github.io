---
layout: post
author: detro
published: true
title: "What does scalability actually means?"
tags: [google, car, number, scalability, googleplex, filling, book, scale, listening, reading]
date: "2011-08-31 09:50:55"
updated: "2011-08-31 17:03:51"
permalink: /2011/08/31/What-does-scalability-actually-means
---

I was on the train to [Portsmouth](http://maps.google.co.uk/maps?cx=c&q=portsmouth&um=1&ie=UTF-8&hq=&hnear=0x487442a41814f1e9:0x45b683ea03373b79,Portsmouth&gl=uk&ei=hgNeTpbZFcSOswaqtNmwDw&sa=X&oi=geocode_result&ct=title&resnum=1&ved=0CCcQ8gEwAA), and listening-reading the book ["In the Plex"](http://books.google.co.uk/books?id=V1u1f8sv3k8C).
In the Part 2 of the book, Chapter 2 if I recall correctly, the author is talking about Google and the Ocean project, what is later on going to be know as [Google Books](http://books.google.co.uk/books).

The part that got me thinking is when Page, Brin and Mayer are trying to work out how actually they can scan the physical books, in a _scalable manner_. To the Googlers, hiring a lot of human beings and a lot of scanner didn't look like a _scalable_ solution at all! So they decided to work on their own scanner, using the hardware building expertise that years of Google Data Center made them acquire.

<div class="img">
<img src="http://craphound.com/images/Google_figure_3.jpg" alt="Google scanner schematic" />
[Google’s book-scanner cleverly corrects for the curvature of an open book](http://boingboing.net/2009/05/03/how-googles-book-sca.html)
</div>

They figured out that, while they still had to hire quite some people to make them physical "manipulate" the books to use the scanners, they needed to have the right instruments, and the right software tools, to make the process _scalable_. Their aim, after all, was to scan the entire set of the **ever written books**, in any language, from every country.

This made them focus a lot of effort in gathering any book they could, scan them for free (or as cheaply as possible), and then let the people access the content online, through their search engine. Well, at least that was the objective: [we know how many trouble they went through because of this project](http://en.wikipedia.org/wiki/Google_Books#Copyright_infringement.2C_fair_use_and_related_issues).

## How do we scale?
Without a doubt an ambitions, and maybe _SciFi-ish_ objective, but their _CompSci_ mind made them think straight away at:
<blockquote>
How do we keep this going when the books available to us get to the hunders tousands? And from there to the millions? How do we **scale**?
</blockquote>

When I read this, I started thinking about the very meaning of the espression _"how do we scale?"_. What does it actually mean to _scale_? How can a process be defined _scalable or not scalable_. Is there a formula? A _rule of thumb_?

## It's all about numbers
How many people do you need to fill your car at the pump? 1? 2? You need one to fill the car, and that should be it. Yes, assuming that the pump has next to it a payment machine, therefore getting rid of the need of someone at the counter to collect payments.

This means that for **1 result == auto filled**, you need **1 humans**. The numerical relationship, the _scale_ is than **1 : 1**. Makes sense isn't it? And it sounds like the right number, right?

What if you need to fill 4 cars at the same time? Assume a petrol station has 4 pumps, and that it can accomodate 4 cars simultaneously, how does this scale? **4 : 4**. But if you look at the 4 pumps as a single unit, than you have a much better ratio **1 petrol station : 4 cars full**. This is a better scale already. You need only 1 petrol station to fill 4 car at the same time.

## Does this scale?
**No, it doesn't scale**. Imagine a scenario when you want to fill 40.000 cars at the same time (a pretty feasable number in a big city). You will need... 10.000 petrol stations! A ridiculous number.

Of course, this is not a realistic scenario (all the cars don't need to be filled at the very same time), but you get the idea.

This means that when we need to measure the _scalability_ of a problem, the first thing to **figure out is the numeric relationship between resource (the pumps) and result (the full cars)**.

What you ultimately want is a ratio **X : Y** with lim(X) => 1 and lim(Y) => INF.

## An "internet" example
How many simultaneous HTTP requests my server can cope with? 10/s? 100/s? 100000/s? Imagine it's **100/s**. The ratio is **1 server : 100 HTTP requests/s**. This means that to serve 100 customers (assuming they produce only 1 request per second - in truth it's much more), you need 1 server.

Now, assume your internet service is very successful, and your customers grow to the order of millions. How many server do you need to serve **1 million HTTP requests per second**? Given _your current ratio_, you will need **1 : 100 * 1000000 == 10000 servers!**. This is terrible!!!

With those kind of number, you will be right at saying:
<blockquote>
My servers do NOT scale!
</blockquote>

## Make it scale
And that's when you want to get cleaver. You hire the best people to write better, more scalable software and design better architectures, to cope with the high volume of traffic. All this, without having to buy tousands of new servers.

Remember, you want to **keep X as close as possble to 1**, while **Y keeps growing**.

## Conclusion
I know that most of you will consider what I wrote as "obvious", and it indeed is. But what I wanted to highlight was infact that we do use terms assuming that their full meaning is know and, again, obvious. But it might be useful sometimes to stop and think and what we say, how we say it, and how we ight find more meaning in the meaning itself.
