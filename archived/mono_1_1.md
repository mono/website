---
layout: obsolete
title: "Mono 1 1"
lastmodified: '2005-09-06'
permalink: /archived/Mono_1_1/
redirect_from:
  - /Mono_1_1/
---

Mono 1 1
========

The following list describes the state of Mono 1.1.x.

For information about the old Mono see [Mono\_1\_0](/index.php?title=Mono_1_0&action=edit&redlink=1 "Mono 1 0 (page does not exist)").

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
<li><a href="#assemblies-under-development">1.2 Assemblies Under Development</a></li>
<li><a href="#missing-assemblies">1.3 Missing Assemblies</a></li>
<li><a href="#third-party-assemblies">1.4 Third Party Assemblies</a></li>
</ul></li>
<li><a href="#languages">2 Languages</a>
<ul>
<li><a href="#stable-languages">2.1 Stable Languages</a></li>
<li><a href="#unstable-languages">2.2 Unstable Languages</a></li>
</ul></li>
<li><a href="#virtual-machine">3 Virtual Machine</a></li>
</ul></td>
</tr>
</tbody>
</table>

Assemblies
==========

Stable Assemblies
-----------------

The following assemblies are feature complete:

            Commons.Xml.Relaxng
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
            System.Windows.Forms
            System.XML

Assemblies Under Development
----------------------------

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
            Formatters.Soap
            Mono.Data.TdsClient (older Sybase and MS SQL)
            System.EnterpriseServices
            System.ServiceProcess

Missing Assemblies
------------------

    Missing:
            System.Management
            System.Messaging
            System.Web.RegularExpressions

Third Party Assemblies
----------------------

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

Mono 1.1 ships with a C\# compiler that supports both the 1.0 and 2.0 specifications.

Unstable Languages
------------------

These languages are not complete in the Mono 1.1 release: VB.NET, JScript.

Virtual Machine
===============

-   JIT, 32 bits: PPC, x86, SPARC, S390

-   JIT, 64 bits: x86-64, SPARCv9

-   Interpreter, 32 bits: s390, HPPA, StrongARM, SPARC v8


