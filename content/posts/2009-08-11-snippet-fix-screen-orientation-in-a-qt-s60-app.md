---
layout: post
author: detro
title: "Snippet: fix Screen Orientation in a Qt/S60 app"
tags: [snippet, orientation, screen, nokia, howto, it, symbian, english, s60, qt]
date: "2009-08-11T08:58:10Z"
---

I follow the [Qt/S60 Mailing list](mailto:qts60-feedback@trolltech.com), that is turning out to be a very interesting and active ML, and the [Qt Labs blog](http://labs.trolltech.com/blogs/), always full of very good code, written directly by the guys of [Qt Software](http://www.qtsoftware.com/).
I thought could be nice to start to post some of the stuff I'm learning.


```
#include <eikenv.h>
#include <eikappui.h>
#include <aknenv.h>
#include <aknappui.h>
// ...
// lock orientation
CAknAppUi* appUi = static_cast<caknappui *>( CEikonEnv::Static()->AppUi() );
if ( appUi ) //< Actually, this will always pass. It's a "static_cast" after all...
{
   appUi->SetOrientationL( CAknAppUi::EAppUiOrientationPortrait );
}
// ...




Today's source is: [Nokia Forum](http://discussion.forum.nokia.com/forum/showthread.php?t=164499).</caknappui></aknappui></aknenv></eikappui></eikenv>
