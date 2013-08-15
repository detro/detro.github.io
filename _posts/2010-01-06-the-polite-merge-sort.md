---
layout: post
author: detro
published: true
title: "The \"Polite\" Merge Sort"
tags: [sort, personal, english, polite, it, merge, operating-system, curiosity, system-call, cool]
date: "2010-01-06 17:04:10"
updated: "2011-03-21 22:31:56"
permalink: /2010/01/06/the-polite-merge-sort/
---

Another old-classic problem: the <a href="http://en.wikipedia.org/wiki/Merge_sort">Merge Sort</a>.

<div class="img">
<img src="http://www.personal.kent.edu/~rmuhamma/Algorithms/MyAlgorithms/Sorting/Gifs/mergeSort.gif" alt="Merge Sort Algorithm" />
Merge Sort Algorithm
</div>

## The problem of the classical implementation
The whole algorithm is explained in the wikipedia link above, so I'll focus on the problem here.

The Merge Sort is an<strong> in-place-sorting-algorithm</strong> that requires some support memory to do it's calculations. At the <em>"merge step"</em>, an amount of memory as large as the current portion of array being merged is allocated to be used as <strong>priority queue</strong> (again, the why is easy to find on the web).
After this memory is used, normally get's released.

Theoretically speaking, the amount of memory that at every recursive call get's created is always <strong><code><= size-of-input-array</code></strong>. So, no big deal: we knew it.

Unfortunately in practice this is not always a good idea: <code>malloc(...)</code> and <code>free(...)</code> are <a href="http://en.wikipedia.org/wiki/System_call">System Calls</a>, and those are expensive to do. They <em>normally</em> require <a href="http://en.wikipedia.org/wiki/Context_switch">Context Switches</a> and other system operations that I can't advice to do without properly thinking through your code.

## A more <em>"Polite"</em> Merge Sort
So, because we know the amount of memory that is going to be needed by this algorithm, why don't we design one that takes it in the beginning and doesn't bother the <a href="http://en.wikipedia.org/wiki/Operating_system">Operating System</a> anymore? Good idea!

<strong>The thing we need is an array of the same size of the input.</strong> Every recursive call of the algorithm, given that it operates on a fixed portion of the input array, will do great operating in the same way on this "support array".

### Not Polite Enough?
A small tweak: <strong>when the <strong>size</strong> input array of the <em>K<sub>th</sub></em> is <code>2</code>, I avoid to do another recursive call.</strong> Instead, I just swap the 2 values if they are not already sorted.
Very "basical" tweak, but, for the sake of it, have fun to calculate how many recursive call I avoid.
...
Done? Yes, i<strong>f <code>M</code> is the number of recursive calls that this algorithm will normally generate, I avoid <code>M/2</code> calls.</strong> The logical structure of the calls of this problem, as in the example image above, is a <strong>Balanced Binary Tree</strong>. And in such structure the number of Leaf is equal to M/2, if M are the nodes. <strong>Quite a relieve for the call stack, isn't it! ;)</strong>

## The code

```cpp
#include <stdio.h>
#include <stdlib.h>

// === Polite Merge Sort ===
// This implementation of Merge Sort is defined "polite", because it tries
// to bother the Operating Systems as less as possible.
//
// Instead of allocating and freeing memory at every intermediate step
// to implement a the priority queue required to sort do the "MERGE STEP",
// it requires to pass at input an empty support array of the same size
// of the input array.
//
// The support array is going to be the solely memory used as support.

void polite_merge(int* array, const unsigned int l_limit, const unsigned int m_limit, const unsigned int r_limit, int* support_array) {
    // Create 3 Peace Marker
    unsigned int i; // For the 'array'
    unsigned int j; // For the 'left part of the array already ordered'
    unsigned int k; // For the 'right part of the array already ordered'
    
    // Copy the portion of sorted arrays in the support array (like a static priority queue)
    for ( i = l_limit; i <= r_limit; ++i ) {
        support_array[i] = array[i];
    }
    
    // Set the Peace Markers
    i = j = l_limit; // 'i' and 'j' both start from the Left
    k = m_limit + 1; // 'k' starts from the Middle + 1 
    
    // Merge the 2 sorted portions
    while ( j <= m_limit && k <= r_limit ) {
        if ( support_array[j] < support_array[k] )
            array[i++] = support_array[j++];
        else
            array[i++] = support_array[k++];
    }
    // Add the remaining sorted portions (if any)
    while ( j <= m_limit ) array[i++] = support_array[j++];
    while ( k <= r_limit ) array[i++] = support_array[k++];
}

void polite_merge_sort(int* array, const unsigned int l_limit, const unsigned int r_limit, int* support_array) {
    unsigned int middle;
    
    if ( l_limit == r_limit ) {
        // Nothing to do => Only 1 element - already sorted
    } else if ( 1 == r_limit - l_limit ) {
        // Only 2 elements - swap them if not yet sorted
        if ( array[r_limit] < array[l_limit] ) {
            // Swap in place - cool!
            array[r_limit] ^= array[l_limit];
            array[l_limit] ^= array[r_limit];
            array[r_limit] ^= array[l_limit];
        }
    } else {
        middle = (l_limit + r_limit) / 2;
        polite_merge_sort(array, l_limit, middle, support_array);
        polite_merge_sort(array, middle + 1, r_limit, support_array);
        polite_merge(array, l_limit, middle, r_limit, support_array);
    }
}
```


This is designed to handle only Integers' Array, but it can easily adapted to whatever kind of data you mean to sort.
