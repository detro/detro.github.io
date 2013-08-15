---
layout: post
author: detro
published: true
title: "Charles: not the Prince, the Proxy"
tags: [linux, map, throttle, non free, windows, charles, mac, proxy, breakpoint, software, prince, features]
date: "2010-09-10 09:33:14"
updated: "2010-09-10 09:33:14"
permalink: /2010/09/10/Charles-not-the-Prince-the-Proxy
---

It's around 3 months now that I'm spending majority of my time developing for the web. For both Career (my new job at [Betfair](http://www.betfair.com)) and Personal (my pet project [txty.mobi](http://www.txty.mobi)) reasons.

And when you do it pretty intensively, with a lot of [JSON](http://en.wikipedia.org/wiki/JSON), [Javascript](http://en.wikipedia.org/wiki/JavaScript) code and what not, you need some tools to "ease tasks". Particularly, the ones where you need to simulate a non-browser client or stuff like that.

<div style="float:right; margin: 2px" markdown="1">
![Charles Proxy logo](http://blog.chasebrammer.com/wp-content/uploads/2009/02/logo.jpg "Charles Proxy")
</div>

### Charles Proxy
It has been brought to my attention this software called [Charles Proxy](http://www.charlesproxy.com/). It's full of interesting and powerful features. Some of them are a real promise to make life of the Web Developer easier and smoother.

Yes, of course there are things like [Firefox Firebug](http://getfirebug.com/). [Chrome Developer Tools](http://www.chromium.org/devtools) (my favourite), [Safari Developer Tools](http://developer.apple.com/technologies/safari/developer-tools.html) and [Opera Dragonfly](http://www.opera.com/dragonfly/). But Charles is different. Sitting between your [User Agent](http://en.wikipedia.org/wiki/User_agent) and [Network Stack](http://en.wikipedia.org/wiki/OSI_model), it can do much more.

I don't aim to do a full review here; you can find details at [the](http://www.charlesproxy.com/documentation/proxying/) [documentation](http://www.charlesproxy.com/documentation/using-charles/) [pages](http://blog.ivandemarino.me/admin/post/108019). But some of this features require at least a mention, to help you realize why this instrument is an important addition to the usual ones.

#### Bandwidth Throttle

from [charlesproxy.com/documentation/proxying/throttling/](http://www.charlesproxy.com/documentation/proxying/throttling/)

> Charles can be used to adjust the bandwidth and latency of your Internet connection. This enables you to simulate modem conditions using your high-speed connection.
> The bandwidth may be throttled to any arbitrary bytes per second. This enables any connection speed to be simulated.
> The latency may also be set to any arbitrary number of milliseconds. The latency delay simulates the latency experienced on slower connections, that is the delay between making a request and the request being received at the other end
This sounds great for testing Mobile Web scenarios.

#### Breakpoints

from [charlesproxy.com/documentation/proxying/breakpoints/](http://www.charlesproxy.com/documentation/proxying/breakpoints/):

> The Breakpoints tool lets you intercept requests and responses before they are passed through Charles. You can examine and edit the request or response and then decide whether to allow it to proceed or to block it.

#### Map Local / Map Remote

from [charlesproxy.com/documentation/tools/map-remote/](http://www.charlesproxy.com/documentation/tools/map-remote/):

> The Map Local tool enables you to use local files as if they were part of a remote website. You can develop your files locally and test them as if they were live. The contents of the local file is returned to the client as if it was the normal remote response.
> The Map Remote tool changes the request location, per the configured mappings, so that the response is transparently served from the new location as if that was the original request.

#### Body Content Viewers
When Looking at a sequence of Request/Respone, if the format is supported by Charles (i.e. XML or JSON) the software offers a special view where data are formatted in a browsable way. Great to take a look at really big and complex sets of data.

### Good work calls for cash
Charles runs on the 3 major desktop systems (Linux, Mac and Windows), and integrates itself with all those systems, making it easy to enable/disable it, without having to play around with proxy configuration too much.
 
It has only one _"problem"_. [It's not free](http://www.charlesproxy.com/buy/) :-( . But if you are into this business, I think this tool is money well spent. More at [charlesproxy.com/documentation/using-charles/requests-responses/](http://www.charlesproxy.com/documentation/using-charles/requests-responses/)

**PS** Why the quote about the [Prince of Wales](http://www.princeofwales.gov.uk/personalprofiles/theprinceofwales/)? Because when I initially searched for it on Google, the only thing I could find was references to the member of the [Royal Family](http://www.royal.gov.uk/). :-P
