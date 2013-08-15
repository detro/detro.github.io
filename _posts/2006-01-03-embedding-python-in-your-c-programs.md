---
layout: post
author: detro
published: true
title: "Embedding Python in your C programs"
tags: [c, python, sw, english, howto, it, linux]
date: "2006-01-03 20:28:30"
updated: "2006-01-03 20:28:30"
permalink: /2006/01/03/embedding-python-in-your-c-programs/
---

<blockquote>The language of choice for large, high-performance applications in Linux is almost always C, or somewhat less often C++. Both are powerful languages that allow you to create high-performance natively compiled programs. However, they are not languages that lend themselves to runtime flexibility. Once a C/C++ application is compiled, its code is pretty much static. At times, that can be a real hindrance. For example, <ins datetime="2006-01-03T19:22:45+00:00">if you want to allow users of a program to create plugins easily</ins> that extend the application's functionality, you have to deal with complex dynamic linking issues that can cause no end of headaches. Additionally, your users will have to know C/C++ in order to extend the application, which severely limits the number of people capable of writing extensions.

A much better solution is to <ins datetime="2006-01-03T19:22:45+00:00">provide your users with a scripting language they can use to extend your application</ins>. <strong>With a scripting language, you will tend to have much more runtime flexibility, as well as shorter development times and a lower learning curve that will extend the base of users capable of creating extensions</strong>.

Unfortunately, creating a scripting language is very much a nontrivial task that easily could become a major portion of your program. Fortunately, you don't need to create a scripting language. <strong>With Python, you can embed the interpreter directly into your application and expose the full power and flexibility of Python without adding very much code at all to your application</strong>.</blockquote>

E VERY VERY INTERESTING howto: <a target="_new" title="Linux Journal article" href="http://www.linuxjournal.com/article/8497">here</a>.
Thanks much too much to William Nagel.


