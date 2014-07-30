---
title: Vulnerabilities
redirect_from:
  - /Vulnerabilities/
---

Reporting vulnerabilities
=========================

Please report security vulnerabilities using our [contact form](http://www.go-mono.com/contact/).

Known vulnerabilities
=====================

Some versions of Mono had security vulnerabilities found after their public release. This page contains a list of the known vulnerabilities, starting with the most recent one.

Moonlight RuntimeHelpers.InitializeArray on non-primitive value types
---------------------------------------------------------------------

CVE: [CVE-2011-0989](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2011-0989)

Missing validations on RuntimeHelpers.InitializeArray can allow untrusted code to modify internal structures leading to plugin crashes and possibly corrupting Moonlight's security manager internal state.

Version affected:

-   Moonlight 2.x
-   Moonlight 3.x previews

Version fixed:

-   Moonlight 2.4.1
-   Moonlight 3.99 preview 3

Notes:

-   Moonlight 1.x does not execute managed code (i.e. does not include Mono) so it is not affected by this vulnerability.
-   The vulnerability is located in mono source code but can only be exploited (by untrusted applications) when used by Moonlight.

Credits:

-   Jeroen Frijters, [http://www.ikvm.net/](http://www.ikvm.net/)

Moonlight Race in Array.Copy "FastCopy" Internal Call
-----------------------------------------------------

CVE: [CVE-2011-0990](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2011-0990)

A race in the internal call implementing a fast-copy optimization for Array.Copy can allow untrusted code to modify internal structures leading to to plugin crashes and possibly corrupting Moonlight's security manager internal state.

Version affected:

-   Moonlight 2.x
-   Moonlight 3.x previews

Version fixed:

-   Moonlight 2.4.1
-   Moonlight 3.99 preview 3

Notes:

-   Moonlight 1.x does not execute managed code (i.e. does not include Mono) so it is not affected by this vulnerability.
-   The vulnerability is located in mono source code but can only be exploited (by untrusted applications) when used by Moonlight.

Credits:

-   Jeroen Frijters, [http://www.ikvm.net/](http://www.ikvm.net/)

Moonlight DynamicMethod Resurrection
------------------------------------

CVE: [CVE-CVE-2011-0991](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2011-0991)

DynamicMethod instances could be finalized, freeing its data, then resurrected leading to use-after-free of their data.

Version affected:

-   Moonlight 2.x
-   Moonlight 3.x previews

Version fixed:

-   Moonlight 2.4.1
-   Moonlight 3.99 preview 3

Notes:

-   Moonlight 1.x does not execute managed code (i.e. does not include Mono) so it is not affected by this vulnerability.
-   The vulnerability is located in mono source code but can only be exploited (by untrusted applications) when used by Moonlight.

Credits:

-   Jeroen Frijters, [http://www.ikvm.net/](http://www.ikvm.net/)

Moonlight Improper Thread Finalization
--------------------------------------

CVE: [CVE-2011-0992](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2011-0992)

Improper cleanup when freeing unmanaged MonoThread instances could allow the use, after being freed, of some member data if the managed instance is resurrected. This could crash the plugin or allow information disclosure.

Version affected:

-   Moonlight 2.x
-   Moonlight 3.x previews

Version fixed:

-   Moonlight 2.4.1
-   Moonlight 3.99 preview 3

Notes:

-   Moonlight 1.x does not execute managed code (i.e. does not include Mono) so it is not affected by this vulnerability.
-   The vulnerability is located in mono source code but can only be exploited (by untrusted applications) when used by Moonlight.

XSP/mod\_mono source code disclosure
------------------------------------

CVE: [CVE-2010-4225](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2010-4225)

An unloading bug can, under some circumstances, let ASP.NET applications misbehave and return the source code (.aspx) of the application or any other file in the web application directory.

Version affected:

-   Mono / XSP / mod\_mono 2.8.x

Version fixed:

-   Mono / XSP / mod\_mono 2.8.2

Moonlight Generic Constraints Bypass Vulnerability
--------------------------------------------------

CVE: [CVE-2010-4254](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2010-4254)

Some missing generic checks inside Mono can be exploited (e.g. mutate strings, run arbitrary code) by untrusted web (silverlight/moonlight) applications even if they are executed under a security manager (coreclr) that sandbox them.

Version affected:

-   Moonlight 2.x
-   Moonlight 3.x previews

Version fixed:

-   Moonlight 2.3.0.1
-   Moonlight 3 preview 10 (2.99.0.10)

Notes:

-   Moonlight 1.x does not execute managed code (i.e. does not include Mono) so it is not affected by this vulnerability.
-   The bug (and fix) is in mono source code but can only be exploited (by untrusted applications) when used by Moonlight.

mono-debugger Insecure Use of LD\_LIBRARY\_PATH
-----------------------------------------------

CVE: [CVE-2010-3369](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2010-3369)

The mono debugger scripts (mdb and mdb-symbolreader) misuse the LD\_LIBRARY\_PATH environment variable (empty case) which could allow loading shared libraries from the current directory.

Version affected:

-   mono-debugger 2.4.x

Version fixed:

-   mono-debugger 2.8.1

Mono Runtime Insecure Native Library Loading
--------------------------------------------

CVE: [CVE-2010-4159](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2010-4159)

The Mono runtime can be tricked to load native libraries from the current working directory.

Version affected:

-   Mono 1.x and 2.x

Version fixed:

-   Mono 2.8.1

Note: this does not affect loading managed assemblies, only native libraries.

ASP.NET Padding Oracle
----------------------

CVE: [CVE-2010-3332](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2010-3332)

Mono ASP.NET implementation is vulnerable to the padding oracle attack, i.e. it leaks some details when invalid padding is being decrypted. However it is **not** possible to download the `web.config` file from the web server (and retrieve the keys or other data from it). The actual severity of attack depends on the web application.

Version affected:

-   Mono 1.x and 2.x

Version fixed:

-   Mono 2.8.1

References:

-   [PaddingOraclesEverywhereEkoparty2010.pdf](http://netifera.com/research/poet//PaddingOraclesEverywhereEkoparty2010.pdf)

Libgdiplus Integer Overflow Vulnerabilities
-------------------------------------------

CVE: [CVE-2010-1526](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2010-1526)

Version affected:

-   libgdiplus 1.x and 2.x

Version fixed:

-   Mono 2.8

Notes:

-   Possible integer overflows, when opening untrusted BMP, JPEG or TIFF files, were fixed in order to avoid potential heap-based buffer overflow.
-   Credits: Stefan Cornelius, Secunia Research

ASP.NET View State Cross-Site Scripting
---------------------------------------

CVE: [CVE-2010-1459](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2010-1459)

Version affected:

-   Mono 1.x and 2.x

Version fixed:

-   Mono 2.6.4

Notes:

-   Mono's ASP.NET EnableViewStateMac default was FALSE (like ASP.NET 1.0) and configuration bugs made it impossible to set it to TRUE.
-   Credits: Web Security Research Group (WSRG) of Hewlett Packard (HP)

XML signature HMAC truncation authentication bypass
---------------------------------------------------

CVE: [CVE-2009-0217](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2009-0217)

Version affected:

-   Mono 1.x and 2.x

Version fixed:

-   Mono 2.4.2.2

Notes:

-   [US-CERT Vulnerability Notes](http://www.kb.cert.org/vuls/id/466161)
-   W3C XML Digital Signature [Errata](http://www.w3.org/2008/06/xmldsigcore-errata.html#e03), [Q&A](http://www.w3.org/QA/2009/07/hmac_truncation_in_xml_signatu.html)

Mono System.Web Header Injection Attack
---------------------------------------

CVE: [CVE-2008-3906](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-3906)

Version affected

-   Mono 1.x

Version fixed:

-   Mono 2.0

Mono ASP.NET Cross-Site Scripting
---------------------------------

CVE: [CVE-2008-3422](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-3422)

Version affected

-   Mono 1.x

Version fixed:

-   Mono 2.0

BigInteger unsafe code overflow
-------------------------------

CVE: [CVE-2007-5197](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-5197)

Version affected

-   Mono 1.x

Version fixed:

-   Mono 1.2.5.1

Notes:

-   beware unsafe code

XSP source code disclosure [Windows]
------------------------------------

CVE: [CVE-2007-5473](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2007-5473)

Version affected

-   Mono 1.x running on Windows operating systems

Fixed in

-   Mono 1.2.5.2

Notes:

-   Mono's System.Web.dll assembly didn't consider, before version 1.2.5.2, some Win32-specific behavior affecting filenames ending with spaces or dots. Win32 operating systems ignores the trailing characters, even if the file-system supports them, and can access the similarly named files without reporting any error. This caused XSP to return ASP.NET source code, instead of rendered content, when executed with Mono under Windows

XSP/mod\_mono source code disclosure
------------------------------------

CVE: [CVE-2006-6104](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-6104)

Version affected

-   Mono 1.1.13.x (and later 1.1.x versions)
-   Mono 1.2.x

Fixed in

-   Mono 1.2.2
-   Mono 1.1.13.8.2

Notes

-   The problem is exhibited in XSP and, in certain cases mod\_mono (when configured with **SetHandler**) but the fix is in the Mono class libraries. To avoid any compatibility issues you should update both Mono and XSP/mod\_mono to the same version.

Workaround

-   Use Apache/[Mod\_mono]({{ site.github.url }}/docs/web/mod_mono/) configured with **AddHander**.

Local privilege escalation via System.Xml.Serialization
-------------------------------------------------------

CVE: [CVE-2006-5072](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-5072)

Version affected

-   Mono 1.1.17 (and prior releases)

Fixed in

-   Mono 1.1.17.2
-   Mono 1.1.13.8.1

Workaround

-   Code generation for serialization can be turned off using **export MONO\_XMLSERIALIZER\_THS=no** prior to executing Mono applications

XSP/mod\_mono directory traversal
---------------------------------

CVE: [CVE-2006-2658](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2006-2658)

Versions affected

-   mod\_mono 1.1.14 (and prior releases)

Fixed in

-   XSP 1.1.15
-   XSP 1.1.13.7, 1.1.7.13
-   XSP 1.0.9.1, 1.0.6.1

Notes

-   Yes the affected/fixed products are confusing. The bug was in XSP but only exposed when using mod\_mono. You should update both packages to avoid compatibility issues.

Mono ASP.NET Unicode Conversion Cross-Site Scripting
----------------------------------------------------

CVE: [CVE-2005-0509](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2005-0509)

Versions affected

-   Mono 1.0.5 (and prior 1.0.x releases)
-   Mono 1.1.3 (and prior 1.1.x releases)

Fixed in

-   Mono 1.0.6
-   Mono 1.1.4

Notes

-   This vulnerability wasn't fixed in MS ASP.NET implementation and could potentially lead into a small interoperability problem.
