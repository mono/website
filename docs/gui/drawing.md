---
layout: docpage
navgroup: docs
title: Drawing
---

Mono provides two mechanism to draw. The first exposes the Microsoft System.Drawing API and the second exposes the [Cairo](http://www.cairographics.org) API:

-   System.Drawing

-   [Mono.Cairo]({{ site.github.url }}/docs/tools+libraries/libraries/Mono.Cairo/)

System.Drawing
--------------

The System.Drawing implementation in Mono is designed to be compatible with the Microsoft API. The imaging model is very similar to the PDF 1.4 composition-based imaging model.

Our implementation is a C\# wrapper around the GDI+ C API (also called the ["GDI+ Flat API"](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/gdicpp/GDIPlus/GDIPlusReference.asp)). This means that the C\# code is the same for Windows and UNIX systems. The following graph explains the situation:

[File:System-drawing.png](/index.php?title=Special:Upload&wpDestFile=System-drawing.png "File:System-drawing.png")

In Windows Mono uses the GDI+ library that is included with the operating system (`GDIPLUS.DLL`, while in UNIX we provide an implementation of this API in the `libgdiplus.so` shared library. Our [libgdiplus]({{ site.github.url }}/docs/gui/libgdiplus/) has the same C Flat API as the `GDIPLUS.DLL`. The C\# code that implement System.Drawing is the same for Windows and UNIX builds. Since this is an implementation of an existing Microsoft API no architectural changes go here.

Our implementation currently exposes the 1.1 and 2.0 APIs, with a few limitations from the underlying GDI+ implementation. The details are tracked on the [GDI+ todo page](http://anonsvn.mono-project.com/viewvc/trunk/libgdiplus/TODO?view=markup).

Mono.Cairo
----------

Cairo is a low-level 2D vector drawing library. Various rendering backends (XRender, Win32) are already supported and more (ie. glitz -- OpenGL hardware accelerated backend) are on the way. The Mono.Cairo.dll assembly exposes the Cairo API to managed applications. The mapping is a pretty straightforward one, and the programming model is very close to the OpenGL model (although much simpler).

Information, tutorials, and examples can be found on the [Mono.Cairo]({{ site.github.url }}/docs/tools+libraries/libraries/Mono.Cairo/) page.

