---
layout: post
author: detro
published: true
title: "BST traversal without stack or recursion (?)"
tags: [recursion, de marino, tree, traversal, queue, morris, stack]
date: "2012-08-06 12:47:17"
updated: "2013-03-23 17:40:23"
permalink: /2012/08/06/BST-traversal-wihtout-stack-or-recursion
---

**SPOILER**: _this article assumes quite a lot of things about your knowledge of binary trees and data structure. I won't spend much time introducing concepts. Deal with it._

Some time ago I had the pleasure to meet with [Chris Lord](http://chrislord.net/blog/), who introduced me to the concept of Binary Tree Traversal without using neither a stack/queue or recursion.

The list of requirements that such algorithm has to fulfil:

* Constant Space: no extra data structure to do the traversal
* Non-destructive: once finished, the tree needs to be exactly how it was before the visit

Sounded _crazy_ initially, but than I looked into it more deeply and discovered, thanks to some pointers from [Luca Colantonio](http://twitter.com/lucabox), that there is an algorithm _in literature_ that does just that: **Morris In-Order** Traversal.

Morris does just that - and a very good description of how it works can be found [on Stack Overflow](http://stackoverflow.com/a/5506601/1389112). I suggest you have a good read and come back: pointless of me to repeat it here.

...

You back? Great!

So, before "discovering" the Morris algorithm, I was trying to write a solution myself. My basic idea was to:

1. Move downwards
2. Manipulate pointers to the branch we are about to explore, to point backward so we have "a way back"
3. Restore once done with that branch

At that stage, it had not occur to me to try to manipulate the entire tree structure like Morris does: I wanted to be very subtle, with the data structure resembling the original tree (though, with backward pointers).

The key issue I hit? **Going Backward**. Once I'm done visiting the branches of a node, I need to go back to the parent (to which I have a pointer too), and restore the structure.

**But HOW am I going to reconstruct the tree?** How do I know if the Branch I just visited was the _left_ or the _right_ branch of the parent I want to move back to?

## Downsize the problem

In a general Binary Tree, there is no guarantee of the order and distribution of nodes. It's just a tree where every node has 0, 1 or 2 child nodes. I didn't have any "rule" on which to **build a backward-restoring logic**.

But then I had an idea: what about [BSTs (Binary Search Tree)](http://en.wikipedia.org/wiki/Binary_search_tree)? In those trees, there is a strong order relationship between a node and its childs.

This means that at any moment in time, once I'm done visiting a branch, I can reconstruct _where I'm coming from_, looking at the values of the parent and the child:

    parent->value > child->value ? is_left_child : is_right_child

And, so I wrote the **De Marino BST Post-Order Traversal** algorithm:

```cpp
void de_marino_bst_post_order_traversal(node *root) {
    node *curr = root;  //< current node
    node *par = NULL;   //< parent of current node
    node *next = root;  //< next node to traversal (but sometimes, just temp variable)
    int dir = DOWN;     //< direction in which we are moving

    do {
        if (dir == DOWN && curr->left != NULL) {
            // Go down left
            next = curr->left;
            curr->left = par;
            par = curr;
            curr = next;
        } else if (dir == DOWN && curr->right != NULL) {
            // Go down right
            next = curr->right;
            curr->right = par;
            par = curr;
            curr = next;
        } else {
            printf("%d\n", curr != NULL ? curr->value : -1);

            if (par->value > curr->value && par->right != NULL) {
                // Go down right, coming from left
                // NOTE: order gives us a hint about where we come from
                dir = DOWN;

                next = par->left;   // hold the way back
                par->left = curr;
                curr = par->right;
                par->right = next;  // store the way back in the right child of par now
                next = curr;
            } else {
                dir = UP;

                if (par->value > curr->value) {
                    // Go up, coming from left
                    // NOTE: order gives us a hint about where we come from
                    next = par->left;
                    par->left = curr;
                } else {
                    // Go up, coming from right
                    // NOTE: order gives us a hint about where we come from
                    next = par->right;
                    par->right = curr;
                }
                curr = par;
                par = next;
            }
        }
    } while(next != NULL && par != NULL);
    printf("%d\n", curr != NULL ? curr->value : -1);
}
```


Now, I'm almost 100% sure that I'm not the first one to _stumble_ into something like this, but for now I'm unable to find anything in literature - _cough_ ... Google ... _cough_ .

## An advantage over Morris

Yes, this algorithm requires the **strong condition of BST** while Morris works with any Binary Tree. That's a given. But this algorithm is also **faster**: it doesn't go deep into the tree to find the rightmost left child of a node, like Morris. From a quick look **the computation is linear - O(n)**: every node is visited only once. But maybe I'm overlooking something in Morris.

## Far from perfect

I'm also sure that this algorithm is **far from bug-less**: I have spent on it less than 24h between coding and thinking. So, please, to all the Computer Scientists people out there: let me know your thoughts and critics. This is a great way to spend some of that theory that we have in our heads.

I have added this code to my [coding exercises](https://github.com/detro/coding-exercises/commits/master) repo on GitHub, if you want to try it out (check latest commits).

Now, as I expect, feel free to ignore my warnings and start your opinionated trashing - I'm pretty confident I'd deserve it. :)
