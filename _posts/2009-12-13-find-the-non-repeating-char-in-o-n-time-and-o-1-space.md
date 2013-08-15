---
layout: post
author: detro
published: true
title: "Find the non repeating char in O(n) time and O(1) space"
tags: [personal]
date: "2009-12-13 22:09:09"
updated: "2009-12-13 22:09:09"
permalink: /2009/12/13/find-the-non-repeating-char-in-on-time-and-o1-space/
---

I would like to post some of the Brain Teaser (mostly algorithmic problems) I'm giving to interviewee lately, and of course some that were submitted to me in the past.
But I can't promise I will keep doing it regularly: just that I will try (blogging regularly is hard for me).

The solution will be at the end of the post, just in case you would like to try to solve it first.
Of course my solution it's MY solution: it could be buggy or non-optimal. In those cases, PLEASE share your view and, better, your alternative solutions.

<h3>Problem description</h3>
Determine the first non-repeated character in a word. For example, in abbcaf it should return c. <strong>Do this in <a href="http://en.wikipedia.org/wiki/Big_O_notation">O(n)</a> time with O(1) space</strong>.

<h3>Some observation</h3>
<strong>O(n)</strong> means that the complexity of time of the algorithm must grow linearly with the input. So, if in this case the input is an <code>array of characters</code>, <em>an acceptable solution can contain &gt;1 non-nested FOR cycle</em>.

<strong>O(1)</strong> means that the complexity of space of the algorithm must be constant, regardlessly of the input.

<h3>Conditions</h3>
For simplicity, will assume that:
<ul>
<li>the input is always a lowercase string (enforcing this condition is easy and cheap)</li>
<li>the input is made made only of the letters of the english alphabet</li>
</ul>
Those conditions will then become the "base" of our solution.

Of course, you are free to assume more conditions: it's usually a good way to solve problems to start adding conditions that simplify the search of a solution, and then start a process of subtraction to arrive to have as less conditions as possible. It usually works for me.
<!--more-->

<h3>Solution</h3>
[code lang="c"]
#define NORMALIZE_CHAR(C)       (C-'a')

#include <stdio .h>

int main(int argc, char** argv)
{
	char* input;
	unsigned int input_length;
	unsigned int i;

	unsigned int present_once = 0;
	unsigned int present_multiple = 0;

	const unsigned int char_to_bit[26] = {
	   0x1, 0x2, 0x4, 0x8, // a, b, c, d
	   0x10, 0x20, 0x40, 0x80, // ...
	   0x100, 0x200, 0x400, 0x800,
	   0x1000, 0x2000, 0x4000, 0x8000,
	   0x10000, 0x20000, 0x40000, 0x80000, //...
	   0x100000, 0x200000, 0x400000, 0x800000, // u, v, w, x
	   0x1000000, 0x2000000 // y, z
	   };

	// Check the Input
	if ( argc == 2 ) input = argv[1];
	else return (1);

    // Search for every character "present only once"
    for ( i = 0; ; ++i )
    {
        if ( input[i] != '\0' ) ///< Doesn't use "strlen" - It checks at every iteration if we reached the end of the string
        {
            // If the current char is not already marked as "present multiple times"
            if ( !( present_multiple & char_to_bit[ NORMALIZE_CHAR(input[i]) ] ) )
            {
                // It it is already marked as "present once"
                if ( present_once & char_to_bit[ NORMALIZE_CHAR(input[i]) ] )
                {
                    // Then mark it as "present multiple times" and unmark it's "present once"
                    present_multiple |= char_to_bit[ NORMALIZE_CHAR(input[i]) ];
                    present_once &= ~char_to_bit[ NORMALIZE_CHAR(input[i]) ];
                }
                else
                {
                    // Otherwise, mark it as "present once"
                    present_once |= char_to_bit[ NORMALIZE_CHAR(input[i]) ];
                }
            }
        }
        else
        {
            // Store the input length to make next iteration easier
            input_length = i;
            break;
        }
    }

    // Look for the first char that is marked as "present only once" => that's the solution
    for ( i = 0; i < input_length; ++i )
    {
        if ( present_once & char_to_bit[ NORMALIZE_CHAR(input[i]) ] )
        {
            printf("=== FINAL RESULT: %c ===\n", input[i]);
            return (0);
        }
    }
    printf("=== FINAL RESULT: no char appears only once ===\n", input[i]);
    return (0);
}
[/code]

The solution is built around the fact that 2 integers, <code>present_once</code> and <code>present_multiple</code> is used to memorize which letter of the alphabet appears only once, and which one appears more then once.
The result of this analysis occupies <strong>the space of just 2 <code>unsigned int</code></strong>: a second analysis of the string is then done to catch the first letter in it that is already known for being present only once.

<h3>Final observations</h3>
<ul>
<li>Works as long as the set of chars is &lt; number_of_bits(int): that's why I limit it to the english alphabet - generally a <code>u_int</code> is made of <code>32 bits</code> on modern architectures.</li>
<li>In case you didn't get how does it work, the output is reconstructed from an Hexadecimal value where the result is the first bit (from right to left) set to "1"</li>
<li>It avoids to use of strlen to calculates the length of the input. This makes the solution a "2 * O(n) == O(n)" =&gt; <strong>VERY COOL</strong></li>
<li>The space occupied is "O(1)" (constant):; 1 pointer, 2 support u_int, 2 solution-carrying u_int, 1 hashmap of SIZE_OF_ALPHABET integers</li>
</ul>

That's all folks!</stdio>
