---
layout: post
author: detro
published: true
title: "Scope 'this', and scope 'that'"
tags: [c/c++, script, this, pattern, phantomjs, javascript, that, invocation, scope, example]
date: "2012-02-12 21:18:07"
updated: "2012-02-13 08:22:19"
permalink: /2012/02/13/Scope-this-and-scope-that
---

As a guy that tries to live his professional life in the middle of the dichotomy "C/C++ - JavaScript", I often find myself discussing the discrepancies, differences and implementation details of the _latter_ (an half-assed prototypal language) using the _former_.

The other day I was chatting with Luca (@lucabox) about **scope** in JS, and we were describing the different situations you can end up with... and how we work our way out of those culprits.

What I did later on, was picking up [JS-Bible](http://www.amazon.co.uk/exec/obidos/ASIN/0596517742/) and go to Chapter 4, _Functions_. I strongly advice you get yourself one and read that chapter again and again, as I did now for the 3rd time. Every time there is a little bit of news to grow your knowledge. That book has to stay on your desk, at any time.

After that I did the obvious: `git checkout master && qmake && make` my beloved [PhantomJS](http://www.phantomjs.org/) and started fiddling around.

In Chapter 4 of Crockford's there is a section called _"Invocation"_: there The Man highlights the 4 Invocation Patterns that can be used in JavaScript. What I wrote was a practical demonstration of those patterns: this way it would be an easy documentation of how **functional scoping is such a tricky _bitch_ to handle**.

## The "subject"
First, I wrote this function:

```javascript
var foo, obj, that, Constructor, ClosuredScope;
aVariable = "I'm a String in a global (attached to 'window')";

// 'foo', but no 'bar'
foo = function(callMessage) {
    console.log("\n\033[0;32m" + callMessage + " {\033[0m");    //< console.log(callMessage + "{");

    console.log(aVariable);
    console.log(this.aVariable);
    console.log(window.aVariable);
    if (typeof(that) != "undefined" && that.aVariable) {
        console.log(that.aVariable + " (passed via \033[0;31m'that'\033[0m)");
    }
    if (this === window) {
        console.log("Here \033[0;31m'this'\033[0m resolves to \033[0;31m'window'\033[0m");
    }

    console.log("\033[0;32m}\033[0m\n");                        //< console.log("}");
};
```


What this those is reading the value of `aVariable`, taking it **implicitly from the current scope** and **explicitly from `this`** (i.e. pointer to the current _scope_) and ** from `window`** (i.e. the gloval _scope_). Also, it does a couple of extra bits:

* Checks if there is `that.aVariable` in the current scope (in case we are using the famous `that = this` trick)
* Highlights when the magical JS Runtime is using the global scope (`window`) as local scope (`this`)

Yes, and I added some bash colouring to my print-out: I like to have the key stuff highlighted to me.

## Function Invocation Pattern
I started with something very easy:

```javascript
// Function Invocation Pattern
foo("*** Proving the 'Function Invocation Pattern' ***");
```


that will print out:

```console
*** Proving the 'Function Invocation Pattern' *** {
I'm a String in a global (attached to 'window')
I'm a String in a global (attached to 'window')
I'm a String in a global (attached to 'window')
Here 'this' is equal to 'window'
}
```


What's happening here is obvious: **the scope in which the invocation is executed, is parent of the internal scope of the callee**. Hence, if a variable is not found in the local scope, will be looked-up in the parent scopes(s).

But we all knew that, didn't we?

## Method Invocation Pattern
Now, let's start to have some fun:

```javascript
// Method Invocation Pattern
obj = {
    aVariable : "I'm a String in an object (i.e. scope/'this')",
    foo : foo
};
obj.foo("*** Proving the 'Method Invocation Pattern' ***");
```


the above will print:

```console
*** Proving the 'Method Invocation Pattern' *** {
I'm a String in a global (attached to 'window')
I'm a String in an object (i.e. scope/'this')
I'm a String in a global (attached to 'window')
}
```


The object `obj` to which we added a reference to foo, now acts as the scope parenting the internal function scope. Hence, `aVariable` is found in `obj`, set to something different. In other words, during the invocation the function run in a scope where `obj === this`.

## Constructor Invocation Pattern + Prototype Inheritance

```javascript
// Constructor Invocation Pattern + Prototype Inheritance
Constructor = function(s) {
    this.aVariable = s;
};
Constructor.prototype.foo = foo;
obj = new Constructor("I'm a String in an object (i.e. scope/'this'), assigned via a Constructor");
obj.foo("*** Proving the 'Constructor Invocation Pattern + Prototype Inheritance' ***");
```


predictably this prints:

```console
*** Proving the 'Constructor Invocation Pattern + Prototype Inheritance' *** {
I'm a String in a global (attached to 'window')
I'm a String in an object (i.e. scope/'this'), assigned via a Constructor
I'm a String in a global (attached to 'window')
}
```


when I was working at Betfair, I found this kind of inheritance in the hierarchy we used, and all was based on [YUI2](http://developer.yahoo.com/yui/2/). Than moved to more Closure-based inheritances with [YUI3](http://yuilibrary.com/).

It's not a bad pattern per se, and makes it pretty clear to understand what's going on, but it does not offer the protection of Closures.

## Constructor Invocation Pattern + Closure
Here I have to take a bit of "liberty" and make some ugly detour:

```javascript
ClosuredScope = function(s) {
    var aVariable = s;
    this.aVariable = s;
    this.fooWrapper = function(m) { foo(m); console.log(aVariable + " (from the wrapper)"); };
    this.fooOriginal = foo;
};
obj = new ClosuredScope("I'm a String in an object (i.e. scope/'this'), accessible via Closure");
obj.fooOriginal("*** Proving the 'Constructor Invocation Pattern + Closure' (original) ***");
obj.fooWrapper("*** Proving the 'Constructor Invocation Pattern + Closure' (wrapper) ***");
```


that prints out:

```console
*** Proving the 'Constructor Invocation Pattern + Closure' (original) *** {
I'm a String in a global (attached to 'window')
I'm a String in an object (i.e. scope/'this'), accessible via Closure
I'm a String in a global (attached to 'window')
}


*** Proving the 'Constructor Invocation Pattern + Closure' (wrapper) *** {
I'm a String in a global (attached to 'window')
I'm a String in a global (attached to 'window')
I'm a String in a global (attached to 'window')
Here 'this' resolves to 'window'
}

I'm a String in an object (i.e. scope/'this'), accessible via Closure (from the wrapper)
```


In the first invocation (i.e. `obj.fooOriginal(...)`) the callee acts as expected: same printout as per the Prototype Inheritance. But when invoked by `obj.fooWrapper(...)` `obj`'s scope is not made parent of the callee scope, as it is invoked _as-is_ (i.e. `foo(m);`).

A Closure though was indeed created: `console.log(aVariable + " (from the wrapper)");` proves just that.

## Apply Invocation Pattern

```javascript
foo.apply({
    aVariable : "I'm a String set via the 'apply' method: scope/'this' is passed to 'apply()'"
}, ["*** Proving the 'Apply Invocation Pattern' ***"]);
```


obviously produces:

```console
*** Proving the 'Apply Invocation Pattern' *** {
I'm a String in a global (attached to 'window')
I'm a String set via the 'apply' method: scope/'this' is passed to 'apply()'
I'm a String in a global (attached to 'window')
}
```


this is the easiest one, as the scope manipulation is made very explicit, and controlled by the developer. Useful when you want to tightly control what your callee receives.

## `var that = this` Invocation Pattern
If you wrote a lot of JavaScript, you have written one of this. Somewhere in time, you had a piece of code that drove you nuts for a little while, because the scope was just like [Frank Abagnale](http://en.wikipedia.org/wiki/Frank_Abagnale). Hence, to trap it, you created a fixed reference to it, an _"alias"_ some would say.

```javascript
// 'that' = 'this' Invocation Pattern
ClosuredScope = function(s) {
    this.aVariable = s;
    return {
        aVariable : this.aVariable,
        that : this,
        fooThat : foo
    };
};
obj = new ClosuredScope("I'm a String set in another Closure");
obj.fooThat("*** Proving the 'That = This Invocation Pattern' ***");
```


and this one comes out with:

```console
*** Proving the 'That = This Invocation Pattern' *** {
I'm a String in a global (attached to 'window')
I'm a String set in another Closure
I'm a String in a global (attached to 'window')
I'm a String set in another Closure (passed via 'that')
}
```


what's the reason? it's the only way to _"catch and hold"_ `this`, the scope. `that` is than a reference to `this`, to ensure the callee can still get hold of it. And yes, this is a Closure.

What do you say? Too messy? Well, the `that = this`-for-dummies is:

```javascript
// ...
var that = this;
 setTimeout(function () {
     that.doStuff();
 }, 1000);
// ...
```


but the same applies.

## Conclusions
Well, after all this the only real conclusion I can give you is: be careful when writing JavaScript, and make sure you really understand what's going on.

Tools like PhantomJS, [Firebug](http://getfirebug.com), [WebKit Inspector](http://trac.webkit.org/wiki/WebInspector) or [Opera Dragonfly](http://www.opera.com/dragonfly/) (choose your favourite), are your best friends to workout what's going on. When your code grows, it's not always YOUR code: breakpointing and analysing in details what's going on it's often the only way to solve this kind of issues.

And you, tweeps: please share your wisdom. I'm sure you guys will have loads to say about this ;-) .

_Happy scoping!_

**UPDATE**: here is the full gist [invocation_patterns.js](https://gist.github.com/1810899).
