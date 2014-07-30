---
title: "TDS Providers"
lastmodified: '2006-05-17'
permalink: /archived/TDS_Providers/
redirect_from:
  - /TDS_Providers/
---

TDS Providers
=============

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#design-of-the-microsoft-sql-server-sybase-and-tds-data-providers-in-mono">1 Design of the Microsoft SQL Server, Sybase, and TDS Data Providers in Mono</a></li>
<li><a href="#new-adonet-providers">2 New ADO.NET Providers</a></li>
<li><a href="#building-the-new-providers">3 Building The New Providers</a></li>
<li><a href="#classes-in-monodatatdsclientinternal-will">4 Classes in Mono.Data.TdsClient.Internal will:</a></li>
<li><a href="#implementation-details-of-the-tds-protocol">5 Implementation Details of the TDS Protocol</a></li>
<li><a href="#more-information">6 More Information</a></li>
<li><a href="#contribute">7 Contribute</a></li>
</ul></td>
</tr>
</tbody>
</table>

Design of the Microsoft SQL Server, Sybase, and TDS Data Providers in Mono
--------------------------------------------------------------------------

-   After much discussion among the Mono ADO.NET developers,

we have come up with the design of implementing a Sybase, Microsoft SQL Server, and TDS Generic ADO.NET providers. These providers have been created and are actively developed by Tim Coleman.

-   Since Sybase and Microsoft SQL Server databases both

use the TDS protocol for data access, and other implementations of TDS (FreeTDS and jTDS) have included support for multiple versions of the TDS, we have decided to do the same.

-   The TdsClient ADO.NET provider will be Mono's first provider

written completely in C\# without any dependencies except the usual suspects: corlib.dll, System.dll, and System.Xml.dll.

New ADO.NET Providers
---------------------

-   Mono.Data.SybaseClient namepace and assembly will hold the ADO.NET provider for Sybase SQL Server database. This provider uses TDS version 5.0 which can only be used with Sybase databases.

-   System.Data.SqlClient namespace and System.Data assembly will hold the ADO.NET provider

for Microsoft SQL Server 7.0/2000 databases. This provider is to be compatible with SqlClient in Microsoft .NET and uses TDS version 7.0 which only supports Microsoft SQL Server 7.0/2000. There is TDS version 8.0 which we will need to support as well, but it is used for Microsoft SQL Server 2000 databases.

-   Mono.Data.TdsClient namespace and assembly is a generic provider for older TDS databases. This provider will default to using TDS version 4.2 which can be used by older Sybase and Microsoft SQL Server databases.

Building The New Providers
--------------------------

All three providers will use common internal code at Mono.Data.TdsClient.Internal. Any classes in Mono.Data.TdsClient.Internal will have the internal keyword and will be built with the assembly of that provider.

-   SqlClient will build its assembly System.Data using files

from System.Data, System.Data.SqlClient, System.Data.SqlTypes, System.Data.Common, and Mono.Data.TdsClient.Internal.

SqlClient will only reference the usual suspects: corlib.dll, System.dll, and System.Xml.dll. SqlClient will be a wrapper around TdsClient.Internal, but provide specific functionality to Microsoft SQL Server 7.0/2000 databases.

SqlClient build example:

    mcs -target:library -out:System.Data.dll \
    System.Data.SqlClient/
    *.cs \ ..\Mono.Data.TdsClient\Mono.Data.TdsClient.Internal\
    *.cs \ [any other classes in System.Data assembly...] \ -r corlib.dll -r System.dll -r System.Xml.dll

-   SybaseClient will build its assembly Mono.Data.SybaseClient using files from Mono.Data.SybaseClient and Mono.Data.TdsClient.Internal. SybaseClient will reference the usual suspects plus System.Data.dll SybaseClient will be a wrapper around TdsClient.Internal, but provide specific functionality to Sybase.

SybaseClient build example:

    mcs -target:library -out:Mono.Data.SybaseClient.dll \
    Mono.Data.SybaseClient\
    *.cs \ ..\Mono.Data.TdsClient\Mono.Data.TdsClient.Internal\
    *.cs -r corlib.dll -r System.dll -r System.Xml.dll -r System.Data.dll

-   TdsClient will build its assembly Mono.Data.TdsClient

using files from Mono.Data.TdsClient and Mono.Data.TdsClient.Internal. TdsClient will reference the usual suspects plus System.Data.dll TdsClient is a wrapper provider around TdsClient.Internal used for generic unit tests. TdsClient will a wrapper around TdsClient.Internal as a generic TDS provider and allow TDS configuration options not exposed in SqlClient nor SybaseClient, such as, TdsVersion will be exposed in TdsClient but not in SqlClient nor SybaseClient.

TdsClient build example:

     mcs -target:library -out:Mono.Data.TdsClient.dll \
    Mono.Data.TdsClient\
    *.cs \ Mono.Data.TdsClient.Internal\
    *.cs \ -r corlib.dll -r System.dll -r System.Xml.dll -r System.Data.dll

\</ol\>

Classes in Mono.Data.TdsClient.Internal will:
---------------------------------------------

-   use the internal keyword to prevent exposing these classes to the System.Data.dll assembly.

-   implement the ADO.NET interfaces just like any other ADO.NET provider, such as, IDbConnection, IDbCommand, IDataReader, IDataRecord, IDataAdapter, etc...

-   be sealed just like other providers

-   provide features to be directly used by the SqlClient and SybaseClient providers, such as, setting the default TDS version: SqlClient to 7.0 and SybaseClient to 5.0 and TdsClient to 4.2.

-   be written completely in C\# or IL assembly language (if need be).

-   implement the TDS protocol version 4.2, 5.0, 7.0, and 8.0. This

is where most of the work will take place.

-   be an internal ADO.NET provider to the public ADO.NET providers:

System.Data.SqlClient, Mono.Data.SybaseClient, and Mono.Data.TdsClient.

Implementation Details of the TDS Protocol
------------------------------------------

-   will be implemented in pure C\# from scratch

-   will reside in Mono.Data.TdsClient.Internal

-   will use FreeTDS and jTDS as rerferences.

More Information
----------------

-   [FreeTDS](http://www.freetds.org/) is C API that implements

the TDS protocol. Has libraries for tds, ctlib, and dblib. It builds and runs on Windows, Linux, and other platforms. FreeTDS provides data access to Microsoft SQL Server and Sybase databases.

-   [jTDS](http://jtds.sf.net/) is a 100% Java JDBC provider

for Microsoft SQL Server and Sybase databases.

-   [TDS Protocol](http://www.freetds.org/tds.html)

Contribute
----------

Anybody willing to help? If so, contact any of the people working on the ADO.NET support in Mono: Rodrigo Moya, Tim Coleman, Daniel Morgan, Brian Ritchie, Vladimir Vukicevic, Ville Palo, Franklin Wise, and others.

