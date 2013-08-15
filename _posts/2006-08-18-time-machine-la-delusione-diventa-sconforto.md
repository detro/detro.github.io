---
layout: post
author: detro
published: true
title: "Time Machine: La delusione diventa sconforto"
tags: [solaris, apple, personal, macosx, sw, it, opensource, laugh, curiosity, projects, italian]
date: "2006-08-18 22:47:49"
updated: "2006-08-18 22:47:49"
permalink: /2006/08/18/time-machine-la-delusione-diventa-sconforto/
---

Apple, ora sono profondamente deluso da te.
"The Next big Features"? Questa é il tipico "JOKE"!. E' una presa per i fondelli.

Mi sono andato a leggere tutto l'articolo (ottimo, da 10 e lode) di <a href="http://arstechnica.com/staff/fatbits.ars/2006/8/15/4995">Ars Technica</a> scritto dal talentuoso (almeno con le parole e per la conoscenza) <strong>John Siracusa</strong>... e lo sconforto mi ha assalito.

Io quest'anno sono stato (e sono ancora) impegnatissimo, quindi ho dovuto letteralmente "bypassare" <a href="http://opensolaris.org/os/;jsessionid=360C02BBB52F138B52CCBBACA99C5624">Solaris 10</a>. L'ho solo scaricato, ma senza avere il tempo di installarlo. 2 erano le cose che mi interessavano (e ora lo sono anche di più): <a href="http://opensolaris.org/os/community/zfs/">ZFS</a> e <a href="http://www.opensolaris.org/os/community/dtrace/">DTrace</a>.

Ho scoperto che internet pullula di siti web in cui si discute e si chiede che ZFS venga scelto come futuro filesystem di <a href="http://www.apple.com/macosx">MacOSX</a> (e non solo). Ne voglio citare solo alcune delle maggiori e più applaudite features:
<blockquote>...
<strong>ZFS Features</strong>

<ul class="feature_list">
<li>Pooled Storage Model</li>
<li>Always consistent on disk</li>

<li>Protection from data corruption</li>
<li>Live data scrubbing</li>
<li>Instantaneous snapshots and clones</li>
<li>Fast native backup and restore</li>
<li>Highly scalable</li>
<li>Built in compression</li>
<li>Simplified administration model</li>
</ul>
...</blockquote>

Quando é stato presentato Time Machine, ovviamente tutti quelli che conoscevano ZFS e le discussioni in proposito (io no, purtroppo ;( ), hanno pensato al file system di <a href="http://www.sun.com">Sun</a> integrato in Leopard. Io mi ero limitato a pensare (a dire il vero, a dare per scontato) ad un nuovo f.s.

Leggere della soluzione reale, fa venire i brividi.
Ma ancor peggio, fa venire sconforto questo:
<blockquote>There's still plenty of room for legitimate Time Machine criticism, however. While the hard link trees are a clever solution, given the constraints of HFS+, the strategy dictates a file-level granularity for all backups. In other words, if you change a single byte of a 500MB file, the entire 500MB file will be copied to the backup volume during the next Time Machine backup. Frequent modifications to large files will fill your backup volume very quickly.

According to MacWorld, "<em>Apple suggests that the answer will be for application developers to modify their programs to break up data into more discrete elements that can be backed up more simply by Time Machine—something they may already be doing in order to make their files searchable via Spotlight.</em>" <strong>Of course, this advice is totally unhelpful for people who edit video or work with other large media files on a daily basis.</strong> </blockquote>

Paradossalmente, ci va peggio chi doveva goderne di più, cioé chi tratta grandissimi file.
Uno che opera su file che, messi insieme, arrivano a qualche mega (come nel mio caso quando programmo) potrebbe, con un pò di diligenza, non aver bisogno di backup: basterebbe farsi con regolarità delle copie.
Chi invece opera su file di grandi... grandissime dimensioni, NECESSITA di un sistema trasparente di Backup. Sarebbe davvero assurdo non averlo.

Non continuo con le mie considerazione, perché diventerebbero una mera traduzione dell'<a href="http://arstechnica.com/staff/fatbits.ars/2006/8/15/4995">articolo di Ars Technica</a>. Resta però lo sconforto per una GRANDE OCCASIONE PERSA.
E se penso al fatto che ci vogliono ancora 7 mesi... posso solo sperare che Apple pensi di integrare ZFS o qualcosa di simile (anche perché ero all'oscuro della VACCHIAIA di HFS, che pensavo risalisse al Mac OSX 10.0... non a Macos 8O !!!)


