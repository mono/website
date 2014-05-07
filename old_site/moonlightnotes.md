---
layout: obsolete
title: "MoonlightNotes"
permalink: /old_site/MoonlightNotes/
redirect_from:
  - /MoonlightNotes/
---

MoonlightNotes
==============

Notes on the Moonlight implementation and notes on bringing Silverlight to Linux.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#Testing">1 Testing</a></li>
<li><a href="#Debugging_Tricks">2 Debugging Tricks</a>
<ul>
<li><a href="#Using_an_Alternate_Firefox">2.1 Using an Alternate Firefox</a></li>
<li><a href="#Debugging_JIT_issues">2.2 Debugging JIT issues</a></li>
</ul></li>
<li><a href="#Resources">3 Resources</a></li>
<li><a href="#Silverlight_SDKs">4 Silverlight SDKs</a>
<ul>
<li><a href="#For_Developing_on_non-Microsoft_Systems">4.1 For Developing on non-Microsoft Systems</a></li>
<li><a href="#Moonlight_IDE">4.2 Moonlight IDE</a></li>
<li><a href="#The_Moonlight_Engine">4.3 The Moonlight Engine</a>
<ul>
<li><a href="#Security_Model">4.3.1 Security Model</a></li>
<li><a href="#Other_Security_Requirements">4.3.2 Other Security Requirements</a></li>
<li><a href="#Media_Codecs">4.3.3 Media Codecs</a></li>
<li><a href="#Assemblies">4.3.4 Assemblies</a>
<ul>
<li><a href="#Dependencies">4.3.4.1 Dependencies</a></li>
<li><a href="#New_versioned_Libraries">4.3.4.2 New versioned Libraries</a></li>
</ul></li>
<li><a href="#API_Implementation">4.3.5 API Implementation</a>
<ul>
<li><a href="#System.ServiceModel.Web">4.3.5.1 System.ServiceModel.Web</a></li>
<li><a href="#System.Windows.dll">4.3.5.2 System.Windows.dll</a></li>
</ul></li>
<li><a href="#Compiler_Fixes">4.3.6 Compiler Fixes</a></li>
<li><a href="#LINQ">4.3.7 LINQ</a></li>
<li><a href="#Rendering">4.3.8 Rendering</a>
<ul>
<li><a href="#Cairo">4.3.8.1 Cairo</a></li>
<li><a href="#AntiGrain_2.4">4.3.8.2 AntiGrain 2.4</a></li>
</ul></li>
<li><a href="#Rendering_Pipeline">4.3.9 Rendering Pipeline</a>
<ul>
<li><a href="#Integration_with_Compiz">4.3.9.1 Integration with Compiz</a></li>
</ul></li>
<li><a href="#The_Plugin_and_the_DOM">4.3.10 The Plugin and the DOM</a>
<ul>
<li><a href="#Plugin_Loading">4.3.10.1 Plugin Loading</a></li>
</ul></li>
<li><a href="#Hosting_API">4.3.11 Hosting API</a></li>
<li><a href="#JavaScript_compiler">4.3.12 JavaScript compiler</a></li>
</ul></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Testing
=======

-   For a simple self contained html file with embedded Silverlight, [Moonlight\_Standalone\_File]({{site.github.url}}/old_site/Moonlight_Standalone_File "Moonlight Standalone File")
-   We need to be able to reuse existing, mostly unit, tests we already have. Here we face the same difficulties as the assemblies themselves (e.g. \#ifdef versus tools);
-   We need to run (parts of) the tests under the new security model - not just under Mono/Linux but also under MS Silverlight under Windows;
-   We need to expand those tests, e.g. new classes, more coverage;
-   [Instructions for Jackson's new test harness]({{site.github.url}}/old_site/Moonlight_Test_Harness "Moonlight Test Harness")

Debugging Tricks
================

Using an Alternate Firefox
--------------------------

If you are using Firefox on the desktop at the same time as you debug Moonlight, you will want to create a separate profile that you can use to debug Moonlight.

To do this, start firefox from the command line with the option:

``` bash
$ firefox -ProfileManager -no-remote
```

Create a new profile, give it a name, and then in future invocations, use:

``` bash
$ firefox -P debug -no-remote
```

Debugging JIT issues
--------------------

Since there is no way of passing command line options to the Mono VM embedded in the plugin, you can always wait inside gdb for the first time you get a breakpoint (it happens when the GC scans memory for the bottom of the stack) and you can set some o the debugging variables like this:

``` bash
(gdb) run -no-remote -P debug default.html
...
Program received signal SIGSEGV, Segmentation fault.
[Switching to Thread -1223038608 (LWP 19647)]
0xb2068da7 in GC_find_limit (p=0x89c6f8c "", up=0) at os_dep.c:813
813                     GC_noop1((word)(*result));
(gdb) p debug_options
$1 = {handle_sigint = 0, keep_delegates = 0, collect_pagefault_stats = 0, break_on_unverified = 0}
(gdb) p debug_options.break_on_unverified = 1
$2 = 1
(gdb) cont
```

In the above case, I set the break-on-unverified debugging option that will break into the debugger when unverifiable code is found.

Resources
=========

Books on WPF are good resources, although they cover the "larger" API of which Silverlight is merely a subset.

Some notes that are relevant to WPF have been moved to the [WPF]({{site.github.url}}/old_site/WPF "WPF") page.

[Adam Nathan's](http://blogs.msdn.com/adam_nathan/) book on WPF is very good, and it goes into some of the technical details that other books merely skim on.

Silverlight SDKs
================

Developers can create Silverlight 1.0 applications without any extra dependencies in MacOS and Linux. Silverlight 2.0 can optionally use C\# and the .NET framework to create applications.

For users of Silverlight 2.0 we are creating an SDK that developers can use to create applications on Linux, Unix and MacOS.

For Developing on non-Microsoft Systems
---------------------------------------

If you install Mono as described in the [Getting Started](#GettingStarted) section you will get an SDK that you can use to develop against Microsoft Silverlight and Mono Moonlight APIs.

Instead of using the **mcs** or **gmcs** compilers as you do regularly with Mono you need to use the **smcs** compiler that will generate and reference the proper assembly versions that are suitable for Silverlight development.

Moonlight IDE
-------------

Since Linux and MacOS developers will not be able to run Blend on their operating systems, we have created a XAML designer. This XAML designer is located on [SVN]({{site.github.url}}/old_site/SourceCodeRepository) in the module "lunareclipse".

Lunar Eclipse currently is a standalone desktop application but we want to build a MonoDevelop add-in to have a full Silverlight development experience and possible also port it to the web to provide a designer that MacOS users to use.

It also looks like the current VS.NET Orcas [can't help](http://silverlight.net/quickstarts/Start/BrowseApi.aspx) much to create Silverlight code based on the security attributes:

> The Silverlight assemblies include both members that can be used in Silverlight-based applications and members that can be referenced only by .NET Framework code. The members that cannot be used in Silverlight-based applications are identified by the presence of the SecurityCriticalAttribute attribute. The presence of this attribute is not visible in the Object Browser, so you cannot discern which members can be used for Silverlight-based applications. However, you will get an exception when you attempt to execute a security-critical member in a Silverlight-based application.

We should look into building such support into [MonoDevelop](http://www.monodevelop.org) code completion.

The Moonlight Engine
--------------------

Currently Moonlight supports the 1.0 engine (no runtime engine, purely exposed as Javascript) and the 2.0 engine (the runtime engine exposed to .NET).

### Security Model

Mono has not historically been used to run untrusted code inside the virtual machine. Although we have done some work towards the implementation of the [CAS]({{site.github.url}}/old_site/CAS "CAS") this work has not been completed.

Silverlight 2.0 introduce a new security model to replace [CAS]({{site.github.url}}/old_site/CAS "CAS") for it's applications. This model is discussed in details [here]({{site.github.url}}/old_site/Moonlight2CoreCLR "Moonlight2CoreCLR").

Details about how Moonlight implement this features can be found [here]({{site.github.url}}/old_site/MoonlightSecurity "MoonlightSecurity").

### Other Security Requirements

While this new security model looks easier to implement, wrt to the stackwalk-based [CAS]({{site.github.url}}/old_site/CAS "CAS"), most of the requirements for the [MonoSandbox]({{site.github.url}}/old_site/MonoSandbox "MonoSandbox") are still needed to provide a safe execution environment.

A few other things must be completed:

-   Complete the Mono verifier
-   [New Stack overflow prevention](http://bugzilla.ximian.com/show_bug.cgi?id=81685)
-   The previous section security infrastructure.
-   Code audit
-   Harden the runtime to prevent crashes from ill-formed assemblies.

### Media Codecs

Currently Moonlight implements its own media pipeline (fetching, streaming, demultiplexing) and uses ffmpeg codecs to decode audio and video. This is the default when you compile the source code yourself.

For the official release we will be using Microsoft's MediaPack a package that will provide Microsoft's own codecs for Moonlight. This code is currently under development.

### Assemblies

Silverlight is an extended subset of the 2.0 .NET framework. Existing assemblies (ECMA) are versioned as 2.1.0.0 which are reduced versions of the 2.0 libraries and have been annotated with the security attributes and have been expanded in a few areas.

[![20-to-21.png]({{site.github.url}}/old_site/images/2/2a/20-to-21.png)]({{site.github.url}}/old_site/images/2/2a/20-to-21.png)

Silverlight introduce new assemblies, all signed by the Microsoft key and versioned at 1.0.0.0 - except for **AGCLR.DLL** which isn't versioned in 1.1 Alpha (bug?).

#### Dependencies

As we can see in next figures Silverlight doesn't have any circular dependencies between it's assemblies, unlike Fx 2.0, which is good news and will reduce our build time (no special loops in the Makefiles like we have today).

[![Agclr.png]({{site.github.url}}/old_site/images/9/95/Agclr.png)]({{site.github.url}}/old_site/images/9/95/Agclr.png) [![Sxc.png]({{site.github.url}}/old_site/images/b/b3/Sxc.png)]({{site.github.url}}/old_site/images/b/b3/Sxc.png)

**Legend**

-   Assemblies in red are compiled with /unsafe;
-   "Trusted Callers" means that all assemblies can only be used from assemblies running at FullTrust. From a build point of view this means none of them have the AllowPartiallyTrustedCallers attribute;

#### New versioned Libraries

We introduced a new NET\_2\_1 define and a new net\_2\_1 profile in the build system. The resulting libraries would be a superset that encompasses both 2.0 and the 2.1 API, but since 2.0 and 2.1 only have a few intersection points we will probably expand the [Cecil Linker]({{site.github.url}}/old_site/Linker "Linker") to specifically tune the 2.1 library to its right size without entering the world of pain that it would be to maintain the 2.0 and 2.1 defines at the same time.

[![Mono20-to-21.png]({{site.github.url}}/old_site/images/d/da/Mono20-to-21.png)]({{site.github.url}}/old_site/images/d/da/Mono20-to-21.png)

In addition, we should look into injecting the security attributes System.Security.SecuritySafeCriticalAttribute and System.Security.SecurityCriticalAttribute out-of-line with another [Cecil]({{site.github.url}}/old_site/Cecil "Cecil")-based tool, again to avoid populating the code base with too many defines (Note: the injector has been completed).

Tasks:

-   Setup the build for 2.1.0.0 versioned libraries
-   Setup configure for it.
-   Setup the key signing setup, and our shoehorning-signer for it.
-   Setup mono-api-info, mono-api-compare, corcompare pages for it.
-   Integrate into the build system.

A peer project of this is [Completing the 2.0 Profile]({{site.github.url}}/old_site/Completing2.0Profile "Completing2.0Profile") effort. As both 2.1.0.0 and 2.0.0.0 share a lot in common.

I would like to avoid an ifdef mess, my personal hope is that we can create probably a new profile NET\_2\_1 that would be a superset of NET\_2\_0. The result would be a larger assembly than we need to have.

At that point, we should use the Cecil-based linker (which will have to be modified) and have the linker strip out all the public code that is not necessary in the 2.1 profile.

**Note:** I generated the corcompare output, but it is hard to read because many issues boil down to the missing attributes, so a first step might be to write the injection library to reduce some of the noise.

**Note:** For the curious the Microsoft [BCL Blog Team](http://blogs.msdn.com/bclteam/archive/2007/04/30/introducing-microsoft-silverlight-1-1-alpha-justin-van-patten.aspx) has published a list of the [BCL classes available in SL 1.1 Alpha](http://blogs.msdn.com/bclteam/attachment/2338963.ashx). Note that this is not complete (BCL only) and subject to changes.

### API Implementation

Since there is no SDK documentation shipping with Silverlight 1.1, one way of getting a list of APIs to implement is to use the procedure described in this document: [Explore Silverlight Assemblies with Visual Studio Object Browser](http://silverlight.net/quickstarts/Start/BrowseApi.aspx).

Alternatively, you can use \`monop2 -d assemblyname.dll' to get a list of classes and APIs from the Silverlight installation.

#### System.ServiceModel.Web

As part of the Google Summer of Code some of the APIs in this assembly will be implemented, but there are some areas that will not be implemented as part of it. There is currently nobody signed up for working on the Syndication APIs. And although these are not part of the Silverlight 1.1 release, they are on the roadmap.

#### System.Windows.dll

This contains the interface to the rendering engine and lives in two parts:

-   moon/src module on SVN (the C++ code)
-   moon/class/System.Windows on SVN (the C\# code)

The class hierarchy for instance (on the [WPFNotes]({{site.github.url}}/old_site/WPFNotes "WPFNotes") page) looks fairly simple, there are two kinds of classes there: those that derive from DependencyObject, and those that do not. The ones that derive from DependencyObject participate in the whole notification/propagation system and the others do not.

It is probably simple for those that want to contribute to start work on the classes that do not derive from DependencyObject. We should follow the regular process: write nunit test cases to understand the API, and then write the API.

One thing that seems clear to me is that the rendering should be done in the unmanaged world. Just like the full WPF does, it seems like the managed code is merely a front-end that communicates with the backend and creates the object in the unmanaged world. The unmanaged world actually does all the rendering. There are a couple of questions as to how much needs to go in the unmanaged world, but at least it is clear that anything that derives from Visual as well as the majority of the things references from them (Brushes and Transforms at least, and maybe also PathSegments?)

Currently the plan is to have the C++ code mirror the C\# class hierarchy, and it will be responsible for rendering and for loading XAML files into memory.

There are some stubbed out some classes in olive/class/agclr, but they are not complete and no real work has happened, there are just bits to see how pieces fit together.

### Compiler Fixes

Mono 1.2.4 is not able to build the DLR, you can either use SVN of mcs, or you can use Seo's patches for the IronPython/DLR distribution from [here](https://fepy.svn.sourceforge.net/svnroot/fepy/trunk/patches/2.0a1/)

### LINQ

Mono currently does not have a complete LINQ implementation, we need to complete those. They currently live in the mcs/class/System.Core directory.

There are plenty of things left to implement in the LINQ namespace.

Current developments:

-   Antonello contributed recently various core bits to LINQ.
-   Atsushi has been working on the XML Linq support.
-   Marek Safar has been working on the C\# 3 linq syntax.

### Rendering

We are currently using Cairo for rendering, but every once in a while we consider the use of AntiGrain, there are pros and cons to each one, and we have not really done any real work to compare one against the other in terms of performance yet.

Antigrain 2.4 is licensed under the MIT X11 license, which would be very good for embedded vendors, while Cairo is LGPL/MPL which is less friendly in some settings. Sadly Antigrain 2.5 is now dual-licensed under the GPL/commercial so we could potentially be stuck maintaining a 2.4-based codebase.

#### Cairo

Pros:

-   Potential for hardware acceleration in the future.
-   Maintained and used by multiple open source projects (Mozilla, Gtk+)
-   Well known in the Mono community
-   It is able to offload work to the X server.
-   Interaction between Cairo and X server is well understood and actively worked on.

Cons:

-   API is context-bound instead of parametrized: so there is an API overhead to switch from one set of brushes, patterns to another one while drawing two different objects.
-   License: LGPL/MPL, this might prevent its use on certain embedded scenarios (gaming consoles for example).
-   Not yet tuned for performance.

#### AntiGrain 2.4

Pros:

-   Very fast today.
-   Software.
-   Composable stack.
-   Template-based Parametrized API.
-   Good cross platform story (Win32, X11, Linux).

Cons:

-   C++

Agg 2.5 will ship with a libsigc++ license that will allow us to treat the code as MIT X11 unless the code is pulled out, allowing Antigrain to be used internally for Silverlight and allowing them to license Antigrain for other customers.

### Rendering Pipeline

Silverlight is a small subset of WPF.

Both the "real" WPF and Silverlight have two components: a managed component that provides the API, that exposes the dependency property system and provides the high-level interface to the rendering engine and an unmanaged component that renders the "scene".

There are also at least two threads: one that responds to redraw requests (to ensure that the content is always rendered regardless of whether the application is busy) and another that drives the process.

#### Integration with Compiz

In some early discussions with David Reveman (the designer of Xgl and Compiz), we are considering the definition of a rendering scene protocol that would allow in the presence of Compiz offload the work to the compositing manager and take advantage of the direct hardware interface that Compiz has.

### The Plugin and the DOM

[![]({{site.github.url}}/old_site/images/b/b7/Plugin.png)]({{site.github.url}}/old_site/images/b/b7/Plugin.png)

Plugin relation to the Browser

There are two directions of communication: the browser talking to the plugin, and the plugin talking to the browser.

The plugin will have to expose the internal tree structure to its host, this is simple to do, documentation on how to write Mozilla plugins is available [here](http://www.mozilla.org/projects/plugins/). Work on this will probably have to wait until we get the API to a reasonable state.

The other direction (plugin communicating with the browser) can be started right away. This is the System.Windows.Browser and System.Windows.Hosting namespaces (they live in System.Silverlight.dll).

Our initial goal is to support Mozilla so this should not be too hard.

#### Plugin Loading

Currently only one instance of the Mono virtual machine can live in a single process (the GC, signal handling, segfault handling all are controlled by the Mono runtime).

Open questions:

-   How should various plugins be isolated from each other?
-   Are AppDomains enough to isolate different plugins?
-   Should Mono be modified to support completely different applications?

### Hosting API

System.Silverlight.dll and Microsoft.Scripting.dll are involved.

Some notes at [MoonlightHostingNotes]({{site.github.url}}/old_site/MoonlightHostingNotes "MoonlightHostingNotes").

### JavaScript compiler

The JavaScript compiler does not look like it will be open sourced, but some comments from the Mix conference indicate that it is probably a small compiler (scanning and parsing) that defers most of the work to the DLR (already open source).

The size of the Javascript compiler in Silverlight and the runtime are 114,688 and 299,008 bytes respectively. Extrapolating this from the size of our C\# 1.0 compiler means that their Javascript compiler is roughly 9,000 lines of code, and the supporting runtime is roughly 22,000 lines of code.

We have a runtime we could start from already, but it will likely require some changes, while the Javascript compiler seems relatively trivial to implement.



