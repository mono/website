---
title: Compatibility
redirect_from:
  - /Compatibility/
---

The easiest way to describe what Mono currently supports is:
 **Everything in .NET 4.5** except **WPF**, **WWF**, and with **limited WCF** and **limited ASP.NET 4.5 async stack**.

Here is a slightly more detailed view, by .NET framework version:

|<i class="fa fa-check"/>|Implemented|<i class="fa fa-exclamation-triangle"/>|Partially Implemented|<i class="fa fa-ban"/>|Not Implemented|

.NET 4.5
--------

|<i class="fa fa-check"/>|C# 5.0 - async support|
|<i class="fa fa-check"/>|Async Base Class Library Upgrade|
|<i class="fa fa-exclamation-triangle"/>|MVC4 *- Partial, no async features supported.*|
|<i class="fa fa-ban"/>|ASP.NET 4.5 Async Pipeline *- Needs a parallel processing pipeline with async support, not done.*|

.NET 4.0
--------

|<i class="fa fa-check"/>|C# 4.0|
|<i class="fa fa-check"/>|ASP.Net 4.0|
|<i class="fa fa-check"/>|ASP.Net MVC 1, MVC 2 and MVC3|
|<i class="fa fa-check"/>|System.Numerics|
|<i class="fa fa-check"/>|Managed Extensibily Framework *- Shared with .NET via MS-PL license*|
|<i class="fa fa-check"/>|Dynamic Language Runtime *- Shared with .NET via MS-PL license*|
|<i class="fa fa-check"/>|Client side OData *- Shared with .NET via MS-PL license*|
|<i class="fa fa-check"/>|EntityFramework *- Available since Mono 2.11.3.*|
|<i class="fa fa-check"/>|Parallel Framework and PLINQ|
|<i class="fa fa-exclamation-triangle"/>|CodeContracts *- API complete, partial tooling*|
|<i class="fa fa-exclamation-triangle"/>|Server-side OData *- Depends on Entity Framework.*|

.NET 3.5
--------

|<i class="fa fa-check"/>|C# 3.0|
|<i class="fa fa-check"/>|System.Core|
|<i class="fa fa-check"/>|LINQ|
|<i class="fa fa-check"/>|ASP.Net 3.5|
|<i class="fa fa-check"/>|ASP.Net MVC|
|<i class="fa fa-check"/>|LINQ to SQL *- Mostly done, but a few features missing*|

.NET 3.0
--------

|<i class="fa fa-exclamation-triangle"/>|WCF *- Silverlight 2.0 subset completed*|
|<i class="fa fa-ban"/>|WPF *- No plans to implement*|
|<i class="fa fa-ban"/>|WWF *- Will implement WWF 4 instead on future versions of Mono.*|

.NET 2.0
--------

|<i class="fa fa-check"/>|C# 2.0 (generics)|
|<i class="fa fa-check"/>|Core Libraries 2.0: mscorlib, System, System.Xml|
|<i class="fa fa-check"/>|ASP.Net 2.0 *- Except WebParts*|
|<i class="fa fa-check"/>|ADO.Net 2.0|
|<i class="fa fa-check"/>|Winforms/System.Drawing 2.0 *- Does not support right-to-left*|

.NET 1.1
--------

|<i class="fa fa-check"/>|C# 1.0|
|<i class="fa fa-check"/>|Core Libraries 1.1: mscorlib, System, System.Xml|
|<i class="fa fa-check"/>|ASP.Net 1.1|
|<i class="fa fa-check"/>|ADO.Net 1.1|
|<i class="fa fa-check"/>|Winforms/System.Drawing 1.1|
|<i class="fa fa-check"/>|System.Transactions|
|<i class="fa fa-ban"/>|System.Management *- Does not map to Linux*|
|<i class="fa fa-ban"/>|System.EnterpriseServices *- Deprecated*|
