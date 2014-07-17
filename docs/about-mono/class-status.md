---
layout: docpage
navgroup: docs
title: Class Status
---

We keep track of the differences between the major APIs between Mono and .NET in our class status pages, check:

[http://go-mono.com/status/](http://go-mono.com/status/)

The above web site compares the results from our [continuous builds](http://wrench.mono-project.com/builds) against the public definitions of various APIs available in .NET.

Comparing Locally
-----------------

[![]({{ site.github.url }}/old_site/images/e/e9/Screenshot24.png)]({{ site.github.url }}/old_site/images/e/e9/Screenshot24.png)

Native Client GUI Compare

You can compare the API status on your system (for example, if you are a developer) using the tool \`gui-compare' that is shipped with the mono-tools package.

**gui-compare** will download the reference API description from Mono's site, and compare those against any assemblies that you have installed on your system.

In addition, it is possible to use **gui-compare** to compare assemblies against assemblies (for example to determine the changes from 1.0 to 2.0 for example) or to use it to compare an assembly against a masterinfo (a masterinfo is a description of a public API in XML form) or to compare two masterinfo definitions (again, to compare two public descriptions of an API).

Generating class status pages for your own assemblies
-----------------------------------------------------

See [Generating class status pages]({{ site.github.url }}/old_site/Generating_class_status_pages "Generating class status pages") for instructions.

MasterInfos
-----------

These are the files we compare to when generating our class status pages (we call them "masterinfos") and they represent the Microsoft API for each one of the official releases (2.0, 3.0, 3.5sp1, 4.0, 4.5 and Silverlight 2.0)

-   [masterinfos-2.0.tar.gz](http://go-mono.com/masterinfos/2.8/masterinfos-2.0.tar.gz)
-   [masterinfos-3.0.tar.gz](http://go-mono.com/masterinfos/2.8/masterinfos-3.0.tar.gz)
-   [masterinfos-3.5.tar.gz](http://go-mono.com/masterinfos/2.8/masterinfos-3.5.tar.gz)
-   [masterinfos-4.0.tar.gz](http://go-mono.com/masterinfos/2.8/masterinfos-4.0.tar.gz)
-   [masterinfos-4.5.tar.gz](http://go-mono.com/masterinfos/2.8/masterinfos-4.5.tar.gz)

-   [masterinfos-SL2.tar.gz](http://mono.ximian.com/masterinfos/2.4/masterinfos-SL2.tar.gz)


