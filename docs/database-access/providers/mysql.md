---
title: MySQL
redirect_from:
  - /MySQL/
---

Info
----

The Mono provider for [MySQL](http://www.mysql.com/) database is the [MySQL Connector/Net](http://dev.mysql.com/downloads/connector/net/).

MySQL Connector/Net is a fully managed provider and does not require a client library. You have to get it from MySQL AB. The provider is distributed under the GPL license. This is the recommened provider to use with Mono.

Support for MySQL Connector/Net can be found [here](http://dev.mysql.com/support/). If you decide to compile from sources, you should define the conditional compilation variable MONO (i.e., -d:MONO when compiling from the command line).

Usage
-----

**Prerequisites**

-   MySQL database

-   MySQL .NET Connector

**Connection String**

-   Format:

<!-- -->

     "Server=hostname;" + "Database=database;" + "User ID=username;" + "Password=password;" + "Pooling=false"

-   Parameters:

|Parameter Definition|Description|Example|
|:-------------------|:----------|:------|
|Server or Data Source|Hostname or IP Address of the MySQL server|Server=MYHOST|
|Database|name of MySQL database|Database=testdb|
|Port|TCP/IP Port to connect. Optional.|Port=3306|
|User ID|name of MySQL database user|User ID=someuser|
|Password|password for MySQL database user|Password=mypass12|
|Pooling|whether or not to use connection pooling. YES or TRUE to use connection pooling and NO or FALSE to not use connection pooling.|Pooling=false|

-   Installing MySql.Data.dll in the GAC:

<!-- -->

      cd path_to_your MySql.Data.dll assembly
      gacutil -i MySql.Data.dll

**C\# Example**

``` csharp
 using System;
 using System.Data;
 using MySql.Data.MySqlClient;
 
 public class Test
 {
    public static void Main(string[] args)
    {
       string connectionString =
          "Server=localhost;" +
          "Database=test;" +
          "User ID=myuserid;" +
          "Password=mypassword;" +
          "Pooling=false";
       IDbConnection dbcon;
       dbcon = new MySqlConnection(connectionString);
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

<!-- -->

    mcs TestExample.cs -r:System.Data.dll -r:/path/to/MySql.Data.dll

-   Running the Example:

<!-- -->

     mono TestExample.exe 

