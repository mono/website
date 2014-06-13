---
layout: docpage
navgroup: docs
title: ODBC
permalink: /docs/database-access/providers/odbc/
---

Info
----

-   ADO.NET Data Provider for Data Sources that have [ODBC](http://www.microsoft.com/data/odbc/) driver support. It is recommended to use a managed provider other than ODBC to access a database. For example, it is better to use Npgsql to connect to PostgreSQL instead of using ODBC.

-   Exists in namespace System.Data.Odbc and assembly System.Data

-   Works on Windows, Linux, and Unix.

-   Works on Windows via the native Windows odbc32.dll

-   Works on Linux/Unix via:
    -   [unixODBC](http://www.unixodbc.org/) which has commercial support from [Easysoft](http://www.easysoft.com/)
    -   [iODBC](http://www.iodbc.org/) which has commercial support from [OpenLink Software](http://oplweb.openlinksw.com:8080/download/)

-   List of unixODBC [drivers](http://www.unixodbc.org/drivers.html)

-   List of [ODBC Vendors](http://www.sqlsummit.com/odbcvend.htm)

-   ODBC can connect to various databases which has an ODBC driver installed:
    -   [MySQL](http://www.mysql.com/) Note: the MySQL Connector/Net from MySQL AB is the best way to connect to MySQL on Mono
    -   [PostgreSQL](http://www.postgresql.org/) Note: ODBC support for PostgreSQL is poor; please use the Managed provider [Npgsql]({{site.github.url}}/PostgreSQL) instead.
    -   [Oracle](http://www.oracle.com/)
    -   [Interbase](http://www.borland.com/products/downloads/download_interbase.html)
    -   [Sybase](http://www.sybase.com/downloads) ( via [FreeTDS](http://www.freetds.org/) on UNIX)
    -   [Microsoft SQL Server](http://www.microsoft.com/sql/default.asp) ( via [FreeTDS](http://www.freetds.org/) on UNIX)
    -   [IBM DB2 Universal Database](http://www-3.ibm.com/software/data/db2/)
    -   [MS Access](http://www.microsoft.com/office/access) (via [MDB Tools](http://mdbtools.sourceforge.net/) on UNIX)

-   Microsoft did not add System.Data.Odbc to the System.Data.dll assembly until Dot NET 1.1 (Visual Studio.net 2003). For Dot NET 1.0 (Visual Studio.net 2002), ODBC was available as Microsoft.Data.Odbc.dll as a separate download from MSDN

Current Status
--------------

-   OdbcCommandBuilder has been implemented.

-   Can connect on Windows via native Windows odbc32.dll

-   Can connect on Linux via unixODBC's libodbc.so or iODBC's libiodbc.so

-   Various databases have been tested using their ODBC drivers: MySQL, PostgreSQL, Oracle, IBM DB2, and Microsoft SQL Server. Please note, some drivers maybe good while others may not be. If a managed provider is available, it recommend to use that managed provider.

-   Can execute non-query commands via ExecuteNonQuery of a OdbcCommand

-   Can execute aggreates and retrieve a single row single column result via ExecuteScalar of a OdbcCommand

-   Can execute queries via ExecuteReader of a OdbcCommand and retrieve results using an OdbcDataReader

-   Can get a DataTable containing schema info via GetSchemaTable() in a OdbcDataReader

-   Can Fill a DataTable in a DataSet via an OdbcDataAdapter

Action plan
-----------

-   Need to create more test cases to find and fix bugs

-   Test more ODBC drivers

-   Test other setups

Missing Features
----------------

-   Odbc Output Parameters

-   Complex Parameter Types (Binary, Numeric, Guid)

Testing ODBC Providers
----------------------

You can test a native odbc provider with ADO.NET Odbc classes. There is a possiblity of bugs in either Managed code or the native odbc providers. Before filing a bug, make sure your native provider works with other languages (C, perl, etc).

To test a odbc provider

-   Create a DSN entry at /etc/unixODBC/odbc.ini and /etc/unixODBC/odbcinst.ini.

-   Provide the connection string information in odbc.config file under mcs/class/System.Data/Test/ProviderTests. The app settings name should be "ConnString".

-   Go to the source director mcs/class/System.Data/Test/ProviderTest.

-   In a shell, enter "make run-test DATABASE=odbc".

The following topics are for running tests for individual providers as stand-alone tests.

Testing ODBC provider with IBM DB2 Universal Database
-----------------------------------------------------

-   You need a working mono and mcs

-   For UNIX, you will need unixODBC or iODBC installed

-   Have acess to a [IBM DB2 Universal Database](http://www-306.ibm.com/software/data/db2/) or you can download from IBM

-   Read these web pages about UNIX, ODBC, and IBM DB2

-   [unixODBC web page about IBM DB2](http://www.unixodbc.com/doc/db2.html)

-   [IBM web page about unixODBC and DB2](http://www-306.ibm.com/software/data/db2/udb/ad/v8/cli/t0010406.htm)

-   The ODBC provider is similar to the [IBM DB2]({{site.github.url}}/old_site/IBM_DB2 "IBM DB2") provider.

Testing ODBC provider with MySQL
--------------------------------

**Prerequisites** You can test Mono's ODBC provider System.Data.Odbc with the MySQL ODBC driver MyODBC

-   Take a look at OdbcTest.cs in mcs/class/System.Data/Test

**Connection String Format**

-   Here is a ConnectionString format if you have a DSN setup:

<!-- -->

     "DSN=dataSetName;" +
     "UID=myuserid;" + 
     "PWD=mypassword" 

-   Here is a ConnectionString format if you do not have a DSN (also called DSN-less connection). Note the use of DRIVER and SERVER parameters:

<!-- -->

     "DRIVER={MySQL ODBC 3.51 Driver};" + 
     "SERVER=localhost;DATABASE=test;" + 
     "UID=myuserid;PASSWORD=mypassword;" + 
     "OPTION=3"

**C\# Example**

``` csharp
 using System;
 using System.Data;
 using System.Data.Odbc;
 
 public class Test
 {
    public static void Main(string[] args)
    {
        // have an ODBC DSN setup named MYSQLDSN
        // that accesses a MySQL database via
        // MyODBC driver for ODBC with a
        // hostname of localhost and database test
       string connectionString =
          "DSN=MYSQLDSN;" +
          "UID=myuserid;" +
          "PWD=mypassword";
       IDbConnection dbcon;
       dbcon = new OdbcConnection(connectionString);
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

-   To build on Mono:

<!-- -->

     mcs TestExample.cs -r:System.Data.dll

-   Running the Example:

<!-- -->

     mono TestExample.exe 

