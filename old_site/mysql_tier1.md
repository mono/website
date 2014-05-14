---
layout: obsolete
title: "Mysql tier1"
permalink: /old_site/Mysql_tier1/
redirect_from:
  - /Mysql_tier1/
---

Mysql tier1
===========

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#general-questions">1 General Questions</a>
<ul>
<li><a href="#current-status">1.1 Current Status</a></li>
<li><a href="#action-plan">1.2 Action plan</a></li>
<li><a href="#testing">1.3 Testing</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

General Questions
=================

-   \>  Current Status

-   \>  Action plan

-   \>  Testing

 There are two ADO.NET providers in Mono for a [MySQL](http://www.mysql.com/) database:

-   [ByteFX.Data.MySQLClient](http://sourceforge.net/projects/mysqlnet/)

-   Written in 100% C\#

-   Does not require a client library

-   Works on Mono and Microsoft .NET

-   Requires at least Mono 0.18 and MySQLNet 0.65 for it to work on Mono

-   Works in the SQL\# command-line and Gtk\# GUI version

-   Mono.Data.MySql (DEPRECATED)

-   Deprecated in favor of ByteFX.Data.MySQLClient. Mono.Data.MySql is no longer included in

Mono releases.

 Bugs with Mono or the data provider should be reported in Mono's Bugzilla [here](http://bugzilla.ximian.com/). If you do not have Bugzilla user account, it is free and easy to create one [here](http://bugzilla.ximian.com/createaccount.cgi).

="[http://www.mysql.com/articles/dotnet/](http://www.mysql.com/articles/dotnet/)"\>Exploring MySQL in the Microsoft .NET Environment\</a\> is a nice article to read.

Current Status
--------------

Current Status of the MySQL providers:

-   ByteFX.Data.MySqlClient

-   Build and Runs on Microsoft .NET and Mono

-   Works with SQL\# (command-line and Gtk\# GUI versions)

-   MySQLCommandBuilder now implemented

-   Transaction support now implemented (not all table types support this)

-   GetSchemaTable fixed to not use xsd (for Mono)

-   Driver is now Mono-compatible

-   TIME data type now supported

-   More work to improve Timestamp data type handling

-   Changed signatures of all classes to match corresponding SqlClient classes

-   Protocol compression using [SharpZipLib](http://www.icsharpcode.net/OpenSource/SharpZipLib/default.asp)

-   Named pipes on Windows now working properly

-   Work done to improve Timestamp data type handling

-   Implemented IEnumerable on DataReader so DataGrid would work

-   Speed increased dramatically by removing bugging network sync code

-   Driver no longer buffers rows of data (more ADO.Net compliant)

-   Conversion bugs related to TIMESTAMP and DATETIME fields fixed

-   Mono.Data.MySql (DEPRECATED)

Action plan
-----------

The current plan for the MySQL data providers:

-   ByteFX.Data.MySqlClient

-   Testing and fixes

-   Implement missing features

-   Only fixes for bugs to build and run MySQLClient on Mono

will be accepted in mono-cvs. Most bugs and any new features will go into sourceforge cvs. Anytime there is a release of MySQLClient, the source code will be copied from sourceforge cvs to mono-cvs

-   Releases of MySQLClient are determined by Reggie Burnett and releases

of Mono are determined by Miguel de Icaza

-   Implement any missing features or fix any bugs in Mono to get new

features all of MySQLClient to work on Mono

-   Mono.Data.MySql (DEPRECATED)

Testing
-------

-   Have access to a MySQL database or download it from

-   [MySQL AB](http://www.mysql.com/downloads/index.html)

-   MySQLNet can be gotten from [here](http://sourceforge.net/projects/mysqlnet/) and the

binary assembly ByteFX.Data.dll needs to be installed in the same place as the mono class libraries.

-   MySQLNet requires [SharpZipLib](http://www.icsharpcode.net/OpenSource/SharpZipLib/default.asp) which is

a Zip Library written in 100% C\#. This is used for compression/decompression of data sent/received over the network. The SharpZipLib binary assembly SharpZipLib.dll should be installed in the same place as the mono class libraries.

-   Has a ConnectionString format:

<!-- -->


    "Server=hostname;" +
    "Database=database;" +
    "User ID=username;" +
    "Password=password"

-   C\# Example:

<!-- -->


    using System;
    using System.Data;
    using ByteFX.Data.MySqlClient;
    public class Test 
    {
    public static void Main(string[] args)
    {
    string connectionString = 
    "Server=localhost;" +
    "Database=test;" +
    "User ID=myuserid;" +
    "Password=mypassword;";
    IDbConnection dbcon;
    dbcon = new MySqlConnection(connectionString);
    dbcon.Open();
    IDbCommand dbcmd = dbcon.CreateCommand();
    // requires a table to be created named employee
    // with columns firstname and lastname
    // such as,
    // CREATE TABLE employee (
    // firstname varchar(32),
    // lastname varchar(32));
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

-   Building C\# Example:

-   Save the example to a file, such as, TestExample.cs

<!-- -->


    mcs TestExample.cs -r System.Data.dll \
    -r ByteFX.Data.dll

-   Running the Example:

<!-- -->


    mono TestExample.exe



