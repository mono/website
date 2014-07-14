---
layout: docpage
navgroup: docs
title: Supported Platforms
---

Mono has support for both 32 and 64 bit systems on a number of architectures as well as a number of operating systems.

### Supported Operating Systems

**Operating Systems**

-   [Linux]({{ site.github.url }}/docs/about-mono/platforms/linux/)
-   [Mac OS X]({{ site.github.url }}/docs/about-mono/platforms/osx/), [iPhone OS]({{ site.github.url }}/docs/about-mono/platforms/iphone/)
-   [Sun Solaris]({{ site.github.url }}/docs/about-mono/platforms/solaris/)
-   [BSD]({{ site.github.url }}/docs/about-mono/platforms/bsd/) - OpenBSD, FreeBSD, NetBSD
-   [Microsoft Windows]({{ site.github.url }}/docs/getting-started/install/windows/)
-   [Nintendo Wii]({{ site.github.url }}/docs/about-mono/platforms/wii/)
-   [Sony PlayStation 3]({{ site.github.url }}/docs/about-mono/platforms/playstation3/)

### Supported Architectures

Mono has both an optimizing just-in-time (JIT) runtime and a interpreter runtime. The interpreter runtime is far less complex and is primarily used in the early stages before a JIT version for that architecture is constructed. The interpreter is not supported on architectures where the JIT has been ported.

|Supported Architectures|Runtime|Operating system|
|:----------------------|:------|:---------------|
|[s390, s390x (32 and 64 bits)]({{ site.github.url }}/docs/about-mono/platforms/s390/)|JIT|Linux|
|[SPARC (32)]({{ site.github.url }}/docs/about-mono/platforms/sparc/)|JIT|Solaris, Linux|
|[PowerPC]({{ site.github.url }}/docs/about-mono/platforms/powerpc/)|JIT|Linux, Mac OSX, Wii, PlayStation 3|
|[x86]({{ site.github.url }}/docs/about-mono/platforms/x86/)|JIT|Linux, FreeBSD, OpenBSD, NetBSD, 
 Microsoft Windows, Solaris, OS X, Android|
|[x86-64]({{ site.github.url }}/docs/about-mono/platforms/amd64/): AMD64 and EM64T (64 bit)|JIT|Linux, FreeBSD, OpenBSD, 
Solaris, OS X|
|[IA64]({{ site.github.url }}/docs/about-mono/platforms/ia64/) Itanium2 (64 bit)|JIT|Linux|
|[ARM]({{ site.github.url }}/docs/about-mono/platforms/arm/): little and big endian|JIT|Linux (both old and new ABI), iPhone, Android|
|Alpha|JIT|**not maintained**. Linux|
|[MIPS]({{ site.github.url }}/docs/about-mono/platforms/mips/)|JIT|Linux|
|HPPA|JIT|**not maintained** Linux|

Note that the Alpha, MIPS, ARM big-endian and HPPA architectures are community-supported and may not be as complete as the other architectures.

Support for SPARC64 works in older versions of Mono, but not in the recent versions.

 Packages for most platforms are available from the [Downloads]({{ site.github.url }}/download/) page.

### Embedded systems

To make mono more suitable for some architectures used as embedded systems have a look at the [Small footprint]({{ site.github.url }}/docs/compiling-mono/small-footprint/) page.
