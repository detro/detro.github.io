---
layout: post
author: detro
published: true
title: "Count bits set in parallel"
tags: [count, c, code, algorithm, personal, it, english, explaination, bits, cool]
date: "2010-01-07 13:33:46"
updated: "2011-03-21 22:21:33"
permalink: /2010/01/07/count-bits-set-in-parallel/
---

This time it's not something I make myself. Indeed, I still can't "see" it 100%: I got it, but it's a bit complex.

<div class="img">
<img src="http://www.familyhelptree.com/blog/wp-content/uploads/2007/10/counting.jpg" alt="Counting kid" />
A cute little lady counting (bits? ;-) )
</div>

It's a method to count the number of bits in a number in O(1), in just 5 lines of code. <strong>INHUMAN.</strong>

## The "human" solutions
Of course, there are methods that look way more easy and, given that the size of a number in memory is "fixed", the O(1) still stands. For example:
<strong>0. Based on the "evenness/oddness" of the number</strong>

```c
unsigned int bits_counter_v0(unsigned int x) {
    unsigned int count = 0;
    while ( x != 0 ) {
        // If odd, add 1
        count += (x % 2 == 0) ? 0 : 1;
        x >>= 1;
    }
    
    return count;
}
```


<strong>1. Counting one bit at a time (always the least significant one)</strong>

```c
unsigned int bits_counter_v1(unsigned int x) {
    unsigned int count = 0;
    while ( x != 0 ) {
        // If least-significant bit is 1, add 1
        count += (x & 1) ? 1 : 0;
        x >>= 1;
    }
    
    return count;
}
```


<strong>2. Counting 4 bit at a time with max 8 shifts, using an "hashmap" with precalculated results</strong>
The fact that it can count the bits in <em>"max 8 shifts"</em> has the trade off of the memory used by the hashmap.


```c
unsigned int bits_counter_v2(unsigned int x) {
    unsigned int count = 0;
    // "Hashmap" of the values for the least significant 4 bits
    unsigned int int_to_bits_count[16] = {
        0, // 0  00
        1, // 1  01
        1, // 2  10
        2, // 3  11
        1, // 4  100
        2, // 5  101
        2, // 6  110
        3, // 7  111
        1, // 8  1000
        2, // 9  1001
        2, // 10 1010
        3, // 11 1011
        2, // 12 1100
        3, // 13 1101
        3, // 14 1110
        4  // 15 1111
    };
    
    while ( x != 0 ) {
        // Add the bits count of the least significant 4 bits
        count += int_to_bits_count[ x & 15 ];
        x >>= 4;
    }
    
    return count;
}
```


Let's see what some insane people made. <!--more-->

## The "weird" solution
This solution is not impressive, until you analyse how it does actually works, and think <em>"How the hell did they come out with this thing?"</em>.

```c
unsigned int bits_counter_v3(unsigned int x) {
    unsigned int result = 0;
    // strip one set bit per iteration
    while (x != 0) {
        x &= x - 1;
        result++;
    }
    return result;
}
```


The explaination, from the <a href="http://bits.stephan-brumme.com/countBits.html">source where I took it</a> (thanks <a href="http://twitter.com/lucabox">Luca</a> for highlighting it to me):
<blockquote>
The main trick, stripping a single bit with x &= x − 1 (line 21), deserves some attention:
<ul>
<li>if x = 0, then the while-loop is not entered at all, so we do not need to consider this case</li>
<li>if the rightmost bit is 1, then the rightmost bit of x − 1 is 0. All other bits are identical and x &= x − 1 → x = x − 1. Because all other bits are identical we stripped one set bit, the rightmost bit.</li>
<li>if the rightmost bits are 0, then x looks like this: ...1000. And x − 1 looks like this: ...0111. Result of x &= x-1: ...0000.</li>
</ul>
Hence, x &= x − 1 clears all bits except for the ones represented as dots, they remain the same. Again, exactly one bit was cleared.
In general, x &= x − 1 always sets the rightmost bit which was 1 to 0.
</blockquote>

I mean, method 0 and 1 above are practically doing the same thing. This one is just "weird".

## The INHUMAN solution: Counting bits set in Parallel
<em>Ladies and Gentlemen</em>, the algorithm that is still making my mind go banana:

```c
unsigned int bits_counter_v4(unsigned int x) {
    // count bits of each 2-bit chunk
    x  = x - ((x >> 1) & 0x55555555);
    // count bits of each 4-bit chunk
    x = (x & 0x33333333) + ((x >> 2) & 0x33333333);
    // count bits of each 8-bit chunk
    x = x + (x >> 4);
    // mask out junk
    x &= 0xF0F0F0F;
    // add all four 8-bit chunks
    return (x * 0x01010101) >> 24;
}
```


Again, from the same source:
<blockquote>
Counting all set bits of an integer was part of many mainframe CPU's assembler language but somehow
x86 CPUs ignored it for decades. Apparently Intel introduced the POPCNT opcode in its Core i7 design.

Meanwhile, the population count has to be implemented by other means.
The main observations lies in the fact that you can subdivide any bitblock into smaller chunks,
compute their population count and add all intermediate results.

First, the code counts the bits of two adjacent bits:


```c
0b and 0b >> 00b
0b and 1b >> 01b
1b and 0b >> 01b
1b and 1b >> 10b
```


The whole algorithm modifies the input in order to generate the output, that means it works in-place.
Line 3 performs the 2-bit count at once based on the observation:


```c
00b >> unchanged, still 00b
01b >> unchanged, still 01b
10b >> must be converted to 01b
11b >> must be converted to 10b
```


Whenever the higher bit of each 2-bit group is set, subtracting <code>01b</code> gives the desired outcome.
Looks like branching ... but as it turns out, the subtraction can be done always: just subtract the higher bit !
If it is <code>0</code>, the result remains unchanged, if it is <code>1</code>, then we get the right numbers, too.
The shift <code>x &gt;&gt; 1</code> and the following mask of all odd bits (<code>0x55</code> is <code>01010101b</code>):


```c
00b >> shifted: ?0b >> masked: 00b >> subtraction: 00b - 00b >> 00b
01b >> shifted: ?0b >> masked: 00b >> subtraction: 01b - 00b >> 01b
10b >> shifted: ?1b >> masked: 01b >> subtraction: 10b - 01b >> 01b
11b >> shifted: ?1b >> masked: 01b >> subtraction: 11b - 01b >> 10b
```


Now the 2-bit count is done. As you can see, there are just three possible decimal results: <code>0, 1 or 2</code>.

Then, two adjacent 2-bit groups are joined to 4-bit groups (line 5):


```c
00b and 00b >> 0000b
00b and 01b >> 0001b
00b and 10b >> 0010b
01b and 00b >> 0001b
01b and 01b >> 0010b
01b and 10b >> 0011b
10b and 00b >> 0010b
10b and 01b >> 0011b
10b and 10b >> 0100b
```


This time, the 2-bit groups are masked and shifted to match and then simply added. No overflow is possible.


```c
00b + 00b >> 0000b
00b + 01b >> 0001b
00b + 10b >> 0010b
01b + 00b >> 0001b
01b + 01b >> 0010b
01b + 10b >> 0011b
10b + 00b >> 0010b
10b + 01b >> 0011b
10b + 10b >> 0100b
```


The same procedure is done for all 4-bit groups yielding the bit counts for each of the four bytes (line 7)
in their lower four bits. That means, each byte contains its bit count, however, the upper four bits may
contain junk and are masked out (line 9).

Multiplying by <code>0x01010101</code> has an interesting property if we name the four bytes A, B, C, D:


```c
A, B, C, D >> A+B+C+D, B+C+D, C+D, D
```


Obviously the highest byte is what we are looking for. The right shift (line 11) returns just it.
</blockquote>

Of course, this method has a big limitation: it works only with 32-bit numbers.
To use other sizes (64-bit) needs to be adapted. Still, it blows my mind.
