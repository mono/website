---
title: "SecurityValidation"
lastmodified: '2010-02-10'
redirect_from:
  - /SecurityValidation/
---

SecurityValidation
==================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#general">1 General</a></li>
<li><a href="#securitysafecritical-validation">2 [SecuritySafeCritical] Validation</a>
<ul>
<li><a href="#how">2.1 How</a>
<ul>
<li><a href="#review">2.1.1 Review</a></li>
<li><a href="#alternative-solutions">2.1.2 Alternative solutions</a></li>
</ul></li>
</ul></li>
<li><a href="#internalsvisibleto-validation">3 [InternalsVisibleTo] Validation</a>
<ul>
<li><a href="#20">3.1 2.0</a>
<ul>
<li><a href="#legend">3.1.1 Legend</a></li>
<li><a href="#notes">3.1.2 Notes</a></li>
</ul></li>
<li><a href="#30">3.2 3.0</a>
<ul>
<li><a href="#legend_2">3.2.1 Legend</a></li>
<li><a href="#notes_2">3.2.2 Notes</a></li>
</ul></li>
<li><a href="#40-beta">3.3 4.0 (beta)</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

General
=======

-   Before starting update/fix/remove TODO / FIXME / XXX so they don't get reported by the reviewer (which would mean fixing them anyway then another review for the results)

[SecuritySafeCritical] Validation
=================================

The security model provided by [CoreCLR]({{ site.github.url }}/Moonlight2CoreCLR "Moonlight2CoreCLR") makes it easier to review the most critical parts of the managed class libraries bundled with Moonlight 2. Basically there's two types of code:

-   **Transparent**: this includes application code and a large part of the class libraries. Transparent code has some limitation (e.g. no unsafe code, no p/invokes...) that makes it secure to execute untrusted, *transparent*, code inside the sandbox provided by CoreCLR.

-   **Critical**: this code has unrestricted access to the system (i.e. fully trusted by the runtime). Bugs inside critical code could compromise the sandbox.

**Critical** code is also split in two:

-   `[SecuritySafeCritical]` is code that **should be** safe to call from transparent code. "**Should be**" because we have tools to detect and tag them properly - but tagging that does **not** make them safe.

-   `[SecurityCritical]` is code that is not safe to call (e.g. unsafe code, p/invokes) from transparent code. This restriction is enforced by CoreCLR. `[SecurityCritical]` code is generally called by `[SecuritySafeCritical]` code (but can be called by the runtime too).

So the major goal of this part of the audit is to make sure `[SecuritySafeCritical]` **is** (instead of *should be*) safe to be called by transparent code.

How
---

-   Moonlight build tools automatically detect (and inject) the correct attributes for both `[SecuritySafeCritical]` and `[SecurityCritical]` code. All other code is transparent (default). So there is no need to manually classify managed code.

-   The 'audit.exe' tool is used to generate/update the list of `[SecuritySafeCritical]` methods and their review status. If the code of a method change then it's status goes back to **unreviewed**. This makes it possible to gradually review the code and keep the results meaningful.

-   To review code you simply need to looks at the unreviewed methods (one file per assembly), find it's source (either in /mcs/class or in /moon/class), review the code and update the audit data file.

### Review

-   First, spot why the method is critical. There could be several reasons why it was tagged as such.
-   Understand the flow between the (trusted code / user) provided parameters and how they are being used (or passed) to the critical code.
    -   Looking at the callers is not useful if the method is visible outside the assembly - in this case anyone (transparent code) can directly call it. Even if the method is not visible it's better not to assume anything about the caller(s) since this could change and won't be detected by `audit.exe`
-   Make sure all parameters (and the return value) are validated, e.g.
    -   values: like null, negative integers, NaN
    -   file path restrictions

-   Keep an eye on the math, in particular around bounds checks, since the ordering of the operations could lead to integer overflows.

Remember: From the platform (i.e. Moonlight) point of view `[SecuritySafeCritical]` is **not** safe (safety is *our* promise to application code) but is **critical** - it can do anything without being bothered by the CoreCLR restrictions.

Questions about the code ? ping the author(s) on [IRC]({{ site.github.url }}/IRC "IRC")!

### Alternative solutions

-   Large, complex methods might be refactored into smaller methods. This can allow you to move all critical code in a, simpler, method (cutting review time).

-   If the critical parts are not required for Moonlight then adding a `NET_2_1` around it will turn this method into a transparent method.

[InternalsVisibleTo] Validation
===============================

Serious side-effects can occur when platform code assemblies opens their internals to other assemblies. This makes it important to ensure that platform code does not open up to non-platform code (i.e. application code).

Moonlight use its [itv-check](http://anonsvn.mono-project.com/viewvc/trunk/moon/class/tuning/SecurityAttributes/ivt-check.cs?view=markup) tool ensure this rule is not broken (during **make install**).

However for various reasons some exceptions are required (or exists). The next section discuss and compare them to Microsoft Silverlight usage of the `[InternalsVisibleTo]` attribute.

2.0
---

**mscorlib.dll** - Trusted Platform Assembly

Mono.CompilerServices.SymbolWriter.dll

Moonlight Only

Desktop Only

MoonAtkBridge.dll

Moonlight Only

Separate Plugin

Microsoft.WlcProfile.dll

Silverlight Only

Unknown Assembly

Microsoft.WlcProfile.Internal.dll

Silverlight Only

Unknown Assembly

**System.dll** - Trusted Platform Assembly

Microsoft.WlcProfile.dll

Silverlight Only

Unknown Assembly

Microsoft.WlcProfile.Internal.dll

Silverlight Only

Unknown Assembly

**System.Net.dll** - Trusted Platform Assembly

Microsoft.WlcProfile.dll

Silverlight Only

Unknown Assembly

Microsoft.WlcProfile.Internal.dll

Silverlight Only

Unknown Assembly

**System.ServiceModel.dll** - Trusted Platform Assembly

System.Xml.Serialization.dll

Silverlight Only

Silverlight SDK

**System.ServiceModel.Web.dll** - Trusted Platform Assembly

System.Json.dll

Silverlight Only

Silverlight SDK

**System.Windows.dll** - Trusted Platform Assembly

MoonAtkBridge.dll

Moonlight Only

Separate Plugin

**System.Xml.dll** - Moonlight Transparent Platform Assembly

System.Xml.Serialization.dll

Silverlight Only

Silverlight SDK

### Legend

-   **Silverlight SDK** - Silverlight SDK assembly (transparent, needs to be part of the application XAP file)
-   **Desktop Only** - Internal access is **refused** under Moonlight's [CoreCLR]({{ site.github.url }}/Moonlight2CoreCLR "Moonlight2CoreCLR") (i.e. plugin) but is **allowed** for desktop usage (e.g. while compiling with `smcs`)
-   **Separate Plugin** - Considered platform code. Shipped in a separate plugin (XPI).
-   **Unknown Assembly** - Unknown origin (never seen the assembly in the *wild*)

### Notes

-   Platform assemblies that are not listed are not allowing non-platform assemblies to access their internals.
-   Moonlight results are subject to change. The above results for Moonlight match the December 17th 2.0 release.

3.0
---

**mscorlib.dll** - Trusted Platform Assembly

MoonAtkBridge.dll

Moonlight Only

Separate Plugin

Microsoft.WlcProfile.dll

Silverlight Only

Unknown Assembly

Microsoft.WlcProfile.Internal.dll

Silverlight Only

Unknown Assembly

**System.dll** - Trusted Platform Assembly

Microsoft.WlcProfile.dll

Silverlight Only

Unknown Assembly

Microsoft.WlcProfile.Internal.dll

Silverlight Only

Unknown Assembly

**System.Net.dll** - Trusted Platform Assembly

Microsoft.WlcProfile.dll

Silverlight Only

Unknown Assembly

Microsoft.WlcProfile.Internal.dll

Silverlight Only

Unknown Assembly

**System.ServiceModel.dll** - Trusted Platform Assembly

System.Xml.Serialization.dll

Silverlight Only

Silverlight SDK

System.ServiceModel.PollingDuplex.dll

Silverlight Only

Silverlight SDK

**System.ServiceModel.Web.dll** - Trusted Platform Assembly

System.Json.dll

Silverlight Only

Silverlight SDK

**System.Windows.dll** - Trusted Platform Assembly

MoonAtkBridge.dll

Moonlight Only

Separate Plugin

**System.Xml.dll** - Moonlight Transparent Platform Assembly

System.Xml.Serialization.dll

Silverlight Only

Silverlight SDK

### Legend

-   **Silverlight SDK** - Silverlight SDK assembly (transparent, needs to be part of the application XAP file)
-   **Separate Plugin** - Considered platform code. Shipped in a separate plugin (XPI).
-   **Unknown Assembly** - Unknown origin (never seen the assembly in the *wild*)

### Notes

-   Platform assemblies that are not listed are not allowing non-platform assemblies to access their internals.
-   Moonlight results are subject to change. The above results for Moonlight match the mid-February 3.0 preview 2 (aka Olympics) release.

4.0 (beta)
----------

later

