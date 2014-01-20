---
layout: blog
title: "New Mono Releases!"
author: Miguel de Icaza
---

The Mono team has been busy working on Mono, and we have done seven releases since our last blog post.   Our latest Mono 3.0.12 contains a load of new features:

* Support for MacOS X Mavericks
* Portable Class Libraries runtime support: you can now run PCL code with Mono.
* XBuild now supports Portable Class Libraries
* mkbundle now uses IKVM.Reflection, allowing you to create bundles with any profile, without resorting to hacks
* We fixed LLVM loadable module on OSX
* New Entity Framework shipping with Mono
* csharp REPL terse bug fixes.
* Fine tuning of our internal uses of the class libraries for performance
* ```System.WeakReference<T>```, ```Volatile.Read/Write<T>``` and ```Interlocked.MemoryBarrier ()```.
* SGen can now return memory to the OS
* WCF has cookie support
* Many performance optimizations on Marshal class
* LINQ optimizations
* Many fixes to our SGen concurrent collector

[New Mono Builds](http://www.go-mono.com/mono-downloads/download.html "Mono Download"), [Release Notes](http://www.mono-project.com/Release_Notes_Mono_3.0#New_in_Mono_3.0.12 "Mono 3.0 release notes.")
