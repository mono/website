---
title: "TDS Generic"
lastmodified: '2006-01-15'
redirect_from:
  - /TDS_Generic/
---

TDS Generic
===========

-   ADO.NET Provider for old Sybase and Microsoft SQL Server databases

-   Provider is no longer maintained

-   Exists in namespace Mono.Data.TdsClient and assembly Mono.Data.TdsClient

-   Used the [FreeTDS](http://www.freetds.org/) and [jTDS](http://jtds.sourceforge.net/) projects as resources.

-   Does not require a client library

-   Requires the assembly Mono.Data.Tds.dll which implements the TDS protocol

-   Uses TDS Protocol Version 4.2 by default

Using
-----

**Prerequisites**

-   Have a working mono and mcs installed

-   Have access to a Sybase or Microsoft SQL Server database or either download it:

-   [Microsoft SQL Server](http://www.microsoft.com/sql/default.asp)

-   [Sybase](http://www.sybase.com/downloads)

-   If using Microsoft SQL Server 2000, make sure you are using at least Service Pack 3 for Microsoft SQL Server 2000

-   Located at mcs/class/System.Data/Test is a test for System.Data.SqlClient named SqlTest.cs and you could use this as a basis for your test.

**Connection String Format**

-   Has a connection string format:

<!-- -->

    Server=hostname;Database=databaseName;User ID=userid;Password=password

-   The Server part can be used two ways:

-   hostname - "Server=MYHOST"

-   hostname,port - "Server=MYHOST,1533"

**C# Example**

``` csharp
 using System;
 using System.Data;
 using Mono.Data.TdsClient;
 
 public class Test
 {
    public static void Main(string[] args)
    {
       string connectionString =
          "Server=localhost;" +
          "Database=pubs;" +
          "User ID=myuserid;" +
          "Password=mypassword;";
       IDbConnection dbcon;
       dbcon = new TdsConnection(connectionString);
       dbcon.Open();
       IDbCommand dbcmd = dbcon.CreateCommand();
       string sql =
           "SELECT fname, lname " +
           "FROM employee";
       dbcmd.CommandText = sql;
       IDataReader reader = dbcmd.ExecuteReader();
       while(reader.Read()) {
            string FirstName = (string) reader["fname"];
            string LastName = (string) reader["lname"];
            Console.WriteLine("Name: " +
                 FirstName + " " + LastName);
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

-   Building C# Example:

-   Save the example to a file, such as, TestExample.cs

-   Build using Mono C# compiler:

<!-- -->

     mcs TestExample.cs -r:System.Data.dll -r:Mono.Data.TdsClient.dll

-   Running the Example:

<!-- -->

     mono TestExample.exe

