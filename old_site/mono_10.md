---
layout: obsolete
title: "Mono 1.0"
permalink: /old_site/Mono_1.0/
redirect_from:
  - /Mono_1.0/
  - /Mono_1.0_Assemblies/
---

Mono 1.0
========

The following components make up the Mono 1.0 release.

For information about the new Mono see [Mono\_1\_1]({{site.github.url}}/old_site/Mono_1_1 "Mono 1 1").

Notice that these are \*assemblies\*, they are not namespaces. Each assembly normally contains code that spans multiple namespaces (mscorlib contains 37 namespaces), but there are a lot of people who seem confused about this.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#assemblies">1 Assemblies</a>
<ul>
<li><a href="#stable-assemblies">1.1 Stable Assemblies</a></li>
</ul></li>
<li><a href="#assemblies-under-development">2 Assemblies Under Development</a></li>
<li><a href="#missing-assemblies">3 Missing Assemblies</a></li>
<li><a href="#third-party-assemblies">4 Third Party Assemblies</a></li>
<li><a href="#languages">5 Languages</a>
<ul>
<li><a href="#stable-languages">5.1 Stable Languages</a></li>
<li><a href="#unstable-languages">5.2 Unstable Languages</a></li>
</ul></li>
<li><a href="#virtual-machine">6 Virtual Machine</a></li>
</ul></td>
</tr>
</tbody>
</table>

Assemblies
==========

Stable Assemblies
-----------------

The following assemblies are feature complete:

            Commons.RelaxNG
            Cscompmgd
            Mono.Data
            Mono.Data.Tds
            Mono.Posix
            Mono.Security
            Mono.Security.Win32
            System.Web
            System.Configuration.Install
            System.Data
            System.Data.OracleClient
            System.DirectoryServices
            System
            System.Drawing
            System.Runtime.Remoting
            System.Security
            System.Web.Services
            System.XML

Assemblies Under Development
============================

The APIs in the following assemblies are not complete and are not guaranteed to work:

            Accessibility
            Mono.Cairo
            Mono.CSharp.Debugger
            Mono.Data.DB2Client
            Mono.Data.SqlLite
            Mono.Data.SybaseClient
            Mono.GetOptions
            System.Web.Mobile
            System.Design
            System.Drawing.Design
            System.Windows.Forms
            Formatters.Soap
            Mono.Data.TdsClient (older Sybase and MS SQL)
            System.EnterpriseServices

Missing Assemblies
==================

    Missing:
            System.Management
            System.Messaging
            System.ServiceProcess
            System.Web.RegularExpressions

Third Party Assemblies
======================

These are third party assemblies that we ship with Mono, guarantees about API stability are tracked by the owners of each one of these:

    Third party assemblies.
            ByteFX.Data
            Npgsql
            PEAPI
            SharpZipLib.
            
            Java integration with IKVM.NET

Languages
=========

Stable Languages
----------------

Mono 1.0 only shipped with C\# as a stable and complete language.

Unstable Languages
------------------

These languages are not complete in the Mono 1.0 release: VB.NET, JScript.

Virtual Machine
===============

-   JIT, 32 bits: PPC, x86, SPARC

-   JIT, 32 bits, unstable: S390

-   Interpreter, 32 bits: s390, HPPA, StrongARM, SPARC v8


