---
layout: post
author: detro
published: true
title: "Detronizator now on WordPress 2.1.3"
tags: [personal, javascript, sw, it, opensource, curiosity, english, php, projects]
date: "2007-04-03 14:33:53"
updated: "2007-04-03 14:33:53"
permalink: /2007/04/03/detronizator-now-on-wordpress-213/
---

<img src="http://wordpress.org/style/header-logo.png" alt="WP logo" width="100" align="right" />
Post of April the 3rd, 2007 (today) taken by the WordPress.org official blog:
<blockquote>
<strong>WordPress 2.1.3 and 2.0.10</strong>
By <a href="http://photomatt.net/">Matt</a>. Filed under <em>Security</em>, <em>Releases</em>.

We have a security update release now available for both the 2.1 and 2.0 branches of WordPress <a href="http://wordpress.org/download/">now available for immediate download</a>. This update is highly recommend for all users of both branches.

These releases include fixes for several publicly known minor XSS issues, one major XML-RPC issue, and a proactive full sweep of the WordPress codebase to protect against future problems. Many thanks to <a href="http://www.notsosecure.com/">Sumit Siddharth</a> and <a href="http://www.buayacorp.com/">Alex Concha</a> for their help with reporting issues in this release.

As an update to <a href="http://wordpress.org/development/2007/03/upgrade-212/">the systems issue we had last month</a>, we have taken dozens of additional precautions with the servers and systems that run WordPress.org and they appear to be working well, despite hundreds of hack attempts after we publicly disclosed there had been a problem. We are also now aggressively monitoring all downloads for any changes or modifications, and we are confident the same type of problem won’t happen again.</blockquote>

If you are on <strong>2.1</strong>, it's useless to do backups or something like it: the <code>wp-admin/upgrade.php</code> script will not touch the DB. So... update peacefully (and <strong>pleasantly</strong>). For the others still on 2.0.x: why not upgrade now?


