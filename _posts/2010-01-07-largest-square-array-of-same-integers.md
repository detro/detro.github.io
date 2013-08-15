---
layout: post
author: detro
published: true
title: "Largest square array of same integers"
tags: [code, matrix, personal, english, it, calculation, complexity, square, largest, integer, array]
date: "2010-01-07 01:26:12"
updated: "2011-03-21 22:29:31"
permalink: /2010/01/07/largest-square-array-of-same-integers/
---

Tonight it's a challenging one. Or, better, a problem of which is really difficult to find a good solution in <strong>&lt; O(n<sup>3</sup>)</strong>. Indeed, it's a question that an ex-colleague was asked during an interview with <a href="http://www.google.com">Big-G</a>.

<em>The guy, a part from being a REALLY smart guy, is also very humble, and he doesn't want to be mentioned by name. So, sorry for girls looking for a young, smart, promising young man: you need to find who he is yourself. ;)</em>

## Problem Definition
<blockquote>
Given a 2D array (not necessarily square) of integers 1-9 :

```c
{
 { 8 8 8 8 8 },
 { 8 8 8 8 8 },
 { 8 8 3 8 8 },
 { 8 8 8 5 5 },
 { 8 8 8 5 5 }
}
```


Return:
<ol>
<li>The dimension of the largest square consisting of the same integer (in this case 2 because the largest is 2x2 square of 8s).</li>
<li>The integer which appears in that square (in this case 8)</li>
<li>The indices of the top left corner of the square (this this case (0,0) )</li>
<li>If there are multiple squares of the same dimension, you have to return the first one (i.e. the 8 one, not 5).</li>
</ol>
</blockquote>

## My solution
I designed this algorithm on my way back from my previous trip to Paris. Was at least 2 months I had it in my head, but there was the only empty slot of time where I could sit, think and code... on a spare piece of paper. And, still, it performs a disappointing Time Complexity of <strong>O(n<sup>3</sup>)</strong>.

It works like this:

```c
init "largest matrix" to NULL/NONE/-1

for i = 0 to num_of_rows:
   for j = 0 to num_of_cols:
      calculates "how big is the matrix that has TOP-LEFT corner in array[i][j]"
      if "what found is bigger then what found so far":
         save what found as "the new largest matrix"
```


### Calculate how big is the matrix that has TOP-LEFT corner in array[i][j]
It's a scanning that goes "around" the currently calculated matrix from TOP-RIGHT to BOTTOM-LEFT, moving CLOCKWISE. It starts from a base matrix, the single element in TOP-LEFT position, and grows until finds a different value. Sorry, no rocket science here. Probably only the way I manipulate the indexes could be seen as smart.

In the case of the input given above, the steps that it will do for cell <code>[0, 0]</code> will be like:

<strong>STEP 1</strong>

```c
{
 { 8 - - - - },
 { - - - - - },
 { - - - - - },
 { - - - - - },
 { - - - - - },
}
```


<strong>STEP 2</strong>

```c
{
 { 8 8 - - - },
 { 8 8 - - - },
 { - - - - - },
 { - - - - - },
 { - - - - - },
}
```


<strong>STEP 3</strong>

```c
{
 { 8 8 8 - - },
 { 8 8 8 - - },
 { - - 3 - - },
 { - - - - - },
 { - - - - - },
}
```

<strong>Once the <code>'3'</code> is found, the search will stop, returning a <code>result = 2</code> (the measure of the diagonal of the found matrix).</strong>

## A little trick to save us some time
One thing I added to make things slightly better, is to check if <em>"it's worth the effort"</em>!
Given the current location in the matrix <code>[x, y]</code>, if the maximum diagonal that we COULD calculate if the rest of the elements were equal to what's in <code>[x, y]</code> is:
<ul>
<li>either smaller than the current maximum</li>
<li>or just equal to <code>'1'</code></li>
</ul>
then we jump any calculation and move to the next element in the matrix.

## The code

```c
#include <stdlib.h>
#include <stdio.h>

unsigned int measure_diagonal(
        // Need to treet the matrix as an mono-dimensinal array
        const unsigned int* matrix,
        const unsigned int rows,
        const unsigned int cols,
        const unsigned int x,
        const unsigned int y) {
    static unsigned int diagonal;
    static int curr_x; // I can't use unsigned because I need to detect "out of bound"
    static int curr_y;
            
    #ifdef DEBUG
        printf("Measure the Diagonal from cell: (%d, %d)\n", x, y);
        printf("Matrix size: (%d, %d)\n", cols, rows);
    #endif
    
    // Base value: diagonal = 1 - matrix of 1 element
    diagonal = 1;
    
    // Now we are going to scan "around" the right and bottom borders
    //  of the inner matrix ALREADY discovered.
    //  The starting point is the element in position [x,y]
    while ( 1 ) {
        #ifdef DEBUG
            printf("Current Diagonal for (%d,%d): %d\n", x, y, diagonal);
        #endif
        // If the area we are going to scan is outside the main matrix boundaries...
        if ( (x + diagonal) >= cols || (y + diagonal) >= rows ) {
            //... return the current diagonal as it is
            return diagonal;
        }
        
        curr_x = x + diagonal;
        curr_y = y;
        #ifdef DEBUG
            printf("curr_x(%d), curr_y(%d)\n", curr_x, curr_y);
        #endif
        
        do {
            #ifdef DEBUG
                printf("Comparing (%d, %d) with curr(%d, %d)\n", x,y, curr_x, curr_y);
            #endif
            // Check current element is equal to the Top-Left corner one
            if ( matrix[y * cols + x] != matrix[curr_y * cols + curr_x] ) {
                #ifdef DEBUG
                    printf("Diagonal for cell(%d, %d) is: %d\n", x, y, diagonal);
                #endif
                // If not, the diagonal calculated so far is the diagonal
                return diagonal;
            }
            
            // Determine what's next
            if ( curr_y < (y + diagonal) ) {
                // Move one row down in the matrix
                ++curr_y;
            } else {
                // Move one column left in the matrix
                --curr_x;
            }
        } while( (int)x <= curr_x ); // Until within the boundaries
        
        // Good! We discovered an even larger matrix
        ++diagonal;
    }
}

void calculate(const unsigned int* altitude_map,
        const unsigned int rows,
        const unsigned int cols) {

    int best_number = -1;
    int best_dimension = -1;
    int best_row = -1;
    int best_col = -1;
    int r, c;
    int temp_dimension = -1;
    
    for (r = 0; r < rows-1; r++) { // Avoid last row: would be 1 anyway
        for (c = 0; c < cols-1; c++) { // Avoid last column: would be 1 anyway
            if ( temp_dimension <= (int)(cols-c) && temp_dimension <= (int)(rows-r) ) {
                // Measure the diagonal of the matrix starting at position [r, c]
                temp_dimension = measure_diagonal(altitude_map, rows, cols, c, r);
    
                // Is it better then what we found so far?
                if (temp_dimension > best_dimension) {
                    best_dimension = temp_dimension;
                    best_col = c;
                    best_row = r;
                    best_number = altitude_map[r * cols + c];
                }
            }
            #ifdef DEBUG
                else {
                    printf("Skipped useless calculation at (%d, %d)\n", c, r);
                }
            #endif
        }
    }

    printf("ACTUAL   : contains a %dx%d grid of %ds at (%d , %d)\n",
        best_dimension, best_dimension, best_number, best_row, best_col);
}
```


## Conclusions
I'm 100% sure that there are better solution, and indeed the guy above just sent me an alternative that <strong>he claims ( :-P ) has quadratic time complexity</strong>. I didn't check it out yet, but I'll post again if it's true (and, knowing the guy, it's highly probable).

In the meantime, if you have any comment or improvement, please speak up!
