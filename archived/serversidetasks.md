---
title: "ServerSideTasks"
lastmodified: '2008-11-12'
redirect_from:
  - /ServerSideTasks/
---

ServerSideTasks
===============

(This was originally a memo by atsushieno)

Here is the list of what we don't have in Mono yet. [foo] refers to the version. [3.5+] means 3.5 SP1.

-   ADO.NET
    -   Linq to SQL [3.5]: it depends on dblinq effort. Currently it has about 100 todos. Some of them are not easy. There's also complexity on multiple database support and connection string.
    -   Linq to Entities (EF) [3.5+]: I wrote an analysis [here]({{ site.github.url }}/EntityFramework).

-   ASP.NET 3.5/SP1 data involved stuff
    -   LinqDataSource [3.5] depends on L2SQL. grendel is going to implement it based on .NET's L2SQL.
    -   EntityDataSource [3.5+] depends on EF.
    -   DynamicData [3.5+] depends on both above.
    -   (MVC is for 4.0 or later and hence should move from Mono 2.6 to later versions)

-   WF (workflow) [3.0] - it is in olive so far.
    -   every core things updates from current code to RTM (ComponentModel, Runtime and Activities).
    -   a huge amount of missing stuff here. (500 missings in activities and runtime for each, 1200 missing in component.)

-   WCF
    -   SOAP in System.ServiceModel [3.0]. client for SL2 would work. Not-well-designed and unstable server.
    -   SAML [3.0]
    -   WS-\* support [3.0] is largely incomplete. Security stack was a big mess. No duplex support yet.
    -   Cardspace [3.0] is an applied WS-\* support + UI (could be anything).
    -   System.WorkflowServices [3.5] depends on WF.
    -   Data Services [3.5+] depends on WebHttpBinding [3.5] (which is done) and EF.


