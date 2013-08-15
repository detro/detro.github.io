---
layout: post
author: detro
published: true
title: "Swap the value of two integers without temporary storage"
tags: [c, code, xor, personal, fast, simple, value, integer, smart, swap]
date: "2010-01-13 21:48:29"
updated: "2011-03-21 22:11:37"
permalink: /2010/01/13/swap-the-value-of-two-integers-without-temporary-storage/
---

Someone says this is an old lame trick. I think it's simple and clever use of XOR.

## How/Why does it work?
It's built around the properties of the <code>XOR ^</code> operator, who has the following properties:
<ul>
<li><code>A ^ B = B ^ A</code> (commutative)</li>
<li><code>A ^ 0 = A</code></li>
<li><code>A ^ 1 = ~A</code></li>
<li><code>A ^ A = 0</code></li>
</ul>

So, you can see how it get's applied here:

```c
#include <stdio .h>
int main(void)
{
   unsigned int a, b;
   // ... populate somehow "a" and "b"...
   
   printf("a = %d - b = %d\n", a, b);

   a ^= b; // store in "a" the value of "a XOR b"
   b ^= a; // store in "b" the value of "a XOR b XOR b" = "a XOR 0" = "a"
   a ^= b; // store in "a" the velue of "a XOR b XOR a" = "b XOR 0" = "b"

   printf("a = %d - b = %d\n", a, b);
}
```


Neat.
