---
layout: post
author: detro
published: true
title: "Web dev: do we need to raise the bar?"
tags: [web, proprietary, monopoly, prefix, html, webkit, xhtml, specs, css]
date: "2012-02-21 10:16:33"
updated: "2012-02-21 10:16:33"
permalink: /2012/02/21/Web-dev-do-we-need-to-raise-the-bar
---

Articles [like this one](http://www.techrepublic.com/blog/australia/the-webkit-prefix-will-ruin-the-mobile-web/669) and initiatives like "[pre-fix the Web](http://codepo8.github.com/prefix-the-web/)", aim to highlight to web-developers how important is to **build a cross-browser web**. The importance of such a point has been explained in so many places, there is no point in me saying anymore. People  like [Tim Huegdon](http://nefariousdesigns.co.uk/) can give you a far better lesson on this.

But if you are after a "**one sentence to blame them all**":
<blockquote>
If you write a website caring only to test it on WebKit based browser (worse, only your iPhone!!!), you are a **MORON**.
</blockquote>

Recently I happened to re-read the "[How Browsers Work: Behind the scenes of modern web browsers](http://www.html5rocks.com/en/tutorials/internals/howbrowserswork/)" and precisely the section about the [_forgiving_ HTML Parser](http://www.html5rocks.com/en/tutorials/internals/howbrowserswork/#HTML_Parser). I ask
myself: why did we (the _web people_) cheer at HTML5 and [killed XHTML2](http://www.w3.org/News/2009#entry-6601), if not for
the forgiveness? Didn't we do this to _"lower the bar"_, to allow _"your young cousin to write website for his dad's business"_?

We do spend **LOADS** of time pushing our self and colleagues to adopt best practice, validate code and so forth (and that is great!). Why do we fail to make the logic step of thinking:
<blockquote>
The guy that I swear at for using `-webkit-*` only prefixes, is the same guy that uses/abuses the HTML parser!
</blockquote>

On one side we help, and sometimes even endorse _stupid_ people,
because we want the web to be accessible (I guess) to young and
non-experienced (more content on the web == better web ???). But when they use it to do **proprietary shit**, things _we would have not expected or hoped for_, then we go on berserk (I'm the first to do it!) and start talking like grandpas recalling Vietnam when their nephew Is preparing to leave for Iraq:
<blockquote>
...
It's Internet Explorer monopoly all over again!
...
Stop WebKit from taking over the web!
...
</blockquote>

A question: what about enforcing HTML parser to be less forgiving? What about a **shame-banner** built in the browser appearing on the top of the viewport, saying:
<blockquote>
This site is shite! Who made this is a moron!
</blockquote>

_I'm only half joking_: either we want stupid people writing bad websites, or we don't. Either we want an easy to access, low-bar web, or we want a web of experts, computer scientists even, that know what-the-fuck they are doing.

What's your take?
