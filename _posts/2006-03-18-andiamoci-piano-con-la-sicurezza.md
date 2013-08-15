---
layout: post
author: detro
published: true
title: "Andiamoci piano con la sicurezza"
tags: [curiosity, personal, javascript, it, laugh, italian]
date: "2006-03-18 13:04:30"
updated: "2006-03-18 13:04:30"
permalink: /2006/03/18/andiamoci-piano-con-la-sicurezza/
---

<strong>Edit 23 Marzo 2006</strong>: Io ho torto e lui ha ragione. Lascio il post per chi volesse ridere della mia gaffe. Sono stato freagato dal fatto che la libreria JS che uso si occupava "di suo" ad ovviare alle limitazioni di security. 

Su <a href="http://groups.google.com/group/spaghettiajax?lnk=li">SpaghettiAjax</a> un tizio ha fatto una domanda:
<blockquote>...
Dunque mi sto documentando da poco su ajax e vorrei farmi un'idea sulla
fattibilità di quanto segue: attualmente ho un WebService che espone
determinati metodi. Poi ho una web application che sostanzialmente
tramite una jsp richiama una servlet. Questa servlet richiede delle
info al WS (tramite un metodo esposto) ed una volta ottenute le passa
alla jsp che le visualizza.

Ora mi chiedo se la parte utente può essere reimplementata usando
ajax: in particolare sarebbe ottimo se tramite javascript potessi
richiamare quella servlet (o addirittura direttamente il WS) ed esporre
quindi all'utente i risultati.
Per esempio alla jsp attualmente arriva una lista di oggetti, che io
stampo poi a video in modo opportuno. Come ci si comporta in ajax
(javascript) con collezioni ed oggetti (classi java)?...
</blockquote>
Risposta di un tizio:
<blockquote>
> Ora mi chiedo se la parte utente può essere reimplementata usando
> ajax: in particolare sarebbe ottimo se tramite javascript potessi
> richiamare quella servlet (o addirittura direttamente il WS) ed esporre
> quindi all'utente i risultati.

Primo limite di Ajax: non si possono fare richieste a server diversi
da quello in cui l'applicazione Ajax risiede, dunque per far funzionare
il tutto e' necessario installare Ajax nello stesso dominio in cui
c'e' l'applicazione server-side che poi esporta i dati in qualche modo.

> Per esempio alla jsp attualmente arriva una lista di oggetti, che io
> stampo poi a video in modo opportuno. Come ci si comporta in ajax
> (javascript) con collezioni ed oggetti (classi java)?

Javascript e Java hanno in comune solo le prime 4 lettere del nome :)
In seguito ad una decisione commerciale. javascript nativamente non ha
alcun modo di leggere oggetti java, dunque e' necessario che l'applicazione
lato server serializzi in qualche modo i dati, ad esempio in XML o in qualunque
altro formato opportuno, cosi' che javascript possa leggerli e visualizzarli
a video...
</blockquote>

La mia risposta (dovuta):
<blockquote>> On 3/17/06, sloop <apett ...@gmail.com> wrote:
> > Ora mi chiedo se la parte utente può essere reimplementata usando
> > ajax: in particolare sarebbe ottimo se tramite javascript potessi
> > richiamare quella servlet (o addirittura direttamente il WS) ed esporre
> > quindi all'utente i risultati.

> Primo limite di Ajax: non si possono fare richieste a server diversi
> da quello in cui l'applicazione Ajax risiede, dunque per far funzionare
> il tutto e' necessario installare Ajax nello stesso dominio in cui
> c'e' l'applicazione server-side che poi esporta i dati in qualche modo.

???
Me la spieghi questa?
No perché se no la roba che manipoli in Ajax da una vita che mi arriva
dall'altra parte del globo non funziona ma io non lo so!
No, a parte la mia battuta, ti rendi conto che secondo questa
affermazione cose tipo le GMap usate con le GMap API non hanno alcun
motivo di esistere perché non possono funzionare?
Stiamo attenti a quello che scriviamo: la gente potrebbe prenderci sul
serio. Magari tu intendevi dire altro ma... rileggi please.

> > Per esempio alla jsp attualmente arriva una lista di oggetti, che io
> > stampo poi a video in modo opportuno. Come ci si comporta in ajax
> > (javascript) con collezioni ed oggetti (classi java)?

> Javascript e Java hanno in comune solo le prime 4 lettere del nome :)
> In seguito ad una decisione commerciale....

Si tratta semplicemente di linguaggi diversi che girano in ambienti e
con logiche ben diverse.

> javascript nativamente non ha
> alcun modo di leggere oggetti java, dunque e' necessario che l'applicazione
> lato server serializzi in qualche modo i dati, ad esempio in XML o in qualunque
> altro formato opportuno, cosi' che javascript possa leggerli e visualizzarli
> a video.

I WS più evoluti (quelli dello standard 2.0 non ancora definito
"reccomended" definiscono
il formato XML XSD per l'invio di interi Oggetti e non solo di "tipi
primitivi"+Array come é ora.
Questo permetterà quindi di serializzare oggetti in un linguaggio e
riutilizzarli (nei limiti definiti dallo stesso standard) in un altro.
Per esempio, il ho fatto sistemi in cui il backend é una servlet che
espone un WS fatto con WSCompile ed il client era una pagina PHP5 che
interrogava tale WS.
Per potermi spedire dati "complessi" ho utilizzato un formato XML
comune a Client e Server.
In attesa di WS2.0 consiglio CALDAMENTE questa soluzione. Veloce,
sicura e pienamente controllabile dallo sviluppatore. </apett></blockquote>
