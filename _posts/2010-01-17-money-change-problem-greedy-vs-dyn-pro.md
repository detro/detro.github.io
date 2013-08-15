---
layout: post
author: detro
published: true
title: "Money change problem: Greedy vs. Dyn.Pro."
tags: [code, personal, money, it, greedy, solution, dynamic-programming, english, problem, coin, change, cool]
date: "2010-01-17 21:37:56"
updated: "2011-03-21 22:08:47"
permalink: /2010/01/17/money-change-problem-greedy-vs-dyn-pro/
---

This is a classical problem of <a href="http://en.wikipedia.org/wiki/Computer_science">Computer Science</a>: it's used to study both <a href="http://en.wikipedia.org/wiki/Greedy_algorithm">Greedy</a> and <a href="http://en.wikipedia.org/wiki/Dynamic_programming">Dynamic Programming</a> algorithmic techniques.

<div class="img">
<img src="http://www.freephotosbank.com/photographers/photos1/45/med_53ff4957d796d0ff0a7d3151ec4e4a20.jpg" alt="Coins" />
I hate having my pocket full of copper!!! -_-
</div>

## Definition
Given:
<ul>
<li>A set of <code>n</code> Denominations <code>D[0...n-1]</code> in ascending order, representing a Monetary Coin System</li>
<li>An money amount <code>A</code>, as input</li>
</ul>
calculate a solution:
<ul>
	<li><strong><code>S[0...n-1]</code></strong>, with <code>0 &lt;= S[i] &lt;= (A/S[i])</code> and <code>0 &lt; i &lt; n-1</code></li>
</ul>
where:
<ul>
	<li><strong><code>A = Sum<sub>[i=0 -> n-1]</sub> { D[i] * S[i] }</code></strong></li>
	<li><strong><code>Min{ Sum<sub>[i=0 -> n-1]</sub> { S[i] } }</code></strong></li>
</ul>

## In other words
Find the smallest amount of coins to make the given amount.

## First, the Greedy solution
The Greedy approach is as expected: tries to take as much largest coins as possible. Nothing fancy.
[soucecode:c]
change_coins_greedy(D[], A):
   init S[n]
   i = n-1
   // Pick as much largest coins as possible
   while ( A > 0 ) do:
      S[i] = A / D[i]
      A = A - S[i] * D[i]
      i = i - 1
   endwhile
   
   // Set to '0' the result for all the other coins
   while ( i >= 0 ) do:
      S[i] = 0
      i = i - 1
   endwhile
```

This algorithm, of time complexity <strong>O(A)</strong>, doesn't work for some (rare) situations.

## When Greedy is not enough
<del datetime="2010-01-18T10:41:49+00:00">The Greedy algorithm doesn't work for Denominations where if <strong>2 denominations D[i] and D[j] exists</strong> with:</del>
<ul>
<li><del datetime="2010-01-18T10:41:49+00:00"><strong>i &lt; j</strong></del></li>
<li><del datetime="2010-01-18T10:41:49+00:00"><strong>D[i] &lt; D[j]</strong></del></li>
<li><del datetime="2010-01-18T10:41:49+00:00"><strong>2 * D[i] &gt; D[j]</strong></del></li>
</ul>
<del datetime="2010-01-18T10:41:49+00:00">For example, taken <strong>D = {1, 10, 30, 40}</strong> and amount <strong>A = 63</strong>, the Greedy algorithm will build a solution <strong>S = {3, 2, 0, 1}</strong>, that is sub-optimal. The optimal solution in this case is <strong>S = {3, 0, 2, 0}</strong>.</del>
<strong>UPDATE:</strong> <a href="#comment-11505">In the comments Vincenzo</a> gives an example where this condition doesn't still stand but the Greedy Algorithm still produces the best solution.

## Dynamically Programmed Solution
In real life the Greedy algorithm should be always enough: I couldn't find any money system that has the problem described above. And, indeed, the Greedy approach is what every human being "normally" applies when changing money.

But we are Comp-Sci, and we need to find a better solution ;-) - a Dynamically Programmed one.

Given the function <strong>M[j], that is the minimum number of coins to make the amount 'j'</strong>, it looks like:
<ul>
<li><strong>M[A] = min<sub>[i = 0 -> n-1]</sub> { M[ A - D[i] ] +1 , M[A] }</strong></li>
</ul>
Here is the code:

```c
unsigned int* change_coins_dynpro(unsigned short int D[],
    unsigned int D_size, unsigned int amount) {
    // Min. num. of coins for the given 'amount'
    unsigned int min_num_coins[amount], cur_min_num_coins;
    // Biggest coin used for the given 'amount'
    unsigned int biggest_coin_at[amount], cur_biggest_coin_at;
    
    unsigned int i, j;
    unsigned int* solution = NULL;
    
    // Ensure the Denomination System can represent any value
    if ( D[0] != 1 ) return NULL;
    
    // Initialize the solution array to Zero
    solution = (unsigned int*)calloc(D_size, sizeof(unsigned int));
    if ( NULL == solution ) {
        return NULL;
    }

    // Amount '0' requires '0' coins
    min_num_coins[0] = 0;
    biggest_coin_at[0] = 0;
    
    // For Amounts from '1' to 'amount'
    for ( i = 1; i <= amount; ++i ) {
        // Start taking 'D[0]' 'i-times'
        cur_min_num_coins = (i / D[0]);
        cur_biggest_coin_at = 0;

        // For coins from 'D[1]' to 'D[D_size -1]'
        for ( j = 1; j < D_size; ++j ) {
            // If 'D[j]' minimizes the num. of coins to take for amount 'i'
            if ( (i >= D[j]) && (cur_min_num_coins >= (min_num_coins[ i - D[j] ] +1)) ) {
                cur_min_num_coins = min_num_coins[ i - D[j] ] +1;
                cur_biggest_coin_at = j;
            }
        }
        
        // Store the minimum just found
        min_num_coins[i] = cur_min_num_coins;
        biggest_coin_at[i] = cur_biggest_coin_at;
    }
    
    // Let's build the solution array
    while ( amount > 0 ) {
        cur_biggest_coin_at = biggest_coin_at[amount];
        
        solution[ cur_biggest_coin_at ] += 1; // Add '1' of this coin to the solution
        amount -= D[cur_biggest_coin_at]; // Amount left when picking this coin
    }
    
    return solution;
}
```


Time complexity for this algorithm is <strong>O( Amount * num_of_denominations )</strong>.
<em>Pretty heavy algorithm, but do you want to compare with the satisfaction of carrying the minimum amount of coins with you? :P</em>
