---
title: SPARC
redirect_from:
  - /Mono%3ASPARC/
---

Platforms Supported
-------------------

Currently, only the 32 bit SPARCv8 ABI is supported (32 bit userspace).

Operating Systems Supported
---------------------------

At this point, only the Solaris operating system is supported.

Mono releases from 1.1.14 onward should run on Linux/SPARC as well.

Building Mono on Solaris
------------------------

To build Mono on Solaris you will need a complete GNU toolchain:

-   Use GNU tar to unpack the sources, as Solaris tar has problems unpacking Mono.

-   Do not use any of the Solaris tools for the build (cc, ld, as, m4, yacc, sed), make sure that you have a set of GNU tools. When running configure, make sure that none of the build tools used are from Solaris. Set CC=gcc and use gmake for the build.

-   You might need to add /usr/ccs/bin to your PATH since it contains the 'ar' utility needed during the build.

-   /usr/ccs/bin contains an 'mcs' command which has the same name as our C# compiler. This will confuse the build process, so either rename it to something else, or copy the 'ar' command to another directory and include that directory in your path instead of /usr/ccs/bin.

-   If during compilation, gcc reports errors in system header files, you might need to to patch the header files to be compatible with gcc. To do this, run (as root);

<!-- -->

    cd /usr/local/lib/gcc-lib/sparc-sun-solaris<SOL VERSION>/<GCC VERSION>/install-tools
    ./mkheaders
