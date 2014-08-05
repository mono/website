---
title: "OLE DB"
lastmodified: '2005-09-06'
redirect_from:
  - /OLE_DB/
---

OLE DB
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
<li><a href="#testing-oledb-with-libgdas-postgresql-provider">4 Testing OleDb with libgda's PostgreSQL provider</a></li>
</ul></td>
</tr>
</tbody>
</table>

Info
----

-   Provides a System.Data.OleDb like provider for Mono using [GDA](http://www.gnome-db.org/) as the data access layer.

-   Exists in namespace System.Data.OleDb and assembly System.Data

-   Created by Rodrigo Moya (the maintainer for GDA)

-   LibGDA has providers for:
    -   [MySQL](http://www.mysql.com/)
    -   [PostgreSQL](http://www.postgresql.org/)
    -   XML
    -   ODBC (via [unixODBC](http://www.unixodbc.org/))
    -   [Oracle](http://www.oracle.com/)
    -   [Interbase](http://www.borland.com/products/downloads/download_interbase.html)
    -   [Sybase](http://www.sybase.com/downloads) and [Microsoft SQL Server](http://www.microsoft.com/sql/default.asp) via [FreeTDS](http://www.freetds.org/)
    -   [IBM DB2 Universal Database](http://www-3.ibm.com/software/data/db2/)
    -   [SQL Lite](http://www.hwaci.com/sw/sqlite/download.html)
    -   [MS Access](http://www.microsoft.com/office/access/default.asp) via [MDB Tools](http://mdbtools.sourceforge.net/)

-   Does not support trusted connections

-   Bugs with Mono or the data provider should be reported in Mono's Bugzilla [here](http://bugzilla.ximian.com/). If you do not have Bugzilla user account, it is free and easy to create one [here](http://bugzilla.ximian.com/createaccount.cgi).

Current Status
--------------

-   Not actively maintained. Please use another managed provider, System.Data.Odbc, or GDA\# instead.

-   The OleDb provider is working with libgda. The C-Sharp bindings to libgda currently work - meaning they can compile, run, and you can connect to a PostgreSQL database via libgda via the C-Sharp bindings to libgda.

-   Basic functionality (execution of commands, data retrieval, transactions, etc) are now working.

-   An inital implementation of GetSchemaTable() for the OleDbDataReader has been checked into cvs. GetSchemaTable() isn't correct for OleDb, but the foundation is there.

Action plan
-----------

-   Does not work on Widnows because libgda does not work on Windows. Some people have tried it, but I could not verify this myself.

-   Only works on Linux with GNOME 2.x

-   Need to make the OleDb provider compatible with the OleDb provider in Microsoft .NET

Testing OleDb with libgda's PostgreSQL provider
-----------------------------------------------

**Prerequisites**

-   Requires a working mono and mcs

-   Requires Linux because the OleDb provider uses libgda and libgda only works on Linux.

**Connection String Format**

-   Connection String format:

<!-- -->

    "Provider=providerName;..."

providerName is the name of the Provider you use, such as, PostgreSQL, MySQL, etc. The elipsis ... means that the connection parameters are dependent upon the provider being used and are passed to libgda for connecting. Such paramters, can be: Database, User ID, Password, Server, etc...

-   See the test TestOleDb.cs found at mcs/class/System.Data/System.Data.OleDb

**C\# Example**

``` csharp
 using System;
 using System.Data;
 using System.Data.OleDb;
 
 public class Test
 {
    public static void Main(string[] args)
    {
        // there is a libgda PostgreSQL provider
       string connectionString =
          "Provider=PostgreSQL;" +
          "Addr=127.0.0.1;" +
          "Database=test;" +
          "User ID=postgres;" +
          "Password=fun2db";
       IDbConnection dbcon;
       dbcon = new OleDbConnection(connectionString);
       dbcon.Open();
       IDbCommand dbcmd = dbcon.CreateCommand();
       // requires a table to be created named employee
       // with columns firstname and lastname
       // such as,
       //        CREATE TABLE employee (
       //           firstname varchar(32),
       //           lastname varchar(32));
       string sql =
            "SELECT firstname, lastname " +
            "FROM employee";
       dbcmd.CommandText = sql;
       IDataReader reader = dbcmd.ExecuteReader();
       while(reader.Read()) {
            string FirstName = (string) reader["firstname"];
            string LastName = (string) reader["lastname"];
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

-   Building C\# Example:
-   Save the example to a file, such as, TestExample.cs

-   Build:

<!-- -->

    mcs TestExample.cs -r:System.Data.dll

-   Running the Example:

<!-- -->

     mono TestExample.exe 

