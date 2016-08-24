---
title: Wii
redirect_from:
  - /Mono%3AWii/
---

The Mono runtime has been ported to the Wii, and a commercial port is available to Official Nintendo Licensed Wii Developers. If you want to evaluate Mono for the Wii, you must use Nintendo's third party validation tool to request access to the code.   This port is currently only available through Novell.

Installation
============

To build Mono on the Wii, you will need a Mono 2.4 set of class libraries, and in addition to that, you will need to check out the Mono/Wii branch and the special wii support system (obtain this URL from Novell after filling out your request in the middleware portal at Warioworld)

``` bash
 $ git clone -b wii ...
 $ git clone ...
 $ cd wii
 $ make
```

This will produce the Mono runtime for the Wii and build the samples in wii/samples.

