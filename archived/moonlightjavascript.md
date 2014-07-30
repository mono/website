---
title: "MoonlightJavascript"
lastmodified: '2008-06-16'
permalink: /archived/MoonlightJavascript/
redirect_from:
  - /MoonlightJavascript/
---

MoonlightJavascript
===================

We have encountered a number of sites that implement their own Silverlight/Moonlight javascript detection engines. These generally suffer from a number of common mistakes. Our goal here is to list those mistakes and provide alternatives.

Common mistake \#1: Using an out of date Silverlight.js. The original Silverlight.js had a bug which prevented it from detecting Silverlight and Moonlight properly on FireFox 3. This has been corrected as of the Silverlight.js 2.0b2 SDK.

Common mistake \#2: Checking navigator.platform. Moonlight aims to one day support more architectures than just Intel, we have encountered custom javacsript htat limits the site to MacPPC, MacIntel, Intel.

Common mistake \#3: Parsing the UserAgent for supported browsers. Many Firefox extensions will change the UA making this method of detecting support unreliable at best. Additionally, we will support additional browsing platforms to Firefox such as WebKit, Epiphany, Konqueror and Opera.

