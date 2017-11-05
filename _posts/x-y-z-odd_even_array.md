---
layout: post
published: false
title: "Odd Even Array"
tags: []
---

This question has a good variety of working solutions allowing the candidate to trade off memory for CPU. The fastest solution involves a piece of computational trivia that many candidates will not identify, that said there are other solution that test problem solving skills and offer a variety of coding options.  Additionally, there are a number of implementation options that will improve the efficiency of the code.

Typically used to assess: SDE I or II coding bar.

## Setup
You are going to be passed as input an array with an interesting property: the array contains numbers that appear an even number of times throughout the array, save one, that appears an odd number of times.  Your code should accept the array as input and return the number that appears an odd number of times as output.

### Sample Arrays
```
[1,3,1] // returns 3<br/>
[1] // returns 1<br/>
[2,4,6,8,10,12,10,8,6,4,2,2,4,2,4] // returns 12<br/>
[2,2,4,4,10,10,12,12,12,12,12,12,10,10,99] // returns 99<br/>
[1,0,0,0,0,4,4,9,3,7,9,3,7] // returns 1<br/>
```

## Solutions
### Optimal Solution

The optimal solution relies upon binary logic, specifically XOR.  XOR (^) has a few interesting properties that are helpful to this problem, namely,

```
A ^ A = 0
B ^ 0 = B
A ^ B = B ^ A
```

As  a result of these three properties, you can say that for any set containing an even number of A and an odd number of B, XOR'ing all the elements together, in any order, will equal B.  Therefore, the optimal solution contains the following logic:

```cpp
int XORValue = 0;
for( int i = 0; i < ArrayLength; i++)
    XORValue = XORValue ^ array[i];
return XORValue;
```

Note that this solution is O(n) run time and only reads the array a single time, and stores only a single integer value so it is efficient in both time and space complexity.

### Map Solution
A good solution may be obtained by reading the array in sequence, keeping track of each unique value each time it occurs, and incrementing a counter for each value again.  Once you run through the whole array, you will have a map that contains one row for each unique number found in the array and its value will be number of occurrences of that integer.  You may then read through that map sequentially to look for the number that occurs an odd number of times.

Note that this solution is also O(n) run time and has O(n) storage requirements.  In the worst case for storage, each number appears twice save one that appears once, so there are (n-1)/2 even entries and 1 odd entry, so the size of the array is ((n-1)/2 + 1).  Also in this worst case, the map must be read from beginning to end to find the odd value so the run time is actually n + ((n-1)/2 + 1).

While this is still O(n) run time, there is an optimization that will improve the actual performance of this implementation: namely, when you read the array, you add new unique values to the map, setting their value to 1, when you find another entry for this value, you remove it from the map rather than incrementing the counter.  Using this strategy, you will be left with a map that contains a single entry for the value that occurs an odd number of times.  This reduces the runtime to n.  You may also note that this logically behaves the same way as the XOR solution.

### Sort Solution
In the event that the array is sorted, you examine the array sequentially to find the odd value.  Some candidates will attempt to implement this by keeping track of the value that they are currently examining and the number of times that it has been found.  This implementation works by looking at the first entry in the array, setting the "current value" to this value, and setting the "counter" to one.  For each iteration, if the array value is equal to "current value" increment the counter.  Otherwise if the counter is odd, return "current value", and otherwise reset the "current value" to the array value and reset the "counter" to one.

This can be improved upon by examining some sample sorted arrays and noting that for all numbers with an even number of occurrences that occur before the odd one, the transition to the next number occurs on an even entry (assuming a counter starting at zero).

For example,

```
[1,1,2,2,4,4,4,4,5,6,6]
```

The transition from 1 to 2 occurs at array[2]. The transition from 2 to 4 occurs at array[4].  The transition from 4 to 5 occurs at array[8].  Finally, the transition form 5 to 6 occurs at array[9].  So the swap from even to odd is number 5. Written another way, if you compare the first two values, they are the same.  As are the next two values, and so on.  In the fifth pair of values, they do not match.  The first of these two values is the entry that occurs an odd number of times.

This produces a solution that reads more like this:
```cpp
for( int i = 0; i < ArrayLength; i=i+2)
    if(array[i] != array[i+1])
        return array[i];
```

Note that this solution requires an O( n log n) sort followed by an O(n) traversal of the, now sorted, array.  Assuming that the sort occurs in place, this solution uses less space than the map solution.

### Naive Solution
The brute force solution involves some variation of the following: examine the first element of the array, traverse the array and count the number of times that you find this element.  If it is odd, return.  If it is even, move to the next element and start again.

Note that this solution is **O(n^2)**.
