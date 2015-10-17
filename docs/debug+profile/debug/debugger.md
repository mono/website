---
title: Debugger
redirect_from:
  - /Debugger/
  - /MDB/
---

A runtime do Mono implementa uma interface de depuração que permite depuradores e IDEs para depurar código gerenciado. Isso é chamado de [Soft Debugger](/docs/advanced/runtime/docs/soft-debugger/) e é suportado por MonoDevelop, Xamarin Studio e Visual Studio (quando os plugins adequados estão instalados), bem como a linha de comando [SDB client](https://github.com/mono/sdb).

Mono fornece uma API para se comunicar com o depurador e criar suas próprias UIs de depuração através do assembly Mono.Debugger.Soft.dll

Além disso, se você pode [utilizar o depurador Unix GDB com o Mono](/docs/debug+profile/debug/) para depurar problemas de baixo nível.

Bugs
====

Debugger bug tracking:

-   [[Query](http://bugzilla.ximian.com/buglist.cgi?product=Mono%3A+Debugger&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&order=bugs.bug_id)] [[Add](http://bugzilla.ximian.com/enter_bug.cgi?product=Mono%3A+Debugger)]


