---
layout: post
author: detro
published: true
title: "MGS - Il mio progetto per il corso di OOP"
tags: [uncategorized]
date: "2004-11-16 11:04:46"
updated: "2004-11-16 11:04:46"
permalink: /2004/11/16/mgs-il-mio-progetto-per-il-corso-di-oop/
---

<div style="clear:both;"></div><a href="http://www.mandolinux.org/MGS/"><span style="font-weight: bold;">MGS</span></a> significa "<span style="font-weight: bold;">Multithreaded Game Server</span>" ed é il progetto che stò curando per il corso di OOP.<br />Lo stò sviluppando sfruttando per l'aspetto Multithreading la libreria <a style="font-weight: bold;" href="http://www.gnu.org/software/commoncpp/">GNU Common C++ 2</a>: questa libreria si pone come scopo lo sviluppo di un "piccolo" framework per completare ciò che manca al C++ (secondo me ci vorrebbe qualcosa più simile alle QT... ma ci accontentiamo ;-) )<br />>> <span style="font-style: italic;">Si, ma cos'é MGS? </span><br /> Il nome penso faccia già capire: é un Server che permette a persone che vi si connettono di partecipare a dei "<span style="font-weight: bold;">Game</span>". E' sufficiente l'uso di un semplice TelNet:<br /><code><br /># telnet x.y.z.t 9999<br /></code><br />>> <span style="font-style: italic;">Perché le virgolette?</span><br />Perché, per l'approccio volutamente "astratto", in realtà i Game possono essere qualsiasi cosa richieda uno scambio di messaggi (<span style="font-style: italic;">fatti di caratteri alfanumerici</span>) tra gli utenti connessi.<br />Non a caso il primo Game (quello di prova) implementato é una <span style="font-weight: bold;">ChatRoom</span>.<br />>> <span style="font-style: italic;">Come funziona?</span><br />Vi rimando al <a href="http://www.mandolinux.org/MGS/">sito ufficiale</a>.<br /><div style="clear:both; padding-bottom: 0.25em;"></div>
