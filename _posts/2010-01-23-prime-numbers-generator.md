---
layout: post
author: detro
published: true
title: "Prime Numbers Generator"
tags: [code, generator, personal, tricks, it, fast, number, implementation, optimizations, curiosity, primes, cool]
date: "2010-01-23 13:34:33"
updated: "2011-03-21 22:06:50"
permalink: /2010/01/23/prime-numbers-generator/
---

I believe I don't have to describe what <a href="http://en.wikipedia.org/wiki/Prime_number">primes</a> are, what are their properties and what not. This post is more a tribute to geek-ness of 2 friends-and-colleagues (<a href="http://twitter.com/lucabox">@lucabox</a>) that have fun thinking of algorithms to solve stupid (or less stupid), and always useless problems ;-) .

<div class="img">
<img src="http://scottthong.files.wordpress.com/2006/08/optimus_prime.jpg" alt="Optimus Prime" width="250" />
Optimus Prime :-P - yeah yeah, a stupid joke
</div>

## Briefing
This code is based on the assumption that we want to generate very very large primes, so it uses <code>unsigned long long</code> to store the values, instead of classical <code>unsigned int</code>. Live with that.

Also, give that there is nothing much better then a <em>"try-dividing-by-every-previous-prime"</em> out there (there are alternatives, but I'm not aware of more complex ones), I took a look to some properties of Primes, and putted into the algorithm those properties as <strong>conditions for early stop</strong>:
<ol>
<li>Say <code>P[i]</code> are the previously calculated Primes; If trying dividing value <code>V</code> by every <code>P[i]</code> we find that <code>P[i] &gt; sqrt(V)</code>, stop dividing and classify <code>V</code> as a newly found prime</li>
<li><strong>No need to check any even number</strong>: they are divisible by 2, so no primes by definition</li>
<li><strong>No need to allocate more space then an array of the size of the requested prime <em>ordinality</em></strong>: everything can be done in place</li>
</ol>

## Code

```c
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef unsigned long long ull;
typedef unsigned short int bool;

#define TRUE    1
#define FALSE   0

// Check if a number is a Prime, dividing it by all the other 
//  verified primes < of it's Square value.
bool is_prime(ull *primes, ull primes_found, ull value) {
    ull i;
    // Limit - Never check for primes larger then the sqrt(value)
    ull limit = (ull)sqrt(value);
    
    #ifdef DEBUG
        printf("Value: %llu - Primes found so far: %llu\n", value, primes_found);
    #endif
    
    for ( i = 0; i < primes_found; ++i ) {
        // Check if the value is divisible by this prime
        if ( value % primes[i] == 0 ) return FALSE;
        // Check if it's enough. Limit sqrt(value) exceded
        if ( primes[i] > limit ) break;
    }
    return TRUE;
}

ull* prime_numbers_generator(ull input) {
    ull* primes = NULL;
    ull primes_found = 1;
    ull i, j;
    
    // Allocating memory to store the Primes
    primes = (ull*)malloc(input * sizeof(ull));
    if ( NULL == primes ) return NULL;    
    
    // '2' is the first prime 
    primes[0] = 2;

    primes[1] = 3; // Let's start testing '3' for primality ;)
    for ( i = 1; i < input; ) {
        #ifdef DEBUG
            printf("i: %llu - Potential Prime: %llu\n", i, primes[i]);
        #endif
        // Check if 'primes[i]' is a prime
        if ( is_prime(primes, primes_found, primes[i]) ) {
            #ifdef DEBUG
                printf("Found a new Prime: %llu\n", primes[i]);
            #endif
            // Increment num of primes found so far
            ++primes_found;
            // Move to the next odd number
            primes[++i] = primes[i-1] + 2;
        } else {
            // Move to the next odd number, overriding the current one
            primes[i] += 2;
        }
    }
    
    return primes;
}

int main(int argc, char** argv) {
    ull input, i, *primes = NULL;
    if ( argc == 2 ) input = atoi(argv[1]); else return EXIT_FAILURE;
    
    // Calculate the required primes
    primes = prime_numbers_generator(input);
    if ( NULL == primes ) return EXIT_FAILURE;
    
    #ifndef FAST
    printf("All the first %llu Primes are:\n", input);
    for ( i = 0; i < input; ++i ) {
        printf("%llu ", primes[i]);
    }
    printf("\n\n");
    #endif
    
    printf("The Prime #%llu is %llu\n\n", input, primes[input-1]);
    
    return EXIT_SUCCESS;
}
```


Time Complexity of this algorithm is quite complex to calculate. Without <strong>condition 1.</strong> described above, we could quickly say that the complexity is an <strong>O(n<sup>2</sup>)</strong>.

But I believe is more complex then that. Overall speaking, the complexity above is indeed correct, but it does vary a lot, because of the <strong>condition 1.</strong>: the number of times in which <code>P[i] will be &gt; sqrt(V)</code> grows with the square value of P[i]. Means that the bigger the prime, the easier is to find the upper-bound of the modulo operations that will be actually executed. This <em>could</em> make the complexity also something like an <strong>&Omega;(n * log(n))</strong>. But this assertion is far from tested/demonstrated/verified, so I could be boldly wrong.
