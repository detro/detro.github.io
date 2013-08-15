---
layout: post
author: detro
published: true
title: "PostgreSQL 8.1.4 released"
tags: [it, sw, opensource, projects, english]
date: "2006-06-01 10:49:31"
updated: "2006-06-01 10:49:31"
permalink: /2006/06/01/postgresql-814-released/
---

<img src="http://www.bimboflap.it/risorse/servizi/coloriamo/B.N/elefante.gif" width="150" align="left" alt="PG" />
The most advanced Open Source RDBMS... becomes even more advanced!!! ;)
<blockquote><strong>New Advanced Database Features</strong>

<strong>Roles:</strong> PostgreSQL now supports database roles, which simplify the management of large numbers of users with complex overlapping database rights.

<strong>IN/OUT Parameters:</strong> PostgreSQL functions now support IN, OUT and INOUT parameters, which substantially improves support of complex business logic for J2EE and .NET applications.

<strong>Two-Phase Commit (2PC):</strong> long in demand for WAN applications and heterogeneous data centers using PostgreSQL, this feature allows ACID-compliant transactions across widely separated servers.
Performance Enhancements

<strong>Improved Multiprocessor (SMP) Performance:</strong> the buffer manager for 8.1 has been enhanced to scale almost linearly with the number of processors, leading to significant performance gains on 8-way, 16-way, dual-core, and multi-core CPU servers.

<strong>Bitmap Scan:</strong> indexes will be dynamically converted to bitmaps in memory when appropriate, giving up to twenty times faster index performance on complex queries against very large tables. This also helps simplify database management by greatly reducing the need for multi-column indexes.
<strong>
Table Partitioning:</strong> the query planner is now able to avoid scanning whole sections of a large table using a technique known as Constraint Exclusion. Similar to the Table Partitioning found in other database management systems, this feature improves both performance and data management for multi-gigabyte tables.
<strong>
Shared Row Locking:</strong> PostgreSQL's "better than row-level locking" now supports even higher levels of concurrency through the addition of shared row locks for foreign keys. Shared locks will improve insert and update performance on many high-volume OLTP applications.

<a href="http://www.postgresql.org/docs/whatsnew">...</a>
</blockquote>

<a href="http://www.postgresql.org/docs/techdocs.52">Bug fixes</a>.
<blockquote> Q: What's being released?
A: PostgreSQL minor versions 8.1.4, 8.0.8, 7.4.13 and 7.3.15. All of these versions implement a security patch which eliminates a specific vulnerability to SQL injection attacks.

Q: Who does this vulnerability affect?
A: Users of PostgreSQL servers which are exposed to "untrusted input", from the internet or otherwise, and use any "multi-byte encoding", such as UTF-8 or SJIS. Basically, most open source database users with Web applications.

Q: Who is not affected?
A: Several kinds of applications:

   1. Users whose database applications are not exposed to untrusted input, such as single-user applications not exposed to the Internet.
   2. Databases which are set up with "LATIN-1" or other single-byte encoding, on both client and server.
   3. If application always sends untrusted strings as out-of-line parameters, instead of embedding them into SQL commands, it is not vulnerable. This is only available in PostgreSQL 7.4 or later.

<a href="http://www.postgresql.org/docs/techdocs.48">...</a>
</blockquote>

Source, <a href="http://www.ziobudda.net/">Ziobudda</a>.



