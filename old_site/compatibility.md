---
layout: obsolete
title: "Compatibility"
lastmodified: '2013-11-04'
permalink: /old_site/Compatibility/
redirect_from:
  - /Compatibility/
---

Compatibility
=============

[![Moma48.png]({{site.github.url}}/old_site/images/3/36/Moma48.png)]({{site.github.url}}/old_site/images/3/36/Moma48.png)

If you already have an application written in .Net, you can scan your application with the [Mono Migration Analyzer (MoMA)]({{site.github.url}}/old_site/MoMA "MoMA") to determine if your application uses anything not supported by Mono.

The current stable release version of Mono is **3.2.3**. The previous stable release was **2.10.8** (released December 19th, 2011), which is not supported anymore (because its branch doesn't receive more backports).

The easiest way to describe what Mono currently supports is:
 **Everything in .NET 4.5** except **WPF**, **WWF**, and with **limited WCF** and **limited ASP.NET 4.5 async stack**.

Here is a slightly more detailed view, by .NET framework version:

||
||Implemented||Partially Implemented||Not Implemented|

.NET 4.5
--------

||
||C\# 5.0 - async support|
||Async Base Class Library Upgrade|
||MVC4 *- Partial, no async features supported.*|
||ASP.NET 4.5 Async Pipeline *- Needs an parallel processing pipeline with async support, not done.*|

.NET 4.0
--------

||
||C\# 4.0|
||ASP.Net 4.0|
||ASP.Net MVC 1, MVC 2 and MVC3|
||System.Numerics|
||Managed Extensibily Framework *- Shared with .NET via MS-PL license*|
||Dynamic Language Runtime *- Shared with .NET via MS-PL license*|
||Client side OData *- Shared with .NET via MS-PL license*|
||EntityFramework *- Available since Mono 2.11.3.*|
||Parallel Framework and PLINQ|
||CodeContracts *- API complete, partial tooling*|
||Server-side OData *- Depends on Entity Framework.*|

.NET 3.5
--------

||
||C\# 3.0|
||System.Core|
||LINQ|
||ASP.Net 3.5|
||ASP.Net MVC|
||LINQ to SQL *- Mostly done, but a few features missing*|

.NET 3.0
--------

||
||WCF *- silverlight 2.0 subset completed*|
||WPF *- no plans to implement*|
||WWF *- Will implement WWF 4 instead on future versions of Mono.*|

.NET 2.0
--------

||
||C\# 2.0 (generics)|
||Core Libraries 2.0: mscorlib, System, System.Xml|
||ASP.Net 2.0 *- except WebParts*|
||ADO.Net 2.0|
||Winforms/System.Drawing 2.0 *- does not support right-to-left*|

.NET 1.1
--------

||
||C\# 1.0|
||Core Libraries 1.1: mscorlib, System, System.Xml|
||ASP.Net 1.1|
||ADO.Net 1.1|
||Winforms/System.Drawing 1.1|
||System.Transactions|
||System.Management *- does not map to Linux*|
||System.EnterpriseServices *- deprecated*|

Current Mono Master
===================

This section will be updated as major components are added to Mono after the latest official release.

For details on individual classes and methods implemented by Mono, please see our [class status pages](http://go-mono.com/status/). Note that these are built from SVN versions and some methods may not be in a released version yet.

