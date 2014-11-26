---
title: "MaxDB"
lastmodified: '2006-09-23'
redirect_from:
  - /MaxDB/
---

MaxDB
=====

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#info">1 Info</a></li>
<li><a href="#using">2 Using</a>
<ul>
<li><a href="#connection-string">2.1 Connection String</a>
<ul>
<li><a href="#connection-string-format">2.1.1 Connection String Format</a></li>
<li><a href="#connection-string-parameters">2.1.2 Connection String Parameters</a></li>
</ul></li>
<li><a href="#c-example">2.2 C# Example</a>
<ul>
<li><a href="#source-code">2.2.1 Source code</a></li>
<li><a href="#building-example">2.2.2 Building Example</a></li>
<li><a href="#running-the-example">2.2.3 Running the Example</a></li>
</ul></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Info
----

MaxDBProvider is ADO.NET data provider on .NET and Mono for the SAP-certified open source database MaxDB 7.5/7.6 (see [MaxDB](http://www.mysql.com/products/maxdb)).

-   Home site is [[http://www.sourceforge.net/projects/maxdbprovider](http://www.sourceforge.net/projects/maxdbprovider)

MaxDBProvider]

-   Can access MaxDB server either using native network protocol directly or

through corresponding client library

-   Namespace MaxDB.Data and assembly MaxDB.Data.dll

Using
-----

### Connection String

#### Connection String Format

`Server=localhost;Database=Test;User ID=MyLogin;Password=MyPwd;`

#### Connection String Parameters

Parameter Definition

Description

Example

Data Source or Server or Address or<br/>
Addr or Network Address

Hostname or IP Address of the MaxDB server

Server=myhost

Initial Catalog or Database

Name of MaxDB database

Database=testdb

User ID or Login

Name of MaxDB database user

Login=MyLogin

Password or PWD

Password of MaxDB database user

Password=MyPass

Mode

Internal or Oracle. MaxDB database mode. Default = Internal

Mode=Oracle

Pooling

True or False. Controls whether connection pooling is used. Default = True

Pooling=True

Min Pool Size

Min size of connection pool. Default: 1

Min Pool Size=1

Max Pool Size

Max size of connection pool. Default: 20

Max Pool Size=20

Connection Lifetime or<br/>
Load Balance Timeout

Connection lifetime in the connection pool (in seconds). Default: 0

Connection Lifetime=20

The Server connection string parameter can be used in two different ways:

Server Definition

Example

hostname

Server=localhost

hostname:port

Server=localhost:7210

### C# Example

#### Source code

``` csharp
using System;
using System.Data;
using MaxDB.Data;
 
public class Test
{
  public static void Main(string[] args)
  {
    string connectionString =
      "Server=localhost;" +
      "Database=test;" +
      "User ID=scott;" +
      "Password=tiger;";
    IDbConnection dbcon = new MaxDBConnection(connectionString);
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
    dbcmd.Connection = dbcon;
    IDataReader reader = dbcmd.ExecuteReader();
    while (reader.Read())
    {
      string FirstName = (string)reader["firstname"];
      string LastName = (string)reader["lastname"];
      Console.WriteLine("Name: " +
        FirstName + " " + LastName);
    }
    // clean up
    reader.Dispose();
    reader = null;
    dbcmd.Dispose();
    dbcmd = null;
    dbcon.Dispose();
    dbcon = null;
  }
}
```

#### Building Example

Save the example to the file TestExample.cs and compile it

``` bash
mcs TestExample.cs -r:System.Data.dll -r:MaxDB.Data.dll
```

#### Running the Example

``` bash
mono TestExample.exe
```

