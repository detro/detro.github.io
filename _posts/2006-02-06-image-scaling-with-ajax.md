---
layout: post
author: detro
published: true
title: "Image Scaling with AJAX"
tags: [javascript, howto, it, curiosity, english]
date: "2006-02-06 19:53:43"
updated: "2006-02-06 19:53:43"
permalink: /2006/02/06/image-scaling-with-ajax/
---

It's powered with <a href="http://prototype.conio.net/">prototype.js</a> and <a href="http://script.aculo.us/">script.aculo.us</a>: nice!

<blockquote>If you use the script.aculo.us slider control to capture input values, it’s really just a matter of converting those values into something useful and modifying styles.</blockquote>

<script src="http://www.agilepartners.com/mint/mint.js.php" type="text/javascript" language="javascript"></script>
	<script src="http://www.agilepartners.com/scripts/prototype.js" type="text/javascript" language="javascript"></script>
  <script src="http://www.agilepartners.com/scripts/scriptaculous.js" type="text/javascript" language="javascript"></script>

A simple demo. (a Cut&Paste from the <a href="http://www.agilepartners.com/blog/2005/12/07/iphoto-image-resizing-using-javascript/">source site</a> ;) )
	<div style="margin: 10px 0pt 10px 100px;">
	<div id="track1" style="margin: 4px 0pt 0pt 10px; width: 200px; background-image: url(http://www.agilepartners.com/images/content/blog/scaler_slider_track.gif); background-repeat: repeat-x; background-position: left center; height: 18px;">
	<div class="selected" id="handle1" style="width: 18px; height: 18px; left: 196px; position: relative;"><img src="http://www.agilepartners.com/images/content/blog/scaler_slider.gif"/></div>
	</div>
	</div>
	<div style="border: 1px solid rgb(221, 221, 221); overflow: auto; width: 424px; margin-bottom: 30px;">
	<div class="scale-image" style="padding: 10px; width: 190px; float: left;"><img src="http://www.agilepartners.com/images/content/blog/scaler_1.jpg" width="100%"/></div>

	<div class="scale-image" style="padding: 10px; width: 190px; float: left;"><img src="http://www.agilepartners.com/images/content/blog/scaler_2.jpg" width="100%"/></div>
	<div class="scale-image" style="padding: 10px; width: 190px; float: left;"><img src="http://www.agilepartners.com/images/content/blog/scaler_3.jpg" width="100%"/></div>
	<div class="scale-image" style="padding: 10px; width: 190px; float: left;"><img src="http://www.agilepartners.com/images/content/blog/scaler_4.jpg" width="100%"/></div>
	<div class="scale-image" style="padding: 10px; width: 190px; float: left;"><img src="http://www.agilepartners.com/images/content/blog/scaler_5.jpg" width="100%"/></div>
	<div class="scale-image" style="padding: 10px; width: 190px; float: left;"><img src="http://www.agilepartners.com/images/content/blog/scaler_6.jpg" width="100%"/></div>
	</div>
	<p><script type="text/javascript" src="http://www.agilepartners.com/scripts/scale_demo.js"></script></p>

Created by <a href="http://www.agilepartners.com/blog/2005/12/07/iphoto-image-resizing-using-javascript/">Agile Partners.com</a>.
I suggest to read the howto: it's simple and clear. And demonstrate the power of <a href="http://script.aculo.us/">script.aculo.us</a> and <a href="http://prototype.conio.net/">prototype.js</a>.

Source, <a href="http://www.downloadblog.it/post/1342/image-scaling-nel-browser-con-ajax">Downloadblog</a>.
