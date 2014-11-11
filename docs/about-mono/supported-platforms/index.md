---
title: Plataformas Suportadas
redirect_from:
  - /Supported_Platforms/
  - /Platforms_Supported/
  - /Template:Platforms_Supported/
---

Mono possui suporte para os sistemas operacionais de 32 e 64 bits sobre uma série de arquiteturas, bem como vários sistemas operacionais.

### Sistemas Operacionais Suportados

**Sistemas Operacionais**

-   [Linux](/docs/about-mono/supported-platforms/linux/)
-   [Mac OS X](/docs/about-mono/supported-platforms/osx/), [iPhone OS](/docs/about-mono/supported-platforms/iphone/)
-   [Sun Solaris](/docs/about-mono/supported-platforms/solaris/)
-   [BSD](/docs/about-mono/supported-platforms/bsd/) - OpenBSD, FreeBSD, NetBSD
-   [Microsoft Windows](/docs/getting-started/install/windows/)
-   [Nintendo Wii](/docs/about-mono/supported-platforms/wii/)
-   [Sony PlayStation 3](/docs/about-mono/supported-platforms/playstation3/)

### Arquiteturas Suportadas

Mono possui ambos os sistemas otimizados de tempo de execução, o just-in-time (JIT) e o interpretador. O interpretador é muito menos complexo e foi utilizado principalmente nos estágios iniciais, antes de uma versão JIT ser implantada em tal arquitetura. Arquiteturas onde o JIT já foi portado o interpretador não é mais suportado.

|Arquiteturas Suportadas|Tempo de Execução|Sistema Operacional|
|:----------------------|:------|:---------------|
|[s390, s390x (32 e 64 bits)](/docs/about-mono/supported-platforms/s390/)|JIT|Linux|
|[SPARC (32)](/docs/about-mono/supported-platforms/sparc/)|JIT|Solaris, Linux|
|[PowerPC](/docs/about-mono/supported-platforms/powerpc/)|JIT|Linux, Mac OSX, Wii, PlayStation 3|
|[x86](/docs/about-mono/supported-platforms/x86/)|JIT|Linux, FreeBSD, OpenBSD, NetBSD, Microsoft Windows, Solaris, OS X, Android|
|[x86-64](/docs/about-mono/supported-platforms/amd64/): AMD64 and EM64T (64 bit)|JIT|Linux, FreeBSD, OpenBSD, Solaris, OS X|
|[IA64](/docs/about-mono/supported-platforms/ia64/) Itanium2 (64 bit)|JIT|Linux|
|[ARM](/docs/about-mono/supported-platforms/arm/): little e big endian|JIT|Linux (antigas e novas aplicações de interfaces binárias (ABI)), iPhone, Android|
|Alpha|JIT|**não mantido**. Linux|
|[MIPS](/docs/about-mono/supported-platforms/mips/)|JIT|Linux|
|HPPA|JIT|**não mantido** Linux|

Repare que as arquiteturas Alpha, MIPS, ARM big-endian e HPPA são suportadas por comunidades e podem não estar completas como as outras arquiteturas.
Suporte para SPARC64 funciona em versões antigas do Mono, mas não em versões recentes.

 Pacotes para mais plataformas estão disponíveis na página de [Downloads](/download/).

### Sistemas Embarcados

Para deixar o mono mais adequado em arquiteturas que utilizam sistemas embarcados, dê uma olhada na página [small-footprint](/docs/compiling-mono/small-footprint/).
