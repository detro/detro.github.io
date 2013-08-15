---
layout: post
author: detro
published: true
title: "Finally, GhostDriver 1.0.0"
tags: [webdriver, wire, protocol, features, phantomjs, python, selenium, .net, binding, next, future, opensource, release, java, lesson, roadmap, ghostdriver]
date: "2012-12-03 23:29:03"
updated: "2013-01-29 08:25:52"
permalink: /2012/12/04/Finally-GhostDriver-1-0-0
---

After ~10 months of work, I finally managed to push the ball forward enough to reach **GhostDriver 1.0.0**.
I won't lie: it does feel great. It always is to see so much effort mutate into an _achievement_,
even it is such only for me.

Before I go any further though, I owe a massive **THANK-YOU** to the people that through contribution
and / or issue reporting have helped me to build a _releasable_ 1.0.0. In particular to
[Jim Evans](http://jimevansmusic.blogspot.co.uk/), an awesome guy and a bit of a
mentor for me: you ROCK Jim, and I think that is true, _literally!_

<div class="img">
<img src="http://fc02.deviantart.net/fs71/i/2011/149/0/e/ghost_driver_by_swanee3-d3hkmjo.jpg" alt="Ghost Driver" width="600" />
</div>

## Explaining `1.0.0`

In 1.0.0 I wanted to have the right amount of [Wire Protocol](http://code.google.com/p/selenium/wiki/JsonWireProtocol)
implemented, but still be able to deliver something stable before **Christmas 2012**!

So, what's in GhostDriver 1.0.0 ([changelog](https://github.com/detro/ghostdriver/blob/master/CHANGELOG.md))?

0. Navigation
1. Page content extraction
2. Arbitrary JS execution
3. Window handling
4. Frame handling
5. Screen-shot generation
6. Cookies
7. Element Search, Localization & Manipulation
8. Mouse interaction (even though `doubeClick` and `rightClick` seems to be a bit flaky)
9. Keyboard interaction

It's not the entire protocol yet, but it feels like a good start: I do think you can cover a lot of ground in your
tests with those already.

To monitor progress, and to know in details what's there and what's not, check
[this spreadsheet out](https://docs.google.com/spreadsheet/ccc?key=0Am63grtxc7bDdGNqX1ZPX2VoZlE2ZHZhd09lNDkzbkE#gid=0).

### You said "explaining"...

OK. So, GhostDriver is developed as a plain PhantomJS script that makes use of basically 2 PhantomJS built-in
modules:

* `require("webserver")`: to receive the Wire Protocol REST commands HTTP Requests
* `require("webpage")`: to execute those commands into Browser Windows (i.e. 1 `webpage` corresponds to 1 `window`)

You can download the source code from the repository
(see [README.md](https://github.com/detro/ghostdriver/blob/master/README.md)), and launch it with the following:


```bash
$ phantomjs ghostdriver/src/main.js [LOCAL_IP:]PORT
```


This approach was and is **for development only** though: GhostDriver target, since the beginning,
was to embed the driver into PhantomJS - a feature demanded
[since February 2011](http://code.google.com/p/phantomjs/issues/detail?id=49)(!!!).

So, from next release of PhantomJS (**1.8** should come just before Christmas) you will be able to do instead:


```bash
$ phantomjs --webdriver=[LOCAL_IP:]PORT
```


without the need to download anything but your favourite _single-binary-headless-browser_.
If you are impatient though, just download latest PhantomJS `master` branch, compile with `./build.sh` and enjoy.

### Binding

To make it easier to get started, [Luke Inman](https://github.com/lukeis)-[Semerau](https://twitter.com/tunabum),
Jim Evans and I have provided binding classes that
will make even easier to get up and running with PhantomJS/GhostDriver in your Selenium/WebDriver tests.
[Luke is providing Python binding](https://code.google.com/p/selenium/source/browse/#svn%2Ftrunk%2Fpy%2Fselenium%2Fwebdriver%2Fphantomjs),
[Jim covers C#/.Net](https://code.google.com/p/selenium/source/browse/#svn%2Ftrunk%2Fdotnet%2Fsrc%2FWebDriver%2FPhantomJS)
and [I wrote the Java](https://github.com/detro/ghostdriver/tree/master/binding/java/jars) ones.

The next Selenium version is `2.27.0`, and it's going to contain those bindings (hurray!). As I write this,
[David Burns](http://www.theautomatedtester.co.uk/) is
[taking matters into his hands](https://groups.google.com/forum/?fromgroups=#!topic/selenium-developers/0wFXuEHU2hs)
to prepare the release.

But I'm sure you want to see some code. Here is a Java snippet:

```java
import org.openqa.selenium.phantomjs.PhantomJSDriver;

public class TestPhantomJSDriver {

    public static void main(String[] argv) {
        // prepare capabilities
        Capabilities caps = new DesiredCapabilities();
        caps.setJavascriptEnabled(true);                //< not really needed: JS enabled by default
        caps.setCapability("takesScreenshot", true);    //< yeah, GhostDriver haz screenshotz!
        caps.setCapability(
            PhantomJSDriverService.PHANTOMJS_EXECUTABLE_PATH_PROPERTY,
            "/path/to/your/phantomjs/binary/greater/than/1.7"
        );

        // Launch driver (will take care and ownership of the phantomjs process)
        WebDriver driver = new PhantomJSDriver(caps);

        // Load Google.com
        driver.get("http://www.google.com");
        // Locate the Search field on the Google page
        WebElement element = driver.findElement(By.name("q"));
        // Type Cheese
        String strToSearchFor = "Cheese!";
        element.sendKeys(strToSearchFor);
        // Submit form
        element.submit();

        // Check results contains the term we searched for
        assertTrue(driver.getTitle().toLowerCase().contains(strToSearchFor.toLowerCase()));

        // done
        driver.quit();
    }
}
```


It's also important to highlight that **GhostDriver implements the standard WebDriver WireProtocol**.
This means that you can connect to a running instance of PhantomJS in WebDriver mode by simply using any
`RemoteWebDriver` class available in your favourite language. No strict need to use those bindings.

## Where do I get it?

Because GhostDriver is now part of PhantomJS, you can get it in the next PhantomJS binary, stable release.
It should be **PhantomJS 1.8**, and should be out by the 21st of December (don't tell [Ariya](http://ariya.ofilabs.com/)
I told you that - it's still cooking :-) ).

In the meantime, as briefly mentioned above, you have to do a bit of leg work: check out latest PhantomJS
`master` branch (from either [Ariya's (official upstream)](https://github.com/ariya/phantomjs) or
[my own (usually in sync with upstream)](https://github.com/detro/phantomjs)),
and compile it (takes 30 minutes on average specs machine - much less if you have got _SSD_).

The nice thing is that to build this you apply the same "set-up" required to compile any PhantomJS: nothing special
is required. Just follow the instructions from [here](http://phantomjs.org/build.html)
if you have never compiled it before.

## After `1.0.0`: what's next?

There is a lot left to do. To push for 1.0.0 I had to make compromises, particularly in the number of Wire Protocol
commands I had to implement. Few key ones haven't made it, but work on them it's already started
(mostly in my head for now).

### `1.0.1`: bug fixes

I plan to have a `1.0.1` to address all the immediate issues. The work for this will be limited fixing bugs though.
I already got a couple of issues / comments reported and I'll act on those.

So, don't expect this release to be anything BUT bug-fixes: new stuff has to go in _"at the right time"_ (see next).

A quick list of issues that will be address in this release:

* [Issue #123](https://github.com/detro/ghostdriver/issues/123):
Wait for potential "Page Load" when "Element.click()" is used
* [Issue #119](https://github.com/detro/ghostdriver/issues/119):
Command `/shutdown` arrives via `HTTP HEAD` in some language bindings (by [Jari Bakken](https://github.com/jarib))
* [Issue #124](https://github.com/detro/ghostdriver/issues/124):
Invalid response when checking element equality
* [Issue #126](https://github.com/detro/ghostdriver/issues/126):
Crash on `get` + `execute_async_script`

Track the work for `1.0.1` [here](https://github.com/detro/ghostdriver/issues?labels=1.0.1&page=1&state=open).

### `1.1.0`: new features

This is _"the right time"_ to add new features. This will be about pushing towards a full, complete WireProtocol
implementation. So far I have picked the following from the issue tracker:

* [Issue #108](https://github.com/detro/ghostdriver/issues/108): "Timeouts default value should be INFINITE"
* [Issue #120](https://github.com/detro/ghostdriver/issues/120):
Improve command line interface: support for just `--webdriver` without parameters
* [Issue #121](https://github.com/detro/ghostdriver/issues/121):
Better check for command line parameter: enforce `LOCAL_IP:PORT` or `localhost:PORT`
* [Issue #20](https://github.com/detro/ghostdriver/issues/20): Implement support for JavaScript Alert/Prompt/Confirm
* [Issue #84](https://github.com/detro/ghostdriver/issues/84):
Rewrite the Request Routing code to be more like [Node.js's Express](http://expressjs.com/)
* [Issue #57](https://github.com/detro/ghostdriver/issues/57): Implement "Drag & Drop" action builder

Track the work for `1.1.0` [here](https://github.com/detro/ghostdriver/issues?labels=1.1&page=1).

### `1.x`: finishing up

Well, this is quite simple. I can't plan too much ahead, but the idea is to push toward 100% of the whole
WireProtocol. Maybe putting on top of that some Mobile User Agent simulation, but that requires some thinking first.

## Anything else?

Developing a WebDriver has been quite a journey so far, and it's not yet finished.
If you listen to some of the Selenium devs, apparently will never actually end, as issues, feature requests,
criticism and pure simple _trolling_ should keep flowing. At least that should happen if this is successful.

That might turn out to be tiring (or a failure), but I don't hide that knowing this is something that
few people actually want to use makes me a tiny bit proud of my self.

### Priorities

Before I go deep into another cycle of development though, my personal life is to regain some priority:
**I'm getting married in April 2013**. That, as you might expect, will take time and energy.
So, if you want to contribute to a small Open Source project that has some potential to be awesome, please join me and
the other few awesome souls that helped me so far. And this leads me to my last thoughts and conclusions...

### Lesson learned (still learning actually!)

As any small Open Source project, I need contributors. People that are willing to either write code, or kind enough
to report issues in a **proper and reproducible** manner.
One thing I had to learn is that, if I want to keep this project going, I need to be very strict in what I allow
myself to get involved into.

And, worst of all, while I got a bunch of guys really supportive of this work (I'm looking at you, Selenium-ers),
there is always the kind of jerk that prefers to spend time telling you why you are going
to fail, instead of trying to help you contributing improvements or fixes.

Those "encounters" taught me some very useful things:

0. _Open Source it's not Democracy_: You have to keep the ship sailing in the right direction
1. _Open Source it's a "doers" culture_: ignore who talks and does nothing - embrace who makes things happen
2. _Lots of people ignore README files_: they just don't read - but don't get too upset by it
3. _Kill unhelpful issues_: they pollute the bug-tracker and lower morale, but reopen and discuss if the reporter "comes back to his senses"

I have recently started to read [Team Geek](http://www.amazon.co.uk/Team-Geek-Software-Developers-Working/dp/1449302440), and it matches perfectly what I have experienced so far. Read it if you can!

## Conclusions

This post was long overdue, and it took me few days to finish it up. I'm sure I could add more details here, but it's now the 4th night in a row and I want to move on.

What else can I say? **Just that I hope this to be the first of other, even better releases!**

Happy Driving! :)

