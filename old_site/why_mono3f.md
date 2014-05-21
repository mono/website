---
layout: obsolete
title: "Why Mono%3F"
lastmodified: '2005-04-12'
permalink: /old_site/Why_Mono%3F/
redirect_from:
  - /Why_Mono%3F/
---

Why Mono%3F
===========

Mono and Linux Adoption
=======================

Companies who haven't adopted Linux often cite the lack of Linux applications as a reason. In turn, the small number of Linux applications is related to the existing development tools and the size of the developer base. Although Linux is hugely successful to run server applications it has not thrived as a platform for developers of desktop software. The Mono project exists to change this. We want to make it easy for the huge number of Windows developers to build Linux applications.

Currently, Windows-based developers moving to Linux have a huge learning curve. They have to face a new environment, a new set of APIs, the lack of portability for any of their code, an unfamiliar set of tools and a disparate and non-coherent development platform. They're used to tools like MS Visual Studio, which requires engineers to work in a very different way than vi or Emacs and a command-line compiler.

The Open Source culture does not take binary nor backwards compatibility particularly seriously, but the corporate world sees things differently. This is something that software companies have to take very seriously if we want developers to use Linux: software developed today should run in 20 years without modification.

.NET -and by extension Mono- have been designed to work in this situation.

Mono and Linux adoption: Server
===============================

Goals:

-   Deploy ASP.NET web servers and web services on Linux.
-   Leverage Linux security, reliability and low cost.
-   Reuse third-party controls, components and applications on Linux.

Mono enables developers to bring server-side applications that have been developed with the Microsoft .NET Framework over to Unix servers.

Today Windows users have a choice of platform for enterprise applications: Sun's J2EE platform and Microsoft's .NET platform, while Linux/Unix users have been limited to only Sun's J2EE platform.

With Mono, Windows developers can use existing development tools and deploy on clusters of Linux servers.

Mono and Linux adoption: Desktop
================================

Goals:

-   Increase development productivity.
-   Bring Windows ISVs to Linux Desktop.
-   Reuse third-party tools, controls, components and applications on Linux.
-   Support both Windows and Linux: share code. ****

The success of the Linux platform is tied to having an encompassing development platform.

Unlike the server side where the development platform is fairly complete, Linux client side development is relatively weak. Either it is not as mature, or the fragmentation of libraries has made it very hard to have a unified development stack. Various libraries can be used to build applications but the result is a very diverse quilt of technologies and methodologies, often leading to instabilities, dependencies and wasted hours of debugging time.

The Mono platform has one advantage: since it is relatively new it has been able to absorb all of today's needs into a unified platform with a unified programming model and brings a lot of clarity to today's development platform.

Mono's advanced runtime gives developers many features for free: automatic garbage collection, thread safety, and safety from buffer overflows and other sources of security exploits.

The C\# language incorporates various concepts that are normally used in GUI application development directly into the language as first-class language constructs like events, delegates, properties and attributes.

The addition of Visual Basic and Windows.Forms (Q4/2004) to Mono will also help migrate this important group of developers from the Windows platform to Linux.

