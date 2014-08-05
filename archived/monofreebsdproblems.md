---
title: "Mono:FreeBSD-Problems"
lastmodified: '2005-04-04'
redirect_from:
  - /Mono:FreeBSD-Problems/
---

Mono:FreeBSD-Problems
=====================

Reporting problems to BSD\#
---------------------------

When reporting problems we need certain information to help us. The following directions will help you to give us the information we need to solve your problem.

Crashes in a C\# application

-   Run in a terminal window:

<!-- -->

    (Using sh/ksh/bash shell)
    $ export MONO_LOG_LEVEL=debug
    $ export MONO_DEBUG=yes
    $ application
    ...recreate crash...

    (Using csh/tcsh shell)
    $ setenv MONO_LOG_LEVEL debug
    $ setenv MONO_DEBUG yes
    $ application
    ...recreate crash...

Crashes in the Mono runtime

-   Run in a terminal window:

<!-- -->

    $ cd /usr/ports/lang/mono or mono-devel
    $ make CFLAGS+="-g" STRIP="" build
    $ make deinstall
    $ make reinstall
    $ gdb /usr/local/bin/mono
    (gdb) run /path/to/C#/program/that/causes/crash
    ...recreate crash...
    (gdb) bt full

Please then cut and paste the terminal output and send an email to [bsd-sharp-list](http://forge.novell.com/modules/xfmod/maillist/subscribe.php?group_id=1498&list=bsd-sharp-list). Include in that email the version of Mono being used, FreeBSD or BSD\# ports, and the versions of any other applications involved in the crash. If you are not sure whether the crash you are experiencing is an application or runtime crash then run the application in a terminal window and cut and paste the output into your email and we will determine what you need to do next.

