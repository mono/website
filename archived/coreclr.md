---
title: CoreCLR
redirect_from:
  - /Moonlight2CoreCLR/
  - /docs/advanced/coreclr/
---

Note: due to the circular nature of the definitions you'll need some prior knowledge of the CoreCLR security model **or** reading it twice to make sense out of this ;-)

Security levels
===============

The CoreCLR security model divide all code into three distinct levels: **transparent**, **safe-critical** and **critical**. This model is much simpler to understand (and implement) than [CAS](/docs/advanced/cas/) (e.g. no stack-walk). Only a few rules can describe much of it.

Transparent
-----------

By default all code is *transparent* under the CoreCLR model.

-   *Transparent* code is limited to what it can do. Specifically it cannot directly call **critical** code (e.g. p/invokes, unsafe code) but it can call *safe-critical* and other *transparent* code.

-   Since it's default there's no need to add a `[SecurityTransparent]` attribute everywhere.

Safe Critical
-------------

Safe critical code is a **gateway** between *transparent* and *critical* code. As such it represent the *riskiest* code (the less, the better).

-   Code needed to bridge a (safe) *transparent* API to (not necessarily safe) *critical* code needs to be decorated with `[SecuritySafeCritical]` attributes.

-   *Safe critical* code needs to make extra (pre and/or post) validations between the *transparent* and *critical* in order to make the call earn its **safe** prefix.

Critical
--------

Critical code can do anything, like p/invoking into native code and having access to everything outside the host browser. The plugin itself could not work without critical code. However applications can (and must) do without direct access to it.

-   Critical code, including every visible API that does things that application code should not do (e.g. file IO), must be marked with a `[SecurityCritical]` attribute.

-   All unsafe code, p/invoke declarations are **critical** (but still needs to be marked as such).

Code categories
===============

To make this even easier to understand, from an application developer point of view, all assemblies are split into two categories: the **application** (or user) code and the **platform** code.

Application Code
----------------

Application code runs with *limited* trust. This makes it possible, along with other features, to safely run untrusted code inside your browser. Application code is bound by the following rules:

-   All *application* code is **transparent**. Using attributes to (try to) change this will compile but will be **ignored** at execution time.

-   As **transparent** it can call other *application* code (all transparent) and *platform* code that is **transparent** (default) or decorated with the `[SecuritySafeCritical]` attribute.

-   *Application* code cannot **directly** call `[SecurityCritical]` decorated methods/types present in *platform* code.

Platform Code
-------------

Platform code is a subset of the managed code provided with the plugin. This code is fully-trusted. As such it cannot expose all of its API to *application* code, instead it expose them using three different security levels (see next section).

-   *Platform* code is, by default, **transparent**. This means that most of it can be called directly from *application* code.

-   *Platform* code contains **critical** code - i.e. code that do anything (like p/invoking, unsafe code). Such code is decorated with `[SecurityCritical]` attributes and **cannot** be called from *application* code.

-   Access from **transparent** to **critical** code (e.g. using the safe, and transparent, IsolatedStorage that itself use the p/invoke, and critical, System.IO code) is possible thru code decorated with a `[SecuritySafeCritical]` attribute.

Platform Code Assemblies includes:

-   mscorlib
-   Microsoft.VisualBasic [1][2]
-   System
-   System.Core
-   System.Net
-   System.Runtime.Serialization
-   System.ServiceModel [1][2]
-   System.ServiceModel.Web [1]
-   System.Windows
-   System.Windows.Browser
-   System.Xml

[1] does not contain any [SecurityCritical] or [SecuritySafeCritical] attribute [2] has a different public key than the other assemblies

Both [1] and [2] may be considered platform code - but since they don't (but, I guess, eventually could) use `[SecurityCritical]` nor `[SecuritySafeCritical]` they are in effect totally transparent (like application code).

Where ? On Windows / Silverlight 2 the platform files can be found in:

-   C:\\Program Files\\Microsoft Silverlight\\2.0.31005.0
-   C:\\Program Files\\Microsoft SDKs\\Silverlight\\v2.0\\Reference Assemblies

The later only exists if you have the Silverlight 2 SDK installed.

Application Developer Shortcut
==============================

Just remember this: under the CoreCLR an *application* can call anything (i.e. **transparent** or **safe-critical**) as long as it is not **critical**.

Special Considerations
======================

[InternalsVisibleTo]
--------------------

Special care is needed wrt **internal** code since most of the **platform** assemblies include `[InternalsVisibleTo]` attributes - and yes, the internals are open to some **non-platform** (i.e. application code) assemblies.

Reflection
----------

Reflection is possible but has some limitations.

Reflection.Emit
---------------

Code generation is possible (e.g. DLR) but also has some limitations.

Policies
--------

The *CoreCLR* security model does not deal with policies - its decisions are a boolean **CAN** or **CANNOT** do. While this works for the most basic parts it does not solve cases where more elaborate access rules are required, e.g.:

-   downloader policies
-   sockets policies

Special care (outside the scope of *CoreCLR*) are needed to cover them.

Implementation details
======================

Security Attributes Compatibility
---------------------------------

Calls from **application code** to **platform code** (that Moonlight provides) either succeed (e.g. calling transparent or `[SecuritySafeCritical]` code) or fails (e.g. calling `[SecurityCritical]` code).

Since there is **no** distinction from calling **transparent** or **safe critical** code our (Moonlight) `[SecuritySafeCritical]` attributes do not need to match Silverlight implementation. However we do have to match `[SecurityCritical]` attributes on the visible (public and protected) API.

References
==========

-   [Introducing Microsoft Silverlight 1.1 Alpha](http://blogs.msdn.com/bclteam/archive/2007/04/30/introducing-microsoft-silverlight-1-1-alpha-justin-van-patten.aspx) by Justin Van Patten
-   [The Silverlight Security Model](http://blogs.msdn.com/shawnfa/archive/2007/05/09/the-silverlight-security-model.aspx), [Silverlight Security II: What Makes a Method Critical](http://blogs.msdn.com/shawnfa/archive/2007/05/10/silverlight-security-ii-what-makes-a-method-critical.aspx) and [Silverlight Security III: Inheritance](http://blogs.msdn.com/shawnfa/archive/2007/05/11/silverlight-security-iii-inheritance.aspx) by Shawn Farkas
-   [CLR Inside Out: Security In Silverlight2](http://msdn.microsoft.com/en-us/magazine/cc765416.aspx) by Andrew Dai
-   [Security Guidance for Writing and Deploying Silverlight Applications](http://www.microsoft.com/downloads/details.aspx?displaylang=en&FamilyID=7cef15a8-8ae6-48eb-9621-ee35c2547773)
