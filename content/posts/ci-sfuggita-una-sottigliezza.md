---
layout: post
author: detro
title: "Ci è sfuggita una sottigliezza..."
tags: [curiosity, personal, it, windows, laugh, microsoft, italian]
date: "2007-02-17T12:49:39Z"
aliases:
  - /2007/02/17/ci-sfuggita-una-sottigliezza
  - /2007/02/ci-sfuggita-una-sottigliezza
---

... che però è più che fondamentale.
Quando siamo stati alla "[Giornata di Informazione Tecnologica](http://www.detronizator.org/2007/02/13/e-la-chiamano-giornata-di-informazione-tecnologica/)" ci siamo fatti "fregare" dalle parole degli Evangelist Microsoft circa una sottigliezza a dir poco SCONCERTANTE.

Su [en:Windows_Vista|Windows Vista] non si possono installare programmi SE NON come Admin. Questo vuol dire che non si può installare nulla, nemmeno il [en:Mame] o l'emulatore della [en:Playstation|Play]. Con ovvie restrizioni all'usabilità (nonchè alla liberta) degli utenti.
E' ovvio che, che so, il [it:driver] della [it:Scheda Video] vada installato con permessi "elevati": ma lo stesso non vale se voglio giocare a [CrackAttack](http://aluminumangel.org/attack/).

Ci hanno fregato con la storia della retrocompatibilità e della sandbox: su Vista, infatti, i programmi che tentano di scrivere nel registro o in file/directory di sistema vengono "fregati" a livello di API, redirigendo il loro output su una sandbox contenuta nella cartella utente. Molto bello. Ma ci devi arrivare ad installare ;)


![UAC](http://upload.wikimedia.org/wikipedia/en/9/93/UAC_File_Operation.jpg)


Ma questo cosa comporterà (secondo me)? Che TUTTI si faranno account amministratore e useranno SOLO QUELLO, perché è naturale che non si vorrà essere infastiditi continuamente. Questo avrà la naturale conseguenza di eliminare ogni traccia della filosofia "l'account di Admin lo si usa solo se necessario". E quindi di tutta l'architettura "SICURA" di questo (s)Vista.
E, a testimonianza di questo, gli stessi Evangelist lì presenti avevano TUTTI disabilitato la funzione di "chieder loro se continuare o meno quando un programma richiede di eseguire operazioni potenzialmente pericolose": se nemmeno loro sopportano questi messaggi... figurarsi l'utente.

Seguono altre fonti. <!--more-->

Cito [Inquier Italia](http://it.theinquirer.net/2007/02/vista_ha_un_enorme_buco_nel_si.html) in proposito:


>> Microsoft ha dichiarato che il suo “sicurissimo” sistema operativo Vista ha un enorme buco nel sistema di sicurezza, precisamente nell'[en:User_Account_Control|UAC (User Account Control)].
>> Secondo l'hacker che l'ha trovato, Joanna Rutkowska, il buco significa che il leggendario setting di default “no-admin” non è più un meccanismo di sicurezza. Compreso?
> La Rutkowska ha dichiarato a ZD Net che l'User Account Control automaticamente dà per scontato che tutti i programmi di setup vadano eseguiti con privilegi da amministratore.
> Quando esegui uno di questi programmi, si apre un prompt dell'UAC tramite il quale puoi acconsentire a conferire privilegi da amministratore al programma oppure decidere di non eseguirlo. State ancora seguendo?
> Così se un utente si scarica il gioco del Tetris, le possibilità che ha sono decidere se consentirgli tutti i diritti di accesso ai file di sistema, al registro e al kernel, oppure decidere di non eseguire il programma. In nessun momento in Microsoft si sono chiesti perchè mai l'installer del Tetris dovrebbe avere il permesso di accedere al kernel.
> Nel suo blog 'Invisible Things', la Rutkowska sostiene che si dovrebbe garantire all'utente la possibilità di scegliere se concedere tutti i privilegi al software o semplicemente il diritto di aggiungere una cartella nella directory C:\Programmi e qualche comando in HKLMSoftware e niente più. Questa opzione, molto più sicura, era possibile in XP ma è stata eliminata da Vista.
> Un responsabile della sicurezza di Microsoft ha smentito l'esistenza del buco, sostenendo che il modo in cui Vista permette l'accesso a diverse parti del sistema operativo non è così semplice. Ha ammesso che si tratta di una debolezza, ma ha dichiarato che è stata una “scelta di architettura”.
> Rutkowska ha detto a ZD Net di non essere contenta delle dichiarazioni di Microsoft riguardo ai potenziali rischi, dichiarazioni che sostengono la tesi che i bug presenti dell'UAC non sono da considerarsi come “security bugs”.




Altre informazioni le trovate [qui](http://theinvisiblethings.blogspot.com/2007/02/vista-security-model-big-joke.html) e [qui](http://blogs.zdnet.com/security/?p=29).

Ringrazio il mio amicone [Nemo](http://blog.neminis.org/) per la segnalazione.

Cosa fa ridere di tutta sta storia? Che questi hanno il modello Unix dei permessi avanti agli occhi da più di 20 anni... e stanno a perdere il tempo a reinventare la ruota ogni volta... pensando di riuscirci... e fallendo sempre miseramente.
