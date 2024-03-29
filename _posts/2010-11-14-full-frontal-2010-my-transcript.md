---
layout: post
author: detro
published: true
title: "Full Frontal 2010 - My transcript"
tags: [conference, fullfrontalconf, betfair, demo, javascript, fish and chips, html5, brighton]
date: "2010-11-14 22:20:50"
updated: "2010-11-14 22:20:50"
permalink: /2010/11/15/Full-Frontal-2010---My-transcript
---

Last friday I have attended [Full Frontal 2010](http://2010.full-frontal.org/), a one day JavaScript conference organised by [Left Logic](http://leftlogic.com/). This has been the second time the conference ran: the first was [last year](http://2009.full-frontal.org/).

<div class="img" style="text-align: center;">
<img src="http://lh3.ggpht.com/_-lx7Fx4NBII/TOAlVEu-GjI/AAAAAAAACF0/r92mPI-i7s4/s800/ff2010-logo.png" alt="Full Frontal 2010 logo" /><br/>
Full Frontal 2010
</div>

It was a very inspiring and stimulating day, with a **very very** nice [line of speakers](http://2010.full-frontal.org/schedule), all coming from different, but yet connected, areas of the Front End Development scene.

[Left Logic](http://leftlogic.com) is run by [Remy Sharp](http://remysharp.com/), that made an very good job, together with his wife (sorry, I don't recall her name right now), to organise, publicise and sell-out all the tickets, **months before the conference**. I guess next year the only problem for them will be to try to find a bigger venue: [Duke of York's Picturehouse in Brighton](http://www.picturehouses.co.uk/cinema/Duke_Of_Yorks/) was a nice and cosy one, but the  absence of decent WiFi connectivity, and the size of the cinema, will probably become a limit as this event gets more and more popular.

I was there with some colleagues from [Betfair](http://www.betfair.com/): [Matt](http://uk.linkedin.com/in/matthewlljones), [Paul](http://uk.linkedin.com/in/pauljhbrown), [Caroline](http://uk.linkedin.com/in/carolineevelynjames), Nick, Terry and [Tim](http://timhuegdon.com/). It was good also to do some "team building" - and to taste one of the **best Fish & Chips ever** at [Bardsley's of Baker Street](http://www.bardsleys-fishandchips.co.uk/).

**I took some notes:** hopefully, they are interesting for you to checkout. Sorry if they are confused and messy: it's just the way I had to type to keep up with the speech. And I'm too tired to spend time in rewriting them in a proper way :-P .

### Alex Russel

* **Title:** _"Less and More: How HTML5 Will Change The Framework Landscape"_
* **Blog:** [infrequently.org](http://infrequently.org/)

<div style="text-align: center;" class="img">
<img src="http://desmond.yfrog.com/Himg294/scaled.php?tn=0&server=294&filename=q5bd.jpg&xsize=640&ysize=640" width="400" />
</div>

<pre>
- slightlyoff@google.com
- He works on Google Chrome Frame
- Representative on Javascript Committee for Google
- Bare bone JS -> Own-built Library -> Proper Libraries
- Examples of bad usage of JS
	- A lof of different libraries loaded in the same page
	- Tons of HTTP reqs
	- Even with very high quality website, the usage of JS seems to be "too large, too many, too slow"
	- No gzipping sometimes
- Some stuff that makes it better
	- Deferred downloading
	- ...
- There is a patterns of problems and solutions
- Stuff that makes it slow:
	- JS block rendering
	- Parallel requests only in good browsers (all but IE :D)
	- Latency
	- Leaving JS loading/init at the end is not always great from a UX perspective, particularly if the JS is the one that is going to add the maningful, useful function
	- JS runs in the UI thread!!!
- Weight of a Blank Page?
- The cost of Wrapping
	- A way to build platform independence hiding the real DOM elements into nice coherent wraps
	- We end up with different, tall piles of frameworks, built upon unagreed principles
- What should we be asking to Browser Vendors?
	- Higher-level Abstractions
	- DOM-as-component-system
	- Idiomatic APIs
	- Say-what-you-mean syntax
	- Composition primitives
- Huh?
	- <input type="range" min...
	- <input type="location" />
	- navigator.geolocation.getCurrentPosition(callback, errorCallback,...);
	- Current libraries should be "TODO lists" for Browser Manufacturers
- Declarative begets DOM
- DOM begets API
- How can we get it Faster?
- Where can you get a better, newer Browser fast enoug?
	- Build for Mobile first (as Eric Shmidt always says now)
	- Chrome Web Store
		- "You can starting using the very edge of the Web"
	- Chrome Frame
		- How does it work...
- The apps you build matter the most
	- Go check out HTML5 (and relata) now
	- Don't rely on any library
	- Figure out what you can do and will be able to do
</pre>

### Jan Lehnardt

* **Title:** _"About the Peer to Peer web and why you should care - Also, Couch DB"_
* **Twitter:** [@janl](http://twitter.com/janl)

<div style="text-align: center;" class="img">
<img src="http://desmond.yfrog.com/Himg714/scaled.php?tn=0&server=714&filename=ybfr.jpg&xsize=640&ysize=640" width="400" />
</div>

<pre>
- (The guys is Mad :) - ndPaul)
- Web vs. Native
- The FuturePresent is Mobile
- Apple, Google, Palm (ndIvan HP?), Microsoft*, et. al. (ndIvan Nokia?)
- HTML5
- IT'S PRETTY FUCKYING EXCITING, ISN'T IT?
- Mobile is Different
	- Form Factor
	- Touch events (still trying to work out how to do it right)
	- Radio (3G and future vs. WiFi)
	- Battery
- The Basics of User Experience are the same, though
	- User Feedbacks are still one the most important factors
- MAJOR PROBLEM AHEAD
	- We didn't learn yet how to deal with devices with small/short battery life
	- The web today is Centralized
	- The Moble Web can't work "that" way (can't work very well "Centralized")
	- Tim Lee's URL was designed to address "anything anywhere"
- Telcos, grrrrr :)
	- grrrrrrrrrrrrrrr
	- Data Fucking Roaming
	- This needs fixing
- Starting from the User's perspective
- "You can't add machines to a network to reduce its latency"
- Local Data is King
- Put the Web on the Device
- CouchDB (relax)
	- In a nutshell
	- HTTP/JSON API
	- Open Source/Standards
	- Portable from Server Cluster to Smartphone
	- "Counch DB is built of the Web" - Jacob Kaplan-Moss, Django
	- Missing link: Distributing Data and Synchronization
	- Killer feature of CouchDB is SYNC!!!
	- CouchDB uses similar algorithms to Lotus Notes ones (i.e. Sync Database)
	- CouchApps
		- 0. A Document Database that Speaks HTTP
		- 1. Store HTML into Database
		- 2. Load URL from HTML in a Browser or Web View
		- 3. Browser render HTML
		- 4. Javascript can make calls to Database
		- 5. Database can Sync Data & Applications Anywhere
- Happy, Unicorn, Kittens
- Open Issues
	- Control (from Business perspective)
	- Discovery - hard for decentralized systems
	- Trust
	- Fun
- http://guide.couchdb.org/
	- The book is hosted on Github
</pre>

### Paul Rouget

* **Title:** _"Batshit crazy stuff you'll be able to do in browsers"_
* **Twitter:** [@paulrouget](http://twitter.com/paulrouget)

<div style="text-align: center;" class="img">
<img src="http://desmond.yfrog.com/Himg219/scaled.php?tn=0&server=219&filename=i2yq.jpg&xsize=640&ysize=640" width="400" />
</div>

<pre>
- Title: "Batshit crazy stuff you'll be able to do in browsers:"
- Twitter: "@paulrouget"
- Web Sockets, File API, Audio API, ..., WebGL, ...
- API and Demos
- WebSockets
	- Persisten connection between the browser and the server
	- "IP over HTTP"
	- Persistent
	- Bidirectional
	- "Push"
- File API
	- Read local files
	- through: <input type="file" multiples...
	- or through: Drag & Drop
- FileReader
	- Preview
	- Atomic Upload
	- Read Content
	- Edit before upload
- Demo that involved:
	- "Dropbox image uploader"
	- File API
	- Drag & Drop
	- Cross-XHR
	- Form Data
- Javascript, Video, Audio, Canvas 2D, WebGL, Audio API, Web Workers, SVG, Hardware Accelerations
- Demo
	- Workers: image manipulation
	- WebGL (3d car with a very high degree of details)
	- Video?!!?!??! no, WEBGL!!!!
		- 3D mapping of a panoramic Video!!! in Javascript!!!
	- Audio Tag
		- Advanced Audio real-time analysis, mixing 3D and Audio analysis for spectrum 3d shit!!!
	- Realtime Video analysis to detect patterns and overlay with Canvas drawings, in sync with Music... WTFFFFFFFFFFFF!!!
	- Pretty fucking cool 3D City with pictures, video and audio analysis overlayed on buildings. Something that can't be described.
- Sad: IE9 will bring only a minimum subset of all the AWESOME features coming (actually, mostly already there) in all the other Browsers
</pre>

### Dan Webb

* **Title:** _"Bringing the Same-Origin policy to its knees"_
* **Twitter:** [@danwrong](http://twitter.com/danwrong)

<div style="text-align: center;" class="img">
<img src="http://desmond.yfrog.com/Himg208/scaled.php?tn=0&server=208&filename=pqxa.jpg&xsize=640&ysize=640" width="400" />
</div>

<pre>
- Title: "Bringing the Same-Origin policy to its knees"
- Twitter: "@danwrong"
- Front-end Engineer, Platform Team at Twitter
- Web platforms are more than just REST APIs
- Example 1: Badges/Embedded content (i.e. Video)
- Example 2: Widgets
- Example 3: Disqus
- Client-side APIs
	- Ex: Facebook Connect / Javascript SDK
	- Ex: Linked In Javascript API
- Building Javascript API
	- Communicating with the API from a third party site
	- Implementing an RPC layer
	- Adding authenitication and authorisation
- We have got JSON-P, but...
	- Error difficult to Handle
- We need a bit of flexibility
- The Future: Cross-Origin resource sharing
- Support for CORS works on
	- Firefox 3.5+
	- Safari 4+
	- Chromw
	- IE >= 8 (with adaptation)
- Proxied Cross Domain XHR for IE <= 7
- IFRAME
	- problems with the Same-Origin, again!
	- Solution: window.postMessage("message", "target URL") + evenListener in the IFRAME content
- Support for postMessage
	- Firefox 3.5+
	- Safari 4+
	- Chromw
	- IE >= 8 (with adaptation)
- Another method: "window.name"
- EasyXDM (on github)
- JSON RPC
	- json-rpc.org
- On the Server...
	- Code...
- On the Consumer...
	- Code...
- Authentication and Authorisation
	- There are no Secrets in the Browser
	- OAuth 2 User-Agent Profile
		- 10th revision
		- fairly stable
	- How do we get the access token to the client?
	- Server will generate a Auth_Token as a combination of User ID, Client ID and Time (ndIvan I guess the latter)
	- We can verify client by Checking redirect URL
	- Browser receives the Auth_Token Securely
	- Making protected requests
- Health Warning
	- Secure, but non that secure
	- Fairly easy for devs to accidentaly leak tokens
	- Make them expire after a very short amount of time
	- Can use "immediate" mode to refresh expired tokens
	- There's also a means to request a code that can then be passed to the server for it to retrieve a longer lasting token
- Knock yourself out...
- "@jointheflock"
</pre>

### Paul Bakaus

* **Title:** _"High performance browser games"_
* **Twitter:** [@pbakaus](http://twitter.com/pbakaus)

<pre>
- Title: "High performance browser games"
- Twitter: "@pbakaus"
- Zynga's CTO (Germany)
- Overwhelming success of the Aves Engine prototypes (ndIvan: what?)
- How does this work? Making game engines in Javascript?
	- Be creative
	- Be knowledgable
	- Be nuts
- We now have:
	- WebGL
	- V8, SpiderMonkey, Nitro, ...
	- HTML5, CSS3, ...
- Web Developer don't have the background of Game Engine Development normally
- The Open Web Stack
	- HTML5
	- HTML + CSS for rendering
	- JavaScript for client and server
	- Canvas as a tool, not for rendering
	- "Obviously" jQuery and jQuery UI
	- JQuery is a good choice because is just a Library, not a Framework: it stays out of your way ;)
	- (ndIvan: Matt disagrees, of course)
- Cross-browser?
	- Not cross platform?
		- Limited audience
		- Extreme development speedup and advantage
	- We wanted to be Cross-Platform
- Don't worry about today
	- Pick technology from the Future
	- Your game won't be ready anyway
- Architecture and API design
	- Generes that can't be implemented now: casual 3D, shooters - WebGL is needed
	- Generate that can't be implemented for years to come: Next-gen 3D - WebGL is not enough
- So what's left?
	- 2D (Puzzles, Advetures, Board Games, Card Games, Platformers, Jump & Run)
	- 2.5D (RPG, ...)
- We chose a sort of Sim City style game
- Rendering, what should I use?
	- Canvas, of course...
	- No, Canvas is a lot SLOWER
	- Canvas redrawing is painful
	- Instead, in the normal HTML DOM, the Browser does the redrawing optimization for you
	- Using partial-redrawing algorithms in the Canvas is not good
	- Thinking is Key!
- (ndIvan Fish and Chips killed me...)
</pre>

### Brian Leroux

* **Title:** _"PhoneGap: the Future of Mobile Now"_
* **Twitter:** [@brianleroux](http://twitter.com/brianleroux)

<div style="text-align: center;" class="img">
<img src="http://desmond.yfrog.com/Himg688/scaled.php?tn=0&server=688&filename=merj.jpg&xsize=640&ysize=640" width="400" />
</div>

<pre>
- Title: "PhoneGap"
- Twitter: "@brianleroux"
- Dakr Horses:
	- Windows Mobile 7
	- MeeGo
- WTF is PhoneGap?
- Technique:
	- Instantiate a Chrome Browser
	- Bind Javascript (ndIvan: through the Web View directly or over a local HTTP Server)
	- The idea is to use Progressive Enhancement
	- The idea is to make Device API that are coming, available RIGHT NOW!
	- Let's just pretend is a WebKit world in Mobile
	- WebKit features implementation varies A LOT across different implementation/OS
- The best implementation seems to be WebOS
- Standards
	- A lot to choose from
	- Device Sensors && Device Data
		- In the hands of W3C Device API Working Group
- PhoneGap supports DAP so far:
	- Contacts
	- Calendar
	- Media Capture
	- Sys Info
	- Device
	- Gallery
- Currently don't supporting
	- Permissioning
	- Messaging
	- Policy Framework
	- (Policy and Permission is PURE EVIL - no one should implement it ndIvan)
- DAP API at risk: not supported by PhoneGap yet
	- App Launcher
	- Tasks
	- Communications Log
- Tested/Supported PhoneGap APIs - cross platform
	- Accelerometer
	- Camera
	- Contacts
	- Device
	- Events
	- Geolocation
	- Network
	- Notification
- Experimental API
	- XMPP
	- File IO
	- Compass
	- Gyroscope
	- Bluetooth
	- Web Sockets
	- Menuing
- Licensing
	- inbound: Apache
	- outbound: MIT / BSD
- Other standards (shit! ndIvan)
	- JIL / WAC / BONDI
	- W3C Widget Spec
	- HTML5!
- Example of a PhoneGap project (plain W3C Widget Spec - ndIvan)
- Resources:
	- phonegap.com
	- docs.phonegap.com
	- wiki.phonegap.com
- PhoneGap uses happly a lot of the great JS libraries
	- XUI
	- Sencha Touch
	- jQyery-Mobile
- They do most of the development using Web Inspector and Web Inspector Remote
- Risks and Issues
	- Screen Sizes and Pixel Densities
	- Bugs
	- Different WebKits
	- Docs are sparse
	- Getting started in Mobile Development is hard/expensive
- Trying to create an SDK:
	- build.phonegap.com
- FUD
	- Apple Rejections
	- Not Native
- Not distant in the Future (Bear Dick Punch picture - ndIvan)
	- A solid CLI
	- CommonJS require refactoring
	- Fully documented Plugin API
- Final Notes
	- Android is OPEN!
	- Constraints are GOOD!
	- Check what your users want
	- 99% are list, buttons and sliders
</pre>

### Seb Lee-Delise

* **Title:** _"Pixel Pushing Pounding"_
* **Twitter:** [@seb_ly](http://twitter.com/seb_ly)

<div style="text-align: center;" class="img">
<img src="http://desmond.yfrog.com/Himg248/scaled.php?tn=0&server=248&filename=tyiu.jpg&xsize=640&ysize=640" width="400" />
</div>

<pre>
- Title: "Pixel Pushing Pounding"
- Twitter: "@seb_ly"
- http://seb.ly
- THE ENTIRE PRESENTATION IS IN FLASH!!!
- pluginmedia.net
- A creative coder
- Physics in Javascript:
	- Demo of animating a ball
	- Animation of Particles: from very simple to incredible
- 3D:
	- Particles a 3D space: trippy!
	- 3.js (or 3d.js)
- Unity3D
	- Supports for:
		- Web Player
		- iPhone
		- Android
		- WII
		- XBOX
		- PS3
	- No coding to get started
	- It provides an IDE
	- Need to check out this Unity: seems fun!
- "With great pixel power comes great responsibility"
	- Flash community got wild in the past
	- Be careful on what you do with Canvas ;)
	- K&K Mime - Incredible!
- Experiment, Play, Share (even though this stuff was pretty useless)
</pre>

### Conclusion

I think it has been a very good experience, and definitely a source of inspiration. Indeed, since after the last talk from _Seb Lee-Delise_, I wanted to add Canvas animated torches with particles of file on the 2 sides of this blog. But maybe I shouldn't... ;)

I guess, see you next year [#fullfrontalconf](http://twitter.com/#!/search/%23fullfrontalconf).
