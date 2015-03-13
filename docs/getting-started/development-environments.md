---
title: Development Environments
redirect_from:
  - /Development_Environments/
  - /Monodevelop/
  - /Development_Environment/
---

O Projeto  Mono foca ... focuses on compilers and runtime libraries and does not directly provide an IDE. Developers must choose from a series of available tools the one best suited for them.

MonoDevelop
-----------

[MonoDevelop](http://www.monodevelop.com) is a Mono/C# Integrated Development Environment for Windows, Linux and OS X. It parses your C# and VB programs as you type them and is able to provide contextual completion of methods.

In late 2003, a few developers from the Mono community began migrating SharpDevelop, a successful .NET open source IDE from System.Windows.Forms on Windows to Gtk# on Linux. A rebranded version named [Xamarin Studio](http://xamarin.com/studio) is sold by the commercial sponsor behind the project with proprietary iOS/Android addins.

Unix tools
----------

As you might expect, there are many development tools available to C# developers, ranging from bare-bones text editors to complex integrated development environments.

**Using Emacs or Vim**

Emacs and Vim are general purpose text editors, not IDEs designed for use with .NET and C#. However, you can use them to write software in nearly any language.

For Emacs, you will want to use the C# major mode available at [www.cybercom.net](http://www.cybercom.net/~zbrad/DotNet/Emacs) to handle syntax coloring and proper indentation. You may want to install the [OmniSharp](https://github.com/OmniSharp/omnisharp-emacs) plugin for autocompletion and various other features.

Vim supports syntax highlighting for C#. For autocompletion, the [OmniSharp](https://github.com/OmniSharp/omnisharp-vim) plugin is also available.

Eclipse
-------

The Eclipse IDE can be used to edit C# code, but lacks completion of methods. The [emonic](http://emonic.sourceforge.net/) project is not maintained anymore.
