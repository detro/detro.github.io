---
layout: post
author: detro
title: "Riflessioni su ZFS"
tags: [apple, personal, macosx, sw, it, italian]
date: "2006-08-30T10:37:51Z"
---

[![ZFS schema](http://www.sun.com/software/solaris/img/ig_ra_solaris_zfs.gif)](http://www.sun.com/software/solaris/zfs_learning_center.jsp)
Stamane, venendo in auto nell'ufficio dove ho svolto il tirocinio pre-laurea, riflettevo su [ZFS](http://opensolaris.org/os/community/zfs/) [in](http://www.detronizator.org/2006/08/18/time-machine-la-delusione-diventa-sconforto/) [Mac OS X](http://www.apple.com/macosx).

Mi domandavo come mai gli sviluppatori di Apple abbiano inserito nel [VFS](http://en.wikipedia.org/wiki/Virtual_file_system) le strutture necessarie per integrare [ZFS](http://en.wikipedia.org/wiki/ZFS)... senza poi annunciarlo al mondo intero con squilli di trombe e rulli di tamburi.

Ho infine fantasticato su COME ZFS si sarebbe potuto integrare nel discorso di Apple sul Backup, [Time Machine](http://www.apple.com/macosx/leopard/timemachine.html) ecc... e ho realizzato una cosa: Apple vuole integrare un sistema di Backup facile
e trasparente. Non il versioning. ZFS ha il supporto per il versioning, non per il backup.

Cerchiamo un attimo di fare ordine.

	* <strong>Versioning</strong> Capacità di conservare le versioni precedenti di un file durante tutta la sua evoluzione (ovvero, mentre ci si lavora sopra). Suggerisco comunque
di dare uno sguardo su [Wikipedia](http://www.detronizator.org/2006/08/18/time-machine-la-delusione-diventa-sconforto/) per maggior precisione.

	* <strong>Backup</strong> Salvataggio di file come copia di sicurezza, normalmente su <strong>device diverse da quello di origine</strong>.

Ed è proprio questo l'aspetto più "importante" da tenere in considerazione.
Ho visto "in moto" ZFS e, a meno che non supporti (come immagino sicuramente faccia) la possibilità di salvare gli <em>snapshot</em> su altre device, non è un backup inteso alla maniera "classica". A me, utente "smaliziato" di MacOSX, utilizzare gli Snapshot di ZFS non farebbe che piacere. Ma un utente che la riga di comando la odia, che se ne farebbe così com'è? Cos'ì com'è stato presentato, Time Machine è un sistema di backup... non di versioning (malgrado ne integri le qualità).

Quindi, <strong>a che cosa serviva ZFS?</strong>
Io immagino che Apple, per i suoi server, non usi lo stesso identico MacOSX che vende a noi: di sicuro è pieno di personalizzazioni interessanti. 
Pensate al sistema di backup attuale di <strong>.Mac</strong>. 
Pensate al fatto che, tra le destinazioni preferite per effettuare i nostri backup su [<strong>Leopard</strong>](http://www.apple.com/macosx/leopard/), hanno indicato appunto .Mac.

La pensate come me? Io credo che loro useranno (se non usano già) ZFS. E che l'abbiano integrato nei loro server, così da ridurre DRASTICAMENTE lo spazio occupato dai backup degli utenti (dato che il versioning di <strong>ZFS supporta gli snapshot incrementali e differenziali</strong> (per questo sarei entusiasta di usarlo, che credete)). 

E, volendo spiengermi oltre con la fantasia, <strong>potrei pensare ad un Leopard Server capace di fare da server di Backup, basato sull'uso di ZFS.</strong> Di sicuro io lo installerei subito in favore della versione Client.

Staremo a vedere.
