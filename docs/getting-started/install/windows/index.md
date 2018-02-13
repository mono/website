---
title: Install Mono on Windows
redirect_from:
  - /Using_Mono_on_Windows/
  - /Mono%3AWindows/
---

Mono runs on Windows, this page describes the various features available for users who want to use Mono on Windows as well as using Mono-based technologies on Windows without Mono (like Gtk#).

1.  Download the latest Windows installer from the [download](/download/stable/) page.
2.  Run the installer and accept the terms of the license. Mono is now installing:

    [![windows-install-mono.png](/images/windows-install-mono.png)](/images/windows-install-mono.png)

The installer creates a "Open Mono Command Prompt" shortcut under the Mono program group in the start menu.
This shortcut starts a command shell with Mono-relevant path information already configured, which means all the Mono tools "just work".

[![windows-install-mono-cmd.png](/images/windows-install-mono-cmd.png)](/images/windows-install-mono-cmd.png)

At this point, it’s a good idea to run through the basic hello world examples on [this page](/docs/getting-started/mono-basics/) to verify Mono is working correctly.

Gtk#
-----

[Gtk#](/docs/gui/gtksharp/) is included as part of the Mono installation, this will allow you to create Gtk# applications on Windows with the Mono runtime which you can later deploy into Linux. See the [Gtk#](/docs/gui/gtksharp/) page for more details about the toolkit, or go directly to the [Gtk# beginner's guide](/docs/gui/gtksharp/beginners-guide/).

Alternatively, if you only want to use Gtk# on Windows, without Mono, you can use the [Gtk# installer for the .NET Framework](/docs/gui/gtksharp/installer-for-net-framework/).

Mono in the Windows 10 Bash
---------------------------

Windows 10 Insider builds 14316 and greater come with an *experimental*, optional Ubuntu subsystem that exposes bash as an alternative shell. This can be used to install the Debian/Ubuntu version of Mono alongside or instead of the Windows version. Note that this feature is in beta and you need to [manually enable it](http://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/). For more information about how to install Mono inside Windows Bash and known problems, refer to [this issue](https://github.com/mono/website/issues/199).
