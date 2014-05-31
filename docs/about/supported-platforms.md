---
layout: docpage
navgroup: docs
title: Supported Platforms
permalink: /docs/about/supported-platforms/
---

Mono has support for both 32 and 64 bit systems on a number of architectures as well as a number of operating systems.

### Supported Operating Systems

**Operating Systems**

-   [Linux]({{site.github.url}}/old_site/Mono:Linux "Mono:Linux")
-   [Mac OS X]({{site.github.url}}/old_site/Mono:OSX "Mono:OSX"), [iPhone OS]({{site.github.url}}/old_site/Mono:Iphone "Mono:Iphone")
-   [Sun Solaris]({{site.github.url}}/old_site/Mono:Solaris "Mono:Solaris")
-   [BSD]({{site.github.url}}/old_site/Mono:BSD "Mono:BSD") - OpenBSD, FreeBSD, NetBSD
-   [Microsoft Windows]({{site.github.url}}/old_site/Using_Mono_on_Windows)
-   [Nintendo Wii]({{site.github.url}}/old_site/Mono:Wii "Mono:Wii")
-   [Sony PlayStation 3]({{site.github.url}}/old_site/Mono:PlayStation3 "Mono:PlayStation3")

### Supported Architectures

Mono has both an optimizing just-in-time (JIT) runtime and a interpreter runtime. The interpreter runtime is far less complex and is primarily used in the early stages before a JIT version for that architecture is constructed. The interpreter is not supported on architectures where the JIT has been ported.

|Supported Architectures|Runtime|Operating system|
|:----------------------|:------|:---------------|
|[s390, s390x (32 and 64 bits)]({{site.github.url}}/old_site/Mono:S390 "Mono:S390")|JIT|Linux|
|[SPARC (32)]({{site.github.url}}/old_site/Mono:SPARC "Mono:SPARC")|JIT|Solaris, Linux|
|[PowerPC]({{site.github.url}}/old_site/Mono:PowerPC "Mono:PowerPC")|JIT|Linux, Mac OSX, Wii, PlayStation 3|
|[x86]({{site.github.url}}/old_site/Mono:X86 "Mono:X86")|JIT|Linux, FreeBSD, OpenBSD, NetBSD, 
 Microsoft Windows, Solaris, OS X, Android|
|[x86-64]({{site.github.url}}/old_site/Mono:AMD64 "Mono:AMD64"): AMD64 and EM64T (64 bit)|JIT|Linux, FreeBSD, OpenBSD, 
Solaris, OS X|
|[IA64]({{site.github.url}}/old_site/Mono:IA64 "Mono:IA64") Itanium2 (64 bit)|JIT|Linux|
|[ARM]({{site.github.url}}/old_site/Mono:ARM "Mono:ARM"): little and big endian|JIT|Linux (both old and new ABI), iPhone, Android|
|[Alpha](/index.php?title=Mono:Alpha&action=edit&redlink=1 "Mono:Alpha (page does not exist)")|JIT|**not maintained**. Linux|
|[MIPS]({{site.github.url}}/old_site/Mono:MIPS "Mono:MIPS")|JIT|Linux|
|[HPPA](/index.php?title=Mono:HPPA&action=edit&redlink=1 "Mono:HPPA (page does not exist)")|JIT|**not maintained** Linux|

Note that the Alpha, MIPS, ARM big-endian and HPPA architectures are community-supported and may not be as complete as the other architectures.

Support for SPARC64 works in older versions of Mono, but not in the recent versions.

 Packages for most platforms are available from the [Downloads]({{site.github.url}}/old_site/Downloads "Downloads") page.

### Embedded systems

To make mono more suitable for some architectures used as embedded systems have a look at the [Small footprint]({{site.github.url}}/old_site/Small_footprint "Small footprint") page.
