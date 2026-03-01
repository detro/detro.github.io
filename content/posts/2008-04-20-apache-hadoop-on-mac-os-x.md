---
layout: post
author: detro
title: "Apache Hadoop on Mac OS X"
tags: [map, google, character, counter, reduce, mapreduce, it, macosx, english, apache, hadoop, tutorial]
date: "2008-04-20T23:04:06Z"
---

![Hadoop](http://hadoop.apache.org/images/hadoop-logo.jpg)
For some reasons I started to play with [Apache Hadoop (Core)](http://hadoop.apache.org/core/):


> Hadoop is a software platform that lets one easily write and run applications that process vast amounts of data.
>> Here's what makes Hadoop especially useful:
>> * <strong>Scalable:</strong> Hadoop can reliably store and process petabytes.
>> * <strong>Economical</strong>: It distributes the data and processing across clusters of commonly available computers. These clusters can number into the thousands of nodes.
>> * <strong>Efficient:</strong> By distributing the data, Hadoop can process it in parallel on the nodes where the data is located. This makes it extremely rapid.
>> * <strong>Reliable</strong>: Hadoop automatically maintains multiple copies of data and automatically redeploys computing tasks based on failures.
>> Hadoop implements [MapReduce](http://wiki.apache.org/hadoop/HadoopMapReduce), using the[Hadoop Distributed File System (HDFS)](http://hadoop.apache.org/core/docs/current/hdfs_design.html). MapReduce divides applications into many small blocks of work. HDFS creates multiple replicas of data blocks for reliability, placing them on compute nodes around the cluster. MapReduce can then process the data where it is located.
>> Hadoop has been demonstrated on clusters with 2000 nodes. The current design target is 10,000 node clusters.




I followed the [Quickstart](http://hadoop.apache.org/core/docs/current/quickstart.html) guide and I can confirm that it works on [en:Mac OS X] too, but I managed only to make it run in "[standalone](http://hadoop.apache.org/core/docs/current/quickstart.html#Standalone+Operation)" mode: usefull for first-stage development and debugging.
<!--more-->

To understand a bit more how it work, I decided to do also the [Map-Reduce Tutorial](http://hadoop.apache.org/core/docs/current/mapred_tutorial.html): I took the code of the example [Word Counter (v1.0)](http://hadoop.apache.org/core/docs/current/mapred_tutorial.html#Example%3A+WordCount+v1.0) and I wrote a Character Counter: same code but with one <code>for</code> more and more internal documentation.

Assumed it can't help you without a minimum of study of what [MapReduce](http://en.wikipedia.org/wiki/MapReduce) is, I would like to share the code of what I did:

* CharacterCount.java [[src](http://www.detronizator.org/wp-content/uploads/2008/04/charactercount.java)|[src2html](http://www.detronizator.org/wp-content/uploads/2008/04/charactercountjava.html)]

 

If interested, the first thing to read is "[MapReduce: Simplified Data Processing on Large Clusters](http://labs.google.com/papers/mapreduce.html)", a publication by [Jeffrey Dean](http://labs.google.com/people/jeff/) and[Sanjay Ghemawat](http://labs.google.com/people/sanjay/) sponsored by [Google Labs](http://labs.google.com/).
