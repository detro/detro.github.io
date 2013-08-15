---
layout: post
author: detro
published: true
title: "XGL: OpenGL sempre più prepotentemente sui nostri Desktop"
tags: [c, english, sw, it, opensource, linux, novell, projects, italian]
date: "2006-02-11 00:54:09"
updated: "2006-02-11 00:54:09"
permalink: /2006/02/11/xgl-opengl-sempre-piu-prepotentemente-sui-nostri-desktop/
---

<a href="http://freedesktop.org/wiki/Software_2fXgl">XGL</a>: tutti ne stanno parlando ultimamente. Ci sono articoli in ogni dove su XGL ma... che é?
Prendiamo da <a href="http://en.wikipedia.org/wiki/Xgl">Wikipedia</a>:
<blockquote>Xgl is an <a href="http://en.wikipedia.org/wiki/X_Window_System">X server architecture</a>, started by <a href="http://en.wikipedia.org/wiki/David_Reveman">David Reveman</a>, layered on top of <a href="http://en.wikipedia.org/wiki/OpenGL">OpenGL</a> via <a href="http://en.wikipedia.org/wiki/Glitz">glitz</a>. Some say that it is seen as the future of the <a href="http://en.wikipedia.org/wiki/X.Org_Server">X.Org Server</a>, but some disagree because it requires a 3D graphics card. Although most PCs are nowadays shipped with such a card, most vendors (most notably NVIDIA and ATI Technologies) don't provide open source drivers for their cards, which do not work on all computer architectures supported by the X.Org Server.

As of January 2006, it is still at an early stage in development and a number of important pieces are still missing, but progressed well in 2005. Its source was opened up on January 2, 2006 <a href="http://lists.freedesktop.org/archives/xorg/2006-January/011922.html">[1]</a> <a href="http://lwn.net/Articles/166081/">[2]</a>, and included in <a href="http://en.wikipedia.org/wiki/Freedesktop.org">freedesktop.org</a>, along with major restructuring to allow wider range of supported display drivers. X server backends used by Xgl include <a href="http://en.wikipedia.org/wiki/Xgl">Xglx</a> and <a href="http://en.wikipedia.org/wiki/Xgl">Xegl</a>. In February 2006 the server gained wide publicity after a public display where the Novell desktop team could demonstrate a desktop with much eye-candy such as translucent windows and a rotating 3D desktop. <a href="http://www.novell.com/linux/xglrelease/">The eye-candy effects</a> are implemented in a compositing window manager called <a href="http://en.wikipedia.org/wiki/Compiz">Compiz</a> <a href="http://cvs.freedesktop.org/xapps/compiz/">[3]</a>. </blockquote>

<img src="http://www.novell.com/linux/xglrelease/img/transparency1.jpg" align="right" width="150" />
Quindi, per farla breve, questo XGL é una implementazione di XServer (che trova la sua prima embrionale realizzazione in Xglx) e che si basa, per ora, sull'uso di X.Org come backend preesistente. Novell ha sviluppato, in concomitanza, un nuovo <a href="http://en.wikipedia.org/wiki/Window_manager">Window Manager</a>/<a href="http://en.wikipedia.org/wiki/Compositing_manager">Compositing Manager</a> chiamato Compiz che <ins datetime="2006-02-10T22:06:06+00:00">potrebbe</ins> (il condizionale é d'obbligo) entrare a far parte del progetto Gnome e, forse/addirittura, soppiantare <a href="http://en.wikipedia.org/wiki/Metacity">Metacity</a>. Il condizionale é d'obbligo perché:
<ol>
<li>Non voglio essere linciato da chi ne capisce più di me in questo campo</li>
<li>Le notizie sono ancora confuse, dato che poca gente ha già messo piede sul <a href="http://cvs.freedesktop.org/xorg/xserver/xorg/hw/xgl/?only_with_tag=xgl-0-0-1">CVS ufficiale</a> <a href="http://www.novell.com/linux/xglrelease/">rilasciato da Novell</a></li>
<li>Non ho tempo per mettermi con le mani nel codice personalmente</li>
<li>Si tratta di un progetto alla versione 0.0.1 e come tale poco più che un agglomerato di <a href="http://en.wikipedia.org/wiki/API">API</a></li>
</ol>

Inoltre, esiste un progetto a mio parere ben più interessante sul lungo termine:
<blockquote><strong>Xegl</strong> is the future of Xgl and the long term goal of X server development. Xegl is a server that implements the <a href="http://en.wikipedia.org/wiki/Native_Platform_Graphics_Interface">EGL API</a> and uses <a href="http://en.wikipedia.org/wiki/Mesa_3D">Mesa-solo</a> to provide OpenGL rendering directly to the Linux framebuffer. As of August 2005 Xegl can only be run using Radeon R200 graphics hardware and development has currently been delayed... (continua su <a href="http://en.wikipedia.org/wiki/Xgl">Wikipedia</a>)</blockquote>
A quanto pare il consorzio/organizzazione OpenGL si é spremuta le meningi per sviluppare uno standard, EGL appunto, su cui basare lo sviluppo di tutti i futuri Desktop-Environment, partendo dalla base stessa: il Server Grafico.

Come molti utenti, anche io storco un attimino il naso: se non disporrò di una scheda grafica 3D, presto mi ritroverò a non poter usare nulla dei nuovi programmi che verranno sviluppati per il Desktop Linux. Ma il mio storcere il naso é maggiormente rivolto a tutti quei produttori che, per un motivo o per un altro, ancora non vedono il Pinguino come un mercato per cui sviluppare driver. E sarei anche disposto ad usare un driver chiuso (come quello di <a href="http://en.wikipedia.org/wiki/NVIDIA">Nvidia</a>).

Ma cos'é quindi quello che sta facendo maggior scalpore tra gli utenti?
Bhé, che domande: i video no? Ne sono usciti di demo (uno l'ho appena scaricato e appena finisco di scrivere me lo vado a gustare) e devo dire che di promesse ce ne sono tante.

C'é però da sottolineare una cosa importante: TUTTI cercano di emulare o espandere i concetti  che Apple propone RIGHT NOW ai suoi utenti. Ma, si deve anche aggiungere, ho visto cose davvero interessanti, come delle gustose "mescolanze" di Exposé e classico Tab-Switching. Trovate tutto nei link sotto.

Infine, una domanda: ma Novell crede proprio tanto nel Desktop Linux? Diavolo, vi rendete conto dell'enorme esborso economico che sta affrontando e delle energie (soprattutto di marketing) che sta investendo? Anche se stesse spendendo poco in denaro, un eventuale fallimento sarebbe assolutamente distruttivo, non trovate?

Chi vivrà, vedrà (e mai come ora é il caso di dirlo)...

Eccovi quindi una bella serie di link da cui attingere:
<ul>
<li><a href="http://www.linuxedge.org/videos/NLD_SLconf_1.avi">Presentazione stampa 01</a></li>
<li><a href="http://www.linuxedge.org/videos/NLD_SLconf_2.avi">Presentazione stampa 02</a></li>
<li><a href="http://www.linuxedge.org/videos/NLD_SLconf_3.avi">Presentazione stampa 03</a></li>
<li><a href="http://www.linuxedge.org/videos/NLD_SLconf_4.avi">Presentazione stampa 04</a></li>
<li><a href="http://www.novell.com/linux/xglrelease/">Comunicato Ufficiale di Release con video in .mpg, .ogg e flash-stream</a></li>
<li><a href="http://www.freedesktop.org/%7Edavidr/xgl-demo1.xvid.avi">ALL-IN-ONE O_o</a></li>
</ul>

Bhè, non sono riuscito ad attendere e quindi ho visto l'ultimo video della lista prima ancora di finire di scrivere questo post e... c'é da rimanere basiti.
Ci sono finezze grafiche ed effetti che negli altri video non compaiono (forse perché di bassa qualità rispetto a questo): un esempio su tutti é l'effetto di "desaturazione" (alias, decolorazione) per le applicazioni che dovessere "non rispondere più ai comandi". Una finezza a dir poco stupenda. Quasi quasi faccio crashare FF per il solo gusto di vederlo desaturare :D .

<strong>Ovviamente, tutti gli effetti sono SEMPRE GRADUALI: ogni transizione di colore, ogni effetto di deformazione, apparizione, scomparsa... sono tutti GRADUALI e dolci. I pop-up sono quasi "fisici" e viene voglia di toccarli, tanta é la loro "consistenza ottica".</strong>

Xgl, é giusto concludere così, può tramutarsi davvero in una Killer-Application per il Desktop Linux ma... é inutile farsi illusioni: <ins datetime="2006-02-10T23:55:05+00:00">se non si produce software che sappia ben sfruttare tutto questo, gli effetti "spettacolosi" lasceranno il tempo che trovano</ins>.

<em>Ora, non ci resta che aspettare (per i più pigri e/o occupati) o smanettare con il CVS (per i più intraprendenti e/o nullafacenti).</em>
