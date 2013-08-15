---
layout: post
author: detro
published: true
title: "Risposta ad OSS|Blog.it"
tags: [symbianos, apple, personal, it, symbian, uk, linux, microsoft, italian]
date: "2007-07-08 17:52:57"
updated: "2007-07-08 17:52:57"
permalink: /2007/07/08/risposta-ad-ossblogit/
---

<img src="http://www.symbian.com/images/rx/imagesets/7034_lg.jpg" alt="Nigel Clifford" align="right" />
Ieri sono passato, come di consueto, su <a href="http://www.ossblog.it/post/2827/linux-symbian-mobile-enterprise">OSS|Blog.it</a> e cosa ci trovo? Un brevissimo articolo su alcuni commenti che <a href="http://www.symbian.com/about/overview/management/management.html">Nigel Clifford</a>, CEO di <a href="http://www.symbian.com/">Symbian</a>, ha fatto su Linux e sul mercato degli smartphone con i piedi palmati.

Ho provato ad inserire la mia risposta sul relativo post... ma niente. Dice che sto spammando. Quindi... provvedo a farlo da qui.

Allora.
Prima di essere assunto da Symbian, quando iniziai a studiarne la tecnologia e il Sistema Operativo, mi domandai come diavolo facevano a vendere una cosa così: Niente Eccezioni (Leave), niente (o quasi) thread (Active Objects), niente POSIX (almeno fino a quando mi hanno assunto, che è coinciso con il rilascio di P.I.P.S.), e... niente STL (ma staremo a vedere ancora per quanto ;) ).
<!--more-->
Mi veniva da pensare: &laquo;c***o, ma fa proprio pena tecnologicamente parlando&raquo;. Devo dire che però studiandolo, studiando gli internals, capisco tante cose. E definire Symbian un sistema "tecnologicamente osceno" è assolutamente fuori luogo.

E' il sistema operativo con il più basso numero di vulnerabilità note: e, confrontando la base di installato, è il sistema operativo più diffuso al mondo. Un ottimo risultato direi.

E' curato in maniera MANIACALE nell'aspetto delle performance, e questo spiega come mai, ancora oggi, mantenga cose come Active Objects e Leave invece di usare Thread e Exception come tutti i sistemi "normali". Queste strutture ASSOLUTAMENTE FUORI STANDARD permettono un decisivo risparmio di risorse. Tutto a vantaggio dei Customers.

Ed è qui che viene fuori il "marcio": i Customer, spesso, usano male il sistema operativo o, peggio, lo accoppiano ad una interfaccia utente davvero obsoleta. A mio parere (ed anche di molti altri dipendenti) [en:S60] (l'interfaccia di praticamente tutti i Nokia) fa SCHIFO. Sotto tutti gli aspetti: usabilità, grafica ed eleganza compresi. [en:UIQ] (Sony-Ericsson, Motorola ed altri) è decisamente meglio... ma ancora ne ha di strada da fare.

Symbian non è spaventata da Linux. Ed il motivo è semplice: non c'è una azienda dietro. Questo è ottimo per un sistema Desktop/Server dove problemi come batteria e risorse limitatissime non sono un problema. Ma nel momento in cui si deve fare un cellulare, uno smart-phone, i problemi sono tantissimi, primo fra tutti l'hardware limitatissimo e la batteria. Cose di cui la comunità che sviluppa linux non sa e non interessa sapere. E chi ha provato a farlo in ambito aziendale (su tutti, Motorola) ora sta tornando sui suoi passi, poiché, nella pratica, quando si produce un cellulare basato su linux... si butta più della metà del kernel e lo si riscrive daccapo. Dove sarebbe il vantaggio?

Aggiungo: Linux è un sistema usatissimo all'interno di Symbian, ed è amato da tutti gli sviluppatori. Ma una cosa è un server dove 1 giga di ram è una cosa scontata... una cosa è un cellulare, dove 512mb di RAM in un iPhone fanno pensare ad un miracolo di miniaturizzazione. Vi invito a guardare le specifiche tecniche del vostro cellulare, e capirete.

Di chi ha davvero paura Symbian? Nell'ordine: <a href="http://en.wikipedia.org/wiki/Research_In_Motion">RIM</a>, che produce il sistema per i Blackberry (e che ha la più grande fetta del mercato americano, uno dei più ambiti), [en:Microsoft], con i suoi numerosi smart-phone di qualità davvero buona, e... forse il terzo incomodo che rende tutta la sfida più interessante, [en:Apple Inc.] (non ha ancora un mercato, ma ha un potenziale incredibile, soprattutto per il livello di "qualità" che può imporre).

Con questo sproloquio non voglio dire che [en:Symbian OS] è un sistema perfetto, tutt'altro: solo che è consigliabile evitare di fare il mio stesso errore. Valutare una cosa... senza conoscerla.
Ma, ripeto, mi aggiungo a voi nel dire che l'uso che viene fatto di Symbian, spesso, è OSCENO. Avevo un [en:Nokia E70]: l'ho felicemente sostituito con un [en:Sony Ericsson W950i]. Sulla carta, un salto indietro, ma nella qualità... 2 salti in avanti.
