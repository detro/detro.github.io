---
layout: post
author: detro
published: true
title: "String search in O(n + m)"
tags: [search, code, string, personal, it, fast, substring, complexity, english, cool, matching, hashing]
date: "2010-01-08 16:39:21"
updated: "2011-03-27 16:07:38"
permalink: /2010/01/08/string-search-in-on-m/
---

Searching a string inside another string is a very easy task. Given a string <code>A</code> and a string <code>B</code>, start a loop over <code>A</code> from left to right and, for every letter, start an internal loop to see if there is a match with the letters of <code>B</code>.

<div class="img">
<img src="http://dm.ncl.ac.uk/peterevans/blog/wp-content/uploads/2009/04/string.jpg" alt="String" width="300"/>
A ball of string
</div>

Pseudo code would look something like this:

```c
function NaiveSearch(string s[1..n], string sub[1..m])
   for i from 1 to n-m+1
      for j from 1 to m
         if s[i+j-1] ≠ sub[j]
            jump to next iteration of outer loop
      return i
   return not found
```


Time Complexity? <strong>O(n * m), where <code>n</code> is the size of <code>A</code> and <code>m</code> is the size of <code>B</code></strong>.

Wonna do better? Follow me.

## Hashing is the key
Let's build an <a href="http://en.wikipedia.org/wiki/Hash_function">hashing function</a> that generates a quite big number for every string. It has to depend on multiple factors:
<ul>
<li>Size of the Alphabet</li>
<li>Position of every char within the string</li>
<li>A function that for a Chars of the Alphabet gives Numbers</li>
</ul>

Think of Binary Numbers as strings made of 0 and 1, with an alphabet of only 2 characters: <code>0,1</code>. How do we convert a Binary Number in a Decimal?

```c
[ 1 0 1 1] = 2^3*1 + 2^2*0 + 2^1*1 + 2^0*1 = 8 + 0 + 2 + 1 => 11
```


Isn't that the kind of hashing we need?
<ul>
<li>Size of the Alphabet <strong>=> 2, made of the Characters {0,1}</strong></li>
<li>Position of every char within the string <strong>=> The power applied to the 2 depends on the position of that char</strong></li>
<li>A function that for a Chars of the Alphabet gives Numbers <strong>=> In this case, 0 and 1 have already a value ;)</strong></li>
</ul>

Why all this stuff about Hashing? Bear with me and I'll explain.

## Our hashing function
We want to search B in A, so let's take:
<ul>
<li><code>'S'</code> is the String in which we are searching (i.e. 'A')</li>
<li><code>'j'</code> is position of the <del>last</del> <ins>first</ins> (thanks [John](http://www.whatsthebeef.org/)) char in <code>'S'</code> included in the Hashing</li>
<li><code>'alpha'</code> is the size of the Alphabet</li>
<li><code>'m'</code> is the size of the string being searched (i.e. the size of 'B')</li>
</ul>

The hashing function will be something like:

```c
Hashing(S, j) = SUMMATION [i=0 -> m-1] { alpha^(m -(i+1)) * char(S[i+j]) }
```


## What's great about this hashing?
Now comes the great part. Once we calculate the hashing of a string K, and then we REMOVE the first character, APPEND a new one, how do we calculate the hashing of this new L string? Like this:

```c
H(S, j+1) = alpha * ( H(S, j) - alpha^(m-1) * char(S[j]) ) + char(S[j+m])
```

<strong>2 MULTIPLICATIONS, 1 SUBTRACTION and 1 ADDITION</strong>. That takes <strong>O(1)</strong>. See where am I heading?

## Searching by Hashing
Given the <code>B_size</code> size of <code>B</code>, we calculate the hashing of the first <code>B_size</code> characters of <code>A</code>: an <em>"hashing window"</em> over A. If B is not found, we proceed on moving this window, 1 character to the right, 1 at a time; until either we find (the hashing of) B, or the string finishes.

Here is the code:

```c
#include <stdio.h>
#include <string.h>
#include <math.h>

#define NORM_CHAR(A)    (A - ' ')
#define ALPHABET_SIZE   (NORM_CHAR(255)+1)
#define LLU_POW(x, y)   (unsigned long long)pow(x, y)

unsigned long long hash_char(const char* string, unsigned int pos, unsigned int size) {
    #ifdef DEBUG
    printf("HASHING of char '%c' (of value %d) in position #%d of a string of size %d is: %llu\n",
        string[pos],
        NORM_CHAR(string[pos]),
        pos,
        size,
        LLU_POW(ALPHABET_SIZE, size - (pos + 1)) * NORM_CHAR(string[pos])
        );
    #endif
        
    return LLU_POW(ALPHABET_SIZE, size - (pos + 1)) * NORM_CHAR(string[pos]);
}

/**
Given that:
- 'S' is the String in which we are searching (i.e. 'A')
- 'j' is position of the last char in 'S' included in the Hashing
- 'alpha' is the size of the Alphabet
- 'm' is the size of the string being searched (i.e. 'B_size')

=> Hashing(S, j) = SUMMATION [i=0 -> m-1] { alpha^(m -(i+1)) * char(S[i+j]) }
*/
unsigned long long hash_string(const char* string, unsigned int size) {
    static unsigned int i;
    static unsigned long long hash;

    hash = 0;
    for ( i = 0; i < size; ++i ) {
        hash += hash_char(string, i, size);
    }
    
    return hash;
}

int main(int argc, char** argv)
{
    char* A;
    char* B;
    unsigned long long A_hash;
    unsigned long long B_hash;
    unsigned int B_size;
    unsigned int i;
    
    // Check the Input
	if ( argc == 3 ) {
	   A = argv[1];
	   B = argv[2];
	}
	else
	   return (1);

    // Calculate initial Hashings
    B_size = strlen(B);
    A_hash = hash_string(A, B_size);
    B_hash = hash_string(B, B_size);
    printf("HASHING of B('%s') is: %llu\n", B, B_hash);
    #ifdef DEBUG
    printf("Starting from char in position %d, the HASHING of A for length %d is: %llu\n",
        0, B_size, A_hash);
    #endif

    i = B_size;
    while ( A[i-1] != '\0' ) {
        if ( A_hash == B_hash ) {
            printf("YES! B is a Substring of A, in the range { %d, %d}\n\n",
                i-B_size, i-1);
            return(0);
        } else {
            // 'S' is the String in which we are searching (i.e. 'A')
            // 'j' is position of the last char in 'S' included in the Hashing
            // 'alpha' is the size of the Alphabet
            // 'm' is the size of the string being searched (i.e. 'B_size')
            //
            // H(S, j+1) = alpha * ( H(S, j) - alpha^(m-1) * char(S[j]) ) + char(S[j+m])
            A_hash = ALPHABET_SIZE
                * (
                    A_hash
                    - LLU_POW(ALPHABET_SIZE, (B_size-1))
                    * NORM_CHAR( A[i-B_size] )
                )
                + NORM_CHAR( A[i++] );
            #ifdef DEBUG
            printf("Starting from char in position %d, the HASHING of A for length %d is: %llu\n",
                i-B_size, B_size, A_hash);
            #endif
        }
    }
    printf("NO. B is not a Substring of A\n\n", B_hash, A_hash);
}
```


I used <code>unsigned long long</code> so that I could handle the largest numbers possible. Check out large strings to see how easily you can reach enormous values.

## Complexity
<strong>O( 2 * hashing(B) + (size_of_A - size_of_B) * hashing_window_moves  ) =</strong>
<strong>O( 2m + (n-m) * O(1) ) =</strong>
<strong>O( 2m + n -m ) =</strong>
<strong>O( n + m )</strong>

Pretty neat, eh?.

## Where does it come from?
I didn't create the algorithm myself: I "only" coded it in C. Officially this algorithm is called <a href="http://en.wikipedia.org/wiki/Rabin–Karp_string_search_algorithm">Rabin–Karp string search algorithm</a>. But, as for every other things I code, it's great when you actually spend time coding it: you get a great understanding of the problem and the proposed algorithm.
