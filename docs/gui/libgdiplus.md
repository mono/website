---
title: libgdiplus
redirect_from:
  - /Libgdiplus/
---

Libgdiplus is the Mono library that provide a GDI+ comptible API on non-Windows operating systems. Our implementation uses [Cairo](http://www.cairographics.org) to do most of the heavy lifting.

Mono's implementation of GDI+ lives in the [libgdiplus SVN module](http://anonsvn.mono-project.com/viewvc/trunk/libgdiplus/) and includes it's own internal copy of Cairo (version 1.6.4) but will use a newer system version when available (since Mono 2.4).

See [here]({{ site.github.url }}/docs/gui/problemgdiplusinit/) if you're having problems initializing libgdiplus.

Plans
=====

Due to it's tight relation with System.Drawing new versions of libgdiplus are released with (almost) every new version of Mono.

Text
----

The current custom text engine is limited. GDI+ offers many (little used) options that are not, or incorrectly, supported by libgdiplus. The plan is to use Pango to replace our custom engine - but no work is being done on this task at the moment.

A *proof-of-concept* is already in SVN but is **unsupported** and less complete than the current text engine. You can use **--with-pango** to enable it. Note that this will work *only* if you are building libgdiplus with the system cairo, i.e. if you're cairo library is newer than version 1.6.4.

Other Tasks
-----------

Cairo doesn't provide 100% of the functionalities required to implement GDI+ or System.Drawing. A few features were added directly in libgdiplus (unmanaged) or System.Drawing (managed). However some features are still missing.

-   add missing implementation for
    -   [path gradient brush](https://bugzilla.novell.com/show_bug.cgi?id=321034)
    -   [path widen](https://bugzilla.novell.com/show_bug.cgi?id=320856)
    -   [path warp](https://bugzilla.novell.com/show_bug.cgi?id=400775)
-   other missing stuff required for System.Drawing (fill bugs for them)
-   other missing stuff, e.g. parts of the GDI+ API isn't exposed in System.Drawing (fill bugs for them)

Contributions toward completing those tasks are welcome.

