---
title: BSD
redirect_from:
- /Mono%3ABSD/
---

Mono support for BSD based operating systems.

Packaging for BSD operating systems
-----------------------------------

Running Mono on BSD operating systems is supported independently by the respective system's maintainers through their ports. All users should check their ports tree, typically located under lang/mono, in order to install the latest runtime version supported by their specific version of the OS.

For more information regarding specific BSD flavors:
- FreeBSD [(Port)](http://www.freebsd.org/cgi/cvsweb.cgi/ports/lang/mono/) [(Maintainer)](http://code.google.com/p/bsd-sharp/)
- NetBSD [(Port)](http://cvsweb.netbsd.org/bsdweb.cgi/pkgsrc/lang/mono/)
- OpenBSD [(Port)](http://www.openbsd.org/cgi-bin/cvsweb/ports/lang/mono/))
- [Debian GNU/kFreeBSD](http://www.debian.org/ports/kfreebsd-gnu/) [(Package)](https://packages.debian.org/unstable/interpreters/mono-runtime)

Using Mono under BSD
--------------------

It is typically recommended that BSD users **DO NOT** download the standard source tarball from the project's and attempt to build it themselves but instead use the ports system available for their platform. These Mono ports typically contain platform specific patches which have either not been merged upstream or may not work outside their target system.

Questions regarding any type of problem encountered in running Mono under these operating systems are best directed to their port's maintainer or the project's mailing list. These people are the most suited to discern between platform specific issues vs. Mono related ones.
