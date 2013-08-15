---
layout: post
author: detro
published: true
title: "Find the non repeating char in O(n) time and O(1) space - v2"
tags: [better, c, code, asymptotic, algorithm, space, personal, english, char, optimization, time, first, string]
date: "2009-12-18 23:22:34"
updated: "2011-03-21 22:41:17"
permalink: /2009/12/18/find-the-non-repeating-char-in-on-time-and-o1-space-v2/
---

My colleague and friend Luca (<a href="http://twitter.com/lucabox">@lucabox</a>) described a better solution to the problem of <em>"<a href="http://www.detronizator.org/2009/12/13/find-the-non-repeating-char-in-on-time-and-o1-space/">Finding the first non repearing char in a string in O(n) time and O(1) space</a>"</em>. It uses smartly the space, making the solution nicer and slicker.
Or we are just 2 geeks that need to give more attention to their girlfriends :P

## Luca's solution description
The logic of this solution is based on the usage of an array of unsigned chars.
Every char (assumed to be lowecase) has an associated small byte (1 char = 8 bits), where the bits 0x1 and 0x2 (the 2 least significant) represents, respectively, "<em>present once in the input string</em>" and "<em>present multiple times in the input string</em>". After the input is "scanned" once, and every letter is marked with the correspondent "<em>presence bit</em>" (once, multiple or none), it get's scanned a second time to find the first char of the input which has the bit "present once" set to "1".

## Before I show you the code
Again, this comes from Luca Colantonio (<a href="http://uk.linkedin.com/in/lucacolantonio">http://uk.linkedin.com/in/lucacolantonio</a>), smart ass that is too lazy to maintain a blog and post it himself (or even implementing himself - he just explained to me at work and I had to code it). Thanks Luca ;)

Now, the code.

```c
#include <stdio.h>
#include <string.h>

#define PRESENCE_ONCE_BIT       0x1
#define PRESENCE_MULTIPLE_BIT   0x2
#define NORMALIZE_CHAR(C)       (C-'a')

int main(int argc, char** argv)
{
	char* input;
	unsigned int input_length;
	unsigned int i;

	unsigned char char_presence_bitmask[26];
	memset(char_presence_bitmask, 0x0, 26);

	// Check the Input
	if ( argc == 2 ) input = argv[1];
	else return (1);

    // Search for every character "present only once"
    for ( i = 0;; ++i )
    {
        // Avoid use of "strlen", just to look cooler
        if ( input[i] != '\0' )
        {
            // If the current char is not already marked as "present multiple times"
            if ( !( char_presence_bitmask[NORMALIZE_CHAR(input[i])] & PRESENCE_MULTIPLE_BIT) )
            {
                // It it is already marked as "present once"
                if ( char_presence_bitmask[NORMALIZE_CHAR(input[i])] & PRESENCE_ONCE_BIT )
                {
                    // Then mark it as "present multiple times" and unmark it's "present once" bits
                    char_presence_bitmask[NORMALIZE_CHAR(input[i])] |= PRESENCE_MULTIPLE_BIT;
                    char_presence_bitmask[NORMALIZE_CHAR(input[i])] &= ~PRESENCE_ONCE_BIT;
                }
                else
                {
                    // Otherwise, mark it as "present once"
                    char_presence_bitmask[NORMALIZE_CHAR(input[i])] |= PRESENCE_ONCE_BIT;
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
        if ( char_presence_bitmask[NORMALIZE_CHAR(input[i])] & PRESENCE_ONCE_BIT )
        {
            printf("=== FINAL RESULT: %c ===\n", input[i]);
            return (0);
        }
    }
    printf("=== FINAL RESULT: no char appears only once ===\n");
    return (0);
}
```

