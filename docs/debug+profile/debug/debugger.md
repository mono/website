---
layout: docpage
navgroup: docs
title: Debugger
redirect_from:
  - /Debugger/
  - /MDB/
---

The Mono runtime implements a debugging interface that allows debuggers and IDEs to debug managed code. This is called the [Soft Debugger]({{ site.github.url }}/docs/advanced/runtime/docs/soft-debugger/) and is supported by both MonoDevelop, Xamarin Studio and Visual Studio (when the appropriate plugins are installed) as well as the command line [SDB client](https://github.com/mono/sdb).

Mono provides an API to communicate with the debugger and create your own debugging UIs via the Mono.Debugger.Soft.dll assembly

In addition, if you can [use the Unix GDB debugger with Mono]({{ site.github.url }}/docs/debug+profile/debug/) to debug low level problems.

Bugs
====

Debugger bug tracking:

-   [[Query](http://bugzilla.ximian.com/buglist.cgi?product=Mono%3A+Debugger&bug_status=NEW&bug_status=ASSIGNED&bug_status=REOPENED&order=bugs.bug_id)] [[Add](http://bugzilla.ximian.com/enter_bug.cgi?product=Mono%3A+Debugger)]


