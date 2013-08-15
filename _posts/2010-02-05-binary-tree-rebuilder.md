---
layout: post
author: detro
published: true
title: "Binary Tree Rebuilder"
tags: [binary, code, qt, personal, tree, binary-tree, visit, it, solution, english, rebuilder]
date: "2010-02-05 20:54:01"
updated: "2010-09-29 22:04:55"
permalink: /2010/02/05/binary-tree-rebuilder/
---

Imagine you have a <a href="http://en.wikipedia.org/wiki/Binary_tree">Binary Tree</a>, with those characteristics:
<ul>
	<li>Nodes do not respect any order relation - In other words: it's <strong>not</strong> a <a href="http://en.wikipedia.org/wiki/Binary_search_tree">Binary Search Tree</a> of any kind</li>
	<li>Every node appears <em>once and only once</em> within the tree</li>
</ul>

<div align="center">
<img src="http://www.drunkmenworkhere.org/bintree/pagerank.png" alt="A nice Binary Tree" />
<em>A nice Binary Tree</em>
</div>

Then, your little brother passes by your desk and, to upset you, deletes the tree from your computer memory/HD (yeah, I know, I'm pathetic at inventing hypothetical situations :-P ).

Fortunately though, you previously did a <a href="http://en.wikipedia.org/wiki/Tree_traversal">Pre-Order and an In-Order visit of your tree</a>, and stored the result in an 2 nice array.

<strong>Can you rebuild the original tree structure out of this 2 array?</strong>

<h3>How are you going to rebuild it?</h3>
Yes, you can! (Sorry, I couldn't resist). And it's quite easy as well. What you have to do, is the following: 
<ul>
<li>Take the first element of the PreOrder Array and use it as root of a new tree</li>
<li>Find the position of this New Node in the InOrder Array, scanning it from <code>0</code> to <code>n-1</code> (<code>n</code> is the number of Nodes)</li>
<li>IF next element in the PreOrder Array is on the left of the New Node in the InOrder array: call RECURSIVELY this procedure, this time taking into account the portion of InOrder array that goes from <code>0</code> to the <code>position of the New Node in the InOrder Array -1</code>.</li>
<li>IF next element in the PreOrder Array is on the right of the New Node in the InOrder array: call RECURSIVELY this procedure, this time taking into account the portion of InOrder array that goes from the<code> position of the New Node in the InOrder Array +1</code> to <code>n-1</code>.</li>
<li>Return the New Node</li>
</ul>

By the way, this doesn't work. To fix it we should be more generic, specifying things a little bit better. Things like:
<ul>
	<li>Every recursive calls takes into account a portion of the InOrder array; in the case of the first call it's the entire array</li>
	<li>There is going to be as much recursive calls as the number of elements in the PreOrder array</li>
</ul>

Of course, is a tree what we are talking about here: <strong>recursion is a MUST</strong>.<!--more-->

<h3>The solution</h3>
Well, after the crappiest algorithmic explanation I have ever written, here it comes the code.

This time it's not pure <a href="http://en.wikipedia.org/wiki/C_(programming_language)">C</a>: I wanted to use the beautiful <a href="http://qt.nokia.com/">Qt Framework</a> that I'm using since July/August 2009 for work. I will attach the code full code into a ZIP file; here I report at least the core algorithm:

```cpp
#include "TreeRebuilder.h"
#include <QDebug>

TreeRebuilder::TreeRebuilder() { }


TreeNode *TreeRebuilder::rebuild(QVector<TREE_NODE_VAL_TYPE> *preOrderVisit, QVector<TREE_NODE_VAL_TYPE> *inOrderVisit) {
    reset();

    m_preOrderVisit = preOrderVisit;
    m_inOrderVisit = inOrderVisit;

    mapNodePosInInOrderVisit();

    return doRebuild(0, m_inOrderVisit->size() - 1);
}

void TreeRebuilder::mapNodePosInInOrderVisit() {
    if ( !m_inOrderVisit ) {
        qCritical() << "InOrder Visit not provided";
    }

    // Memorize the Position in the InOrder Visit of every element for quick-lookup
    for (qint32 i = 0; i < m_inOrderVisit->size(); ++i) {
        m_nodePosInInOrderVisit.insert(m_inOrderVisit->at(i), i);
    }
}

TreeNode *TreeRebuilder::doRebuild(const qint32 &inOrderLeftLimit, const qint32 &inOrderRightLimit) {
    TreeNode *newNode = new TreeNode;

    qDebug() << "[Node:\t" << m_preOrderVisit->at( m_currRootInPreOrderVisit ) << "]";
    newNode->val = m_preOrderVisit->at( m_currRootInPreOrderVisit++ ); // Post-increment used to select the next New Node value, taken from the PreOrder Visit

    if ( inOrderLeftLimit < inOrderRightLimit ) {
        // If the current Node Value is not the first in the InOrderVisit current range, means there is a Left Child
        if ( m_nodePosInInOrderVisit.value(newNode->val) > inOrderLeftLimit ) {
            qDebug() << "   Found Left Child";
            newNode->leftChild = doRebuild(inOrderLeftLimit, m_nodePosInInOrderVisit.value(newNode->val) -1);
        }

        // If the current Node Value is not the last in the InOrderVisit current range, means there is a Right Child
        if ( m_nodePosInInOrderVisit.value(newNode->val) < inOrderRightLimit ) {
            qDebug() << "   Found Right Child";
            newNode->rightChild = doRebuild(m_nodePosInInOrderVisit.value(newNode->val) + 1, inOrderRightLimit);
        }
    }

    qDebug() << "[/Node:\t" << newNode->val << "]";

    return newNode;
}

void TreeRebuilder::reset() {
    m_currRootInPreOrderVisit = 0;
    m_preOrderVisit = NULL;
    m_inOrderVisit = NULL;
    m_nodePosInInOrderVisit.clear();
}

QVector<TREE_NODE_VAL_TYPE> TreeRebuilder::generateInOrderVisit(TreeNode * const root) {
    QVector<TREE_NODE_VAL_TYPE> result;

    TreeRebuilder::doGenerateInOrderVisit(root, &result);

    return result;
}

void TreeRebuilder::doGenerateInOrderVisit(TreeNode * const root, QVector<TREE_NODE_VAL_TYPE> *result) {
    if ( NULL != root ) {
        doGenerateInOrderVisit(root->leftChild, result);
        result->append(root->val);
        doGenerateInOrderVisit(root->rightChild, result);
    }
}

QVector<TREE_NODE_VAL_TYPE> TreeRebuilder::generatePreOrderVisit(TreeNode * const root) {
    QVector<TREE_NODE_VAL_TYPE> result;

    TreeRebuilder::doGeneratePreOrderVisit(root, &result);

    return result;
}

void TreeRebuilder::doGeneratePreOrderVisit(TreeNode * const root, QVector<TREE_NODE_VAL_TYPE> *result) {
    if ( NULL != root ) {
        result->append(root->val);
        doGeneratePreOrderVisit(root->leftChild, result);
        doGeneratePreOrderVisit(root->rightChild, result);
    }
}
```


Mmm, I can see that the code doesn't look very clear in here. Well, again, the code is downloadable from: <a href='http://www.detronizator.org/wp-content/uploads/2010/02/TreeRebuilder.tar.gz'>TreeRebuilder.tar.gz</a>

For Qt experts: yes, I'm using just the build-mechanism of Qt and the containers. All the rest is just plain <a href="http://en.wikipedia.org/wiki/C%2B%2B">C++</a>. But using <a href="http://doc.trolltech.com/4.6/signalsandslots.html">Signals and Slots</a> for this would have been a massive overkill, don't you think? ;)
