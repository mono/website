---
title: Wii
redirect_from:
  - /Mono:Wii/
---

The Mono runtime has been ported to the Wii, and a commercial port is available to Official Nintendo Licensed Wii Developers. If you want to evaluate Mono for the Wii, you must use Nintendo's third party validation tool to request access to the code.

Installation
============

To build Mono on the Wii, you will need a Mono 2.4 set of class libraries, and in addition to that, you will need to check out the Mono/Wii branch and the special wii support system (obtain this URL from Novell after filling out your request in the middleware portal at Warioworld)

``` bash
 $ svn co .../branches/wii
 $ svn co .../trunk/wii
 $ cd wii
 $ make
```

This will produce the Mono runtime for the Wii and build the samples in wii/samples.

Licensing
=========

Both the Mono runtime and the Mono C# Compiler are available under proprietary license for those who cannot, or choose not to, use LGPL and GPL code in their projects.
