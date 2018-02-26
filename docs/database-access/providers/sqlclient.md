---
title: SQLClient
redirect_from:
  - /SQLClient/
  - /SQL_Client/
  - /MS_SQL_Client/
  - /MSSQL/
---

Info
----

-   ADO.NET Provider for Microsoft SQL Server 7/2000/2005/2008 databases

-   Exists in namespace System.Data.SqlClient and assembly System.Data

-   Used the [FreeTDS](http://www.freetds.org/) and [jTDS](http://jtds.sourceforge.net/) projects as resources.

-   Does not require a client library because it is fully managed.

-   Requires the assembly Mono.Data.Tds.dll which implements the TDS protocol in C#

-   Uses TDS Protocol Version 7.0

Current Status
--------------

-   Connect to Microsoft SQL Server 7, 2000, 2005, and 2008 databases via SQL Server authentication and NT Authentication. However, if you want to use NT Authentication, you must trully be on an NT/2000/2003 Domain.

-   Connection pooling works.

-   Stored Procedures work.

-   Named pipes are not supported. However, if you knew jCIFS or Samba, you probably could implement this functionality for SqlClient.

-   Parameters work.

-   Prepare works.

-   SQL commands can be executed via ExecuteNonQuery() of a SqlCommand.

-   SQL aggregates can be executed and a single row and single column result can be retrieved via ExecuteScalar() of a SqlCommand

-   SQL queries can be executed via ExecuteReader() and results can be retrieved via SqlDataReader.

-   a DataTable with schema info about a result can be gotten via GetSchemaTable() in a SqlDataReader

-   XML can be read via ExecuteXmlReader in a SqlCommand.

-   Data can be filled in a DataTable in a DataSet via a SqlDataAdapter

-   Works in the SQL# command-line and Gtk# GUI version

Action Plan
-----------

-   Needs more testing and fixing bugs

-   Start work on TDS Protocol Version 8.0 support

-   Add support for the .NET Framework 2.0

-   Add support for ADO.NET 2.0

-   Add support for Microsoft SQL Server 2005

-   Add support for distributed transactions

-   Add support for Named Pipes

-   Better support for Integrated Security (NTLM Authentication)

Testing
-------

**Prerequisites**

-   Have a working mono and mcs installed. Recommend at least Mono 1.1.5 since there have been lots of bug fixes.

-   Have access to a Microsoft SQL Server database or either download it: [Microsoft SQL Server](http://www.microsoft.com/sql/default.mspx)

There is a trial version which allows you to use it for 120 days. There is also MSDE and [SQL Server 2005 Express](http://msdn.microsoft.com/vstudio/express/sql/download/) which are free downloads. MSDE (Desktop version of SQL Server) will not be supported on the Windows Vista operating system - use SQL Server 2005 Express instead. If you get SQL Server 2005 Express, also get the SQL Server Management Studio Express.

-   **IMPORTANT:** If using Microsoft SQL Server 2000, make sure you are using at least Service Pack 3 for Microsoft SQL Server 2000. If using MSDE 2000, make sure you have the special Service Pack 3 for MSDE 2000. Currently, the latest service pack is SP4. You can get it from [here](http://www.microsoft.com/technet/prodtechnol/sql/2000/downloads/default.mspx)

-   For those that only have MSDE installed. You can change the authentication mode from Windows Only Authentication to SQL Server and Windows Authentications (also knows as Mixed-mode authentication) via the [registry](http://support.microsoft.com/default.aspx?scid=kb;en-us;Q322336&sd=tech#4). It is the LoginMode you need to change. By default, MSDE is installed with Windows Only Authentication. If you want SqlClient to work with MSDE via SQL Server authentication, you will need to change the setting. Otherwise, you wil have to use NT Authentication.

-   If using MSDE, you might need to create a new user with password. Give this user access to various databases in this MSDE instance. Also, for each database, give this new user at least SELECT access to the various tables you want to retrieve data from.

-   If you have Enterprise Manager, you can easily change the authentication mode for both MSDE and Microsoft SQL Server. To change the authentication mode in Enterprise Mananger, select the instance, right-click on it, and select properites. The SQL Server properties dialog for that instance will pop up. Choose the Security tab. Change the Authentication from Windows Only to SQL Server and Windows. If the instance of your database does not show up in Enterprise Manager, Register first by selecting the Action menu and choosing New SQL Server Registration.

-   By default, SQL Server 2005 Express has TCP/IP disabled. So, you have to go into SQL Server Configuration Manager and enable TCP/IP for each instance you wish to connect via TCP/IP. But, you also must make sure the TCP/IP Protocol is one of the allowed client protocols. You may need to make sure your firewall allows mono.exe to do networking. And allow the SQL Server Monitor UDP Port 1434 in your firewall. If this UDP port is not enabled, then SqlClient running on Linux will not be able to get the TCP port to connect to based on the instance name SQLEXPRESS. SQL Server 2005 Network Configuration - Protocols for - SQLEXPRESS - enable TCP/IP. And SQL Server Native Client - Client Protocols - enable TCP/IP.

-   If you want to use Integrated Security (aka NT Authentication aka Trusted Connection aka Domain Login), you will need to specify the Windows NT/2000/2003 Domain User ID and Password. This is because Mono is not integrated with Windows nor SQL Server.

**Connection string format**

-   Has a connection string format for SQL Server Authentication:

<!-- -->

``` text
Server=hostname;Database=databaseName;User ID=sqlServerUserid;Password=sqlServerPassword
```

-   Has a connection string format for NT Authentication:

<!-- -->

``` text
Server=hostname;Database=databaseName;User ID=windowsDomain\windowsUserid;Password=windowsPassword;Integrated Security=SSPI
```

-   Connection String Parameters:

|Parameter Definition|Description|Example|
|:-------------------|:----------|:------|
|Server or Data Source|hostname of the SQL Server|Server=MYHOST|
|Database or Initial Catalog|name of the database|Database=pubs|
|User ID or UID|name of SQL Server user. If using integrated security, it is the name of the domain, backslash, and the name of the domain user|User ID=sa or UID=MYDOMAIN\\SomeDomainUser|
|Password or PWD|password for SQL Server user. If using integrated security, is the password of the domain user|Password=mypass12|
|Integrated Security|use NT Authentication using a Windows domain user id and password|Integrated Security=SSPI|
|Min Pool Size|Specifies the minimum number of connections in the connection pool. Default is 0.|Min Pool Size=0|
|Max Pool Size|Specifies the maximum number of connections in the connection pool. Default is 100.|Max Pool Size=100|
|Pooling|Specifies whether or not to use connection pooling. Valid values are TRUE or YES to use connection pooling or FALSE or NOT to not use connection pooling. Default is TRUE.|Pooling=true|

-   The Server connection string parameter can be used in three different ways:

|Server Definition|Example|
|:----------------|:------|
|hostname|Server=MYHOST|
|hostname,port|Server=MYHOST,1433|
|hostname\\instance|Server=MYHOST\\NETSDK|

-   C# Example using SQL Server Authentication:

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
       using (dbcon = new SqlConnection(connectionString)) {
           dbcon.Open();
           using (IDbCommand dbcmd = dbcon.CreateCommand()) {
               string sql =
                   "SELECT fname, lname " +
                   "FROM employee";
               dbcmd.CommandText = sql;
               using (IDataReader reader = dbcmd.ExecuteReader()) {
                   while(reader.Read()) {
                       string FirstName = (string) reader["fname"];
                       string LastName = (string) reader["lname"];
                       Console.WriteLine("Name: " +
                            FirstName + " " + LastName);
                   }
               }
           }
       }
    }
 }
```

-   C# Example using NT Authentication (Integrated Security)

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
       using (dbcon = new SqlConnection(connectionString)) {
           dbcon.Open();
           using (IDbCommand dbcmd = dbcon.CreateCommand()) {
               string sql =
                   "SELECT fname, lname " +
                   "FROM employee";
               dbcmd.CommandText = sql;
               using (IDataReader reader = dbcmd.ExecuteReader()) {
                   while(reader.Read()) {
                       string FirstName = (string) reader["fname"];
                       string LastName = (string) reader["lname"];
                       Console.WriteLine("Name: " +
                            FirstName + " " + LastName);
                   }
               }
          }
       }
    }
 }
```

-   C# Example using Command Builder and Data Adapter to easily update the database based on inserts, updates, or deletes in a DataTable

<!-- -->

``` csharp
using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
 
namespace TestSqlClientAdapter {
    public class Test {
        static SqlConnection con;
        static SqlTransaction trans;
 
        public static void Main (string[] args)
        {
            Console.WriteLine("Apapter Test Begin...");
            using (con = new SqlConnection(
                            "server=localhost;" +
                            "database=pubs;" +
                            "user id=sa;" +
                            "password=mypass")) {
                con.Open();
 
                Setup();
 
                trans = con.BeginTransaction();
                Insert();
                trans.Commit();
 
                trans = con.BeginTransaction();
                Update();
                trans.Commit();
 
                trans = con.BeginTransaction();
                Delete();
                trans.Commit();
 
            }
            Console.WriteLine("Done.");
        }
 
        static void Setup()
        {
            using (SqlCommand cmd = con.CreateCommand()) {
                cmd.Transaction = trans;
                cmd.CommandText =
                                  "DROP TABLE MONO_TEST_ADAPTER1";
 
                try { cmd.ExecuteNonQuery();
                } catch(SqlException e) { }
 
                cmd.CommandText =
                    "CREATE TABLE MONO_TEST_ADAPTER1 (" +
                    " num_value int primary key," +
                    " txt_value varchar(64))";
                cmd.ExecuteNonQuery();
            }
        }
 
        static void Insert()
        {
            Console.WriteLine("Insert...");
 
            SqlDataAdapter adapter = new SqlDataAdapter(
                                "SELECT * FROM MONO_TEST_ADAPTER1", con);
            adapter.MissingSchemaAction  = MissingSchemaAction.AddWithKey;
            adapter.SelectCommand.Transaction = trans;
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
 
            DataSet ds = new DataSet();
            adapter.Fill(ds,"MONO_TEST_ADAPTER1");
 
            DataRow row = ds.Tables["MONO_TEST_ADAPTER1"].NewRow();
            row["num_value"] = 3;
            row["txt_value"] = "Value inserted";
 
            ds.Tables["MONO_TEST_ADAPTER1"].Rows.Add(row);
 
            adapter.Update(ds, "MONO_TEST_ADAPTER1");
 
            row = null;
            builder = null;
            adapter = null;
            ds = null;
 
            ReadData(con, "SELECT * FROM MONO_TEST_ADAPTER1");
        }
 
        static void Update()
        {
            Console.WriteLine("Update...");
 
            SqlDataAdapter adapter = new SqlDataAdapter(
                                "SELECT * FROM MONO_TEST_ADAPTER1", con);
            adapter.SelectCommand.Transaction = trans;
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
 
            DataSet ds = new DataSet();
            adapter.Fill(ds,"MONO_TEST_ADAPTER1");
 
            DataRow row = ds.Tables["MONO_TEST_ADAPTER1"].Rows[0];
            row["txt_value"] = "Value updated";
 
            adapter.Update(ds, "MONO_TEST_ADAPTER1");
 
            row = null;
            builder = null;
            adapter = null;
            ds = null;
 
            ReadData(con, "SELECT * FROM MONO_TEST_ADAPTER1");
 
        }
 
        static void Delete()
        {
            Console.WriteLine("Delete...");
 
            SqlDataAdapter adapter = new SqlDataAdapter(
                                "SELECT * FROM MONO_TEST_ADAPTER1", con);
            adapter.SelectCommand.Transaction = trans;
            SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
 
            DataSet ds = new DataSet();
            adapter.Fill(ds,"MONO_TEST_ADAPTER1");
 
            ds.Tables["MONO_TEST_ADAPTER1"].Rows[0].Delete();
 
            adapter.Update(ds, "MONO_TEST_ADAPTER1");
 
            builder = null;
            adapter = null;
            ds = null;
 
            ReadData(con, "SELECT * FROM MONO_TEST_ADAPTER1");
 
        }
 
        private static void ReadData(IDbConnection con, string sql)
        {
            using (IDbCommand cmd = con.CreateCommand()) {
                cmd.Transaction = trans;
                cmd.CommandText = sql;
                using (IDataReader reader = cmd.ExecuteReader()) {
                    int rows = 0;
                    while(reader.Read()) {
                        Console.WriteLine("Value 0: {0}", reader[0]);
                        Console.WriteLine("Value 0: {0}", reader[1]);
                        rows++;
                    }
                    Console.WriteLine("Rows retrieved: {0}", rows);
                }
            }
        }
    }
 }
```

-   Building C# Example:

-   Save the example to a file, such as, TestExample.cs

-   Build on Linux:

<!-- -->

``` bash
csc TestExample.cs -r:System.Data.dll
```

-   Running the Example:

<!-- -->

``` bash
     mono TestExample.exe
```
