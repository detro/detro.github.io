---
layout: post
author: detro
title: "TFactory (seconda parte)"
tags: [uncategorized]
date: "2004-11-18T01:16:33Z"
aliases:
  - /2004/11/18/tfactory-seconda-parte
  - /2004/11/tfactory-seconda-parte
---



Come avevo anticipato (o no?) ecco il codice della <b>Factory</b> che carica Classi a <i>Run-Time</i> (tipo <i>Plug-In</i>) in <b>C++</b>.
E' anche (indecentemente) commentata, quindi: divertitevi...

**#ifndef _TFACTORY_H_**
#define _TFACTORY_H_
#include "TFactoryException.h"
#include <dlfcn.h> // Libreria "Dynamic Lynking Loader"</dlfcn.h>

/** 
 * @class TFactory TFactory.h
 * Questa Classe Template ha il compito di @b Istanziare @b a @b Run-Time Classi
 * la cui Dichiarazione e Definizione non e' avvenuta a @b Compile-Time.
 * In sostanza, si parla di realizzare un sistema per la gestione
 * di quelli che, in gergo, si chiamano @b Plug-In: mini-programmi che
 * si aggiungono ad altri piu' grandi per aumentarne le funzionalita'.
 * 
 * E' una "Factory" di Classi @a Plug-In.

 * Carica da libreria SO la definizione di una Classe che ha come 
 * Classe di Base il Parametro passato alla Factory: in questo modo e'
 * sufficiente, per realizzare classi Plug-In, che le Classi da Istanziare 
 * a Run-Time implementino un'interfaccia comune.
 *    
 * Per la precisione, e' anche necessario che nella libreria SO che
 * contiene la classe sia presente una funzione cosÏ definita:


 *
 * <code></code>
 * extern "C"

 * <classname> *buildObject(void) { return new <classname>; }
</classname></classname>
 *

 *
 * @c buildObject(void) crea effettivamente una istanza della Classe Plug-In.
 *
 * Questa soluzione permette quindi di caricare nuove Classi senza
 * bisogno ne di ricompilare, ne di modificare il codice. */
template <class></class>
class TFactory {
    public:
        TFactory(const string &);
        ~TFactory();
        T build () ;
        void closeSo();
        
    private:
        /* Handler della SO caricata */
        void *handler;
        /* Puntatore alla funzione (o, meglio, al "simbolo")
         * ritornato da "dlsym" */
        T (*builder)(void);
        void openSo(const string &);
};

/**
 * Costruttore TFactory.
 * Si occupa anche di recuperare i Simboli (@c "buildObject" ) 
 * necessari all'istanziazione di una nuova T Class.
 *
 * @param soLibPath Path alla Libreria SO da dove caricare la definizione
 *     della Classe */
template <class></class>
TFactory<t>::TFactory(const string &soLibPath) {</t>
    try {
        /* Caricamento della SO */
        openSo(soLibPath);
        /* Casting necessario per una corretta assegnazione
         * della funzione al relativo puntatore */
        *(void **) (&builder) = dlsym(handler, "buildObject");
        /* Controlla che il Simbolo Cercato ("buildObject") sia
         * stato trovato... */
        if ( builder == NULL ) { // Errore nel caricamento della funzione
            /* ...in caso negativo, lancia un TFactoryException */
            string exceptionMessage("<tfactory> ERROR: ");</tfactory>
            exceptionMessage += dlerror();
            throw TFactoryException(exceptionMessage);
        }
    }
    catch ( TFactoryException &e ) {
        throw e;
    }
    cout << "<tfactory> Plug-In Loaded. Library-Path: "<<>
}

/** Distruttore TFactory */
template <class></class>
TFactory<t>::~TFactory() {}</t>

/**
 * Restituisce una istanza della Classe contenuta nella SO.
 * L'oggetto restituito e' UP-Castato alla Classe Base "T"
 * (parametro del Template) 
 * @return Una nuova istanza di T (T = Parametro di TFactory) */
template <class></class>
T TFactory<t>::build() {</t>
    return ( (*builder)() ); // Ritorna la nuova istanza di T
}

/**
 * Carica la libreria SO.
 *
 * @param soLibPath Libreria SO da caricare */
template <class></class>
void TFactory<t>::openSo(const string &soLibPath) {</t>
    /* Apertura della Libreria SO */
    handler = dlopen( soLibPath.data(), RTLD_NOW);
    
    if (!handler) {
        string exceptionMessage("<tfactory> ERROR: ");</tfactory>
        exceptionMessage += dlerror();
        throw TFactoryException(exceptionMessage);
    }
}

/** Chiude la libreria SO */
template <class></class>
void TFactory<t>::closeSo() {</t>
    if (handler) {
        dlclose(handler);
        handler = NULL;
    }
}

#endif

Per una migliore lettura, consiglio un bel Cut&amp;Paste, magari in qualche Beautifier...


