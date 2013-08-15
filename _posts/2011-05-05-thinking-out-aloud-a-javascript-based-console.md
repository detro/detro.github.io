---
layout: post
author: detro
published: true
title: "Thinking out aloud: a JavaScript based console?"
tags: [code, console, qt, phantomjs, javascript, idea, project, coffeescript, source, example]
date: "2011-05-05 21:45:56"
updated: "2011-05-05 21:45:56"
permalink: /2011/05/06/Thinking-out-aloud-a-JavaScript-based-console
---

In the last month or two [I started contributing](https://github.com/detro/phantomjs) to [PhantomJS](http://www.phantomjs.org):
<div class="img">
<img src="http://www.openclipart.org/image/800px/svg_to_png/lemmling_Cartoon_ghost.png" width="400" alt="PhantomJS logo"/>
PhantomJS logo
</div>

<blockquote>
PhantomJS is a headless WebKit with JavaScript API. It has fast and native support for various web standards: DOM handling, CSS selector, JSON, Canvas, and SVG.

PhantomJS is an optimal solution for headless testing of web-based applications, site scraping, pages capture, SVG renderer, PDF converter and many other use cases.
</blockquote>

The project is really interesting and we are seeing a steady growth in terms of:

* Number of users
* Number of posts/questions/answers on the [official Google group](https://groups.google.com/forum/#!forum/phantomjs)
* Number of [contribution](https://github.com/ariya/phantomjs/commits/master)

The mind behind PhantomJS is [Ariya Hidayat](http://ariya.blogspot.com/), a brilliant guy that I first met when he was still working for Trolltech/Nokia. I will not spend a lot of time here explaining why it's idea is so great: for that there is [the official wiki](http://code.google.com/p/phantomjs/w/list).

To share some awesomeness, here is my favourite example. _Do you want to know what's the weather like in London from your command line?_ Type something like this:

```bash
$ phantomjs examples/weather.js London, UK

City: London, UK
Current condition: Clear
Temperature: 61 F
Humidity: 45%
Wind: N at 4 mph

Thu: 52-66 F  Partly Sunny
Fri: 57-72 F  Partly Sunny
Sat: 55-72 F  Partly Sunny
Sun: 50-70 F  Chance of Rain
```


How does that work? Here is the PhantomJS script source:

```javascript
if phantom.state.length is 0
    city = 'Mountain View'
    if phantom.args.length > 0
        city = phantom.args.join ' '
    phantom.state = city
    console.log "Loading #{ city }"
    phantom.open encodeURI "http://www.google.com/ig/api?weather=#{ city }"
else
    if phantom.loadStatus is 'fail'
        console.log 'Unable to access network'
    else
        if document.querySelectorAll('problem_cause').length > 0
            console.log "No data available for #{ phantom.state }"
        else
            data = (s, e) ->
                e = e or document
                el = e.querySelector s
                if el then el.attributes.data.value else null

            console.log ''
            console.log 'City: ' + data 'weather > forecast_information > city'
            console.log 'Current condition ' + data 'weather > current_conditions > condition'
            console.log 'Temperature: ' + data('weather > current_conditions > temp_f') + ' F'
            console.log data 'weather > current_conditions > humidity'
            console.log data 'weather > current_conditions > wind_condition'
            console.log ''

            forecasts = document.querySelectorAll 'weather > forecast_conditions'
            for f in forecasts
                console.log "#{ data 'day_of_week', f }: " +
                            "#{ data 'low', f }-" +
                            "#{ data 'high', f } F  " +
                            "#{ data 'condition', f }"

    phantom.exit()
```


This scripts uses the _undocumented_ [Google Weather API](http://www.google.com/search?sourceid=chrome&ie=UTF-8&q=google+api+weather#sclient=psy&hl=en&safe=off&source=hp&q=google+weather+api&aq=f&aqi=&aql=&oq=&pbx=1&bav=on.2,or.r_gc.r_pw.&fp=ee59edf59cfa0598). Nothing special given _nowdays_ Javascript... but this is bring the result to your CLI! And yep, PhantomJS supports **Coffee Script**, as well as Javascript.

Isn't this enough to make your eyes sparkly?

## a JavaScript based console?
Anyway, I'm not here to show what's available. I'm here to throw an idea out.

PhantomJS is based on the super-awesome Qt. And Qt provides a **superb** API set. The one that makes PhantomJS possible is [QtWebKit](http://trac.webkit.org/wiki/QtWebKit), a [WebKit](http:///webkit.org) flavour that is developed side by side with the Google Chrome and the Apple Safari WebKits, on [the official WebKit repo](http://trac.webkit.org/). [QtWebKit API](http://doc.qt.nokia.com/latest/qtwebkit.html) make it extremely easy to build software based on WebKit.

Qt also provides other great modules, and one of them is [QtScript](http://doc.qt.nokia.com/latest/qtscript.html). Based on? Yes, it's based on Javascript! Actually, it wraps in a great API the "standard" [WebKit JavascriptCode](http://www.webkit.org/projects/javascript/).

So, if you do _1+1_ what happens? **PhantomJS can become a fully fledged Javascript interpreter!** The WebPage could just be an object to manipulate as a "resource", like any other object. The developer could do thinks like:

```javascript
var page = require("WebPage");
page.load("www.google.com");
page.input("Lady Gaga", "#inputTextField");
page.click("#submitSearch");
...
var rasterizer = require("Rasterizer");
rasterizer.print(page, "~/ladyGagaSearchResult.png");
...
```

Do you see where I'm heading here?

Put into the picture the [CommonJS](http://www.commonjs.org/) specs, still cooking, and you can imagine JavaScript reaching places that no one would have imagined few years ago.

We are discussing this [here on the official group](https://groups.google.com/d/topic/phantomjs/0lOnBOL1oV8/discussion). Come on, join in?
