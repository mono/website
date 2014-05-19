---
layout: obsolete
title: "MonoSandbox"
permalink: /old_site/MonoSandbox/
redirect_from:
  - /MonoSandbox/
  - /SecuringSecondLife/
---

MonoSandbox
===========

Starting with Mono 2.6, we have a security sandbox that allows executing untrusted code side-by-side with trusted code.

This work was part of the [Moonlight project](/index.php?title=Moonlight_project&action=edit&redlink=1 "Moonlight project (page does not exist)") to create an open source and cross platform Silverlight implementation and to help projects like Second Life.

Originally Mono did not have a sandbox, but Moonlight required us to create a sandbox that would allow us to run untrusted code, potentially malicious code inside the Mono runtime.

For more information on the Mono sandbox, see:

-   [Moonlight2CoreCLR]({{site.github.url}}/old_site/Moonlight2CoreCLR "Moonlight2CoreCLR"): The CoreCLR security system, as used in Silverlight.
-   [SecurityValidation]({{site.github.url}}/old_site/SecurityValidation "SecurityValidation"): The process we used to secure the sandbox.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#security-issues">1 Security Issues</a>
<ul>
<li><a href="#metadata-integrity">1.1 Metadata integrity</a></li>
<li><a href="#cil-verification-and-coreclr-security">1.2 CIL Verification and CoreCLR Security</a></li>
<li><a href="#audit-of-the-codebase">1.3 Audit of the codebase</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Security Issues
===============

The sandbox is composed of various components to ensure that malicious code does not cause problems:

-   CIL verification
-   Metadata integrity
-   CoreCLR security
-   Audit of the runtime and assemblies
-   Stack Overflow.

The problem with building a sandbox is that it requires all of these mechanisms to be complete before the sandbox is secure and so useful. A sandbox without bytecode verfication is not useful.

Metadata integrity
------------------

Metadata integrity ensures that assemblies (.exe or .dll) programs are well formed and that they conform to what the runtime engine expects. The metadata verifier ensures that the JIT compiler will not try to access invalid information, or trick the JIT engine into reading or writing data that it is not supposed to.

CIL Verification and CoreCLR Security
-------------------------------------

Mono implements the [CoreCLR]({{site.github.url}}/old_site/Moonlight2CoreCLR "Moonlight2CoreCLR") security model, this requires a CIL verifier to ensure that the CIL bytecodes represent a real program, and it is also used at verification time to ensure that the code being compiled only accesses methods that they are allowed to, and that they only use CIL instructions that they have permission to use.

For example, trusted code (the code that implements the core libraries, like the String class) get access to both pointer arithmetic operations from the CIL as well as getting full access to any APIs that the system provides.

Untrusted code, will not get access to any CIL pointer instructions and can only use APIs that have been flagged as secure. Any attempts to use pointer instructions or restricted APIs are turned into an exception and the code is not even JIT compiled.

For example, the System.IO.File.Open() routine can be called by trusted code (this is used internally for example to read configuration files) but untrusted code can not call it. It can only reach Open through a gateway that would provide an open file from a secure location (IsolatedStorage for example).

Audit of the codebase
---------------------

The [SecurityValidation]({{site.github.url}}/old_site/SecurityValidation "SecurityValidation") page describes how the [Moonlight]({{site.github.url}}/old_site/Moonlight "Moonlight") managed assemblies are audited to allow the safe execution of untrusted code under the [CoreCLR]({{site.github.url}}/old_site/Moonlight2CoreCLR "Moonlight2CoreCLR").

