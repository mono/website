---
title: .NET Source Code Integration
---

With the recent open sourcing of parts of .NET, we want to bring the best pieces of .NET to Mono, and contribute the cross platform components of Mono to the .NET efforts.

This document describes the strategies that we will employ.

We will be [tracking the efforts on Trello](https://trello.com/b/vRPTMfdz/net-framework-integration-into-mono)

Background
==========

Microsoft is open sourcing .NET in two ways:

* [.NET Core](http://github.com/corefx): a re-imagined version of .NET that is suitable to be deployed alongside web apps and places a strong focus on a new set of assemblies and APIs based on the PCL 2.0 profile.   This is a full open source project, with Microsoft taking contributions and developing in the open.

* [Parts of the .NET Framework](http://github.com/Microsoft/referencesource): these are parts of the .NET framework as it ships on Windows, and the API that Mono has been implementing over the years.   The version published here is a snapshot of the .NET Framework source code. While Microsoft is publishing the source code, they are not actively developing this tree in the open, nor are they taking patches. 

Considerations
==============

This section lists a set of issues to keep in mind while bringing the Microsoft .NET source code into Mono, and what we need to keep in mind as we upgrade the code.

The list of issues below identifies the constraints that we have to bring .NET code into Mono.

Mono’s Platform Specific Code
-----------------------------

In numerous instances, Mono contains platform specific code which is currently missing from .NET.  There are a wide variety of features like this.  Some examples include:

* the `System.Environment` class which provides a platform-specific set of locations for applications to lookup certain well known file system locations.

* The `Registry` class which provides an abstraction that maps to Windows APIs or a file backed implementation on Unix.

Mono’s Classes with Tight Runtime Integration
---------------------------------------------

Some of the APIs in the .NET framework are bound to have tight dependencies on their runtime implementation.  Just like Mono’s implementation does.

There are cases where we might want to take on the extra challenge of doing the runtime integration work (for example, switching from our barely maintained decimal support, to Microsoft’s version would be a win).  In other cases, the amount of work is not worth doing the changes, like the support for `System.Reflection.Emit`.

Mono Profiles
-------------

Mono ships a mobile API profile which is designed to be a lightweight API profile and is used in mobile devices, game consoles and the Mono for Unreal Engine project.

The Mobile Profile basically removes some of the heavier .NET dependencies from the system.  It mostly deals with removing `System.Configuration` dependencies from our class libraries.

Mono Core
---------

In the long term, we want to adopt a .NET-Core like approach, where we have a thin layer of platform/VM specific APIs, and we allow users to use Mono in the same way that .NET core can be used, without the large libraries/profiles.

Mono Classes are Linker Friendly
--------------------------------

Some of the class libraries in Mono have been designed to keep the result linker-friendly, an important piece of functionality required by our Android and iOS deployments.

This comes in the form of removing some runtime weak association with a strong association, or teaching our linker and class libraries of connections between certain classes and their requirements.  Many of those links would likely exist in .NET as well, but we would need to ensure that we do not regress when incorporating code here.

Base Class Libraries Bootstrapping
----------------------------------

The bootstrapping of the core libraries is not exactly fun.  Microsoft has cyclic dependencies on various assembly groups.  For example `mscorlib`, `System`, `System.Xml`, `System.Configuration` and `System.Core` are build referencing each other’s types.  Another cluster includes the `System.Web` family.

Mono currently has a multi-stage build process to create these libraries that have cyclic dependencies.  Bringing new code from Microsoft is possible, but for each class that we bring, we might need to adjust the cyclic dependency build.

Limited Man Power
-----------------

We have limited manpower, so when bringing code from .NET, we need to pick our battles.

The pieces of Mono that have been used the most are of higher quality than the pieces that have not been used very much, or have not been maintained for a long time.

It is best to focus our efforts on the high-value targets in the .NET class libraries than to bring things that are known to work well in Mono and are well tested.

Some .NET Code might not be complete
------------------------------------

Some of the .NET code that we are getting might not be complete, it might be missing resources, strings, build files and might not be trivially buildable.   So it important that when you submit a pull request, the patch builds completely.

Performance/Memory side effects
-------------------------------

This is mostly a non-issue, but we might find cases where Mono class libraries have been fine-tuned for use in the Mono runtime and bringing the equivalent code from Microsoft might regress our performance or make us allocate more memory.

Some items to watch out for:

* **Code Access Security checks**: these are likely present in .NET, and they do not exist in Mono.   They are relatively expensive to perform, and Mono’s does not even implement it correctly.   So we would need to ifdef out all the CAS-related support when importing the code.

* **Object Disposed*: Mono did not always faithfully implement the object disposed pattern.   This is a pattern where objects that implement `IDisposable` throw the `ObjectDisposedException` whenever an object’s Dispose method was called, but a member of that instance was called.   This requires extra testing that Mono currently does not have in a few places.    It might not matter, but we might want to watch out for this.

* **Enumeration Validation**: .NET tends to validate the values of enumeration passed to its functions.  Mono does not do this, so we might have a performance impact when we bring some of the code. 

Code Access Security Checks is probably the one that we should be worried about, as it is completely useless in Mono.

Compile-Time Defines
--------------------

The Microsoft source code contains many different kinds of compiler defines that are used for conditional compilation.   Whenever we are importing code from Microsoft, we need to perfom an audit and determine which features


Strategy
========

In general, we will be integrating code from the [Reference Source](http://github.com/Microsoft/referencesource) release, as this contains the API that is closest to Mono.

We [are tracking the task assignements](https://trello.com/b/vRPTMfdz/net-framework-integration-into-mono) on Trello.

Later on, when we implement Mono Core, we will instead contribute the VM/OS specific bits to .NET Core.

We need to come up with an integration plan that will maximize the benefits to Mono and our users with the least amount of engineering effort.  While in an ideal world we could bring some 80-90% of the code over, this is a major effort with many risks involved.  We will prioritize the work to focus on what would give us the most benefits upfront for the Mono community, and leave the more complex/harder difficult bits for later.

Giving Mono a big boost from the start

When bringing code to Mono, we can bring code in the following ways:

* Entire assemblies
* Entire classes
* Blended Work
* Individual members

**Entire Assemblies:** We should port entire assemblies when our assembly is known to be very buggy, in bad shape, or just completely broken.

Immediate candidates for this include:

* WCF - almost immediately
* System.Web - almost immediately

Medium term candidates include:

* System.Configuration - possible, but requires careful examination
* System.Linq.Data
* Remoting

Long term candidates include:

* XML stack

Entire Classes: We would port entire classes when a class or a family of classes is known in Mono to be buggy, poorly maintained or a source of problems.  Candidates for this include:

* System.Text.RegularExpressions

** Blended Work: **

These are libraries of high quality code and whose Mono counterpart might be known to have limitations, bugs or problems.    But yet, the Microsoft implementation contains dependencies on native libraries that do not exist across all platforms.

* HTTP client stack
* `System.Data.*` - Microsoft's impementation has many dependencies on native code that need to be refactored to be cross platform.


** Individual Members:** We will find some of this code in a few places.  There are places in Mono that while pretty good overall, might have some known bugs and limitations.  The binding functionality in System.Reflection is an example of a method that works, but might have bugs and mistakes on the edges.

Porting and Regressions
-----------------------

Whenever we bring .NET code to replace Mono code, there might be cases where we introduce a regression of some kind: functionality, performance or we bring in a behavior that is incompatible with the idioms that Mono users have used for a long time.

In general, when porting code to Mono, we should make sure that Mono’s test suite continues to pass, and that no regressions are introduced. If a regression is introduced, we need to file a bug and track this particular problem.

Very popular, mostly bug-free APIs: skip
----------------------------------------

Mono’s core is in very good shape, and there will be very little value in bringing the .NET implementation to Mono.  It would consume valuable engineering time to replace good code with another piece of good code, while also paying the price of potential regressions.

Empowering Third Parties
------------------------

There are certain pieces of code that are going to be difficult to do, but if we do them, we can assist third parties that do not know as much about Mono’s internals or our build process to contribute.

Dealing with System.Configuration
---------------------------------

In general, the idiom that we will use when porting code that involves `System.Configuration` that we want to support both in the full profile mode and the Mobile Profile mode will be roughly:

* Comment out the public class that subclasses `ConfigurationSection`.
* Keep the `SettingsSectionInternal` class around, since so much code depends on it.
* ifdef-out the constructor that depends on `System.Configuration` from this class that uses `System.Configuration`, and replace it instead with hardcoded values that we obtain from running the code in .NET and obtaining the default values.
* Add the `partial` class modifier to the `SettingsSectionInternal` class.
* Provide a constructor in the partial class in Mono to setup the default values.
* Track each setting, so that we can later decide if we want to provide a C# API to change these values.

Source Code Style
-----------------

When making changes, try to keep the style of the original project. If you are making changes to .NET's code, use their style.   When making changes to Mono, use our style.

We believe that we can mostly make few changes to the upstream code and mostly use either `#if' blocks, `partial` classes and split a few things to achieve portability.

.NET Core and Mono
==================

We want to contribute some of the cross platform code from Mono, as well as chunks that we port from the .NET Framework Reference Source to the .NET Core effort.

We will update this page with information as the porting process at Microsoft evolves and we can volunteer some of our/their code back to the .NET Core effort.

