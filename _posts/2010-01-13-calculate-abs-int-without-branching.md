---
layout: post
author: detro
published: true
title: "Calculate abs(int) without branching"
tags: [branching, code, personal, operators, english, it, bitwise, twos-complement, abs, value, hack, absolute, cool]
date: "2010-01-13 23:43:12"
updated: "2011-03-21 22:11:09"
permalink: /2010/01/13/calculate-absint-without-branching/
---

For this you need someone to teach it to you: if you made it yourself, then you are a very good <a href="http://en.wikipedia.org/wiki/Computer_science">Comp-Sci</a>, and you should send your CV to <a href="http://www.google.co.uk/intl/en/jobs/">Google</a> ASAP. ;)

## Without branching O_o?
Yes, without using any "<code>if ( a < 0 )...</code>". To do that, you need to refresh how <a href="http://en.wikipedia.org/wiki/Two's_complement">Two's Complement works</a>, then come back.

What we really need to focus on is that, given a <code>signed int A</code>, the negative of that number is: <code>B = ~A + 1</code>. BUT, we are trying to calculate the Absolute Value, not the negative. So, something like:

```c
RESULT =
    (INPUT, if positive, or NEGATE_INPUT, if negative)
    +
    (0, if positive, or 1, if negative)
```


Does it makes sense to you? To me it didn't for the first 10 minutes.

## What do we need?
We need, given the integer in input, to calculate 2 values:
<ul>
<li>A way to "optionally negate" the input</li>
<li>A variable carrying <code>0</code> if the input is positive, <code>1</code> otherwise
</ul>

### Look what we have here: the <code>XOR</code>
Properties of XOR are:
<ul>
<li><strong><code>A ^ 0 = A</code></strong></li>
<li><strong><code>A ^ 1 = ~A</code></strong></li>
<li><code>A ^ A = 0</code></li>
<li><code>A ^ B = B ^ A</code> (commutative)</li>
</ul>

The first two properties are key here: if we could only generate a variable from the input that contains <code>0</code> if positive and <code>1</code> if negative, we would have half hack done.

### Ladies and Gentleman, all shift please
Now, let's see some shifting in action. <strong>If A is a Positive number, then:</strong>

```c
A = INPUT >> 31 => 0x00000000 => 0
B = -A => -0x00000000 => 0
```


<strong>While if A is a Negative number, then:</strong>

```c
A = INPUT >> 31 => 0xFFFFFFFF => -1
B = -A => 0x00000001 => 1
```


## Putting all together
So, this means that we can calculate the absolute value using the new variables we have produced, A and B. Here is how:

```c
#include <stdio.h>

int abs(const int value) {
   int A = value >> 31;     // 0x00000000 if Positive, 0xFFFFFFFF if Negative
   int B = -A;              // 0x00000000 if Positive, 0x00000001 if Negative
   return (value ^ A) + B;  // value ^ A = value if Positive, value ^ A = ~value if Negative
}

int main(int argc, char** argv)
{
    int input;
    
    // Check the Input
	if ( argc == 2 ) input = atoi(argv[1]); else return (1);
	
	printf("abs(%d) = %d\n\n", input, abs(input));
}
```


Who showed me this hack? eh eh eh! ;)
