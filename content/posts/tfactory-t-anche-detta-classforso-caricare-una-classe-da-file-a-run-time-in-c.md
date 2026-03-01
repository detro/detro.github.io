---
layout: post
author: detro
title: "TFactory (anche detta ClassForSO): caricare una classe da file a Run-Time in C++..."
tags: [uncategorized]
date: "2004-11-16T11:15:23Z"
aliases:
  - /2004/11/16/tfactory-t-anche-detta-classforso-caricare-una-classe-da-file-a-run-time-in-c
  - /2004/11/tfactory-t-anche-detta-classforso-caricare-una-classe-da-file-a-run-time-in-c
---



L'idea mi é venuta durante lo sviluppo di [**MGS**](http://www.mandolinux.org/MGS/): sapevo che alcuni miei colleghi (**SbatMan**, **o'Troll**, **Sax**) avevano fatto una cosa in questa direzione per il loro progetto di OOP.
In particolare loro avevano realizzato una `*Template Factory***typedef**` obbligatori per gestire gli handler delle SO) che una Classe che si voleva istanziare a Run-Time doveva rispettare: ho eliminato il tutto approfondendo un pò l'argomento:

```
# man dlsym
```

Avendo studiato il loro codice per benino (come fanno i programmatori seri...;-)), il risultato é stato una leggera trasformazione del Template che ora permette di:

   * Caricare una classe da una SO (Shared Object Library) a Run-Time (come prima);
   * Assegnare l'oggetto istanziato tramite UP-Casting ad una Super-Classe (come prima);
   * Nessuna restrizione sulle Gerarchie (unica differenza con il lavoro dei miei colleghi).
 

 Cosa ho fatto quindi io di nuovo? La mia versione della `**TFactory **` (così il nome della Classe) può essere portata ovunque continuando a funzionare sempre.
Prossimamente posterò il codice completo o un link allo stesso.
Da notare che, al momeno, il sito ufficiale non é stato ancora aggiornato.



