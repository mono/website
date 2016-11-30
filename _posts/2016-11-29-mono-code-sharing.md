---
layout: blog
title: Future of Mono's .NET Code Sharing
author: Miguel de Icaza
tags: [plans]
---

Mono's use of Reference Source Code
===================================

Since the first release of the .NET open source code, the Mono project
has been integrating the published [Reference
Source](https://github.com/microsoft/referencesource) code into Mono.

We have been using the Reference Source code instead of the
[CoreFX](https://github.com/dotnet/corefx), as Mono implements a
larger surface area than what is exposed in there - Mono implements
the .NET Desktop API.

Integrating the code sometimes is easy, we replace the code in Mono
with the reference source code.  When the code is not exactly
portable, we need to make it portable and either write missing code,
or integrate some of the work that we did in Mono, with the code that
existed in .NET.  There are some cases where porting the code is just
too complicated, and we have not been able to do the work.

We keep track of the [major
items](https://trello.com/b/vRPTMfdz/net-framework-integration-into-mono)
in Trello.

Originally, we [forked the reference source
code](https://github.com/mono/referencesource) and kept a
[branch](https://github.com/mono/referencesource/tree/mono) with our
code, but it was too large of an external dependency and it was also a
module that was quite static.  So recently, we started copying the
code that we needed [directly into
Mono](https://github.com/mono/mono/tree/master/mcs/class/referencesource).

While this has worked fine for a while, the .NET Reference Source is
only updated when a major .NET release takes place, and it tracks the
version of .NET that ships along with Windows.  This means that we are
missing on many of the great optimizations and improvements that are
happening as part of [.NET Core](https://www.microsoft.com/net/core).

The optimizations and fine tuning typically take place in two places,
work that goes into `mscorlib.dll` is maintained in the
[coreclr](https://github.com/dotnet/coreclr) module while the higher
level frameworks are maintained in the
[corefx](https://github.com/dotnet/corefx) module.

A New Approach
==============

Many of the APIs that were originally removed from CoreFX are now
being added back, so we can start to consider switching away from
referencesource and into CoreFX.

After discussing with the .NET Core team, we came up with a better
approach for the long-term maintenance of the shared code.

The .NET team has now setup a new repository where the cleaned up and
optimized version of `mscorlib.dll` will live in the
[corert](https://github.com/dotnet/corert) module.

What we will do is submodule both CoreRT and CoreFX and replace our
manually copied code from the Reference Source with code from CoreRT
and CoreFX.

The twist is that for scenarios where Mono's API surface is larger, we
will contribute changes back to CoreRT/CoreFX where we either add
support for the larger API surface, or we make the API pluggable
(likely with a tasteful use of the `partial` modifier).

One open issue is that Mono has historically used a single set of
framework libraries (like mscorlib.dll, System.dll etc.) that work
across Linux, MacOS, Unix and Windows and they dynamically detect
how to behave based on the platform.  This is useful on scenarios
where you want to bootstrap work in one platform by using another
one, as the framework libraries are identical.

CoreFX takes a different approach, the libraries are tied to a
particular platform flavor.

This means that some of the work that we will have to do will involve
either adjusting the CoreFX code to work in the way that Mono works,
or give up on our tradition of having the same assemblies work across
all platforms.
