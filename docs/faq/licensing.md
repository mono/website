---
layout: docpage
navgroup: docs
title: "FAQ: Licensing"
redirect_from:
  - /FAQ:_Licensing/
  - /FAQ_Licensing/
  - /License/
  - /Licensing/
---

Licensing
---------

**Can I write commercial or proprietary applications that run with Mono?**

Yes. The licensing scheme is planned to allow proprietary developers to write applications with Mono.

**What license or licenses are you using for the Mono Project?**

We use four open source licenses:

-   The C\# compiler is dual-licensed under the MIT/X11 license and the [GNU General Public License](http://www.opensource.org/licenses/gpl-license.html) (GPL).

-   The tools are released under the terms of the [GNU General Public License](http://www.opensource.org/licenses/gpl-license.html) (GPL).

-   The runtime libraries are under the [GNU Library GPL 2.0](http://www.gnu.org/copyleft/library.html#TOC1) (LGPL 2.0).

-   The class libraries are released under the terms of the [MIT X11](http://www.opensource.org/licenses/mit-license.html) license.

-   ASP.NET MVC, the Managed Extensibility Framework (MEF), the Dynamic Language Runtime (DLR), System.Data.Services.Client, parts of System.Numerics and ASP.NET AJAX client software are released by Microsoft under the open source [Microsoft Permissive License](http://www.opensource.org/licenses/ms-pl.html), some of them are dual licensed also as [Apache2](http://www.apache.org/licenses/LICENSE-2.0)

Mono is available to be licensed commercially if the LGPL/GPL/X11 combination is not suitable for you. [Xamarin](http://xamarin.com/) offers [commercial licensing](http://xamarin.com/licensing) options to redistribute Mono under non-LGPL terms. If your organization intends to redistribute software which embeds or bundles Mono, but is unable to comply with the terms of GNU LGPL v2, the Ultimate Edition may be right for you.

For other licensing options, [contact us](http://www.go-mono.com/contact/).

**Why are the class libraries licensed under the MIT X11 license?**

Originally, the class libraries were released under the terms of the GNU Library GPL (LGPL). The problem with the GNU LGPL is an outdated wording related to "derived works". A derived work of the library must be covered by the same license as the library itself. This definition was fine before object oriented frameworks existed, but with the introduction of object oriented frameworks, different people disagree whether some code that uses object-oriented inheritance is an instance of a "derived work".

The class libraries are a big component of Mono and it is where the most diverse group of individuals have contributed to.

Given the ambiguity, and given the chance that every author to the class libraries could have a different understanding of the terms of the license, we chose a license that was still an open source/free software license, but did not have these ambiguities.

The ambiguity would have allowed an author of the code would demand an application developer to release pieces of its source code based on a technicality, and we did not want to risk the future of Mono on this.

**When do I need to obtain a license from Xamarin to the Mono Runtime?**

We only require licensing for uses of Mono and Moonlight on embedded systems, or systems where you are unable to fulfill the obligations of the GNU LGPL.

For example, if you manufacture a device where the end user is not able to do an upgrade of the Mono virtual machine or the Moonlight runtime from the source code, you will need a commercial license of Mono and Moonlight.

Or if you ship an application that requires to statically link the Mono runtime and you are not able to provide the object code to relink Mono, you must obtain a commercial license from Xamarin.

Use our [Contact](http://www.go-mono.com/contact/) form with the information about your needs to discuss this.

**I would like to contribute code to Mono under a particular license. What licenses will you accept?**

We will have to evaluate the licenses for compatibility first, but as a general rule, we will accept the code under the same terms of the "container" module.

**Why does Xamarin require a copyright assignment?**

When a developer contributes code to the C\# compiler or the Mono runtime engine, we require that the author grants Xamarin the right to relicense his/her contribution under other licensing terms.

This allows Xamarin to re-distribute the Mono source code to parties that might not want to use the GPL or LGPL versions of the code.

Particularly embedded system vendors obtain grants to the Mono runtime engine and modify it for their own purposes without having to release those changes back.

Patents
-------

**Could patents be used to completely disable Mono?**

No. For a more nuanced response, see the next question.

**What kind of patent coverage exists for Mono?**

The coverage is divided in various areas, that we explore below:

-   Code covered under the Microsoft Community Promise (ECMA/ISO standards)
-   Microsoft code licensed under the MS-PL or Apache2 Licenses, which come with patent grants.
    -   Class libraries shipped with Mono
    -   Code not in ECMA/ISO but opened with patent grants by the .NET Micro Framework.
-   Standards covered by the [Microsoft Open Specification Promise](http://www.microsoft.com/interop/osp/default.mspx)
-   Code protected by the [Moonlight 3/4 patent covenant](http://www.microsoft.com/interop/msnovellcollab/newmoonlight.mspx)

First some background information.

The .NET Framework is divided in two parts: the ECMA/ISO covered technologies and the other technologies developed on top of it like ADO.NET, ASP.NET and Windows.Forms.

Mono implements the ECMA/ISO covered parts, as well as being a project that aims to implement the higher level blocks like ASP.NET, ADO.NET and Windows.Forms.

The Mono project has gone beyond both of those components and has developed and integrated third party class libraries, the most important being: Debugging APIs, integration with the Gnome platform (Accessibility, Pango rendering, Gdk/Gtk, Glade, GnomeUI), Mozilla, OpenGL, extensive database support (Microsoft only supports a couple of providers out of the box, while Mono has support for 11 different providers), our POSIX integration libraries and finally the embedded API (used to add scripting to applications and host the CLI, or for example as an embedded runtime in Apache).

The core of the .NET Framework, and what has been patented by Microsoft falls under the ECMA/ISO submission.

Microsoft [has announced](http://port25.technet.com/archive/2009/07/06/the-ecma-c-and-cli-standards.aspx) that the ECMA standards for C\# and the CLI are covered under the [Community Promise](http://www.microsoft.com/interop/cp/default.mspx) patent license.

Basically a grant is given to anyone who want to implement those components for free and for any purpose.

**In addition** to the grants made on the Community Promise, they have also released large swats of code under the Microsoft Public License and the Apache2 licenses, code that Mono bundles, for example the Managed Extensibility Framework, the Dynamic Language Runtime, ASP.NET MVC and even an embedded version of .NET and a complete CLI implementation with a complete class library called the .NET Micro Framework. All of the code in there comes with a patent grant.

The actual patent coverage includes the sum of both the ECMA-covered standards, their MS-PL licensed code and their Apache licensed code.

For people who need full compatibility with the Windows platform, Mono's strategy for dealing with any potential issues that might arise with ASP.NET, ADO.NET or Windows.Forms is: (1) work around the patent by using a different implementation technique that retains the API, but changes the mechanism; if that is not possible, we would (2) remove the pieces of code that were covered by those patents, and also (3) find prior art that would render the patent useless.

Not providing a patented capability would weaken the interoperability, but it would still provide the free software / open source software community with good development tools, which is the primary reason for developing Mono.

The patents do not apply in countries where software patents are not allowed.

For Linux server and desktop development, we only need the ECMA components, and things that we have developed (like Gtk\#) or Apache integration.

**Are there alternatives to ASP.NET?**

Yes, there are a number of alternatives that people have been using for developing Web applications that do not use the ASP.NET model: [Jitsu](http://www.jitsu.org) and [Dream](http://developer.mindtouch.com/Dream).

**Are there alternatives to Windows.Forms?**

Yes, there are plenty of alternatives, including [Gtk\#]({{ site.github.url }}/docs/gui/gtksharp/) see our page on [Gui Toolkits]({{ site.github.url }}/docs/gui/gui-toolkits/) for more information.

**Is Mono only an implementation of the .NET Framework?**

Mono implements both the .NET Framework, as well as plenty of class libraries that are ethier UNIX specific, [Gnome](http://www.gnome.org) specific, or that are not part of the .NET Framework but people find useful.

Mono can also be used a Java Virtual Machine via [IKVM](http://www.ikvm.net).

Old Background
==============

This contains some old information that we are keeping here for the sake of finding it for future reference. The information below is now superseded by Microsoft's announcement on using the Community Promise for the ECMA CLI and C\#.

 Jim Miller at Microsoft has made a statement on the patents covering ISO/ECMA, (he is one of the inventors listed in the patent): [here](http://web.archive.org/web/20030424174805/http://mailserver.di.unipi.it/pipermail/dotnet-sscli/msg00218.html). Microsoft's letter to ECMA is [here](http://www.ecma-international.org/publications/files/ECMA-ST/Ecma%20PATENT/ECMA-334%20&%20335/2001ga-123%20&%202002ga-003.pdf).

Credits
-------

The FAQ contains material contributed by Miguel de Icaza, Jaime Anguiano, Lluis Sánchez.

