---
layout: post
published: false
title: "Binary Expression Trees"
tags: []
---

== Overview ==

A binary expression tree is a binary tree that represents a mathematical expression.  The leaf nodes are always the operands (numbers or variables) and the other nodes (i.e. those that have child nodes) operators.   This question can test candidates understand how to search a binary tree, and also tokenise an expression and parse it back into a tree, nominally using a stack.

I've had success with this question scaling from graduates up to SDE2s.  Probably too trivial for a SDE3, but untested.

== Setup ==

<div class="floatright">{{S3PicCaption|BinaryExpressionTreeExample.jpg|'''((((a+b)*c)+d)-e)'''}}</div>

* '''Do you know what a binary expression tree is?'''.  Candidates usually don't know, or know it by some other name.  In this case, follow up by asking them if they know what a binary tree is (I don't immediately explain an expression tree yet).  If they don't know what a binary tree is, explain that too.

* '''Here's an expression tree'''.  Draw a binary expression tree on the board.  There's an example to the right, you might go for a simpler or more complex one (this one is quite simple).  Ask the candidate if they know what it represents.  They should pick up it's a mathematical expression.  Ask them to write the expression it represents, just to confirm they fully understand.  If they have trouble, either walk them through it, or try with a simpler tree.

* The candidate might well ask to clarify the properties of the tree, i.e. a node can have 0 or 2 children, operands are always the leafs, operators elsewhere.

== Warm up problem - ''Node class'' ==

''I tend to only ask this problem for graduates or low level SDEs, as it should be a walk in the park''.

'''In the language of your choice, can you create a data structure or class to represent a binary expression tree?'''  I use this for ambiguity tolerance - the ideal solution (usually, unless justified somehow) is only implementing a Node class a Node is a tree.  Sometimes candidates waste time making a Tree wrapper that only holds a single Node.  Often a yellow flag.

==== Solution + comments ====

<source lang="java">
public class Node {
    private Node left;
    private Node right;
    private String value;

    public Node(String value) {
        super();
        this.value = value;
    }

    // this is nice for covering base cases.  candidates don't usually implement this right away, but it's nice if they come back and add it (or something similar) later, rather than put the == null logic in their methods
    public boolean isBalanced() {
        return (this.left != null && this.right != null) || (this.left == null && this.right == null);
    }

        // again, don't expect this right away, but it's nice to see them to add it during Problem 2.  There are lots of ways to handle this, including subclassing, but this is a simple and acceptable way for an interview!
    public boolean isOperator() {
        return ("+".equals(value) || "-".equals(value) || "*".equals(value) || "/".equals(value));
    }

        //getters and setters - I ask candidates not to implement these because it's a waste of time.
}
</source>

== Problem 1 - ''Printing an infix expression'' ==

'''Can you write a method/function that given an instance of your Node'''/Tree''' class, returns the (infix) expression its tree represents? For example, if I gave the tree I drew on the board, I'd want it to return the expression you said that represents.'''

This is a simple tree search.  The candidate should be able to write a solution (almost always recursive, I've not seen them be successful with an iterative solution, although I'm sure they could be) that does a depth-first search to build up the expression.

==== Solution + comments ====

<source lang="java">
public String getInfix(Node node) {
        // Base cases.  Big yellow flag if candidate steams ahead without considering them.
    if (node == null) return "";
    if (!node.isBalanced()) throw new InvalidTreeNode(node); // I don't expect them to implement an exception in the interview
        // Operand.  If this isn't caught here then you end up with ((1)+(2)), which I will call them out on.
    if (node.getLeft() == null && node.getRight() == null) return node.getValue();

        // StringBuilder is just one approach, but a clean one.
    StringBuilder sb = new StringBuilder();
    sb.append("("); // Candidates often forget the ()s.  Important because no concept of precedence right now.
    sb.append(getInfix(node.getLeft()));
    sb.append(node.getValue());
    sb.append(getInfix(node.getRight()));
    sb.append(")");
    return sb.toString();
}
</source>

A lot of candidates, even higher level ones, seem to over think this part of the problem a bit.  It's pretty simple, especially if done recursively.  Guide them through it as you see fit - it's unfortunate if they spend the whole interview on this.


== Problem 2 - ''Parsing reverse polish notation (RPN)'' ==

* ''Write the expression in RPN on the board.'' (the RPN for the previous expression is '''a b + c * d + e -''').
* '''Do you know what this represents?''' [May work it out, may not, explain anyway].  It's the same expression in reverse polish notation.  That's a way to represent an expression in postfix.  In other words, the operator goes after the operands.

'''Can you write a method/function that given the RPN expression string, returns back the expression tree (of Nodes) representing it?'''

Candidates should ask for clarification about the input.  What separates each token in the string?  (I always say a space - makes it easy. If candidates just split the string on characters, you should later call out what will happen if numbers are greater than 9 ;-) if they don't notice this problem themselves).  Candidate may also ask for another example of RPN or clarification of the "rules", which are that an operator is preceded by two operands, and an operand may be a compound expression of other operators/operands.

Some examples are:
* ''ab+'' = ''a+b''
* ''ab+c*'' = ''(a+b)*c''
* ''ab+cd+*'' = ''(a+b)*(c+d)''
* ''ab+cd+*5*'' = ''((a+b)*(c+d))*5''

Candidates will struggle if they try to do things like split the input into groups of three (operator,operator,operand) because while that works for the most naive cases (ab+), it'll fail if it's even slightly more complex (ab+c*).  I had a graduate using an intricate set of for loops to loop over the input in groups of 7 (ab+cd+*) and then threes (ab+, cd+) and then ones (final *).  Novel, but very wrong.

==== Solution + comments ====

<source lang="java">
public Node parse(String rpn) {
    // Tokenise string.  If candidates try to do anything more complex it's probably wrong.
    String[] tokens = rpn.split(" ");

        // Choice of data structure for the stack is always interesting.  It can be a yellow flag for the candidate if they're not able to pick a stack, and pick an implementation of a stack in their language.  A LinkedList is fine obviously.
    LinkedList<Node> queue = new LinkedList<Node>();

    for (String token : tokens) {
        Node currentNode = new Node(token);
        if (!currentNode.isOperator()) { // extra marks if they implement isOperator, rather than do a test on the value here
            // Push non-operators onto the stack
            queue.push(currentNode);
        } else {
            // When we see an operator, pop the top two values from the stack and push the result back on.
                        if (queue.size() < 2) throw new InvalidExpression(rpn); // Minor +points if capture this case.
            currentNode.setRight(queue.pop());
            currentNode.setLeft(queue.pop());
            queue.push(currentNode);
        }
    }

    // Get the last
    Node node = queue.poll(); // Minor: poll doesn't throw an error if it's empty, so we can do InvalidExpression below
    if (queue.size() > 0) throw new InvalidExpression(rpn); // Again, +points
    return node;
}
</source>

It's very easy to trip up and get lost in this problem, even though it's actually pretty simple.  The [http://en.wikipedia.org/wiki/Reverse_Polish_notation Wikipedia] article for RPN explains the stack-based approach in evaluating the answer.  Building the tree is just a slight difference.  Candidates may try to use a recursive solution, or just really trip up.

== Bonus questions ==

* If you've only got a little time left, consider asking them to modify their RPN parser to evaluate the expression (assuming it's numbers in the input, at least).  It's a fairly trivial change if they realise they can drop the notion of converting it into a tree and just evaluate as they pop off the stack.  I've not asked a candidate this yet, but I imagine some trip-ups would be spending a lot of time writing another method that walks over the resulting tree to calculate the answer (unless they do this well, I'd ding them on invent and simplify), or getting lost in working out how to evaluate the expression (you've got string operators and you need to perform the operation they imply. I'd use a switch/if for simplicity!).

* The question could probably be extended/modified for a higher level SDE by asking them to parse infix expressions (for example, using the [http://en.wikipedia.org/wiki/Shunting-yard_algorithm|Shunting-yard algorithm]) into a tree/RPN or to evaluate.

* If the candidate is really failing badly from Problem 1, you could probably convert this into a simpler "validate the tree is a valid binary expression tree" question.  If they manage that, it's not a long stretch to coach them into at least completing problem 1 using their solution (actually, it's probably easier to complete problem 1 than validate the tree - but the candidate might have trouble making mental leaps at first).
