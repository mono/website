---
layout: obsolete
title: "Sybase"
lastmodified: '2006-05-17'
permalink: /old_site/Sybase/
redirect_from:
  - /Sybase/
---

Sybase
======

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#info">1 Info</a></li>
<li><a href="#current-status">2 Current Status</a></li>
<li><a href="#action-plan">3 Action plan</a></li>
<li><a href="#testing">4 Testing</a></li>
<li><a href="#connection-string-format">5 Connection String Format</a></li>
<li><a href="#c-example">6 C# Example</a>
<ul>
<li><a href="#building-c-example">6.1 Building C# Example</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Info
----

-   ADO.NET Provider for Sybase SQL Server databases

-   Exists in namespace Mono.Data.SybaseClient and assembly Mono.Data.SybaseClient

-   Used the [FreeTDS](http://www.freetds.org/) and [jTDS](http://jtds.sourceforge.net/) projects as resources.

-   Does not require a client library

-   Requires the assembly Mono.Data.Tds.dll which implements the TDS protocol

-   Uses TDS Protocol Version 5.0

Current Status
--------------

-   Able to connect to Sybase ASE (Adapter Server Enterprise) 12.x databases

-   Does not work with Sybase databases prior to 12.x, such as, 11.x. Is this due to Unicode or something with our TDS 5.0 implementation?

-   Does not work with Sybase ASA (Adaptive SQL Anywhere) databases. Maybe the [FreeTDS](http://www.freetds.org/) project could help you on this.

-   SQL commands can be executed via ExecuteNonQuery() of a SybaseCommand.

-   SQL aggregates can be executed and a single row and single column result can be retrieved via ExecuteScalar() of a SybaseCommand

-   SQL queries can be executed via ExecuteReader() and results can be retrieved via SybaseDataReader.

-   a DataTable with schema info about a result can be gotten via GetSchemaTable() in a SybaseDataReader

-   Data can be filled in a DataTable in a DataSet via a SybaseDataAdapter

-   SybaseCommandBuilder has been implemented; however, it will not work due to Sybase provider does not return the table names nor key info. This may need modification of TDS 5.0 support in Mono.Data.Tds.

Action plan
-----------

-   Need for people to create more tests...

-   Make sure the provider works with Sybase ASE 15.

-   Add support for new features in Sybase ASE 15

-   Make Mono's Sybase provider compatible with Sybase's own ADO.NET provider

-   When executing a SQL statement using CommandBehavior of KeyInfo, get the table names used in the SQL and any primary key info. This is needed by the SybaseCommandBuilder to build the where clause of Update and Delete statements.

-   Add support for Sybase ASA (Adapter Server Anywhere)

-   Add support for older Sybase ASE (Adapter Server Enterprise) databases prior to 12.x

Testing
-------

**Prerequisites**

-   Have a working mono and mcs installed

-   Have access to a Sybase ASE 12.x or higher database or either download it:

-   [Sybase](http://www.sybase.com/downloads)

-   When you install Sybase Adapter Server Enterprise 12.x from Sybase, the default port is 5000.

Connection String Format
========================

-   Has a connection string format:

<!-- -->

    Server=hostname;Database=databaseName;User ID=userid;Password=password

-   The Server part can be used two ways:

-   hostname - "Server=MYHOST"

-   hostname,port - "Server=MYHOST,5000"

-   Connection String Parameters:

|Parameter Definition|Description|Example|
|:-------------------|:----------|:------|
|Server or Data Source|hostname of the SQL Server|Server=MYHOST|
|Database or Initial Catalog|name of the database|Database=pubs|
|User ID or UID|name of SQL Server user.|User ID=sa|
|Password|password for SQL Server user.|Password=mypass12|
|Min Pool Size|Specifies the minimum number of connections in the connection pool. Default is 0.|Min Pool Size=0|
|Max Pool Size|Specifies the maximum number of connections in the connection pool. Default is 100.|Max Pool Size=100|
|Pooling|Specifies whether or not to use connection pooling. Valid values are TRUE or YES to use connection pooling or FALSE or NOT to not use connection pooling. Default is TRUE.|Pooling=true|

C\# Example
===========

``` csharp
 using System;
 using System.Data;
 using Mono.Data.SybaseClient;
 
 public class Test
 {
    public static void Main(string[] args)
    {
       string connectionString =
          "Server=myhostname,5000;" +
          "Database=pubs;" +
          "User ID=myuserid;" +
          "Password=mypassword;";
       IDbConnection dbcon;
       dbcon = new SybaseConnection(connectionString);
       dbcon.Open();
       IDbCommand dbcmd = dbcon.CreateCommand();
       string sql =
            "SELECT name " +
            "FROM master.dbo.sysobjects";
       dbcmd.CommandText = sql;
       IDataReader reader = dbcmd.ExecuteReader();
       while(reader.Read()) {
            string objName = reader["name"].ToString();
            Console.WriteLine("Name: " + objName);
       }
       // clean up
       reader.Close();
       reader = null;
       dbcmd.Dispose();
       dbcmd = null;
       dbcon.Close();
       dbcon = null;
    }
 }
```

Building C\# Example
--------------------

Save the example to a file, such as, TestExample.cs, then to build on Linux, do:

     mcs TestExample.cs -r:System.Data.dll -r:Mono.Data.SybaseClient.dll

To run the example:

     mono TestExample.exe 

