---
layout: post
author: detro
published: true
title: "Use Backtracking to print all Subsets"
tags: [integers, code, generator, algorithm, personal, it, set, english, print, subsets, backtracking]
date: "2010-01-22 00:47:31"
updated: "2011-03-21 22:04:51"
permalink: /2010/01/22/use-backtracking-to-print-all-subsets/
---

I'm "studying" this algorithmic technique: <a href="http://en.wikipedia.org/wiki/Backtracking">Backtracking</a>. This is an algorithmic approach to problem solution that I trust every good Computer Scientist already uses; but taking a <a href="http://www.algorist.com/">good theo-practical look</a> at it is something better.

<div class="img">
<img src="http://upload.wikimedia.org/wikipedia/commons/2/2c/Depthfirst.png" alt="A Backtracking Tree" width="200"/>
A Backtracking Tree
</div>

I believe you can find enough informations about it online (the 2 links I provided are more than enough), so I'll go straight to the problem.

## Problem definition
Given an integer <code>n</code>, and the set <code>S = { 1 ... n }</code>, calculate (print) all the possible subsets of <code>S</code>. For example, for <code>n = 1</code>, all the possible subsets are <code>{ 1 }</code> and <code>{ }</code> (empty set). For <code>n = 2</code>, all the possible subsets are: <code>{ 1 2 } { 1 } { 2 } { }</code>. In general, for the set made of the first <code>n Integers</code>, the number of possible subsets is <code>2<sup>n</sup></code>.

## Approaching the problem
A way to describe a possible subset is an <strong>array of <code>n</code> elements, one for every integers; every element in the array will have value <code>TRUE</code> if the correspondent integers is part of the subset, <code>FALSE</code> otherwise</strong>.

Why the Backtracking then? Because the backtracking technique is designed to generate every possible "candidate solution" once. If we design the algorithm smartly, we can get the backtracking logic to work for us and generate all the possible subsets.

Are you are asking yourself: <em>"isn't this a bit of a stretching of the backtracking approach?"</em>. I believe it is: the code could be made way smaller, even though it would have the same complexity. We are going to execute the backtracking, designing the algorithm so it will never stop until it tried every possible solution. No "intermediate stopping condition" then.

## Solution
Give a good look at the <strong><code>void backtrack(int *curr_sol, int curr_sol_size, int input)</code></strong>: it works as a <strong><em>"skeleton"</em></strong> for <em>generic backtracking</em> algorithms. I'm going to use it in the future as well: I'm going to have fun to implement a <a href="http://en.wikipedia.org/wiki/Sudoku">Sudoku</a> solver ASAP (probably this weekend). Why? Because I suck at Sudoku: never got into it very much to learn how to play :-P.

Anyway, here is the code

```c
#include <stdio.h>
#include <stdlib.h>

// Fake boolean values
#define TRUE    (1)
#define FALSE   (0)

// Candidates used at every recursive call
#define MAX_CANDIDATES 2

// Define the "bool" type using "short int"
typedef short int bool;
static bool finished = FALSE;

bool reject(int* curr_sol, int curr_sol_size, int input) {
    return FALSE; // EMPTY for now
}

bool accept(int* curr_sol, int curr_sol_size, int input) {
    return (curr_sol_size == input);
}

void output(int* curr_sol, int curr_sol_size, int input) {
    static int i;
    printf("[ ");
    for ( i = 1; i <= curr_sol_size; ++i ) {
        if ( curr_sol[i] == TRUE ) printf("%d ", i);
    }
    printf("]\n");
}

void extend_solution(int* curr_sol, int curr_sol_size, int input, int* candidates, int* num_candidates) {
    // Only 2 possibilities: the element is take or not taken
    candidates[0] = TRUE;
    candidates[1] = FALSE;
    *num_candidates = 2;
}

void try(int *curr_sol, int curr_sol_size, int input) {
    // EMPTY for now
}

void revert(int *curr_sol, int curr_sol_size, int input) {
    // EMPTY for now
}

void backtrack(int *curr_sol, int curr_sol_size, int input) {
    int candidates[MAX_CANDIDATES];
    int num_candidates;
    int i;

    if ( reject(curr_sol, curr_sol_size, input) ) {
        return; // Not worth completing
    }
    
    if ( accept(curr_sol, curr_sol_size, input) ) {
        output(curr_sol, curr_sol_size, input); // Found! Print it
    } else {
        ++curr_sol_size; // Increase solution size
        
        // Generate solution extension
        extend_solution(curr_sol, curr_sol_size, input, candidates, &num_candidates);
        // Try every candidates just generated
        for ( i = 0; i < num_candidates; ++i ) {
            curr_sol[curr_sol_size] = candidates[i];
            
            try(curr_sol, curr_sol_size, input);
            
            backtrack(curr_sol, curr_sol_size, input);
            
            revert(curr_sol, curr_sol_size, input);
            
            if ( finished ) return; // Early termination
        }
    }
}

void print_all_subset_from_1_to(int n) {
    int *sol;
    sol = malloc(n * sizeof(int));
    backtrack(sol, 0, n);
    free (sol);
}

int main(int argc, char** argv) {
    int input;
    if ( argc == 2 ) input = atoi(argv[1]); else return (EXIT_FAILURE);
    
    print_all_subset_from_1_to(input);
}
```


## Complexity
Time Complexity? Actually, I believe we are talking about a very complex algorithm here: there are <strong>2<sup>n</sup></strong> different subsets here, but to generate everyone of them, the algorithm has to go deep down in every branch of the Backtracking tree. And, given that the depth of a branch is exactly <strong>n</strong> (because is when the printing actually happens), I believe here we have a <strong>O(n * 2^n)</strong> complexity; pretty big. But I could be wrong, so if any <a href="http://en.wikipedia.org/wiki/Big_O_notation">Big-O notation</a> expert is out there, please advice.
