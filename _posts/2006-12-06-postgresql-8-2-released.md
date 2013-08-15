---
layout: post
author: detro
published: true
title: "PostgreSQL 8.2 released"
tags: [personal, sw, it, opensource, english, devtools, projects]
date: "2006-12-06 17:07:23"
updated: "2006-12-06 17:07:23"
permalink: /2006/12/06/postgresql-82-released/
---

The BEST Open-Souce RDBMS (not only for me), becomes better than itself.

<blockquote><strong>5 December 2006, Washington DC (LISA Conference)</strong>: The PostgreSQL Global Development Group today announces the release of version 8.2 of the PostgreSQL object-relational database management system. This 14th public release adds features, maturity, and performance requested by business users, delivering manageability comparable to leading enterprise database systems. Version 8.2 is expected to drive even more migrations toward PostgreSQL.

"This release touches almost every command and database facility," said PostgreSQL core team member and EnterpriseDB database architect Bruce Momjian. "It adds expanded, compatible syntax and interfaces which have been requested by our community, making it easier for new DBAs to fully use all of PostgreSQL's advanced features."

"Unisys is pleased to note significant enhancements in the scalability and performance of PostgreSQL on large-scale multi-processor systems," states Ali Shadman, vice president and general manager, Open Source Solutions, Systems and Technology, Unisys. "The newly released 8.2 version continues the maturation of PostgreSQL into a database management system capable of enterprise adoption."

New tools and features to make database management and development easier include:

<strong>Performance improvements</strong>: version 8.2 improves performance around 20% overall in high-end OLTP (online transaction processing) system tests. Users can gain even more in data warehousing efficiency. The changes include faster in-memory and on-disk sorting, better multi-processor scaling, better planning of partitioned data queries, faster bulk loads and vastly accelerated outer joins.

<strong>Warm Standby Databases</strong>: through an extension to our Point in Time Recovery feature (introduced in version 8.0), administrators now can easily create a failover copy of your database cluster.

<strong>Online Index Build</strong>s: index builds can now occur while applications write to database tables, allowing performance tuning without downtime.

<strong>SQL 2003 Features</strong>: PostgreSQL, well known for standards compliance, has added syntax for several more features introduced in the ANSI SQL 2003 specification, including: statistical aggregates, multi-row VALUE statments, UPDATE RETURNING and multi-column aggregates.

Advanced database features, being offered in PostgreSQL 8.2 before any other major database system, include:

<strong>Generalized Inverted Indexes</strong>: support a more scalable and programmable way of indexing semi-structured and full text data.

<strong>DTrace</strong>: PostgreSQL has also been instrumented for Solaris DTrace and other advanced tracing tools via the Generic Monitoring Framework.

"With data warehouse instances housing billion-row tables and multiple terabytes of data, online index builds and hot-standby capabilities are crucial," said Theo Schlossnagle, Principal at OmniTI Computer Consulting. "We are also excited that PostgreSQL is now a first- class DTrace citizen. This means our regular system analysis efforts can now incorporate database-specific data leading to much more meaningful results."

There are dozens of additional features and improvements in 8.2 which will make PostgreSQL DBAs more productive. See the press kit for details. </blockquote>

Click <a href="http://www.postgresql.org/about/press/presskit82.html">here for more details</a>.
Souce, <a href="http://www.ossblog.it/post/1597/rilasciato-postgresql-82">OSSBlog</a>.
