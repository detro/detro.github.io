---
layout: post
author: detro
title: "XGL: OpenGL sempre più prepotentemente sui nostri Desktop"
tags: [c, english, sw, it, opensource, linux, novell, projects, italian]
date: "2006-02-11T00:54:09Z"
---

[XGL](http://freedesktop.org/wiki/Software_2fXgl): tutti ne stanno parlando ultimamente. Ci sono articoli in ogni dove su XGL ma... che é?
Prendiamo da [Wikipedia](http://en.wikipedia.org/wiki/Xgl):


> Xgl is an [X server architecture](http://en.wikipedia.org/wiki/X_Window_System), started by [David Reveman](http://en.wikipedia.org/wiki/David_Reveman), layered on top of [OpenGL](http://en.wikipedia.org/wiki/OpenGL) via [glitz](http://en.wikipedia.org/wiki/Glitz). Some say that it is seen as the future of the [X.Org Server](http://en.wikipedia.org/wiki/X.Org_Server), but some disagree because it requires a 3D graphics card. Although most PCs are nowadays shipped with such a card, most vendors (most notably NVIDIA and ATI Technologies) don't provide open source drivers for their cards, which do not work on all computer architectures supported by the X.Org Server.
>> As of January 2006, it is still at an early stage in development and a number of important pieces are still missing, but progressed well in 2005. Its source was opened up on January 2, 2006 [[1]](http://lists.freedesktop.org/archives/xorg/2006-January/011922.html) [[2]](http://lwn.net/Articles/166081/), and included in [freedesktop.org](http://en.wikipedia.org/wiki/Freedesktop.org), along with major restructuring to allow wider range of supported display drivers. X server backends used by Xgl include [Xglx](http://en.wikipedia.org/wiki/Xgl) and [Xegl](http://en.wikipedia.org/wiki/Xgl). In February 2006 the server gained wide publicity after a public display where the Novell desktop team could demonstrate a desktop with much eye-candy such as translucent windows and a rotating 3D desktop. [The eye-candy effects](http://www.novell.com/linux/xglrelease/) are implemented in a compositing window manager called [Compiz](http://en.wikipedia.org/wiki/Compiz) [[3]](http://cvs.freedesktop.org/xapps/compiz/). 



![](http://www.novell.com/linux/xglrelease/img/transparency1.jpg)
Quindi, per farla breve, questo XGL é una implementazione di XServer (che trova la sua prima embrionale realizzazione in Xglx) e che si basa, per ora, sull'uso di X.Org come backend preesistente. Novell ha sviluppato, in concomitanza, un nuovo [Window Manager](http://en.wikipedia.org/wiki/Window_manager)/[Compositing Manager](http://en.wikipedia.org/wiki/Compositing_manager) chiamato Compiz che <ins datetime="2006-02-10T22:06:06+00:00">potrebbe</ins> (il condizionale é d'obbligo) entrare a far parte del progetto Gnome e, forse/addirittura, soppiantare [Metacity](http://en.wikipedia.org/wiki/Metacity). Il condizionale é d'obbligo perché:

* Non voglio essere linciato da chi ne capisce più di me in questo campo

* Le notizie sono ancora confuse, dato che poca gente ha già messo piede sul [CVS ufficiale](http://cvs.freedesktop.org/xorg/xserver/xorg/hw/xgl/?only_with_tag=xgl-0-0-1) [rilasciato da Novell](http://www.novell.com/linux/xglrelease/)

* Non ho tempo per mettermi con le mani nel codice personalmente

* Si tratta di un progetto alla versione 0.0.1 e come tale poco più che un agglomerato di [API](http://en.wikipedia.org/wiki/API)

Inoltre, esiste un progetto a mio parere ben più interessante sul lungo termine:


> <strong>Xegl</strong> is the future of Xgl and the long term goal of X server development. Xegl is a server that implements the [EGL API](http://en.wikipedia.org/wiki/Native_Platform_Graphics_Interface) and uses [Mesa-solo](http://en.wikipedia.org/wiki/Mesa_3D) to provide OpenGL rendering directly to the Linux framebuffer. As of August 2005 Xegl can only be run using Radeon R200 graphics hardware and development has currently been delayed... (continua su [Wikipedia](http://en.wikipedia.org/wiki/Xgl))


A quanto pare il consorzio/organizzazione OpenGL si é spremuta le meningi per sviluppare uno standard, EGL appunto, su cui basare lo sviluppo di tutti i futuri Desktop-Environment, partendo dalla base stessa: il Server Grafico.

Come molti utenti, anche io storco un attimino il naso: se non disporrò di una scheda grafica 3D, presto mi ritroverò a non poter usare nulla dei nuovi programmi che verranno sviluppati per il Desktop Linux. Ma il mio storcere il naso é maggiormente rivolto a tutti quei produttori che, per un motivo o per un altro, ancora non vedono il Pinguino come un mercato per cui sviluppare driver. E sarei anche disposto ad usare un driver chiuso (come quello di [Nvidia](http://en.wikipedia.org/wiki/NVIDIA)).

Ma cos'é quindi quello che sta facendo maggior scalpore tra gli utenti?
Bhé, che domande: i video no? Ne sono usciti di demo (uno l'ho appena scaricato e appena finisco di scrivere me lo vado a gustare) e devo dire che di promesse ce ne sono tante.

C'é però da sottolineare una cosa importante: TUTTI cercano di emulare o espandere i concetti  che Apple propone RIGHT NOW ai suoi utenti. Ma, si deve anche aggiungere, ho visto cose davvero interessanti, come delle gustose "mescolanze" di Exposé e classico Tab-Switching. Trovate tutto nei link sotto.

Infine, una domanda: ma Novell crede proprio tanto nel Desktop Linux? Diavolo, vi rendete conto dell'enorme esborso economico che sta affrontando e delle energie (soprattutto di marketing) che sta investendo? Anche se stesse spendendo poco in denaro, un eventuale fallimento sarebbe assolutamente distruttivo, non trovate?

Chi vivrà, vedrà (e mai come ora é il caso di dirlo)...

Eccovi quindi una bella serie di link da cui attingere:

* [Presentazione stampa 01](http://www.linuxedge.org/videos/NLD_SLconf_1.avi)

* [Presentazione stampa 02](http://www.linuxedge.org/videos/NLD_SLconf_2.avi)

* [Presentazione stampa 03](http://www.linuxedge.org/videos/NLD_SLconf_3.avi)

* [Presentazione stampa 04](http://www.linuxedge.org/videos/NLD_SLconf_4.avi)

* [Comunicato Ufficiale di Release con video in .mpg, .ogg e flash-stream](http://www.novell.com/linux/xglrelease/)

* [ALL-IN-ONE O_o](http://www.freedesktop.org/%7Edavidr/xgl-demo1.xvid.avi)

Bhè, non sono riuscito ad attendere e quindi ho visto l'ultimo video della lista prima ancora di finire di scrivere questo post e... c'é da rimanere basiti.
Ci sono finezze grafiche ed effetti che negli altri video non compaiono (forse perché di bassa qualità rispetto a questo): un esempio su tutti é l'effetto di "desaturazione" (alias, decolorazione) per le applicazioni che dovessere "non rispondere più ai comandi". Una finezza a dir poco stupenda. Quasi quasi faccio crashare FF per il solo gusto di vederlo desaturare :D .

<strong>Ovviamente, tutti gli effetti sono SEMPRE GRADUALI: ogni transizione di colore, ogni effetto di deformazione, apparizione, scomparsa... sono tutti GRADUALI e dolci. I pop-up sono quasi "fisici" e viene voglia di toccarli, tanta é la loro "consistenza ottica".</strong>

Xgl, é giusto concludere così, può tramutarsi davvero in una Killer-Application per il Desktop Linux ma... é inutile farsi illusioni: <ins datetime="2006-02-10T23:55:05+00:00">se non si produce software che sappia ben sfruttare tutto questo, gli effetti "spettacolosi" lasceranno il tempo che trovano</ins>.

<em>Ora, non ci resta che aspettare (per i più pigri e/o occupati) o smanettare con il CVS (per i più intraprendenti e/o nullafacenti).</em>
