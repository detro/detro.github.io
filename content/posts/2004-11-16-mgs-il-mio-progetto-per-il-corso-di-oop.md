---
layout: post
author: detro
title: "MGS - Il mio progetto per il corso di OOP"
tags: [uncategorized]
date: "2004-11-16T11:04:46Z"
---



[**MGS**](http://www.mandolinux.org/MGS/) significa "**Multithreaded Game Server**" ed é il progetto che stò curando per il corso di OOP.
Lo stò sviluppando sfruttando per l'aspetto Multithreading la libreria [GNU Common C++ 2](http://www.gnu.org/software/commoncpp/): questa libreria si pone come scopo lo sviluppo di un "piccolo" framework per completare ciò che manca al C++ (secondo me ci vorrebbe qualcosa più simile alle QT... ma ci accontentiamo ;-) )
>> *Si, ma cos'é MGS?*
 Il nome penso faccia già capire: é un Server che permette a persone che vi si connettono di partecipare a dei "**Game**". E' sufficiente l'uso di un semplice TelNet:

```
# telnet x.y.z.t 9999
```

>> *Perché le virgolette?*
Perché, per l'approccio volutamente "astratto", in realtà i Game possono essere qualsiasi cosa richieda uno scambio di messaggi (*fatti di caratteri alfanumerici*) tra gli utenti connessi.
Non a caso il primo Game (quello di prova) implementato é una **ChatRoom**.
>> *Come funziona?*
Vi rimando al [sito ufficiale](http://www.mandolinux.org/MGS/).



