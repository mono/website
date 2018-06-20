---
title: Supported Platforms
redirect_from:
  - /Supported_Platforms/
  - /Platforms_Supported/
  - /Template%3APlatforms_Supported/
---

Mono has support for both 32 and 64 bit systems on a number of architectures as well as a number of operating systems.

### Supported Operating Systems

**Operating Systems**

-   [Linux](/docs/about-mono/supported-platforms/linux/)
-   [macOS](/docs/about-mono/supported-platforms/macos/), [iOS, tvOS, watchOS](/docs/about-mono/supported-platforms/apple/)
-   [Sun Solaris](/docs/about-mono/supported-platforms/solaris/)
-   [IBM AIX and i](/docs/about-mono/supported-platforms/aix/)
-   [BSD](/docs/about-mono/supported-platforms/bsd/) - OpenBSD, FreeBSD, NetBSD
-   [Microsoft Windows](/docs/getting-started/install/windows/)
-   [Sony PlayStation 4](/docs/about-mono/supported-platforms/playstation4/)
-   [XboxOne](/docs/about-mono/supported-platforms/xbox-one/)

### Supported Architectures

Mono has both an optimizing just-in-time (JIT) runtime and a interpreter runtime. The interpreter runtime is far less complex and is primarily used in the early stages before a JIT version for that architecture is constructed. The interpreter is not supported on architectures where the JIT has been ported.

|Supported Architectures|Runtime|Operating system|
|:----------------------|:------|:---------------|
|[s390x (64 bits)](/docs/about-mono/supported-platforms/s390/)|JIT|Linux|
|[SPARC (32)](/docs/about-mono/supported-platforms/sparc/)|JIT|Solaris, Linux|
|[PowerPC](/docs/about-mono/supported-platforms/powerpc/)|JIT|Linux, AIX, i, macOS, Wii, PlayStation 3|
|[x86](/docs/about-mono/supported-platforms/x86/)|JIT|Linux, FreeBSD, OpenBSD, NetBSD, Microsoft Windows, Solaris, macOS, Android|
|[x86-64](/docs/about-mono/supported-platforms/amd64/): AMD64 and EM64T (64 bit)|JIT, Interpreter|Linux, FreeBSD, OpenBSD, Solaris, macOS|
|[ARM](/docs/about-mono/supported-platforms/arm/): little and big endian|JIT, Interpreter (arm64 only)|Linux (both old and new ABI), iPhone, Android|
|[MIPS](/docs/about-mono/supported-platforms/mips/)|JIT|Linux|

Note that the MIPS, PowerPC, SPARC, S390X, and ARM big-endian are community-supported and may not be as complete as the other architectures.

Packages for most platforms are available from the [Downloads](/download/stable/) page.

### Embedded systems

To make mono more suitable for some architectures used as embedded systems have a look at the [Small footprint](/docs/compiling-mono/small-footprint/) page.

### Deprecated Platforms

Support for the following platforms is only available for older versions of Mono (that you can retrieve from the Git history, or via licensing from Novell) but are not up-to-date and are no longer maintained:

- [Sony PlayStation 3](/docs/about-mono/supported-platforms/playstation3/)
- [Nintendo Wii](/docs/about-mono/supported-platforms/wii/)
- HPPA architecture on HP-UX.
- Alpha architecutre on Linux.
- S390 architecture on Linux (the 32-bit version)
- [IA64](/docs/about-mono/supported-platforms/ia64/) Itanium2 (64 bit) on Linux
- SPARC64 a community effort that was not merged.
