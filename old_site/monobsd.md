---
layout: obsolete
title: "Mono:BSD"
lastmodified: '2009-01-31'
permalink: /old_site/Mono:BSD/
redirect_from:
  - /Mono:BSD/
---

Mono:BSD
========

Mono support for BSD operating systems.

Packaging for BSD operating systems
===================================

Mono on BSD operating systems is supported independently by the respective operating systems through their ports systems. All users should check their ports tree, typically under lang/mono, to install their operating systems latest supported Mono port.

-   [FreeBSD]({{site.github.url}}/old_site/Mono:FreeBSD "Mono:FreeBSD") [(Port)](http://www.freebsd.org/cgi/cvsweb.cgi/ports/lang/mono/) [(Maintainer)](http://code.google.com/p/bsd-sharp/)
-   NetBSD [(Port)](http://cvsweb.netbsd.org/bsdweb.cgi/pkgsrc/lang/mono/)
-   OpenBSD ([Port](http://www.openbsd.org/cgi-bin/cvsweb/ports/lang/mono/))
-   DragonflyBSD (Port: no official port)
-   [Debian GNU/kFreeBSD](http://www.debian.org/ports/kfreebsd-gnu/) [(Package)](http://packages.debian.org/unstable/interpreters/mono-runtime)

Using Mono on the BSDs
======================

It is typically recommended that BSD users NOT download the standard source tarball from the Mono download page and attempt to build/install it but use their ports system instead. The Mono ports typically contain platform specific patches which have either not been merged upstream or to work around idiosyncrasies in the system.

Questions regarding problems running or using Mono on any of these platforms are best directed to the port maintainer or the project's ports mailing list first. These are the people best able to discern platform specific issues vs. general Mono issues.

