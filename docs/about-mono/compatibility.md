---
title: Compatibility
redirect_from:
  - /Compatibility/
---

The easiest way to describe what Mono currently supports is:<br/>
**Everything in .NET 4.7** except **WPF**, **WWF**, and with **limited WCF** and **limited ASP.NET async stack**.

System.Web and WCF are [candidates for 'almost immediate' porting from the .NET reference source back to Mono](/docs/about-mono/dotnet-integration/#entire-assemblies), so support coverage may improve.

Here is a slightly more detailed view, by .NET framework version:

|<i class="fas fa-check"/>|Implemented|<i class="fas fa-exclamation-triangle"/>|Partially Implemented|<i class="fas fa-ban"/>|Not Implemented|

.NET 4.7
--------

|<i class="fas fa-check"/>|C# 7.0|
|<i class="fas fa-check"/>|ValueTuples|

.NET 4.6
--------

|<i class="fas fa-check"/>|C# 6.0|

.NET 4.5
--------

|<i class="fas fa-check"/>|C# 5.0 - async support|
|<i class="fas fa-check"/>|Async Base Class Library Upgrade|
|<i class="fas fa-exclamation-triangle"/>|MVC4 *- Partial, no async features supported.*|
|<i class="fas fa-exclamation-triangle"/>|MVC5 *- Partial, no async features supported.*|
|<i class="fas fa-ban"/>|ASP.NET 4.5 Async Pipeline *- Needs a parallel processing pipeline with async support, not done.*|

.NET 4.0
--------

|<i class="fas fa-check"/>|C# 4.0|
|<i class="fas fa-check"/>|ASP.NET 4.0|
|<i class="fas fa-check"/>|ASP.NET MVC 1, MVC 2 and MVC3|
|<i class="fas fa-check"/>|System.Numerics|
|<i class="fas fa-check"/>|Managed Extensibily Framework *- Shared with .NET via MS-PL license*|
|<i class="fas fa-check"/>|Dynamic Language Runtime *- Shared with .NET via MS-PL license*|
|<i class="fas fa-check"/>|Client side OData *- Shared with .NET via MS-PL license*|
|<i class="fas fa-check"/>|EntityFramework *- Available since Mono 2.11.3.*|
|<i class="fas fa-check"/>|Parallel Framework and PLINQ|
|<i class="fas fa-exclamation-triangle"/>|CodeContracts *- API complete, partial tooling*|
|<i class="fas fa-exclamation-triangle"/>|Server-side OData *- Depends on Entity Framework.*|

.NET 3.5
--------

|<i class="fas fa-check"/>|C# 3.0|
|<i class="fas fa-check"/>|System.Core|
|<i class="fas fa-check"/>|LINQ|
|<i class="fas fa-check"/>|ASP.NET 3.5|
|<i class="fas fa-check"/>|ASP.NET MVC|
|<i class="fas fa-check"/>|LINQ to SQL *- Mostly done, but a few features missing*|

.NET 3.0
--------

|<i class="fas fa-exclamation-triangle"/>|WCF *- Silverlight 2.0 subset completed*|
|<i class="fas fa-ban"/>|WPF *- No plans to implement*|
|<i class="fas fa-ban"/>|WWF *- Will implement WWF 4 instead on future versions of Mono.*|

.NET 2.0
--------

|<i class="fas fa-check"/>|C# 2.0 (generics)|
|<i class="fas fa-check"/>|Core Libraries 2.0: mscorlib, System, System.Xml|
|<i class="fas fa-check"/>|ASP.NET 2.0 *- Except WebParts*|
|<i class="fas fa-check"/>|ADO.NET 2.0|
|<i class="fas fa-check"/>|Winforms/System.Drawing 2.0 *- Does not support right-to-left*|

.NET 1.1
--------

|<i class="fas fa-check"/>|C# 1.0|
|<i class="fas fa-check"/>|Core Libraries 1.1: mscorlib, System, System.Xml|
|<i class="fas fa-check"/>|ASP.NET 1.1|
|<i class="fas fa-check"/>|ADO.NET 1.1|
|<i class="fas fa-check"/>|Winforms/System.Drawing 1.1|
|<i class="fas fa-check"/>|System.Transactions|
|<i class="fas fa-ban"/>|System.Management *- Does not map to Linux*|
|<i class="fas fa-ban"/>|System.EnterpriseServices *- Deprecated*|
