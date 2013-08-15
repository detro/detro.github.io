---
layout: post
author: detro
published: true
title: "Fibonacci's numbers calculator"
tags: [exponential, personal, it, solution, dynamic-programming, complexity, optimization, fibonacci, curiosity, english, cool]
date: "2010-01-05 00:39:40"
updated: "2011-09-26 13:25:42"
permalink: /2010/01/05/fibonacci-numbers-calculator/
---

Another simple-but-yet-interesting problem that I found challenging solving is the to <em>Write a Fibonacci's numbers calculator</em>. It's a REALLY SIMPLE problem, but still can demonstrate how superficial thinking in programming can lead to dramatically bad solutions.

## What's a Fibonacci's number
A <a href="http://en.wikipedia.org/wiki/Fibonacci_number">Fibonacci's number</a> is an integer number generated using the following function:
<blockquote>
Assumed that:
<code>f(0) = 0</code>
<code>f(1) = 1</code>

for a generic "n" Integer:
<code>f(n) = f(n-1) + f(n-2)</code>
</blockquote>

For example, the first 20 Fibonacci's number are:
<code>0 1 1 2 3 5 8 13 21 34 55 89 144 233 377 610 987 1597 2584 4181 6765</code>

## The young-and-entusiast approach
Recursion! We all love the elegance of it. When we manage to write something that uses Recursions, everything seems easier and simpler to our eyes for a while. BUT, in this particular case, using recursion for implementing such simple task is really bad.

Why? <strong>Because at every call to this function, it will generate <code>2<sup>n</sup></code> recursive function calls.</strong> A bit of a nightmare for the <strong>process call stack</strong> if the whole purpose of this thing is calculating a "stupid" integer number.

<div class="img">
<img src="http://mitpress.mit.edu/sicp/full-text/sicp/book/chapter-1/figs/fib-tree.gif" alt="" title="Fibonacci using a recursive algorithm" />
Functions call tree using a recursive algorithm
</div>

Plus, given the nature of the function itself, <strong>it will recalculate the same <code>f(x)</code> over and over again, because <code>f(x)</code> is going to be a subproblem shared between a certain <code>y</code> and <code>z</code>, where both <code>y > x</code> and <code>z > x</code></strong>.

Result? An awful implementation. With a quick Big-Oh analysis I would say that the Time Complexity of this "monster" will be <strong>O(2<sup>n</sup>)</strong>.
Don't believe it? Check out the implementation here:

```c
#include <stdio .h>

unsigned long fibonacci_slow(unsigned short i)
{
    if ( i == 0 )
        return (0);
    
    if ( i == 1 )
        return (1);
    
    return ( fibonacci_slow(i-1) + fibonacci_slow(i-2) );
}

int main(int argc, char** argv)
{
    unsigned short i, input;
    unsigned long curr = 0, prevprev = 0, prev = 1;
    
    // Check the Input
	if ( argc == 2 ) input = atoi(argv[1]); else return (1);
	
	printf("RESULT: fibonacci(%d) = %lu\n\n", input, fibonacci_slow(input));
	return (0);
}

```


<strong>Running it on my Code 2 Duo laptop with <code>n &gt; 40</code> takes around 10 seconds. For <code>n = 50</code> I got bored to wait after 1 minute passed by.</strong>

If you check out <a href="http://www.algorist.com/">this book</a>, it is going to tell you that such solution is going to take 13 days to come out with a solution, for an average machine (i.e. a machine where <em>O(1) = 0.001 &micro;s</em>).

BUT, of course, I have an alternative solution. Actually, more then one. And the best runs in <strong>O(log(n))</strong> ;)

## Dynamically programmed solution
The most important thing to bear in mind with the above solution is:
<blockquote>
... it will recalculate the same <code>f(x)</code> over and over again, because <code>f(x)</code> is going to be a subproblem shared between...
</blockquote>

To make this thing work, we need to build a solution that doesn't do the same job more then once. <a href="http://en.wikipedia.org/wiki/Dynamic_programming">Dynamic Programming</a> is the key!

To be more precise, we need to modify the algorithm so that at every step it doesn't trow away a previous call to <code>f(n)</code>, unless we are sure it's not useful anymore. In this way problems that share sub-problems (as explained before), will enjoy the pleasure of using the previously calculated results.

Because I assume most of my visitors are developers, I'm going to put here the code: it explains itself better than I can do writing.

```c
#include </stdio><stdio .h>

int main(int argc, char** argv)
{
    unsigned short i, input;
    unsigned long curr = 0, prevprev = 0, prev = 1;
    
    // Check the Input
	if ( argc == 2 ) input = atoi(argv[1]); else return (1);
	
	if ( input > 0 )
	{
        curr = 1;
        for ( i = 2; i < = input; ++i )
        {
            curr = prevprev + prev;
            #ifdef DEBUG
            printf("%d: %lu\n", i, curr);
            #endif
            prevprev = prev;
            prev = curr;
       }
	}
	
	printf("RESULT: fibonacci(%d) = %lu\n\n", input, curr);
	return (0);
}

```


Complexity in Time? A very nice <strong>O(n)</strong>. And the space occupied is <strong>O(1)</strong>: just two <code>unsigned long</code>.

## Fibonacci and Identity Matrix
Take a look now to this property of Matrices:

```c
    [ 1 1 ] n      [ F(n+1) F(n)   ]
    [ 1 0 ]    =   [ F(n)   F(n-1) ]
```


Given the formula for multiplying 2x2 Matrices

```c
    [ a b ] [ d e ]   [ ad + be  bd + ce ]
    [ b c ] [ e f ] = [ bd + ce  be + cf ]
```


You can then prove the result above by induction: Let

```c
   A = [ 1 1 ]   (identity matrix)
       [ 1 0 ]
```


assume by induction that the equation above is is true for some n,
multiply both sides by another power of A using the formula for
matrix multiplication, and verify that the terms you get are the
same as the formula defining the Fibonacci numbers.

So, what you can calculate a Fibonacci's number in this way:
<ol>
<li>Initialize <code>M</code> as the Identity Matrix</li>
<li>Multiply <code>M</code> by itself <code>(n-1)</code>-times</li>
<li>Return <code>M[0][0]</code>
</li></ol>

## Calculate <code>a<sup>n</sup></code> in O(log(n))
Why this now? Bear with me just a little more.
Yes, it's possible to do such a thing. And it made me feel stupid when I realized how simple it was.

Isn't <strong><code>a<sup>n</sup></code> = <code>a<sup>floor(n/2)</sup></code> * <code>a<sup>ceil(n/2)</sup></code></strong>? So, you can calculate it with something like:

```c
int exp(int a, int n)
{
   int res = a;
   if ( n > 1 )
   {
      res = exp(a, n/2);
      res *= res;
      if ( n % 2 != 0 ) // In case 'n' was odd
      {
         res *= a;
      }
   }
   return res;
}

```


<del>I'm leaving to you to get why the complexity of this is just <strong>O(log(n))</strong>.</del> Actually not, I'm giving you a quick explanation: this method is going do do as much multiplications (<em>O(1) operations</em>) as the number of time you need to divide the input <code>n</code> by <code>2</code> before it becomes <code>1</code>.
Confused? Ok, try the other way round: it requires as much multiplication, as you need to multiply <code>1 by 2</code>, so that the result is <code>n</code> (of course, more or less the <code>1</code> where <code>n is odd</code>).

## Put together Fibonacci, Matrices and our latest "breakthrough"
If you arrived this far, you probably already realized where I'm heading: Using the Identity Matrix property explained before with this algorithm for calculating exponentials.

After all, multiplying a Matrix M by itself n-1 times is like calculating </code><code>M<sup>n-1</sup></code>. And here is the code that implements all this:

```c
#include <stdio.h>
#include <stdlib.h>

unsigned long* matrix_2x2_multiply(unsigned long* A, unsigned long* B)
{
    unsigned long* result = (unsigned long*)malloc(4 * sizeof(unsigned long));
    result[0] = A[0] * B[0] + A[1] * B[2];
    result[1] = A[2] * B[0] + A[3] * B[2];
    result[2] = A[0] * B[1] + A[1] * B[3];
    result[3] = A[2] * B[1] + A[3] * B[3];
    return result;
}

unsigned long* matrix_2x2_multiply_identity(unsigned long* A)
{
    unsigned long identity[] = {1, 1, 1, 0};
    return matrix_2x2_multiply(A, identity);
}

unsigned long* matrix_2x2_power(unsigned long* input_matrix, unsigned short n)
{
    #ifdef DEBUG
    printf("INPUT MATRIX(%d)\n[%lu\t%lu]\n[%lu\t%lu]\n\n",
        n, input_matrix[0], input_matrix[1], input_matrix[2], input_matrix[3]);
    #endif

    unsigned long* result = input_matrix;
    unsigned long* temp = NULL;
    
    if (n > 1)
    {
        if ( n/2 > 1 ) // Avoid useless recursion
        {
            result = matrix_2x2_power(input_matrix, n/2);
            temp = result;
            
            #ifdef DEBUG
            printf("AFTER RECURSION(%d)\n[%lu\t%lu]\n[%lu\t%lu]\n\n",
                n, result[0], result[1], result[2], result[3]);
            #endif
        }
        result = matrix_2x2_multiply(result, result);
        // Free a 2x2 Array that is not needed anymore
        if ( temp != NULL )
        {
            free(temp);
            temp = NULL;
        }
        
        #ifdef DEBUG
        printf("AFTER MULTIPLICATION(%d)\n[%lu\t%lu]\n[%lu\t%lu]\n\n",
            n, result[0], result[1], result[2], result[3]);
        #endif
        
        if ( (n % 2) != 0 )
        {
            result = matrix_2x2_multiply_identity(result);
            
            #ifdef DEBUG
            printf("AFTER IDENTITY MULTIP.(%d)\n[%lu\t%lu]\n[%lu\t%lu]\n\n",
                n, result[0], result[1], result[2], result[3]);
            #endif
        }
    }
        
    #ifdef DEBUG
    printf("resultULT(%d)\n[%lu\t%lu]\n[%lu\t%lu]\n\n",
        n, result[0], result[1], result[2], result[3]);
    #endif

    return result;
}

unsigned long fibonacci_fast(unsigned short n)
{
    unsigned long result;
    unsigned long* matrix_2x2;
    unsigned long* identity_matrix_2x2;
    
    if ( n > 0)
    {
        // Allocating an initial Array 2x2 of unsigned long
        identity_matrix_2x2 = (unsigned long*)malloc(4 * sizeof(unsigned long));
        // Initialize the first matrix to the "identity matrix"
        identity_matrix_2x2[0] = 1;
        identity_matrix_2x2[1] = 1;
        identity_matrix_2x2[2] = 1;
        identity_matrix_2x2[3] = 0;
        
        matrix_2x2 = matrix_2x2_power(identity_matrix_2x2, n-1);
        result = matrix_2x2[0];
        
        // Freeing memory
        free(identity_matrix_2x2);
        // For "n" < 3 there is the risk that the call "matrix_2x2_power"
        //  returns the same matrix as result: this happens when no
        //  alteration is done on the input matrix.
        if ( identity_matrix_2x2 != matrix_2x2 )
            free(matrix_2x2);
            
        return result;
    }
    else
        return 0;
}

int main(int argc, char** argv)
{
    unsigned short input;
    // Check the Input
	if ( argc == 2 ) input = atoi(argv[1]); else return (1);

	printf("resultULT: fibonacci-v2(%d) = %lu\n\n", input, fibonacci_fast(input));
	return (0);
}
```


## One more thing

<strong>Yes, the allocation of all those matrices during the calculation is heavy.</strong> Even if they are just 2x2, it is still a lot of system calls to get and release memory from and to the Operating System (the <code>malloc</code> and the <code>free</code>).

We could do the job with just 2 matrices, 1 holding the current Matrix, and 1 holding the next multiplication. <strong>A circular array of 2 matrices 2x2, swapping their role at every step?</strong> HERE WE GO:

```c
#include <stdio.h>

unsigned short matrix_2x2_square(unsigned long matrix_array[2][4],
    unsigned short curr_matrix_index)
{
    static int new_matrix_index; new_matrix_index = (curr_matrix_index + 1) % 2;
    matrix_array[new_matrix_index][0] = 
        matrix_array[curr_matrix_index][0] * matrix_array[curr_matrix_index][0]
        + matrix_array[curr_matrix_index][1] * matrix_array[curr_matrix_index][2];
    matrix_array[new_matrix_index][1] = 
        matrix_array[curr_matrix_index][2] * matrix_array[curr_matrix_index][0]
        + matrix_array[curr_matrix_index][3] * matrix_array[curr_matrix_index][2];
    matrix_array[new_matrix_index][2] = 
        matrix_array[curr_matrix_index][0] * matrix_array[curr_matrix_index][1]
        + matrix_array[curr_matrix_index][1] * matrix_array[curr_matrix_index][3];
    matrix_array[new_matrix_index][3] = 
        matrix_array[curr_matrix_index][2] * matrix_array[curr_matrix_index][1]
        + matrix_array[curr_matrix_index][3] * matrix_array[curr_matrix_index][3];

    return new_matrix_index;
}

unsigned short matrix_2x2_multiply_identity(unsigned long matrix_array[2][4],
    unsigned short curr_matrix_index)
{
    static int new_matrix_index;

    // Swap the role of the 2 Matrices
    new_matrix_index = (curr_matrix_index + 1) % 2;
    
    matrix_array[new_matrix_index][0] = matrix_array[curr_matrix_index][0] * 1
        + matrix_array[curr_matrix_index][1] * 1;
    matrix_array[new_matrix_index][1] = matrix_array[curr_matrix_index][2] * 1
        + matrix_array[curr_matrix_index][3] * 1;
    matrix_array[new_matrix_index][2] = matrix_array[curr_matrix_index][0] * 1
        + matrix_array[curr_matrix_index][1] * 0;
    matrix_array[new_matrix_index][3] = matrix_array[curr_matrix_index][2] * 1
        + matrix_array[curr_matrix_index][3] * 0;

    return new_matrix_index;
}

unsigned short matrix_2x2_power(unsigned long matrix_array[2][4],
    unsigned short curr_matrix_index, unsigned short n)
{
    #ifdef DEBUG
    printf("INPUT MATRIX(%d)\n[%lu\t%lu]\n[%lu\t%lu]\n\n",
        n, matrix_array[curr_matrix_index][0], matrix_array[curr_matrix_index][1],
        matrix_array[curr_matrix_index][2], matrix_array[curr_matrix_index][3]);
    #endif
    
    if (n > 1)
    {
        if ( n/2 > 1 ) // Avoid useless recursion
        {
            // Recursive call for N/2
            curr_matrix_index = matrix_2x2_power(matrix_array, curr_matrix_index, n/2);
            
            #ifdef DEBUG
            printf("AFTER RECURSION(%d)\n[%lu\t%lu]\n[%lu\t%lu]\n\n",
                n, matrix_array[curr_matrix_index][0], matrix_array[curr_matrix_index][1],
                matrix_array[curr_matrix_index][2], matrix_array[curr_matrix_index][3]);
            #endif
        }
        // Matrix = Matrix * Matrix
        curr_matrix_index = matrix_2x2_square(matrix_array, curr_matrix_index);
        
        #ifdef DEBUG
        printf("AFTER MULTIPLICATION(%d)\n[%lu\t%lu]\n[%lu\t%lu]\n\n",
            n, matrix_array[curr_matrix_index][0], matrix_array[curr_matrix_index][1],
            matrix_array[curr_matrix_index][2], matrix_array[curr_matrix_index][3]);
        #endif
        
        // If N is odd
        if ( (n % 2) != 0 )
        {
            // Matrix = Matrix * IdentityMatrix ("{1, 1, 1, 0}")
            curr_matrix_index = matrix_2x2_multiply_identity(matrix_array, curr_matrix_index);
            
            #ifdef DEBUG
            printf("AFTER IDENTITY MULTIP.(%d)\n[%lu\t%lu]\n[%lu\t%lu]\n\n",
                n, matrix_array[curr_matrix_index][0], matrix_array[curr_matrix_index][1],
                matrix_array[curr_matrix_index][2], matrix_array[curr_matrix_index][3]);
            #endif
        }
    }
        
    #ifdef DEBUG
    printf("RESULT(%d)\n[%lu\t%lu]\n[%lu\t%lu]\n\n",
        n, matrix_array[curr_matrix_index][0], matrix_array[curr_matrix_index][1],
        matrix_array[curr_matrix_index][2], matrix_array[curr_matrix_index][3]);
    #endif

    // Return the index of the matrix carrying the current result
    return curr_matrix_index;
}

unsigned long fibonacci_fast(unsigned short n)
{
    unsigned long   result;
    unsigned short  matrix_2x2_cur = 0;
    unsigned long   matrix_2x2[2][4] = { {1, 1, 1, 0}, {0, 0, 0, 0} };
    
    if ( n > 0)
    {        
        matrix_2x2_cur = matrix_2x2_power(matrix_2x2, matrix_2x2_cur, n-1);
        result = matrix_2x2[matrix_2x2_cur][0];
           
        return result;
    }
    else
        return 0;
}

int main(int argc, char** argv)
{
    unsigned short input;
    // Check the Input
	if ( argc == 2 ) input = atoi(argv[1]); else return (1);

	printf("RESULT: fibonacci-v2(%d) = %lu\n\n", input, fibonacci_fast(input));
	return (0);
}

```


## Conclusion

If you arrived to read this far, I think you don't need conclusions. You already understood all what I meant to say here.

What I invite you to do is to compile and run those solutions, testing their performances with growing inputs. On my system (<a href="http://en.wikipedia.org/wiki/Mac_OS_X_Snow_Leopard">Mac OS X Snow Leopard</a>), using <code>unsigned long</code> to carry the values I can calculate up to <code>f(93)</code>: after that it overflows and the generated numbers can't be stored with a base type.

```bash
   # ./fibonacci-v3 92
   RESULT: fibonacci-v2(92) = 7540113804746346429
   # ./fibonacci-v3 93
   RESULT: fibonacci-v2(93) = 12200160415121876738
   # ./fibonacci-v3 94
   RESULT: fibonacci-v2(94) = 1293530146158671551
```


