---
title: Debugger
redirect_from:
  - /Debugger/
  - /MDB/
---

The Mono runtime implements a debugging interface that allows debuggers and IDEs to debug managed code. This is called the [Soft Debugger](/docs/advanced/runtime/docs/soft-debugger/) and is supported by MonoDevelop, Visual Studio for Mac and Visual Studio (when the appropriate plugins are installed) as well as the command line [SDB client](https://github.com/mono/sdb).

Mono provides an .NET API to communicate with the debugger and create your own debugging client by using the API available in Mono.Debugger.Soft.dll assembly.

In addition to managed code debugging, you can [use the Unix GDB debugger with Mono](/docs/debug+profile/debug/) to debug low level runtime problems.

Bugs
====

[Known issues](https://bugzilla.xamarin.com/buglist.cgi?component=Debugger&list_id=324673&product=Runtime&resolution=---)


