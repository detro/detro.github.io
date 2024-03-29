---
layout: post
author: detro
published: true
title: "Apache Hadoop on Mac OS X"
tags: [map, google, character, counter, reduce, mapreduce, it, macosx, english, apache, hadoop, tutorial]
date: "2008-04-20 23:04:06"
updated: "2008-04-20 23:04:06"
permalink: /2008/04/20/apache-hadoop-on-mac-os-x/
---

<img src="http://hadoop.apache.org/images/hadoop-logo.jpg" alt="Hadoop" align="right" width="200" />
For some reasons I started to play with <a href="http://hadoop.apache.org/core/">Apache Hadoop (Core)</a>:
<blockquote>Hadoop is a software platform that lets one easily write and run applications that process vast amounts of data.

Here's what makes Hadoop especially useful:
<ul>
<li><strong>Scalable:</strong> Hadoop can reliably store and process petabytes.</li>
<li><strong>Economical</strong>: It distributes the data and processing across clusters of commonly available computers. These clusters can number into the thousands of nodes.</li>
<li><strong>Efficient:</strong> By distributing the data, Hadoop can process it in parallel on the nodes where the data is located. This makes it extremely rapid.</li>
<li><strong>Reliable</strong>: Hadoop automatically maintains multiple copies of data and automatically redeploys computing tasks based on failures.</li>
</ul>

Hadoop implements <a href="http://wiki.apache.org/hadoop/HadoopMapReduce">MapReduce</a>, using the<a href="http://hadoop.apache.org/core/docs/current/hdfs_design.html"> Hadoop Distributed File System (HDFS)</a>. MapReduce divides applications into many small blocks of work. HDFS creates multiple replicas of data blocks for reliability, placing them on compute nodes around the cluster. MapReduce can then process the data where it is located.

Hadoop has been demonstrated on clusters with 2000 nodes. The current design target is 10,000 node clusters.
</blockquote>

I followed the <a href="http://hadoop.apache.org/core/docs/current/quickstart.html">Quickstart</a> guide and I can confirm that it works on [en:Mac OS X] too, but I managed only to make it run in "<a href="http://hadoop.apache.org/core/docs/current/quickstart.html#Standalone+Operation">standalone</a>" mode: usefull for first-stage development and debugging.
<!--more-->

To understand a bit more how it work, I decided to do also the <a href="http://hadoop.apache.org/core/docs/current/mapred_tutorial.html">Map-Reduce Tutorial</a>: I took the code of the example <a href="http://hadoop.apache.org/core/docs/current/mapred_tutorial.html#Example%3A+WordCount+v1.0">Word Counter (v1.0)</a> and I wrote a Character Counter: same code but with one <code>for</code> more and more internal documentation.

Assumed it can't help you without a minimum of study of what <a href="http://en.wikipedia.org/wiki/MapReduce">MapReduce</a> is, I would like to share the code of what I did:
<ul>
<li>CharacterCount.java [<a href="http://www.detronizator.org/wp-content/uploads/2008/04/charactercount.java">src</a>|<a href="http://www.detronizator.org/wp-content/uploads/2008/04/charactercountjava.html">src2html</a>]</li>
</ul> 

If interested, the first thing to read is "<a href="http://labs.google.com/papers/mapreduce.html">MapReduce: Simplified Data Processing on Large Clusters</a>", a publication by <a href="http://labs.google.com/people/jeff/">Jeffrey Dean</a> and<a href="http://labs.google.com/people/sanjay/"> Sanjay Ghemawat</a> sponsored by <a href="http://labs.google.com/">Google Labs</a>.
