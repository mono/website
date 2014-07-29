---
layout: docpage
navgroup: docs
title: PostgreSQL
redirect_from:
  - /PostgreSQL/
---

Info
----

Npgsql is the recommended provider to connect to PostgreSQL 7.x and 8.x databases on .NET and Mono.

Mono distributes the Npgsql database provider for [PostgreSQL](http://postgresql.org).

-   Home site: [Npgsql](http://npgsql.projects.postgresql.org/)

-   fully managed provider for PostgreSQL

-   does not require a client library

-   in namespace Npgsql and assembly Npgsql

Current Status
--------------

-   Can be used with Postgresql 7.x and 8.x databases

-   Has some support for ADO.NET 2.0 including GetSchema.

-   You can send insert, update, delete queries

through NpgsqlCommand.ExecuteNonQuery() method.

-   You can send queries like, select count(\*) from table, select version() with NpgsqlCommand.ExecuteScalar() method.

-   There is logging support. To use it, place code like that in your program:

<!-- -->

     NpgsqlEventLog.Level = LogLevel.Debug; 
     NpgsqlEventLog.LogName = "NpgsqlTests.LogFile"; 

-   There is a winforms test suite (Thanks Dave Page).

-   Better support of ODBC-like ConnectionString in NpgsqlConnection (Thanks Dave Page)

-   You can use parameter names with Npgsql (:) or SqlServer (@) prefix style. This easy porting of code from Sql server to postgresql

-   You can use native large object support

Action plan
-----------

-   Any features or bugs for Npgsql should be implemented in Npgsql's [main source code repository](http://pgfoundry.org/projects/npgsql/). Only bugs necessary for building and running of Npgsql on Mono can be done in Mono's source code repository, but once applied they should be sent to Npgsql's mailing list for inclusion into their source code repository.

-   Add any missing functionality to Npgsql. If this funtionality works on .NET but not on Mono, implement the missing features or fix the bugs in Mono

Using Npgsql
------------

**Prerequisites**

-   Have a working mono and mcs

-   Get [Npgsql](http://npgsql.projects.postgresql.org/) and make sure the binary assembly Npgsql.dll is installed in the same place that the mono class libraries are located.

-   Connection String Parameters:

<table>
<col width="33%" />
<col width="33%" />
<col width="33%" />
<thead>
<tr class="header">
<th align="left">Parameter Definition</th>
<th align="left">Description</th>
<th align="left">Example</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Server</td>
<td align="left">hostname of the PostgreSQL Server</td>
<td align="left">Server=localhost</td>
</tr>
<tr class="even">
<td align="left">Database</td>
<td align="left">name of the database</td>
<td align="left">Database=postgres</td>
</tr>
<tr class="odd">
<td align="left">Port</td>
<td align="left">Network port to connect. Optional</td>
<td align="left">Port=54321</td>
</tr>
<tr class="even">
<td align="left">User ID</td>
<td align="left">user id</td>
<td align="left">User ID=postgres</td>
</tr>
<tr class="odd">
<td align="left">Password</td>
<td align="left">password</td>
<td align="left">Password=mypass12</td>
</tr>
<tr class="even">
<td align="left">Encoding</td>
<td align="left">Encoding to be used. Possible values: ASCII(default) and UNICODE. Use UNICODE if you are getting problems with UTF-8 values</td>
<td align="left">Encoding=UNICODE</td>
</tr>
<tr class="odd">
<td align="left">SSL</td>
<td align="left">True or False. Controls whether to attempt a secure connection. Default = False</td>
<td align="left">SSL=true</td>
</tr>
<tr class="even">
<td align="left">Pooling</td>
<td align="left">True or False. Controls whether connection pooling is used. Default = True</td>
<td align="left">Pooling=false</td>
</tr>
<tr class="odd">
<td align="left">MinPoolSize</td>
<td align="left">Min size of connection pool. Default: 1</td>
<td align="left">MinPoolSize=2</td>
</tr>
<tr class="even">
<td align="left">MaxPoolSize</td>
<td align="left">Max size of connection pool. Default: 20</td>
<td align="left">MaxPoolSize=6</td>
</tr>
<tr class="odd">
<td align="left">Timeout</td>
<td align="left">Time to wait for connection open in seconds</td>
<td align="left">Timeout=30</td>
</tr>
<tr class="even">
<td align="left">Sslmode</td>
<td align="left">Mode for ssl connection control. Sslmode can be one of the following values:
<pre><code>           Prefer - If it is possible to connect using ssl, it will be used.
           Require - If an ssl connection cannot be made, an exception is thrown.
           Allow - Not supported yet, just connects without ssl.
           Disable - No ssl connection is done.
           Default is Disable. </code></pre></td>
<td align="left">Sslmode=Require</td>
</tr>
<tr class="odd">
<td align="left">Protocol</td>
<td align="left">Protocol version to use, instead of automatic detection. First tries 3 and fallsback to 2; Integer 2 or 3.</td>
<td align="left">Protocol=2</td>
</tr>
</tbody>
</table>

### Examples

#### Some Connection Example

``` csharp
 using System;
 using System.Data;
 using Npgsql;
 
 public class Test
 {
    public static void Main(string[] args)
    {
       string connectionString =
          "Server=localhost;" +
          "Database=test;" +
          "User ID=postgres;" +
          "Password=fun2db;";
       IDbConnection dbcon;
       dbcon = new NpgsqlConnection(connectionString);
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
            string FirstName = reader.GetString(reader.GetOrdinal("firstname"));
            string LastName = reader.GetString(reader.GetOrdinal("lastname"));
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

    $ mcs TestExample.cs -r:System.Data.dll -r:Npgsql.dll

-   Running the Example:

<!-- -->

     mono TestExample.exe 

#### Howto use PostgreSQL from ASP.Net

``` csharp
<%@ Page Language="c#" Title="postgres via Npgsql" %>
<%@ Assembly name="System" %>
<%@ Assembly name="System.Data" %>
<%@ Assembly name="Npgsql" %>
 
<script runat="server">
                protected void Page_Load(object sender, EventArgs e) 
                {
                        if (!Page.IsPostBack)
                        {
                      string connectionString =
                        "Server=localhost;" +
                        "Database=test;" +
                        "User ID=postgres;" +
                        "Password=fun2db;";
                        System.Data.IDbConnection dbcon;
                        dbcon = new Npgsql.NpgsqlConnection(connectionString);
                        dbcon.Open();
                        System.Data.IDbCommand dbcmd = dbcon.CreateCommand();
                        string sql =
                                "SELECT firstname, lastname " +
                                "FROM employee";
                        dbcmd.CommandText = sql;
                        System.Data.IDataReader reader = dbcmd.ExecuteReader();
                                dg.DataSource = reader;
                                dg.DataBind();
                            reader.Close();
                        reader = null;
                        dbcmd.Dispose();
                        dbcmd = null;
                        dbcon.Close();
                        dbcon = null;
                        }
                }
</script>
 
<html> 
<body>
The DataGrid that follows should list employees </ br>
<asp:DataGrid id="dg" runat="server">
</asp:DataGrid>
 
// requires a table to be created named employee
// with columns firstname and lastname
// such as,<br />
//        CREATE TABLE employee (<br />
//           firstname varchar(32),<br />
//           lastname varchar(32));<br />
//<br />
// create records thus<br />
//        INSERT INTO employee <br />
//           SELECT 'Rob','Davis';<br />
//        INSERT INTO employee <br />
//           SELECT 'Sarah','Davis';<br />
 
</body>
</html>
```

-   More examples can be found in Npgsql Users Manual [here](http://npgsql.projects.postgresql.org/docs/manual/UserManual.htm)

Installation instructions for PostgreSQL DBMS
---------------------------------------------

### On UNIX

-   Read the PostgreSQL Installation Instructions

at /usr/doc/postgresql-x.x.x/html/installation.html

-   Depending on your UNIX system, PostgreSQL maybe already installed, a database user 'postgres' created, a linux user 'postgres' created and initdb ran. Or maybe not.

<!-- -->

     su
     adduser postgres
     mkdir /usr/local/pgsql/data
     chown postgres /usr/local/pgsql/data
     su - postgres
     initdb -D /usr/local/pgsql/data
     postmaster -i -D /usr/local/pgsql/data
     createdb test
     psql test

-   Make sure you have a database user named postgres. It is best to install the PostgreSQL DBMS under linux user postgres. When you run the postmaster, run it under the user postgres as well. If this was not done, then you will need to create a user named postgres for the System.Data tests.

-   If you already installed PostgeSQL and you do not have a database user named postgres, then you can create user postgres using psql:

<!-- -->

    psql test
    create user postgres with password 'fun2db';

-   The postmaster must be run with -i option.

-   In the /usr/local/pgsql/data/pg\_hba.conf file, you need to have the AUTH\_TYPE set to md5. You can read more on this at /usr/doc/postgresql-7.2.1/html/client-authentication.html or wherever your PostgreSQL html docs are located. See the 2nd line below, host 127.0.0.1 has an AUTH\_TYPE md5 in pg\_hba.conf.

<!-- -->

    # # TYPE     DATABASE    IP_ADDRESS    MASK               AUTH_TYPE

     local      all                                          trust
     host       all         127.0.0.1     255.255.255.255    md5

-   If you can not find your PostgreSQL documentation locally or you did not install it, then you can get it [here](http://www.postgresql.org/idocs/).

### On Windows using native PostgreSQL

-   Starting with PostgreSQL 8.0, PostgreSQL has native Windows support

-   [PostgreSQL Downloads](http://www.postgresql.org/download/)


