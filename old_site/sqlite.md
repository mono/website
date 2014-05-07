---
layout: obsolete
title: "SQLite"
permalink: /old_site/SQLite/
redirect_from:
  - /SQLite/
  - /SQL_Lite/
---

SQLite
======

 The Mono.Data.SqliteClient assembly contains an ADO.NET data provider for the [SQLite](http://www.sqlite.org/) embeddable database engine (both version 2 and version 3).

SQLite has a notable oddity: table cell data does not retain what kind of data it was. Everything is stored as either a long, double, string, or blob. And in SQLite version 2, everything is stored as a string. So you need to be careful about avoiding casting values returned by SQLite without checking the type of the value returned. See below for notes on storing DateTimes.

(The last maintainer of Mono.Data.SqliteClient was [Josh Tauberer](http://razor.occams.info).)

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#New_style_assembly_shipped_with_Mono_1.2.4">1 New style assembly shipped with Mono 1.2.4</a></li>
<li><a href="#Prerequisites">2 Prerequisites</a></li>
<li><a href="#Connection_String_Format">3 Connection String Format</a></li>
<li><a href="#Storing_DateTimes">4 Storing DateTimes</a></li>
<li><a href="#Character_Encodings">5 Character Encodings</a></li>
<li><a href="#C.23_Example_.281.1_profile_of_the_new_assembly_and_the_old_assembly.29">6 C# Example (1.1 profile of the new assembly and the old assembly)</a></li>
</ul></td>
</tr>
</tbody>
</table>

New style assembly shipped with Mono 1.2.4
------------------------------------------

Starting with the 1.2.4 release, Mono ships a second SQLite assembly - Mono.Data.Sqlite. The new assembly provides support **only for SQLite version 3**and is not 100% binary and API compatible with the older assembly. The new assembly is based on code by Robert Simpson from [http://sqlite.phxsoftware.com/](http://sqlite.phxsoftware.com/) and provides full ADO.NET 2.0 API interface. Code from the old binary is contained in the new one but is available **only in the 1.1 profile**. The 2.0 profile can no longer access the old code when referencing the new assembly. We have chosen this way as means to provide a migration path for developers using SQLite in their .NET applications - both assemblies will be shipped with several future releases of Mono, and at some (yet undetermined) point the old one will be removed from the distribution. All the developers are encouraged to start transitioning their code to the new assembly - for both 1.1 and 2.0 profiles.

One disadvantage of the new assembly is its binary incompatibility in the data format. That is, if your application uses SQLite database v2 format you **will not** be able to access your data with the new assembly. To solve this problem you must dump your data using sqlite v2 utilities and then restore it using sqlite v3 utilities.

Prerequisites
-------------

If you do not have [SQLite](http://www.sqlite.org/), download it. There are binaries for Windows and Linux. You can put the .dll or .so along side your application binaries, or in a system-wide library path.

Connection String Format
------------------------

The format of the connection string is:

    [1.1 profile and the old assembly]
    URI=file:/path/to/file 

    [2.0 profile in the new assembly]
    Data Source=file:/path/to/file
    Data Source=|DataDirectory|filename

The latter case for the 2.0 profile references the App\_Data directory (or any other directory that's configured to contain data files for an ASP.NET 2.0 application)

As an example:

    [1.1 and the old assembly]
    URI=file:SqliteTest.db 

    [2.0 and the new assembly]
    Data Source=file:SqliteTest.db

That will use the database SqliteTest.db in the current directory. It will be created if it does not exist.

Or you prefer to use SQLite as an in memory database

    URI=file::memory:,version=3

The `version=3` is supported, but not necessary with the new assembly.

With the old assembly, the ADO.NET adapter will use SQLite version 2 by default, but if version 2 is not found and version 3 is available, it will fallback to version 3. You can force the adapter to use version 3 by adding "version=3" to the connection string:

    URI=file:SqliteTest.db,version=3

The new assembly, as described above, uses only database format version 3.

-   Connection String Parameters:

**For the 1.1 profile and the old assembly**

|Parameter Definition|Description|Example|
|:-------------------|:----------|:------|
|URI|a file Universal Resource Identifier|URI=file:SqliteTest.db|
|version|version of SQL Lite to use: version 2 or 3|version=3|
|busy\_timeout|a timeout, in milliseconds, to wait when the database is locked before throwing a SqliteBusyException (since Mono 1.1.14)|busy\_timeout=3000|

The busy\_timeout parameter is implemented as a call to [sqlite(3)\_busy\_timeout](http://sqlite.org/capi3ref.html#sqlite3_busy_timeout). The default value is 0, which means to throw a SqliteBusyException immediately if the database is locked.

**For the 2.0 profile in the new assembly**

|Parameter Definition|Description|Example|
|:-------------------|:----------|:------|
|Data Source|a file Universal Resource Identifier|Data Source=file:SqliteTest.db|
|version|version of SQL Lite to use: version 3|version=3|

Storing DateTimes
-----------------

The way DateTimes are stored and retrieved from Sqlite databases depends on a lot, unfortunately, because Sqlite doesn't have a way of storing datetimes natively. Further, there are two versions of Sqlite (2 and 3) which are treated differently when it comes to DateTimes. The recommended way of using DateTimes with Sqlite is to encode/decode them yourself to/from some particular integer string format that you decide, and *not* putting them into a DATE or DATETIME column.

Sqlite2 only has strings internally. No matter what the column was declared as, DateTimes are just going to be converted into strings. If you use parameters, for instance, DateTimes will be converted in a culture-sensitive format. When reading back the data, there's no way to know that it was originally a DateTime and not a string, so Mono.Data.SqliteClient returns the string. Using Sqlite2, you really can't use DateTimes without encoding them yourself.

If you explicitly are targetting Sqlite3, or using the new assembly (in which case you should be providing the version parameter in the connection string, unless you are using the new assembly), you can rely on the particular behavior used when connecting to a Sqlite3 database. Sqlite3 has string, integer (64bit), real, and blob internal storage types. When putting a DateTime into the database using parameters, Mono.Data.SqliteClient will encode the DateTime as an integer using ToFileTime(). But this doesn't help when reading the data back to determine that a value was originally a DateTime. Sqlite3 also exposes the names of the types of the columns as the table was created with. If a column is declared as a DATE or DATETIME, SqliteDataReader will try to turn the value back into a DateTime. If it finds an integer value, it uses DateTime.FromFileTime, which is the reverse of how it encodes DateTimes if you insert a DateTime via parameters. If it finds a string value, it uses DateTime.Parse, but note that Parse is a very slow operation. So with Sqlite3, DateTimes should be put into DATE or DATETIME columns in the database either through parameters or by turning it into a long with ToFileTime yourself, and then they will be read back as DateTimes.

Character Encodings
-------------------

The Sqlite client treats character encodings differently for version 2 and version 3 because of the way Sqlite2 and 3 treat strings.

In Sqlite3, the Sqlite client communicates with Sqlite in Unicode. Therefore, you should be able to read and write any characters from the database, but note that if you write Unicode characters to a database, you may not be able to read them back in other applications if the application does not communicate with Sqlite using Unicode.

In Sqlite2, the client by default communicates with Sqlite using the UTF-8 encoding, which means you can read and write any character. But you must beware of two things. The first is that since non-ASCII characters are encoded as multi-byte characters in UTF-8, and Sqlite2 doesn't recognize multibyte characters (unless it was compiled specifically with UTF-8 support), LIKE, GLOB, LENGTH, and SUBSTR will behave oddly. The second caveat is that other applications using the database must be using UTF-8 as well.

When using Sqlite2, you can force Mono.Data.SqliteClient to use a different encoding instead of UTF-8 by adding ";encoding=ASCII" for instance to the connection string. It must be an encoding that ends with a single null terminator, however.

C\# Example (1.1 profile of the new assembly and the old assembly)
------------------------------------------------------------------

``` csharp
 using System;
 using System.Data;
 using Mono.Data.SqliteClient;
 
 public class Test
 {
    public static void Main(string[] args)
    {
       string connectionString = "URI=file:SqliteTest.db";
       IDbConnection dbcon;
       dbcon = (IDbConnection) new SqliteConnection(connectionString);
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
            string FirstName = reader.GetString (0);
            string LastName = reader.GetString (1);
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

To build the example:

-   Save the example to a file, such as, TestExample.cs
-   Build using Mono C\# compiler:

<!-- -->

    mcs TestExample.cs -r:System.Data.dll -r:Mono.Data.SqliteClient.dll

To run the example:

    mono TestExample.exe

