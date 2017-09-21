---
title: libgdiplus
redirect_from:
  - /Libgdiplus/
---

Libgdiplus is the Mono library that provides a GDI+-compatible API on non-Windows operating systems. Our implementation uses [Cairo](http://www.cairographics.org) to do most of the heavy lifting.

Mono's implementation of GDI+ lives in the [libgdiplus GitHub repository](https://github.com/mono/libgdiplus).

See [here](/docs/gui/problemgdiplusinit/) if you're having problems initializing libgdiplus.

Plans
=====

Due to its tight relation with System.Drawing, new versions of libgdiplus are released with (almost) every new version of Mono.

Text
----

The current custom text engine is limited. GDI+ offers many (little used) options that are not, or incorrectly, supported by libgdiplus. The plan is to use Pango to replace our custom engine—but no work is being done on this task at the moment.

A *proof-of-concept* is already in git but is **unsupported** and less complete than the current text engine. You can use **--with-pango** to enable it.

Other Tasks
-----------

Cairo doesn't provide 100% of the functionalities required to implement GDI+ or System.Drawing. A few features were added directly in libgdiplus (unmanaged) or System.Drawing (managed).

However some features are still missing, check the [TODO](https://github.com/mono/libgdiplus/blob/master/TODO) file in the repository. Contributions toward completing those tasks are welcome.

