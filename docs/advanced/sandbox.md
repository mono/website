---
layout: docpage
navgroup: docs
title: MonoSandbox
redirect_from:
  - /Sandbox/
  - /MonoSandbox/
  - /SecuringSecondLife/
---

Starting with Mono 2.6, we have a security sandbox that allows executing untrusted code side-by-side with trusted code.

This work was part of the [Moonlight project]({{ site.github.url }}/docs/web/moonlight/) to create an open source and cross platform Silverlight implementation and to help projects like Second Life.

Originally Mono did not have a sandbox, but Moonlight required us to create a sandbox that would allow us to run untrusted code, potentially malicious code inside the Mono runtime.

For more information on the Mono sandbox, see:

-   [CoreCLR]({{ site.github.url }}/docs/advanced/coreclr/): The CoreCLR security system, as used in Silverlight.
-   [SecurityValidation]({{ site.github.url }}/archived/SecurityValidation "SecurityValidation"): The process we used to secure the sandbox.

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

Mono implements the [CoreCLR]({{ site.github.url }}/docs/advanced/coreclr/) security model, this requires a CIL verifier to ensure that the CIL bytecodes represent a real program, and it is also used at verification time to ensure that the code being compiled only accesses methods that they are allowed to, and that they only use CIL instructions that they have permission to use.

For example, trusted code (the code that implements the core libraries, like the String class) get access to both pointer arithmetic operations from the CIL as well as getting full access to any APIs that the system provides.

Untrusted code, will not get access to any CIL pointer instructions and can only use APIs that have been flagged as secure. Any attempts to use pointer instructions or restricted APIs are turned into an exception and the code is not even JIT compiled.

For example, the System.IO.File.Open() routine can be called by trusted code (this is used internally for example to read configuration files) but untrusted code can not call it. It can only reach Open through a gateway that would provide an open file from a secure location (IsolatedStorage for example).

Audit of the codebase
---------------------

The [SecurityValidation]({{ site.github.url }}/archived/SecurityValidation "SecurityValidation") page describes how the [Moonlight]({{ site.github.url }}/docs/web/moonlight/) managed assemblies are audited to allow the safe execution of untrusted code under the [CoreCLR]({{ site.github.url }}/docs/advanced/coreclr/).

