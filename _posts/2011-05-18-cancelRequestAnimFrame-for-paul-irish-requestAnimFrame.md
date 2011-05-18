---
layout: post
published: true
title: cancelRequestAnimationFrame() For Paul Irish requestAnimationFrame()
---

[Paul Irish](http://paulirish.com/) recently
wrote [requestAnimationFrame for smart animating](http://paulirish.com/2011/requestanimationframe-for-smart-animating/).
It is a polyfill so people can start use requestAnimationFrame() today and still be future proof.

This post is about its counterpart,
[cancelRequestAnimFrame()](http://webstuff.nfshost.com/anim-timing/Overview.html#cancelRequestAnimationFrame).
It cancels a [requestAnimationFrame()](http://webstuff.nfshost.com/anim-timing/Overview.html#requestAnimationFrame),
like [clearTimeout](https://developer.mozilla.org/en/DOM/window.clearTimeout)
cancels a [setTimeout](https://developer.mozilla.org/en/DOM/window.setTimeout).

# Step 1: how to get the code

First include the ```cancelRequestAnimFrame()``` code in your page. 

	window.cancelRequestAnimFrame = ( function() {
		return window.cancelAnimationFrame			||
			window.webkitCancelRequestAnimationFrame	||
			window.mozCancelRequestAnimationFrame 		||
			window.oCancelRequestAnimationFrame		||
			window.msCancelRequestAnimationFrame		||
			clearTimeout
	} )();
	
Add ```requestAnimFrame()``` too. It is a slightly modified version of
[paul's](http://paulirish.com/2011/requestanimationframe-for-smart-animating/)
to return setTimeout() handle.

	window.requestAnimFrame = (function(){
		return  window.requestAnimationFrame       || 
			window.webkitRequestAnimationFrame || 
			window.mozRequestAnimationFrame    || 
			window.oRequestAnimationFrame      || 
			window.msRequestAnimationFrame     || 
			function(/* function */ callback, /* DOMElement */ element){
				return window.setTimeout(callback, 1000 / 60);
			};
	})();


# Step 2: how to use it

Here is a possible way to use it.
***Show, dont tell***, here is a [live demo](http://jsfiddle.net/ghjKC/3/) on jsfiddle

    // to store the request
    var request;
    
    // start and run the animloop
    (function animloop(){
      render();
      request = requestAnimFrame(animloop, element);
    })();
    
    // cancelRequestAnimFrame to stop the loop in 1 second
    setTimeout(function(){
        cancelRequestAnimFrame(request);				
    }, 1*1000)


# About requestAnimationFrame

In the past months, much has been done for web graphics. Among them, 
[requestAnimationFrame()](http://webstuff.nfshost.com/anim-timing/Overview.html)
is used to make smoother animation while not wasting useless
rescources when not visible.
The [spec](http://webstuff.nfshost.com/anim-timing/Overview.html) is making good
progress, and [several](http://dev.chromium.org/developers/design-documents/requestanimationframe-implementation)
[implementations](https://developer.mozilla.org/en/DOM/window.mozRequestAnimationFrame) are already deployed.

