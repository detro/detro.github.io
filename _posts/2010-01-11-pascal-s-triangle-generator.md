---
layout: post
author: detro
published: true
title: "Pascal's Triangle generator"
tags: [code, triangle, generator, personal, english, it, pascal, optimization, memory, cool]
date: "2010-01-11 01:31:09"
updated: "2011-03-21 22:12:27"
permalink: /2010/01/11/pascals-triangle-generator/
---

What's <a href="http://en.wikipedia.org/wiki/Pascal's_triangle">Pascal's Triangle</a>? That's what it is (<a href="http://en.wikipedia.org/wiki/Pascal's_triangle">Wikipedia</a> has all the theory, if you need).

<div class="img">
<img src="http://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Pascal%27s_triangle_5.svg/250px-Pascal%27s_triangle_5.svg.png" alt="Pascal's Triangle first 6 rows" />
Pascal's Triangle first 6 rows
</div>

The thing I wrote here is a generator of the <em>n-th row</em> of the triangle, that doesn't use more then the memory needed to store the solution. Instead of allocating a <em>Triangular Matrix</em>, and building every row based on the one above, solution is <em>built in place</em>.

## How does it work
The result is generated <em>"filling the row from right to left"</em>. I start initiating the element on the right hand side to <code>'1'</code>. Then, I run something like:

```c
init result[0.. requested_row]

result[requested_row-1] = 1

for i = 2 -> requested_row do:
   for j = requested_row-i -> requested_row-1 do:
      result[j] = result[j] + result[j+1]
   endfor
endfor
```


Clearly this is nothing special. Just a little trick to avoid to use a triangular matrix. <a href="http://www.google.co.uk/products?hl=en&safe=off&q=memory%20prices&lr=&um=1&ie=UTF-8&sa=N&tab=wf">Memory is not cheap</a>, you know! ;-)


```c
#include <stdio.h>
#include <stdlib.h>

void print_row(unsigned long long* row, unsigned int size) {
    static unsigned int j;
    for ( j = 0; j < size; ++j ) { printf("%llu ", row[j]); }
    printf("\n");
}

unsigned long long* pascal_triangle_line(unsigned int pascal_row){
    static unsigned int i, j;
    unsigned long long* result = NULL;
    result = (unsigned long long*)calloc(pascal_row, sizeof(unsigned long long));
    
    if ( NULL != result ) {    
        result[pascal_row-1] = 1; // First element on the right is always '1'
        for ( i = 2; i <= pascal_row; ++i ) {
            
            #ifdef DEBUG
            print_row(result, pascal_row);
            #endif
            
            for ( j = pascal_row-i; j < pascal_row-1; ++j ) {
                result[j] += result[j+1]; // Calculate the 'j'-th element
                
                #ifdef VERBOSE
                printf("(row: %d, element: %d) => %llu\n", i, j, result[j]);
                #endif
            }
        }
    }
        
    return (result);
}

int main(int argc, char** argv)
{
    unsigned int input;
    unsigned long long* result = NULL;
       
    // Check the Input
	if ( argc == 2 ) input = atoi(argv[1]); else return (EXIT_FAILURE);
    
    // Calculate the required line
    result = pascal_triangle_line(input);
    
    // Print result
    if ( NULL != result ) { 
        printf("RESULT ROW:\n");
        print_row(result, input);
        return (EXIT_SUCCESS);
    }
    return (EXIT_FAILURE);
}
```


Complexity in time: O(n<sup>2</sup>/2). After all, the complexity is a constant operation O(1), multiplied by the number of elements in the Triangular Matrix: n<sup>2</sup> elements divided by 2. BUT bear in mind that O(n<sup>2</sup>/2) = O(n<sup>2</sup>). So, <strong>it's more correct to say that the complexity is quadratic</strong>.

Of course, if instead you need the whole triangle (not just an arbitrary row) you will have to store it somewhere, so this solution wouldn't work for you as it is.
