---
layout: post
author: detro
published: true
title: "\"Bidirectionally multiplied\" array"
tags: [code, personal, it, solution, bidirectional, english, multiplication, array, problem, simple]
date: "2010-01-22 01:26:28"
updated: "2011-03-21 22:43:41"
permalink: /2010/01/22/bidirectionally-multiplied-array/
---

Another small problem before I go to sleep tonight:
<blockquote>
There is an array A[N] of N numbers.
You have to compose an array Output[N] such that Output[i] will be equal
to multiplication of all the elements of A[N] except A[i].

For example Output[0] will be multiplication of A[1] to A[N-1] and Output[1]
will be multiplication of A[0] and from A[2] to A[N-1].

<strong>Solve it without division operator and in O(n).</strong>
</blockquote>

What is funny of the problem, is the fact that the <strong>O(n)</strong> constraint, makes it sound like is going to be hard to solve. Doesn't it? Well, it's not.

The solution is quite simple, so I suggest you take your 10 minutes to think about it, then continue to see the code.


```c
int *bidirectionally_multiplied_array(const int *A, int size_A) {
    int *multi_left_to_right, *multi_right_to_left, *output;
    int i;
    
    // Make some space for calculation...
    multi_left_to_right = malloc(size_A * sizeof(int));
    multi_right_to_left = malloc(size_A * sizeof(int));
    output = malloc(size_A * sizeof(int));
    
    // Multiply the elements "from left to right"...
    multi_left_to_right[0] = A[0];
    for ( i = 1; i < size_A; ++i ) {
        multi_left_to_right[i] = multi_left_to_right[i-1] * A[i];
    }
    
    // Multiply the elements "from right to left"...
    multi_right_to_left[size_A-1] = A[size_A-1];
    for ( i = size_A-2; i >= 0; --i ) {
        multi_right_to_left[i] = multi_right_to_left[i+1] * A[i];
    }
    
    // First and Last element are "special case"
    output[0] = multi_right_to_left[1];
    output[size_A-1] = multi_left_to_right[size_A-2];
    for ( i = 1; i < size_A-1; ++i ) {
        output[i] = multi_left_to_right[i-1] * multi_right_to_left[i+1];
    }
    
    free(multi_left_to_right);
    free(multi_right_to_left);
    
    return output;
}
```


