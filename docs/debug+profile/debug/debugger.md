---
title: Debugger
redirect_from:
  - /Debugger/
  - /MDB/
---

The Mono runtime implements a debugging interface that allows debuggers and IDEs to debug managed code. This is called the [Soft Debugger](/docs/advanced/runtime/docs/soft-debugger/) and is supported by MonoDevelop, Visual Studio for Mac and Visual Studio (when the appropriate plugins are installed) as well as the command line [SDB client](https://github.com/mono/sdb).

Mono provides .NET API to communicate with the debugger in Mono.Debugger.Soft.dll assembly. It can be used to create your own debugging client or for similar purposes.

In addition to managed code debugging, you can [use the Unix GDB debugger with Mono](/docs/debug+profile/debug/) to debug low level runtime problems.

Bugs
----

[Known issues](https://github.com/mono/mono/labels/area-Debugger)
