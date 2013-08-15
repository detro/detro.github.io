---
layout: post
author: detro
published: true
title: "3 o'clock javascript"
tags: [snippet, code, personal, javascript, programming, it, late, yawn, optimization, curiosity, fun]
date: "2010-03-28 02:17:02"
updated: "2010-09-29 22:03:33"
permalink: /2010/03/28/3-oclock-javascript/
---

I was writing some code to react at a <code>textarea.onKeyUp</code>. I take the size of the current <code>textarea.val().length</code>, update an element and do some other stuff.

<div align="center">
<img src="http://talkpractice.files.wordpress.com/2009/05/yawn.jpg" alt="Yawn" />
<em>yawn</em>
</div>

The first version of the code looked like:

```javascript
$('#message').keyup(function(e){
   $('#chars_num').html( new_len );
   $('#sms_num').html( Math.floor($('#message').val().length / 161) +1) );
});
```


Working good, but was clearly slow: every keystroke was "giving back the cursor" too slowly for a fast typer like me. I went to take a look at <a href="http://www.twitter.com/">twitter</a>, and their text box was WAY FASTER.
<!--more-->
Well, a decent programmer (not like me at 3 o'clock in the morning) will do something like:

```javascript
obj_message = $('#message');
obj_chars_num = $('#chars_num');
obj_sms_num = $('#sms_num');
obj_message.keyup(function(e){
   new_len = obj_message.val().length;
   obj_chars_num.html( new_len );
   obj_sms_num.html( Math.floor(new_len / 161) +1 );
});
```


Longer, but WAY FASTER: the browser is not going to have to find the objects on which I operate, again and again. Just the first time.

I know that now there are the <a href="http://www.w3.org/TR/CSS2/selector.html">W3C Selector API</a>. But the version of <a href="http://jquery.com/">jQuery</a> that I use (&lt; 1.4) doesn't offer it yet (I believe). Why I don't switch to 1.4? Because I have some dependency on 1.3 for now.
