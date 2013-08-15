---
layout: post
author: detro
published: true
title: "How to handle Proxy PAC configuration with Qt"
tags: [qt, javascript, pac, proxy, qtscript, webkit, configuration, qtnetwork]
date: "2011-03-20 19:51:31"
updated: "2011-03-20 19:51:31"
permalink: /2011/03/21/How-to-handle-Proxy-PAC-configuration-with-Qt
---

This article was originally [written on another blog](http://blog.orangelabsuk.com/2010/06/03/extract-proxy-configuration-from-a-pac-file-with-qt/). That blog was never _officially published_, and it will probably never be. It was written on the **3rd of June 2010**, but is still "somewhat important" and relevant.

Since the post was published, **Richard Moore <rich @linux…fpb.site>** has done [a commit in the Qt examples directory that resamples very closely my code below](http://gitorious.org/qt-examples/qt-examples/trees/master/pac-files).

So, I decided to repost it here.

# Qt and Proxy Configuration
What’s great of [Qt](http://qt.nokia.com/), is that it comes with a very rich set of libraries to cover almost everything you can think of. As a Qt developer, you should always double check the Documentation first, to see if “it’s already there”, before jumping into coding. It saves tons of time.

For us a Mobile Developer like me, coming from a [Symbian](http://www.symbian.org/) background, Qt makes me feel “guilty” (stuff gets too easy) and “lazy” (I have to squeeze my neurons less). But I also get more productive.

There are (very small) shortcomings though. Qt provides [QNetworkProxyFactory](http://doc.qt.nokia.com/4.6/qnetworkproxyfactory.html) to get the proxy configuration from the System Configuration, but [it works only on Windows and, partially, on Mac](http://doc.qt.nokia.com/4.6/qnetworkproxyfactory.html#systemProxyForQuery). Other platforms are not handled for now. That’s unfortunate, given that we mainly work with Qt on Symbian and, in my current case, [Maemo 5](http://maemo.org/).

<div class="img">
<img src="http://sis.sissa.it/_media/services/network/proxy/safari/macosx/saf_pac_mod.jpg" alt="Automatic Proxy Configuration on Mac OS X" />
Automatic Proxy Configuration on Mac OS X
</div>

# What could be done on Linux
Of course this can be worked out: in the case of Maemo, being it based on [Linux](http://www.kernel.org/), I will probably just have to find a way to interface with the **gconftool** or make use of `QProcess::systemEnvironment()`. But what if you are in a LAN where the Proxy configuration is distributed across different offices using a [PAC file](http://en.wikipedia.org/wiki/Proxy_auto-config)? Well, you need to work by hand.

A PAC file is a Javascript that looks like this:

```javascript
function FindProxyForURL(url, host) {
   // our local URLs from the domains below example.com don't need a proxy:
   if (shExpMatch(url,"*.example.com/*"))                  {return "DIRECT";}
   if (shExpMatch(url, "*.example.com:*/*"))               {return "DIRECT";}

   // URLs within this network are accessed through
   // port 8080 on fastproxy.example.com:
   if (isInNet(host, "10.0.0.0",  "255.255.248.0"))    {
      return "PROXY fastproxy.example.com:8080";
   }

   // All other requests go through port 8080 of proxy.example.com.
   // should that fail to respond, go directly to the WWW:
   return "PROXY proxy.example.com:8080; DIRECT";
}
```


Working by hand looks scary, because, like in our case, a script can be huge and complex. A [RegExp](http://en.wikipedia.org/wiki/Regular_expression) is a very bad idea, and start from “square one” with [LEX](http://en.wikipedia.org/wiki/Lex_(software)) and [YACC](http://en.wikipedia.org/wiki/Yacc) would feel dumb… and an overkill.

# `QtScript` to the rescue
Fortunately, Qt provides a lot of help. The [QtNetwork](http://doc.qt.nokia.com/4.7-snapshot/network-programming.html) and [QtScript](http://doc.qt.nokia.com/4.7-snapshot/qtscript.html) ([now based on WebKit’s JavascriptCore](http://labs.qt.nokia.com/2009/11/23/qtscript-in-46/)) have what it takes to solve the problem. What I show here is a usage of the QtScript Engine, that takes the PAC file and executes it to extract the right configuration.


```cpp
#include <QtCore/QCoreApplication>
#include <QScriptEngine>
#include <QIODevice>
#include <QFile>
#include <QDebug>
#include <QScriptValue>
#include <QHostInfo>
#include <QHostAddress>
#include <QNetworkInterface>

// Functions to implement are here:
// - http://linuxmafia.com/faq/Web/autoproxy.html
// - http://www.returnproxy.com/proxypac/static/netscape-proxy-format.html

QScriptValue dnsResolve(QScriptContext *context, QScriptEngine *engine) {
   Q_UNUSED(engine)
   QString toResolve = context->argument(0).toString();
   qDebug() << "dnsResolve - toResolve: " << toResolve;

   QHostInfo info = QHostInfo::fromName(toResolve);
   if ( info.error() == QHostInfo::NoError ) {
      return info.addresses().first().toString(); //< Pick the first one
   } else {
      return QString("Host not found");
   }
}

QScriptValue isPlainHostName(QScriptContext *context, QScriptEngine *engine) {
   Q_UNUSED(engine)
   QString hostname = context->argument(0).toString();
   qDebug() << "isPlainHostName - hostname: " << hostname;

   return hostname.contains('.') ? false : true;
}

QScriptValue isInNet(QScriptContext *context, QScriptEngine *engine) {
   Q_UNUSED(engine)
   QString host = context->argument(0).toString();
   QHostAddress hostAddress;
   QPair<QHostAddress, int> subnet;
   QString pattern = context->argument(1).toString();
   QString mask = context->argument(2).toString();
   qDebug() << "isInNet - host: " << host;
   qDebug() << "isInNet - pattern: " << pattern;
   qDebug() << "isInNet - mask: " << mask;

   QHostInfo info = QHostInfo::fromName(host);
   if ( info.error() == QHostInfo::NoError ) {
      hostAddress = info.addresses().first();
      subnet = QHostAddress::parseSubnet(QString("%1/%2").arg(pattern,mask));
      qDebug() << "Host "<< host << " is in Subnet " << QString("%1/%2").arg(pattern,mask) << "? " << hostAddress.isInSubnet(subnet);
      return hostAddress.isInSubnet(subnet);
   } else {
      return false;
   }
}

QScriptValue myIpAddress(QScriptContext *context, QScriptEngine *engine) {
   Q_UNUSED(context)
   Q_UNUSED(engine)

   foreach ( QHostAddress address, QNetworkInterface::allAddresses() ) {
      if( !address.isNull()
         && address != QHostAddress::Null
         && address != QHostAddress::LocalHost
         && address != QHostAddress::LocalHostIPv6
         && address != QHostAddress::Broadcast
         && address != QHostAddress::Any
         && address != QHostAddress::AnyIPv6
         ) {
         qDebug() << "myIpAddress - " << address.toString();
         return address.toString(); //< Pick the First one
      }
   }
}

int main(int argc, char *argv[])
{
   QCoreApplication a(argc, argv);

   QScriptEngine engine;
   QString str;

   // Read the PAC file in a String
   QFile scriptFile(":/proxy-config.pac");
   if ( !scriptFile.open(QIODevice::ReadOnly|QIODevice::Text) ) {
      return EXIT_FAILURE;
   }
   str = scriptFile.readAll();
   scriptFile.close();

   // Inject the extra JS function as explained above
   QScriptValue dnsResolveFunction = engine.newFunction(dnsResolve);
   engine.globalObject().setProperty("dnsResolve", dnsResolveFunction);
   QScriptValue isPlainHostNameFunction = engine.newFunction(isPlainHostName);
   engine.globalObject().setProperty("isPlainHostName", isPlainHostNameFunction);
   QScriptValue isInNetFunction = engine.newFunction(isInNet);
   engine.globalObject().setProperty("isInNet", isInNetFunction);
   QScriptValue myIpAddressFunction = engine.newFunction(myIpAddress);
   engine.globalObject().setProperty("myIpAddress", myIpAddressFunction);

   // Evalute the PAC file
   if ( engine.canEvaluate(str) ) {
      engine.evaluate(str);
      QScriptValue ctor = engine.evaluate("FindProxyForURL(\"http://blog.orangelabsuk.com\", \"blog.orangelabsuk.com\")");
      if ( !ctor.isError() ) {
         qDebug() << ctor.toString();
         return EXIT_SUCCESS;
      }
   }

   qDebug() << "Error Occurred";
   return EXIT_FAILURE;
}
```


As you can see, what I had to add to the QtScript module was just the implementation of some of the core functions that a PAC interpreter has to offer. Those are not part of the standard Javascript, but QtScript makes it super-easy to inject what is missing.

# Contributing back?
Maybe I’ll should see if the Trolls are interested in getting something like that added to Qt. Maybe a method like

```cpp
QNetworkProxyFactory::proxyForPac(const QIODevice &pacFile)
```

could be added to the current QNetworkProxyFactory.

**What do you think?**

PS If you are asking yourself if there is a BUG/FEATURE-REQUEST on the Qt Official Bugzilla, here is what you can currently find:

* [QTBUG-2069](http://bugreports.qt.nokia.com/browse/QTBUG-2069)
* [QTBUG-9588](http://bugreports.qt.nokia.com/browse/QTBUG-9588)

and both are marked as _“P3: Somewhat important”_.
