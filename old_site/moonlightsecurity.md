---
layout: obsolete
title: "MoonlightSecurity"
lastmodified: '2011-04-11'
permalink: /old_site/MoonlightSecurity/
redirect_from:
  - /MoonlightSecurity/
---

MoonlightSecurity
=================

CoreCLR *agnostic* information is available [here]({{ site.github.url }}/old_site/Moonlight2CoreCLR "Moonlight2CoreCLR").

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#attributes">1 Attributes</a>
<ul>
<li><a href="#goals">1.1 Goals</a></li>
<li><a href="#tools">1.2 Tools</a>
<ul>
<li><a href="#find-sc--compatibility">1.2.1 Find-SC : Compatibility</a></li>
<li><a href="#manual-override-files">1.2.2 Manual override files</a></li>
<li><a href="#detect">1.2.3 Detect</a></li>
<li><a href="#tuner">1.2.4 Tuner</a></li>
</ul></li>
<li><a href="#validation">1.3 Validation</a>
<ul>
<li><a href="#api-access-compatibility">1.3.1 API Access Compatibility</a></li>
<li><a href="#unit-tests">1.3.2 Unit tests</a>
<ul>
<li><a href="#securitycriticaltest">1.3.2.1 SecurityCriticalTest</a></li>
<li><a href="#reflectiontest">1.3.2.2 ReflectionTest</a></li>
<li><a href="#reflectionemittest">1.3.2.3 ReflectionEmitTest</a></li>
</ul></li>
</ul></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Attributes
==========

Silverlight **platform** code executes in three different states. Custom attributes are used to decorated methods (mostly, some types too) into

-   **transparent** code, using `[SecurityTransparent]` but you wont see many of them (if any) because *transparent* is default under the CoreCLR;
-   **safe critical**, using `[SecuritySafeCritical]`; and
-   **critical** code, using `[SecurityCritical]`

Those attributes are **not** part of Moonlight's source code (if they are present they will be ignored) but are kept into data files (compatibility and manual overrides) or are computed at build time before being *injected* by the tuner.

Goals
-----

The main goal is to make it easy to track changes by *automating* the process and by *centralizing* the information.

This means that we can adjust them quickly following updates to Silverlight 3.0 (e.g. bug fixes) or newer versions (e.g. 4.0). Even more important is that we don't need to consistently track all changes to mono libraries source code - which are heavily reused by Moonlight.

Tools
-----

### Find-SC : Compatibility

This tool is executed on *Silverlight* platform assemblies. It is similar in concept to *gui-compare* and *corcompare*. It list for each platform assembly what are the API (types and methods) decorated by `[SecurityCritical]` attributes. This list is important because it guarantees API compatibility with Silverlight.

The data files resuling from **find-sc** are kept in our [GIT](https://github.com/mono/moon/tree/master/class/SecurityAttributes/compatibility) repository.

### Manual override files

This is not a *real* tool since this is the result of a manual process. Applying the right security attributes into platform code '*cannot* be totally automatized. Some part will need to be customized, like removing some attributes or adding new ones.

The manual data *override* files are text files kept in our [GIT](https://github.com/mono/moon/tree/master/class/SecurityAttributes/overrides/) repository.

### Detect

This tool is executed on Moonlight platform assemblies. Its goals are to:

-   *automatically* detect cases where a `[SecurityCritical]` attribute is needed for code to be executed under the CoreCLR security manager. E.g. p/invoke and unsafe code **needs** to be decorated with `[SecurityCritical]` attributes otherwise they won't be executed.

-   *automatically* detect cases where a `[SecuritySafeCritical]` attribute is needed for code to be executed under the CoreCLR security manager. All code calling *critical* code **needs** to be decorated with `[SecuritySafeCritical]` attributes otherwise they won't be executed.

-   merge the previous (critical, safe-critical) data with the *compatibility* and manual *overrides* data.

Unlike the other tools the merged results are **not** kept in GIT and do not, by default, include any comments. You can run the 'detect' tool manually with the '--a' option to get extra annotations.

### Tuner

The tuning process has a step to inject the *right* security attributes into the Moonlight assemblies. The process looks like:

-   Remove any existing `[SecurityCritical]` or `[SecuritySafeCritical]` attributes (since we want to track them in as few places as possible)
-   add `[SecurityCritical]` and `[SecuritySafeCritical]` from the merged data files
    -   `[SecurityCritical]` will replace any `[SecuritySafeCritical]`
    -   `[SecuritySafeCritical]` is ignored if a `[SecurityCritical]` is already present

Validation
----------

### API Access Compatibility

We can ensure visible API compatibility by using **find-sc** on Moonlight and making a diff against the files we produced with Silverlight. Any extra or missing `[SecurityCritical]` should be easily spotted.

### Unit tests

#### SecurityCriticalTest

The original idea was to auto-generate unit tests for all `[SecurityCritical]` code. However their number (of visible API) proved to be quite small.

In general the test cases asserts either a `TypeLoadException`, `MethodAccessException` or `FieldAccessException` when a security check fails (on a type load or when accessing a method or field).

Notes:

-   There's no need to have unit tests for `[SecurityCritical]` with pointer parameters - since application code won't be able to call it because it lack support for **unsafe** blocks.

-   Overloads. It's common that only some method overloads are decorated with `[SecurityCritical]`. In those cases all overloads needs to be tested to ensure that the undecorated ones are working (and not simply calling the `[SecurityCritical]` which would cause an error). That could be the case in SL (none found so far) or inside Mono/ML code base.

#### ReflectionTest

Reflection is possible under the CoreCLR but is a little different than the *classic* case. The general rule is that if you can write it as code then you can use reflection to do the same (i.e. **private** stuff are private).

References:

-   [MSDN: Security Considerations for Reflection](http://msdn.microsoft.com/en-us/library/stfy7tfc(VS.95).aspx)

#### ReflectionEmitTest

Emitting code at runtime is also possible with the CoreCLR (think DLR). Again some restrictions apply.

References:

-   [MSDN: Security Issues in Reflection Emit](http://msdn.microsoft.com/en-us/library/9syytdak(VS.95).aspx)


