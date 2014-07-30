---
title: "Mono Performance Counters"
lastmodified: '2010-04-19'
permalink: /archived/Mono_Performance_Counters/
redirect_from:
  - /Mono_Performance_Counters/
---

Mono Performance Counters
=========================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#mono-performance-counters">1 Mono performance counters</a>
<ul>
<li><a href="#category-processor">1.1 Category: Processor</a></li>
<li><a href="#category-process">1.2 Category: Process</a></li>
<li><a href="#category-mono-memory">1.3 Category: Mono Memory</a></li>
<li><a href="#category-aspnet">1.4 Category: ASP.NET</a></li>
<li><a href="#category-net-clr-jit">1.5 Category: .NET CLR JIT</a></li>
<li><a href="#category-net-clr-exceptions">1.6 Category: .NET CLR Exceptions</a></li>
<li><a href="#category-net-clr-memory">1.7 Category: .NET CLR Memory</a></li>
<li><a href="#category-net-clr-remoting">1.8 Category: .NET CLR Remoting</a></li>
<li><a href="#category-net-clr-loading">1.9 Category: .NET CLR Loading</a></li>
<li><a href="#category-net-clr-locksandthreads">1.10 Category: .NET CLR LocksAndThreads</a></li>
<li><a href="#category-net-clr-interop">1.11 Category: .NET CLR Interop</a></li>
<li><a href="#category-net-clr-security">1.12 Category: .NET CLR Security</a></li>
<li><a href="#category-mono-threadpool">1.13 Category: Mono Threadpool</a></li>
<li><a href="#category-network-interface">1.14 Category: Network Interface</a></li>
</ul></li>
<li><a href="#accessing-performance-counters">2 Accessing performance counters</a></li>
</ul></td>
</tr>
</tbody>
</table>

Mono performance counters
=========================

This page lists the performance counters currently implemented in the Mono runtime.

**Note:** despite being implemented and present in the runtime, not all counters are being updated as of the time of this writing (April 16 2010).

The list is based on the trunk version of the runtime, so not all of them might be present in your version of Mono.

Each category is listed in a section of its own, to facilitate navigation.

Category: Processor
-------------------

Name

Type

Description

 % User Time

Timer 100ns

 % Privileged Time

Timer 100ns

 % Interrupt Time

Timer 100ns

 % DCP Time

Timer 100ns

 % Processor Time

Timer 100ns inverse

Category: Process
-----------------

Name

Type

Description

 % User Time

Timer 100ns

 % Privileged Time

Timer 100ns

 % Processor Time

Timer 100ns

Thread Count

Number of items, 64bit

Virtual Bytes

Number of items, 64bit

Working Set

Number of items, 64bit

Private Bytes

Number of items, 64bit

Category: Mono Memory
---------------------

This category is Mono-specific

Name

Type

Description

Allocated Objects

Number of items, 64bit

Total Physical Memory

Number of items, 64bit

Physical memory installed in the machine, in bytes

Category: ASP.NET
-----------------

Name

Type

Description

Requests Queued

Number of items, 64bit

Requests Total

Number of items, 32bit

Requests/Sec

Rate of counts per second, 32bit

Category: .NET CLR JIT
----------------------

Name

Type

Description

\# of IL Bytes JITted

Number of items, 32bit

\# of IL Methods JITted

Number of items, 32bit

 % Time in JIT

Raw fraction

IL Bytes Jitted/Sec

Rate of counts per second, 32bit

Standard Jit Failures

Number of items, 32bit

Category: .NET CLR Exceptions
-----------------------------

Name

Type

Description

\# of Exceps Thrown

Number of items, 32bit

\# of Exceps Thrown/Sec

Rate of counts per second, 32bit

\# of Filters/Sec

Rate of counts per second, 32bit

\# of Finallys/Sec

Rate of counts per second, 32bit

Throw to Catch Depth/Sec

Number of items, 32bit

Category: .NET CLR Memory
-------------------------

Name

Type

Description

\# Gen 0 Collections

Number of items, 32bit

\# Gen 1 Collections

Number of items, 32bit

\# Gen 2 Collections

Number of items, 32bit

Promoted Memory from Gen 0

Number of items, 32bit

Promoted Memory from Gen 1

Number of items, 32bit

Gen 0 Promoted Bytes/Sec

Rate of counts per second, 32bit

Gen 1 Promoted Bytes/Sec

Rate of counts per second, 32bit

Promoted Finalization-Memory from Gen 0

Number of items, 32bit

Gen 0 heap size

Number of items, 32bit

Gen 1 heap size

Number of items, 32bit

Gen 2 heap size

Number of items, 32bit

Large Object Heap size

Number of items, 32bit

Finalization Survivors

Number of items, 32bit

\# GC Handles

Number of items, 32bit

Allocated Bytes/sec

Rate of counts per second, 32bit

\# Induced GC

Number of items, 32bit

 % Time in GC

Raw fraction

\# Bytes in all Heaps

Number of items, 32bit

\# Total committed Bytes

Number of items, 32bit

\# Total reserved Bytes

Number of items, 32bit

\# of Pinned Objects

Number of items, 32bit

\# of Sink Blocks in use

Number of items, 32bit

Category: .NET CLR Remoting
---------------------------

Name

Type

Description

Remote Calls/sec

Rate of counts per second, 32bit

Total Remote Calls

Number of items, 32bit

Channels

Number of items, 32bit

Context Proxies

Number of items, 32bit

Context-Bound Classes Loaded

Number of items, 32bit

Context-Bound Objects Alloc / sec

Rate of counts per second, 32bit

Contexts

Number of items, 32bit

Category: .NET CLR Loading
--------------------------

Name

Type

Description

Current Classes Loaded

Number of items, 32bit

Total Classes Loaded

Number of items, 32bit

Rate of Classes Loaded

Rate of counts per second, 32bit

Current appdomains

Number of items, 32bit

Total Appdomains

Number of items, 32bit

Rate of appdomains

Rate of counts per second, 32bit

Current Assemblies

Number of items, 32bit

Total Assemblies

Number of items, 32bit

Rate of Assemblies

Rate of counts per second, 32bit

Total \# of Load Failures

Number of items, 32bit

Rate of Load Failures

Rate of counts per second, 32bit

Bytes in Loader Heap

Number of items, 32bit

Total appdomains unloaded

Number of items, 32bit

Rate of appdomains unloaded

Rate of counts per second, 32bit

Category: .NET CLR LocksAndThreads
----------------------------------

Name

Type

Description

Total \# of Contentions

Number of items, 32bit

Contention Rate / sec

Rate of counts per second, 32bit

Current Queue Length

Number of items, 32bit

Queue Length Peak

Number of items, 32bit

Queue Length / sec

Rate of counts per second, 32bit

\# of current logical Threads

Number of items, 32bit

\# of current physical Threads

Number of items, 32bit

\# of current recognized threads

Number of items, 32bit

\# of total recognized threads

Number of items, 32bit

rate of recognized threads / sec

Rate of counts per second, 32bit

Category: .NET CLR Interop
--------------------------

Name

Type

Description

\# of CCWs

Number of items, 32bit

\# of Stubs

Number of items, 32bit

\# of marshalling

Number of items, 32bit

Category: .NET CLR Security
---------------------------

Name

Type

Description

Total Runtime Checks

Number of items, 32bit

\# Link Time Checks

Number of items, 32bit

 % Time in RT checks

Raw fraction

Stack Walk Depth

Number of items, 32bit

Category: Mono Threadpool
-------------------------

This category is Mono-specific

Name

Type

Description

Work Items Added

Number of items, 64bit

Work Items Added/Sec

Rate of counts per second, 32bit

IO Work Items Added

Number of items, 64bit

IO Work Items Added/Sec

Rate of counts per second, 32bit

\# of Threads

Number of items, 32bit

\# of IO Threads

Number of items, 32bit

Category: Network Interface
---------------------------

Name

Type

Description

Bytes Received/sec

Rate of counts per second, 64bit

Bytes Sent/sec

Rate of counts per second, 64bit

Bytes Total/sec

Rate of counts per second, 64bit

Accessing performance counters
==============================

The code snippet below shows you how to read a counter from the current process. Note that the **Mono Memory** category name will throw an exception on .NET since that category doesn't exist there - replace it with any other non-Mono specific category+counter name pair and it will work:

``` csharp
using System;
using System.Diagnostics;
 
class app
{
   static void Main (string[] args)
   {
       string categoryName;
       string counterName;
 
       if (args.Length >= 2) {
           categoryName = args [0];
           counterName = args [1];
       } else {
           categoryName = "Mono Memory";
           counterName = "Total Physical Memory";
       }
 
       try {
           var pc = new PerformanceCounter (categoryName, counterName);
           Console.WriteLine ("Value of performance counter '{0}/{1}': {2}",
                      categoryName,
                      counterName,
                      pc.RawValue);
       } catch (InvalidOperationException ex) {
           Console.WriteLine ("Category name '{0}' does not exist. {1}", categoryName, ex.Message);
       }
   }
}
```

