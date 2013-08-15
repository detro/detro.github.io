---
layout: post
author: detro
published: true
title: "Need to ship your Qt app for Mac? Bundle it up!"
tags: [osx, qt, deploy, mac os x, app, howto, bundle, mac, static, cpp, linkage]
date: "2011-04-27 16:40:34"
updated: "2011-04-27 16:51:40"
permalink: /2011/04/28/Need-to-ship-your-Qt-app-for-Mac-Bundle-it-up
---

I'm contributing some code and GCC-CPU-time to [PhantomJS](https://github.com/ariya/phantomjs). It's a brilliant idea and I hope it will grow, maybe with some help from me as well.

I have recently spent some time working out how to go from a "compiled from source" version, to generate a shippable executable. For Mac, in my case.

<div class="img">
<img src="http://i.ehow.co.uk/images/a04/j8/5h/fold-cute-origami-gift-box-800x800.jpg" alt="a 'cute' bundle" />
a 'cute' bundle
</div>

I'll explain how to bundle up your Qt based application, so that you can ship it. PhantomJS will be my reference example.

## Static build? Don't do it!
PhantomJS is build on top of [(Qt)WebKit](http://trac.webkit.org/wiki/QtWebKit). 

The initial idea was to build Qt libraries enabling **static linkage** (i.e. passing `-static` to `./configure` script). But I soon discovered that [QtWebKit can't be linked statically](http://doc.trolltech.com/4.7/developing-on-mac.html#building-qt-statically):
<blockquote>
[...] Static builds are only partially supported, meaning that you can build most of Qt statically, but some modules, like web-kit and Designer, will fail. [...]
</blockquote>

So, for PhantomJS was a no go. But I would say in general that if you are building an Application for Mac, you should ship it following the platform "expected format". In other words, as classical **`.app bundle`**.

## What are we going to do
We want to create a `.app` and ship it within a `.dmg` file. To do that, we need to:
* Get Qt source and build it
* Build the `.app`
* Tune it (optional)
* Generate the final `.dmg` package

## Get Qt source and build it
It's advisable NOT to use Qt from the official repo for this. Instead, download latest stable source from [http://qt.nokia.com/downloads](http://qt.nokia.com/downloads) and _untar_ with the following command:

```bash
$ mkdir ~/tmp
$ cd ~/tmp
$ tar -xzf ~/Downloads/qt-everywhere-opensource-src-<latest stable>.tar.gz 
```

it will ensure that you build your code against the most stable Qt.

Once finished downloading, build like this:

```bash
$ cd ~/tmp/qt-everywhere-opensource
$ ./configure -universal -carbon -framework -release \
   -opensource -no-exceptions -webkit -no-phonon \
   -no-xmlpatterns -no-qt3support -no-sql-sqlite -no-stl \
   -no-declarative -prefix $PWD
$ make -j3 sub-src
```


Most of the above _configure flags_ it's focused on compile the minimum necessary to build PhantomJS:

* "`-no-phonon -no-xmlpatterns -no-qt3support -no-sql-sqlite -no-stl -no-declarative`" disabled Phonon, XML Patterns, Qt 3 support, SQLite, STL, Qt Quick for this build
* "`-universal -carbon`" ensures that we build for both `x86` and `ppc` architecture, and maintaining compatibility with older version of Mac OS X
* "`-framework`" ensures that Mac OS X-style framework bundles are built, to be later included/embedded in our own PhantomJS bundle

**You should change those flags based on your needs**. Refer to [this documentation](http://doc.trolltech.com/4.7/configure-options.html) or just type:

```bash
$ ./configure --help
```


After the build has finished without errors, just add the "`/bin`" directory in "`~/tmp/qt-everywhere-opensource`" to the "`PATH`" environment variable. Do something like:

```bash
$ export PATH=~/tmp/qt-everywhere-opensource/bin/:$PATH
```


## Build the `.app`
I assume you know where to get your source code :-). I will use the path **`/sourcedir/`** to refer to it.

In case you want to build for `x86` and `ppc`, you also need to add to your Qt project `.pro` file:

```c
...
mac: CONFIG += x86 ppc
...
```


Time to compile:

```bash
$ qmake -spec macx-g++ -config release && make
```

Finger crossed, all compiled fine.

## Tune it (optional)
For PhantomJS we didn't want the classical _bouncy icon_ on the Dock to appear at every execution, given that PhantomJS is a command line tool. If you are in the same situation, edit "`/sourcedir/bin/yourproject.app/Content/Info.plist`" and add the attribute:

```xml
<key>LSUIElement</key>
<string>1</string>
```


`Info.plist` allows to control many more things than just the Dock icon. Apple documentation about this it's [here](http://developer.apple.com/library/mac/#documentation/MacOSX/Conceptual/BPRuntimeConfig/000-Introduction/introduction.html). Tune it as you like/need.

## Generate the final `.dmg` package
The Trolls provide a simple tool to convert a dynamically linked executable, in a self contained "`.app`" file. The tool is called "`macdeployqt`" and you can find a description [here](http://doc.qt.nokia.com/4.7/deployment-mac.html#the-mac-deployment-tool).

It's part of the Qt source code, but it's not built by default. So, assuming you still have the previously compiled Qt in your `PATH`, do the following:

```bash
$ cd ~/tmp/qt-everywhere-opensource/tools/macdeployqt
$ qmake -spec macx-g++ && make && make install
```


We are ready to package. The last bit to do:

```bash
$ cd /sourcedir/bin/
$ macdeployqt phantomjs.app -verbose=2 -dmg
```


*Done!* Now you have got a nice `.dmg` ready for deployment.

## A word of advice
I strongly recommend to read the [Development](http://doc.trolltech.com/4.7/developing-on-mac.html) and [Deployment](http://doc.qt.nokia.com/4.7/deployment-mac.html) on Mac, from the official Qt documentation. Top to bottom. It's full of useful information and can really help out to understand the _full picture_.

_Happy bundling ;-)_
