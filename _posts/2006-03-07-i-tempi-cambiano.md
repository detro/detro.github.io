---
layout: post
author: detro
published: true
title: "I tempi cambiano..."
tags: [apple, personal, macosx, it, hw, curiosity, italian]
date: "2006-03-07 11:40:23"
updated: "2006-03-07 11:40:23"
permalink: /2006/03/07/i-tempi-cambiano/
---

<img src="http://www.melablog.it/uploads/macminihack.jpg" alt="Mac Mini Rage" align="right" />
... o almeno iniziano a farlo.

Io personalmente non avevo mai letto niente a proposito di test/challenge per il cracking di sistemi MacOSX (ce ne sono stati, ma sempre per dimostrare la robustezza di questi sistemi e di Linux rispetto a W32).

Ebbene, ne sono stati lanciati già 2 (ma sicuramente altri ce ne sono e non ci (mi) sono pervenuti):
<ul>
<li>
<a href="http://rm-my-mac.wideopenbsd.org.nyud.net:8090/">RM MY MAC</a>
</li>
<li>
<a href="http://test.doit.wisc.edu/">Mac OS X Security Challenge</a>
</li>
</ul>

<blockquote>Su <a href="http://www.zdnet.com.au/news/security/soa/Mac_OS_X_hacked_in_less_than_30_minutes/0,2000061744,39241748,00.htm">ZDnet</a> appare la notizia: Gwerdna, sarebbe riuscito ad impossessarsi del Mac (il primo della lista di cui sopra) in meno di 30 minuti, sfruttando una falla del sistema non pubblica. In ogni caso deve essere un soggetto particolarmente abile: "<em>ci ho messo 20 minuti in più di quanti ce ne ho messi con Windows Xp</em>". Come notano in molti, il sito ha pubblicato anche il local account della macchina, un dato che facilita non poco il lavoro degli hacker... </blockquote>

Questi secondo me sono segnali dei tempi che cambiano: non che l'informatica abbia scoperto OGGI Apple, ne che queste cose non si siano MAI fatte. Quello che sorprende é la visibilità che ricevono ora queste cose: basta anche solo guardare i vari media "generici" che cominciano sempre più ad interessarsi al mondo della Mela.

Perché una cosa é certa: per diffondere e far conoscere A TUTTI (soprattutto alle "grandi masse") bisogna finire sulle bocche dei "media di consumo". In Italia questo si traduce nei quotidiani e le TV commerciali (si, anche Rai ormai lo é... ma fa business per gli avversari ;) ).

Source, <a href="http://www.melablog.it/post/1594/1594">Melablog</a>.

Edit 08 Mar 2006: Ieri non avevo letto con attenzione le pagine web di cui sopra, ma solo commentato il fatto che "ci si stesse interessando alla sicurezza di sistemi alternativi al solito W32". I commenti di cui sopra quindi permangono.

Ora però c'é da aggiungere qualche citazione: prima fra tutti, quella su <a href="http://attivissimo.blogspot.com/2006/03/mac-bucato-in-30-min.html">attivissimo.blog</a>:
<blockquote>Ultimamente c'è più interesse del solito per ogni notizia che riguarda la sicurezza del Mac. A volte la fame di scoop (magari mescolata con un po' di voglia di consolarsi in stile "mal comune, mezzo gaudio") spinge a gonfiare notizie in realtà banali fino a farne nascere un allarme generale inutile e deleterio.

E' il caso, per esempio, della notizia di un Mac bucato entro trenta minuti dalla sua messa in Rete per sfida. Ne parla ZDNet: il 22 febbraio scorso, un utente Mac svedese ha collegato il suo Mac Mini a Internet e ha sfidato gli esperti a "bucarglielo", ossia superarne le difese e acquishttp://www.detronizator.org/wp-admin/post.php?action=edit&post=260ire privilegi di root (che consentono all'intruso di fare qualsiasi cosa, come cancellare file e installare programmi).

Sei ore (non trenta minuti) dopo l'annuncio della sfida, il Mini era stato violato da un utente identificatosi come Gwerdna, ossia "Andrew G." a rovescio, che ha dichiarato di averci messo una mezz'oretta scarsa (ecco i famosi 30 minuti) usando delle falle non documentate di Mac OS X.</blockquote>

Il sito <a href="http://rm-my-mac.wideopenbsd.org.nyud.net:8090/">rm my Mac</a> non ha messo online una macchina Apple "as is", bensì ha creato un sito in cui le persone potevano prima crearsi un account <a href="http://en.wikipedia.org/wiki/SSH">SSH</a>, da lì loggarsi e quindi tentare una SCALATA DI PRIVILEGI dall'Interno. Una cosa molto diversa direi.

Per rispondere a questa CAZZATA, <a href="http://test.doit.wisc.edu/">MacOSX Security Test</a> ha fatto la stessa cosa ma senza SSH, volendo dimostrare la robustezza dei sistemi MacOSX (ma io direi di tutti i sistemi *Nix) per quanto riguarda gli attacchi via Web (che erano quelli in discussione). Ebbene, il MacMini é stato ormai spento perché NESSUNO é riuscito, malgrado una quantità enorme di attacchi, ad entrare nella macchina.

Quella proposta da <a href="http://rm-my-mac.wideopenbsd.org.nyud.net:8090/">rm my Mac</a> era una semplice scalata di privilegi, da eseguire "dall'interno del sistema", non via web (se non sapete cosa sia <a href="http://en.wikipedia.org/wiki/SSH">SSH</a>, documentatevi su <a href="http://en.wikipedia.org/wiki/SSH">Wikipedia</a>).

Questo quindi é un invito rivolto a tutti a non lasciarsi subito prendere, come io stesso in parte ho fatto, dalla "foga del titolo", senza prima capire bene che cosa l'articolo voglia realmente dire/presentare/divulgare.
