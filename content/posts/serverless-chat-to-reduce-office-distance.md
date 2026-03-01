---
layout: post
author: detro
title: "Serverless chat to reduce office distance"
tags: [serverless, distance, qt, office, personal, reduce, it, cross-platform, idea, chat, english, brainstorm, utility]
date: "2010-01-31T18:37:26Z"
aliases:
  - /2010/01/31/serverless-chat-to-reduce-office-distance
  - /2010/01/serverless-chat-to-reduce-office-distance
---

This idea comes out for an old university-time idea: to write <strong>a serverless chat application</strong>. Of course, I'm aware of the complications and the problems that using [Broadcasting](http://en.wikipedia.org/wiki/Broadcast_address) could create, so this problems would be took in consideration by design.



![Office](http://hof.povray.org/images/bigthumb/office-13.jpg)



But why now? I was thinking of a way to reduce the <em>"office distances"</em>: making easy to connect with a person who works in your own office. I know, it sounds a bit <em>"creepy"</em> to depend on an application to do that. After all you could just stand up and go to the colleague's desk. And that's what I'd normally do: nothing impossible.

But I can see that this is not always the case for every personality, and, sometimes, I fall in the same "shyness" (since in UK, no one believes me when I say <em>"I'm shy"</em>, but I actually am: I just use jokes to relax and <em>break-the-ice</em>). So months passes by, you never learn the name of some colleagues and so on. After all how many times you work in projects where more than 10 people are involved?

<h3>Acceptance-less</h3>
A system like this could <strong>explicitly avoid</strong> concepts like "accept a contact in your contact-list": <strong>the contact list would be the list of all the clients connected to the network, no one excluded</strong>. I know you could probably do this kind of stuff configuring accordingly some server chat, but you need:

* Infrastructure, set up by an IT department

* Maintenance, provided by an IT department* 

Both this things are normally <em>very rare resources to have in a classical office environment</em>. IT is always evil ;-) . Am I not right?

<h3>Cross platform by design</h3>
I have in mind [Qt](http://qt.nokia.com) as the framework to build something like that. It already covers the most of the desktop environments, and it can be set to integrate nicely. Not like Java. :-P

<h3>Features? No, for now brainstorming</h3>
Yeah, I could start to write a long list of all the features I think such software should have, but this post was more to ask the micro-crowd that reads my blog "what do you think of such an idea?". Any idea will be took in consideration.

<h4>Features</h4>
Ok, that's what I have in mind for now:

* <strong>Acceptance-less contact-list</strong> (I believe that's a core one)

* Chat layout built into a WebView: styling through plugins of CSS(3) files

* Drag and Drop file-transfer (no-passthrough-server: imagine the speed on a lan!)

* Encryption: communication can be encrypted, encrypting the socket traffic one has opened with another client

* Position: this could be like a "status" info, but allowing the person to pin him/herself on a Office map, so that can be easy to find

Please advice for more ;)

<h3>And after this chat?</h3>
Just stand up and go there: it's not like your colleague is going to harm you or something. ;)
