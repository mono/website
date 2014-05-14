---
layout: obsolete
title: "SQL Client"
permalink: /old_site/SQL_Client/
redirect_from:
  - /SQL_Client/
---

SQL Client
==========

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#ms-sql-client">1 MS SQL Client</a>
<ul>
<li><a href="#info">1.1 Info</a></li>
<li><a href="#current-status">1.2 Current Status</a></li>
<li><a href="#action-plan">1.3 Action Plan</a></li>
<li><a href="#testing">1.4 Testing</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

MS SQL Client
=============

-   Info
-   Current Status
-   Action Plan
-   Testing

Info
----

-   ADO.NET Provider for Microsoft SQL Server 7/2000 databases
-   Exists in namespace System.Data.SqlClient and assembly System.Data
-   Created by Tim Coleman
-   Used the [FreeTDS](http://www.freetds.org/) and [jTDS](http://jtds.sourceforge.net/) projects as resources.
-   Implemented in 100% C\#
-   Is similar to the Mono.Data.TdsClient and Mono.Data.SybaseClient providers.
-   Requires the assembly Mono.Data.Tds.dll which implements the TDS protocol in 100% C\#.
-   Uses TDS Protocol Version 7.0
-   Bugs with Mono or the data provider should be reported in Mono's Bugzilla [here](http://bugzilla.ximian.com/). If you do not have Bugzilla user account, it is free and easy to create one [here](http://bugzilla.ximian.com/createaccount.cgi).

Current Status
--------------

-   Connect to Microsoft SQL Server 7/2000 databases via SQL Server authentication and NT Authentication.
-   Connection pooling works.
-   Stored Procedures work.
-   Parameters work.
-   Prepare works.
-   SQL commands can be executed via ExecuteNonQuery() of a SqlCommand.
-   SQL aggregates can be executed and a single row and single column result can be retrieved via ExecuteScalar() of a SqlCommand
-   SQL queries can be executed via ExecuteReader() and results can be retrieved via SqlDataReader.
-   a DataTable with schema info about a result can be gotten via GetSchemaTable() in a SqlDataReader
-   XML can be read via ExecuteXmlReader in a SqlCommand.
-   Data can be filled in a DataTable in a DataSet via a SqlDataAdapter
-   Works in the SQL\# command-line and Gtk\# GUI version

Action Plan
-----------

-   Needs more testing and fixing bugs
-   Start work on TDS Protocol Version 8.0 support
-   Add support for the .NET Framework 2.0 (Whidbey)
-   Add support for Microsoft SQL Server 2005 (Yukon) support

Testing
-------

**Prerequisites**

-   Have a working mono and mcs installed
-   Have access to a Microsoft SQL Server database or either download it:
-   [Microsoft SQL Server](http://www.microsoft.com/sql/default.asp)
-   **IMPORTANT:** If using Microsoft SQL Server 2000, make sure you are using at least Service Pack 3 for Microsoft SQL Server 2000. If using MSDE 2000, make sure you have the special Service Pack 3 for MSDE 2000. You can get it from [here](http://www.microsoft.com/sql/downloads/2000/sp3.asp)

-   For those that only have MSDE installed. You can change the authentication mode from Windows Only Authentication to SQL Server and Windows Authentications (also knows as Mixed-mode authentication) via the [registry](http://support.microsoft.com/default.aspx?scid=kb;en-us;Q322336&sd=tech#4). It is the LoginMode you need to change. By default, MSDE is installed with Windows Only Authentication. If you want SqlClient to work with MSDE via SQL Server authentication, you will need to change the setting. Otherwise, you wil have to use NT Authentication.\</a\>

-   If using MSDE, you might need to create a new user with password. Give this user access to various databases in this MSDE instance. Also, for each database, give this new user at least SELECT access to the various tables you want to retrieve data from.

-   If you have Enterprise Manager, you can easily change the authentication mode for both MSDE and Microsoft SQL Server. To change the authentication mode in Enterprise Mananger, select the instance, right-click on it, and select properites. The SQL Server properties dialog for that instance will pop up. Choose the Security tab. Change the Authentication from Windows Only to SQL Server and Windows. If the instance of your database does not show up in Enterprise Manager, Register first by selecting the Action menu and choosing New SQL Server Registration.

-   Located at mcs/class/System.Data/Test is a test for System.Data.SqlClient named SqlTest.cs and you could use this as a basis for your test.

-   If you want to use Integrated Security (aka NT Authentication aka Trusted Connection aka Domain Login), you will need to specify the Domain User ID and Password. This is because Mono is not integrated with Windows nor SQL Server.

**Connection string format**

-   Has a connection string format for SQL Server Authentication:

<!-- -->

        Server=hostname;
        Database=databaseName;
        User ID=sqlServerUserid;
        Password=sqlServerPassword

-   Has a connection string format for NT Authentication:

<!-- -->

        Server=hostname;
        Database=databaseName;
        User ID=windowsDomain\windowsUserid;
        Password=windowsPassword;
        Integrated Security=SSPI

-   The Server part can be used three ways:

<!-- -->

        Server Definition   Example
        -----------------------------------------------
        hostname        Server=MYHOST
        hostname,port       Server=MYHOST,1433
        hostname\instance   Server=MYHOST\NETSDK

**C\# Examples**

-   C\# Example using SQL Server Authentication:

<!-- -->

``` csharp
using System;
using System.Data;
using System.Data.SqlClient;
public class Test
{
    public static void Main(string[] args)
    {
        string connectionString =
            "Server=MyServer;" +
            "Database=pubs;" +
            "User ID=MySqlServerUserId;" +
            "Password=MySqlServerPassword;";
        IDbConnection dbcon;
        dbcon = new SqlConnection(connectionString);
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

-   C\# Example using NT Authentication (Integrated Security):

<!-- -->

``` csharp
using System;
using System.Data;
using System.Data.SqlClient;
public class Test
{
    public static void Main(string[] args)
    {
        string connectionString =
            "Server=MyServer;" +
            "Database=pubs;" +
            "User ID=MyWindowsDomain\\MyWindowsUserid;" +
            "Password=MyWindowsPassword;" +
            "Integrated Security=SSPI";
        IDbConnection dbcon;
        dbcon = new SqlConnection(connectionString);
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

**Building C\# Example:**

-   Save the example to a file, such as, TestExample.cs

-   Build on Linux:

<!-- -->

    mcs TestExample.cs -r System.Data.dll

-   Running the Example:

<!-- -->

    mono TestExample.exe

