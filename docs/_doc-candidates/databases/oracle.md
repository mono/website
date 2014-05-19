---
layout: obsolete
title: "Oracle"
permalink: /old_site/Oracle/
redirect_from:
  - /Oracle/
  - /Oracle_fix/
---

Oracle
======

 Mono comes with an Oracle client in the System.Data.OracleClient assembly and tracks the Microsoft System.Data.OracleClient library. This library has been discontinued by Microsoft and is no longer maintained.

Oracle produces a client for Windows, but they do not support this on Mono.

Some commercial providers for Mono are available:

-   [http://www.devart.com/dotconnect/oracle/](http://www.devart.com/dotconnect/oracle/)
-   [http://www.datadirect.com/products/net/net%5Ffor%5Foracle/index.ssp](http://www.datadirect.com/products/net/net%5Ffor%5Foracle/index.ssp)

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#info">1 Info</a></li>
<li><a href="#current-status-for-systemdataoracleclient">2 Current Status for System.Data.OracleClient</a></li>
<li><a href="#action-plan">3 Action plan</a></li>
<li><a href="#testing">4 Testing</a></li>
<li><a href="#examples">5 Examples</a></li>
<li><a href="#building-c-examples">6 Building C# Examples</a></li>
</ul></td>
</tr>
</tbody>
</table>

Info
----

-   ADO.NET Data Provider for [Oracle](http://www.oracle.com/) databases

-   Exists in namespace System.Data.OracleClient and assembly System.Data.OracleClient.dll

-   Works on Windows, Linux x86, and Solaris x86. Can you help us get it to work on other systems, such as, Solaris SPARC and Mac OS X?

-   Works with Oracle 8i, 9i, 10g, and 11g databases

-   Uses OCI (Oracle call-level interface) which is a C library for accessing Oracle databases

-   System.Data.OracleClient is deprecated in Microsoft .Net 4.0

-   Alternative that works on Mono but is not included with Mono - [dotConnect for Oracle](http://www.devart.com/dotconnect/oracle/)

Current Status for System.Data.OracleClient
-------------------------------------------

-   You have two ways to connect to Oracle: using a User ID and Password or using external authentication using "Integrated Security=true" in your connection string

-   OracleCommandBuilder has been implemented and can let you do simple Inserts/Updates/Deletes with a DataSet and OracleDataAdapter. However, OracleDataReader needs more implementation for getting KeyInfo and other meta data correctly. The Oracle SQL parser is very simple and will not be able to handle complex queries. Will need a real Oracle SQL parser which would use the jay compiler-compiler. Jay is used by mcs to parse c\# files and System.Data to parse expressions in a DataColumn.

-   REF CURSOR can be returned from a stored procedure as an OracleDataReader via an output parameter defined as OracleType.Cursor

-   Connection pooling working

-   OracleConnection can connect to Oracle 8i, 9i, and 10g databases via OCI (Oracle Call Level Interface)

-   Input and Output parameters (char, varchar2, number, date, raw, long varchar, blob, clob, and timestamp) can now be used in SQL queries, non-queries, PL/SQL Blocks, and stored procedures.

-   Input/Output and Return parameters have not been tested.

-   OracleException and Error handling exists.

-   Message handling needs to be added for non-critical messages received from Oracle (IN PROGRESS)

-   Handling of various data types need to be added [IN PROGRESS]

-   Data Adapter exists, and a DataSet can be filled using it.

-   May not work on non-X86 platforms such as Mac OS X nor Solaris SPARC. Does not work due to byte-ordering or alignment issues with different processors. We accept patches to get these platforms working.

Action plan
-----------

-   Parameters support needs to be Cleaned up (Input and Output parameters WORKING). Input/Output and Return parameters are a TODO)

-   Support for Oracle 8i on Linux and Windows (WORKING)

-   Support for Oracle 9i on Linux and Windows (WORKING. Still need to add features for 9i).

-   Support for Oracle 10g on Linux and Windows (WORKING. Still need to add features for 10g)

-   Support for Oracle 10g on Mac OS X. This requires resolving byte-ordering and alignment issues (TODO).

-   Support for Oracle 10g on Solaris x86. (WORKING on Solaris 10 x86 and Solaris Express x86)

-   Support for Oracle 10g on Solaris SPARC. This requires resolving byte-ordering and alignment issues (TODO)

-   Support for Oracle 10g Express Edition on Windows and Linux (WORKING)

-   Support for Oracle 11g on Linux and Windows (WORKING)

-   Support Large Objects like LONG VARCHAR, BLOB, CLOB (WORKING)

-   Support all the data types (STILL IMPLEMENTING). Still need to implement INTERVAL. Many of the Oracle .net types like OracleDateTime internally use a System .net type like DateTime. This is insufficient for supporting Oracle data types like TIMESTAMP.

-   Security Audit (TODO)

-   NLS / Unicode support / Multi-byte character sets (NEEDS IMPROVEMENT)

Testing
-------

**Prerequisites**

-   Have a working mono and gmcs.

-   Have access to an Oracle 8i, 9i, 10g, 10g Express, or 11g database or download it from [Oracle Downloads](http://www.oracle.com/technology/software/index.html). If you are connecting remotely to an Oracle database, you need the Oracle client software. Registration to the [Oracle Technology Network](http://www.oracle.com/technology/index.html) is free. If installing on Linux, I suggest you do a lot of searching to see how others installed Oracle on Linux. [Werner Puschitz's Oracle on Linux page](http://www.puschitz.com/OracleOnLinux.shtml) contains great step by step guides on installing Oracle on Linux.

-   [Oracle Database 10g Express Edition](http://www.oracle.com/technology/software/products/database/xe/index.html) is free to download and redistribute. It works on Windows and Linux. It is also much easier to install the Express edition compared to the Enterprise and Standard editions.

-   If you do not have any Oracle software installed on the computer you are running Mono but you need to access an Oracle database remotely, may I suggest using the [Oracle Instant Client](http://www.oracle.com/technology/tech/oci/instantclient/index.html). The Oracle Instant Client is far more easier to install than the normal Oracle client software. You can also re-distribute the Oracle Instant Client for free.

-   Oracle 10g Express Edition (XE) installation on Debian/Ubuntu Linux is a breeze via apt-get.

<!-- -->

     Basically, you add to your /etc/apt/sources.list

        deb http://oss.oracle.com/debian unstable main non-free 
      
     And then run the following:

        sudo apt-get update
        sudo apt-get install oracle-xe-universal
        sudo /etc/init.d/oracle-xe configure 

-   In the mcs source code, you can find tests at mcs/class/System.Data.OracleClient/Test

-   The Data Source is an Oracle TNS Name

**Connection String Format**

-   Has a connection string format:

<!-- -->

     "Data Source=tnsname;User ID=userid;Password=password" 

**Connection String Format using TNS network description which does not use a tnsnames.ora file**

-   Has a connection string format:

<!-- -->

     "User ID=SCOTT;" +
     "Password=TIGER;" +
     "Data Source=(" +
     "DESCRIPTION=(" +
     "ADDRESS=(PROTOCOL=TCP)(HOST=192.168.1.101)(PORT=1521))" +
     "(CONNECT_DATA=(SERVER=DEDICATED)" +
     "(SERVICE_NAME=TESTDB)))" 

**Connection String Format for External Authentication**

-   Has a connection string format:

<!-- -->

     "Data Source=tnsname;Integrated Security=true" 

-   Connection String Parameters:

|Parameter Definition|Description|Example|
|:-------------------|:----------|:------|
|Server or Data Source|TNS Name or Network Address of the Oracle instance to connect|Server=TESTDB|
|User ID|name of Oracle database user|User ID=scott|
|Password|password for Oracle database user|Password=mypass12|
|Integrated Security|To connect using external authentication or not. Valid values for Integrated Security are: YES or TRUE to use external authentication. NO or FALSE to not use external authentication. The default is false.|Integrated Security=true|
|Min Pool Size|Specifies the minimum number of connections in the connection pool. Default is 0.|Min Pool Size=0|
|Max Pool Size|Specifies the maximum number of connections in the connection pool. Default is 100.|Max Pool Size=100|
|Pooling|Specifies whether or not to use connection pooling. Valid values are TRUE or YES to use connection pooling or FALSE or NOT to not use connection pooling. Default is TRUE.|Pooling=true|

-   If you use External Authentication, make sure you have a user created externally. Also, make sure you know what you are doing if you use external authentication - there are security implications. Read [Oracle® Database Advanced Security Administrator's Guide](http://download-east.oracle.com/docs/cd/B19306_01/network.102/b14268/asoauth.htm#sthref731) for more info about external authentication.

-   How-To create a Windows user named SomeUser on Windows NT/2000 Domain MyNTDomain for external authentication in Oracle: If you're not on a Windows domain, then your MachineName is the Domain. Note how the domain user is in double quotes and is upper case.

CREATE USER "MYNTDOMAIN\\SOMEUSER" IDENTIFIED EXTERNALLY;

-   How-To create a Linux user named someuser in Oracle which gets authenticated externally:

CREATE USER someuser IDENTIFIED EXTERNALLY;

Examples
--------

**C\# Example 1a - Basic Connection and Retrieval**

``` csharp
 using System;
 using System.Data;
 using System.Data.OracleClient;
 
 public class Test
 {
    public static void Main (string[] args)
    {
       string connectionString =
          "Data Source=testdb;" +
          "User ID=scott;" +
          "Password=tiger;";
       OracleConnection dbcon = null;
       dbcon = new OracleConnection (connectionString);
       dbcon.Open ();
       OracleCommand dbcmd = dbcon.CreateCommand ();
       string sql = "SELECT ename, job FROM scott.emp";
       dbcmd.CommandText = sql;
       OracleDataReader reader = dbcmd.ExecuteReader ();
       while (reader.Read ()) {
          string employeeName = (string) reader["ename"];
          string job = (string) reader["job"];
          Console.WriteLine ("Employee Name: {0}  Job: {1}",
                            employeeName, job);
       }
       // clean up
       reader.Close ();
       reader = null;
       dbcmd.CommandText = sql;
       dbcmd.ExecuteNonQuery ();
       dbcmd.Dispose ();
       dbcmd = null;
       dbcon.Close ();
       dbcon = null;
    }
 }
```

**C\# Example 1b - Basic Connection and Retrieval using Integrated Security**

``` csharp
 using System;
 using System.Data;
 using System.Data.OracleClient;
 
 public class Test
 {
    public static void Main (string[] args)
    {
       string connectionString =
          "Data Source=testdb;" +
          "Integrated Security=true";
       OracleConnection dbcon = null;
       dbcon = new OracleConnection (connectionString);
       dbcon.Open ();
       OracleCommand dbcmd = dbcon.CreateCommand ();
       string sql = "SELECT ename, job FROM scott.emp";
       dbcmd.CommandText = sql;
       OracleDataReader reader = dbcmd.ExecuteReader ();
       while (reader.Read ()) {
          string employeeName = (string) reader["ename"];
          string job = (string) reader["job"];
          Console.WriteLine ("Employee Name: {0}  Job: {1}",
                            employeeName, job);
       }
       // clean up
       reader.Close ();
       reader = null;
       dbcmd.CommandText = sql;
       dbcmd.ExecuteNonQuery ();
       dbcmd.Dispose ();
       dbcmd = null;
       dbcon.Close ();
       dbcon = null;
    }
 }
```

**C\# Example 2 - Calling Stored Procedure**

``` csharp
 using System;
 using System.Data;
 using System.Data.OracleClient;
 
 public class Test
 {
    public static void Main (string[] args)
    {
       string connectionString =
          "Data Source=testdb;" +
          "User ID=scott;" +
          "Password=tiger;";
       OracleConnection dbcon = null;
       dbcon = new OracleConnection (connectionString);
       dbcon.Open ();
 
       Console.WriteLine("  Drop table MONO_TEST_TABLE2...");
       OracleCommand dbcmd = dbcon.CreateCommand ();
 
       try {
              dbcmd.CommandText = "DROP TABLE MONO_TEST_TABLE2";
              dbcmd.ExecuteNonQuery ();
       }
       catch(OracleException oe1) {
              // ignore if table already exists
       }
 
       Console.WriteLine("  Drop procedure SP_TEST2...");
       try {
              dbcmd.CommandText = "DROP PROCEDURE SP_TEST2";
              dbcmd.ExecuteNonQuery ();
       }
       catch(OracleException oe1) {
              // ignore if table already exists
       }
 
       Console.WriteLine("  Create table MONO_TEST_TABLE2...");
 
       dbcmd.CommandText = "CREATE TABLE MONO_TEST_TABLE2 (" +
              " COL1 VARCHAR2(8), "+
              " COL2 VARCHAR2(32))";
       dbcmd.ExecuteNonQuery ();
 
       Console.WriteLine("  Create stored procedure SP_TEST2...");
       dbcmd.CommandText = 
              "CREATE PROCEDURE SP_TEST2(parm1 VARCHAR2,parm2 VARCHAR2) " +
              " IS " +
              " BEGIN " +
              "      INSERT INTO MONO_TEST_TABLE2 (COL1,COL2) VALUES (parm1,parm2);" +
              "      COMMIT;" +
              " END;";
 
              cmd2.ExecuteNonQuery ();
 
       Console.WriteLine("  COMMIT...");
       dbcmd.CommandText = "COMMIT";
       dbcmd.ExecuteNonQuery ();
 
       Console.WriteLine("  Call stored procedure SP_TEST2 with two parameters...");
       OracleCommand dbcmd = con.CreateCommand ();
       dbcmd.CommandType = CommandType.StoredProcedure;
       dbcmd.CommandText = "sp_test2";
 
       OracleParameter myParameter1 = new OracleParameter("parm1", OracleType.VarChar);
       myParameter1.Value = "myval";
       myParameter1.Size = 8;
       myParameter1.Direction = ParameterDirection.Input;
 
       OracleParameter myParameter2 = new OracleParameter("parm2", OracleType.VarChar);
       myParameter2.Value = "another";
       myParameter2.Size = 32;
       myParameter2.Direction = ParameterDirection.Input;
 
       dbcmd.Parameters.Add (myParameter1);
       dbcmd.Parameters.Add (myParameter2);
 
       dbcmd.ExecuteNonQuery ();
 
       dbcmd.CommandText = sql;
       dbcmd.ExecuteNonQuery ();
       dbcmd.Dispose ();
       dbcmd = null;
       dbcon.Close ();
       dbcon = null;
    }
 }
```

**C\# Example 3 - Executing PL/SQL Block**

Why would I want to do that? Let's say I need to execute a stored procedure, yet there is no support for Boolean data type in OCI. I can do this via a PL/SQL block.

``` csharp
 using System;
 using System.Data;
 using System.Data.OracleClient;
 
 public class Test
 {
    public static void Main (string[] args)
    {
       string connectionString =
          "Data Source=testdb;" +
          "User ID=scott;" +
          "Password=tiger;";
       OracleConnection con = null;
       con = new OracleConnection (connectionString);
       con.Open ();
        OracleCommand cmd = con.CreateCommand();
        Console.WriteLine("  Drop procedure SP_TESTPLSQLBLOCK1...");
        try 
        {
            cmd.CommandText = "DROP PROCEDURE SP_TESTPLSQLBLOCK1";
            cmd.ExecuteNonQuery ();
        }
        catch(OracleException oe1) 
        {
            // ignore if table already exists
        }
 
        Console.WriteLine("  Create stored procedure SP_TESTPLSQLBLOCK1...");
        // stored procedure add two number depending on a boolean
 
        cmd.CommandText = 
            "CREATE OR REPLACE PROCEDURE SP_TESTPLSQLBLOCK1(PARM1 IN NUMBER,PARM2 IN BOOLEAN,PARM3 OUT NUMBER)\n" +
            "IS\n" +
            "BEGIN\n" +
            "   IF PARM2 = TRUE THEN\n" +
            "       PARM3 := PARM1 + 7;\n" +
            "    ELSE\n" +
            "       PARM3 := PARM1 + 13;\n" +
            "   END IF;\n" +
            "END;";
 
        cmd.ExecuteNonQuery ();
 
        Console.WriteLine("  COMMIT...");
        cmd.CommandText = "COMMIT";
        cmd.ExecuteNonQuery ();
 
        Console.WriteLine("  Call stored procedure SP_TESTPLSQLBLOCK1 with 3 parameters...");
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = 
            "DECLARE " +
            "   addnum BOOLEAN := sys.diutil.int_to_bool(:P2); " +
            "BEGIN " +
            "    SP_TESTPLSQLBLOCK1(:P1,addnum,:P3); " +
            "END;";
        OracleParameter myParameter1 = new OracleParameter("P1", OracleType.Number);
        myParameter1.Value = 5;
        myParameter1.Direction = ParameterDirection.Input;
 
        OracleParameter myParameter2 = new OracleParameter("P2", OracleType.Number);
        myParameter2.Value = 1;
        myParameter2.Direction = ParameterDirection.Input;
 
        OracleParameter myParameter3 = new OracleParameter("P3", OracleType.Number);
        myParameter3.Direction = ParameterDirection.Output;
 
        cmd.Parameters.Add (myParameter1);
        cmd.Parameters.Add (myParameter2);
        cmd.Parameters.Add (myParameter3);
 
        cmd.ExecuteNonQuery ();
        decimal d = (decimal) myParameter3.Value;
        Console.WriteLine ("    Out Value should be: 12");
        Console.WriteLine ("    Out Value: {0}", d);
        cmd.Dispose();
        cmd = null;
        con.Close();
        con = null;
    }
 }
```

**C\# Example 4 - ASP.NET DataGrid Data Binding to an Oracle database table**

    First, you will need to make sure there is a table named CUSTOMERS with some data.

``` csharp
 CREATE TABLE CUSTOMERS (
    person varchar2(256) NOT NULL,
    email varchar2(256) NOT NULL
 );
 
 INSERT INTO CUSTOMERS
 (PERSON, EMAIL)
 VALUES('Bob Jones','bjones@nowhere.edu');
 
 INSERT INTO CUSTOMERS
 (PERSON, EMAIL)
 VALUES('John Smith','jswmith@somewhere.com');
 
 COMMIT;
```

``` csharp
<%@ Page Language="C#" %>
<%@ import namespace="System.Data" %>
<%@ import namespace="System.Data.Common" %>
<%@ import namespace="System.Data.SqlTypes" %>
<%@ import namespace="System.Data.OracleClient" %>
<%@ import namespace="System.Reflection" %>
<%@ assembly Name="System.Data.OracleClient" %>
 
<html>
<head>
<title>ASP.NET DataGrid Data Binding to an Oracle database table</title>
 
<!-- Source code modified from samples in xsp was originally made by Gonzalo Paniagua Javier -->
 
<script runat="server">
 
    static Type cncType = null;
 
    void GetConnectionData (out string providerAssembly, 
                               out string cncTypeName, out string cncString)
    {
        providerAssembly = null;
        cncTypeName = null;
        cncString = null;
        NameValueCollection config = 
                       ConfigurationSettings.AppSettings as NameValueCollection;
        if (config != null) {
            foreach (string s in config.Keys) {
                if (0 == String.Compare ("DBProviderAssembly", s, true)) {
                    providerAssembly = config [s];
                } else if (0 == String.Compare ("DBConnectionType", s, true)) {
                    cncTypeName = config [s];
                } else if (0 == String.Compare ("DBConnectionString", s, true)) {
                    cncString = config [s];
                }
            }
        }
 
        if (providerAssembly == null || providerAssembly == "")
            providerAssembly = "System.Data.OracleClient";
 
        if (cncTypeName == null || cncTypeName == "")
            cncTypeName = "System.Data.OracleClient.OracleConnection";
 
        if (cncString == null || cncString == "")
            cncString = "Data Source=TESTDB;User ID=scott;Password=tiger";
    }
 
    IDbConnection cnc;
    void Page_Load (object o, EventArgs e) 
    {
        string connectionTypeName;
        string providerAssemblyName;
        string cncString;
 
        GetConnectionData (out providerAssemblyName, 
                       out connectionTypeName, out cncString);
        if (cncType == null) {     
            Assembly dbAssembly = Assembly.LoadWithPartialName (
                                                      providerAssemblyName);
            cncType = dbAssembly.GetType (connectionTypeName, true);
            if (!typeof (IDbConnection).IsAssignableFrom (cncType))
                throw new ApplicationException (
                                        "The type '" + cncType +
                    "' does not implement IDbConnection.\n" +
                    "Check 'DbConnectionType' in web.config");
        }
 
        cnc = (IDbConnection) Activator.CreateInstance (cncType);
        cnc.ConnectionString = cncString;
 
        cnc.Open ();
 
        OracleCommand cmd = (OracleCommand) cnc.CreateCommand();
        cmd.CommandText = "select * from CUSTOMERS";
        DbDataAdapter adapter = new OracleDataAdapter(cmd);
        DataTable table = new DataTable("CUSTOMERS");
        adapter.Fill(table);
        grid.DataSource = table;
        grid.DataBind ();
 
        cmd.Dispose();
        cmd = null;
        cnc.Close ();
    }
 
    void Page_PreRender (object sender, EventArgs e)
    {
        if (cnc == null)
            return;
    }
 
 </script>
 </head>
 <body>
 <h3>DataGrid sample</h3>
 <form runat="server">
    <asp:datagrid id="grid" border="1" 
        EnableViewState="false" runat="server">
    </asp:datagrid>
 </form>
 </body>
 </html>
```

 **C\# Example 5 - Returning a REF CURSOR from an Oracle stored procedure via an OracleDataReader from an out parameter**

``` csharp
 using System;
 using System.Data;
 using System.Data.OracleClient;
 
 public class Test
 {
    public static void Main (string[] args)
    {
        string connectionString =
          "Data Source=testdb;" +
          "User ID=scott;" +
          "Password=tiger;";
        OracleConnection connection = null;
        connection = new OracleConnection (connectionString);
        connection.Open ();
 
    Console.WriteLine("Setup test package and data...");
    OracleCommand cmddrop = connection.CreateCommand();
 
    cmddrop.CommandText = "DROP TABLE TESTTABLE";
    try { 
        cmddrop.ExecuteNonQuery(); 
    } 
    catch(OracleException e) {
        Console.WriteLine("Ignore this error: " + e.Message); 
    }
    cmddrop.Dispose();
    cmddrop = null;
 
    OracleCommand cmd = connection.CreateCommand();
 
    // create table TESTTABLE
    cmd.CommandText = 
        "create table TESTTABLE (\n" +
        " col1 numeric(18,0),\n" +
        " col2 varchar(32),\n" +
        " col3 date)";
    cmd.ExecuteNonQuery();
 
    // insert some rows into TESTTABLE
    cmd.CommandText = 
        "insert into TESTTABLE\n" +
        "(col1, col2, col3)\n" +
        "values(45, 'Mono', sysdate)";
    cmd.ExecuteNonQuery();
 
    cmd.CommandText = 
        "insert into TESTTABLE\n" +
        "(col1, col2, col3)\n" +
        "values(136, 'Fun', sysdate)";
    cmd.ExecuteNonQuery();
 
    cmd.CommandText = 
        "insert into TESTTABLE\n" +
        "(col1, col2, col3)\n" +
        "values(526, 'System.Data.OracleClient', sysdate)";
    cmd.ExecuteNonQuery();
 
    cmd.CommandText = "commit";
    cmd.ExecuteNonQuery();
 
    // create Oracle package TestTablePkg
    cmd.CommandText = 
        "CREATE OR REPLACE PACKAGE TestTablePkg\n" +
        "AS\n" +
        "    TYPE T_CURSOR IS REF CURSOR;\n" +
        "\n" +
        "    PROCEDURE GetData(tableCursor OUT T_CURSOR);\n" +
        "END TestTablePkg;";
    cmd.ExecuteNonQuery();
 
    // create Oracle package body for package TestTablePkg
    cmd.CommandText = 
        "CREATE OR REPLACE PACKAGE BODY TestTablePkg AS\n" +
        "  PROCEDURE GetData(tableCursor OUT T_CURSOR)\n" + 
                "  IS\n" +
        "  BEGIN\n" +
        "    OPEN tableCursor FOR\n" +
        "    SELECT *\n" +
        "    FROM TestTable;\n" +
        "  END GetData;\n" +
        "END TestTablePkg;";
    cmd.ExecuteNonQuery();
 
    cmd.Dispose();
    cmd = null;
 
    Console.WriteLine("Set up command and parameters to call stored proc...");
    OracleCommand command = new OracleCommand("TestTablePkg.GetData", connection);
    command.CommandType = CommandType.StoredProcedure;
    OracleParameter parameter = new OracleParameter("tableCursor", OracleType.Cursor);
    parameter.Direction = ParameterDirection.Output;
    command.Parameters.Add(parameter);
 
    Console.WriteLine("Execute...");
    command.ExecuteNonQuery();
 
    Console.WriteLine("Get OracleDataReader for cursor output parameter...");
    OracleDataReader reader = (OracleDataReader) parameter.Value;
 
    Console.WriteLine("Read data...");
    int r = 0;
    while (reader.Read()) {
        Console.WriteLine("Row {0}", r);
        for (int f = 0; f < reader.FieldCount; f ++) {
            object val = reader.GetValue(f);
            Console.WriteLine("    Field {0} Value: {1}", f, val);
        }
        r ++;
    }
    Console.WriteLine("Rows retrieved: {0}", r);
 
    Console.WriteLine("Clean up...");
    reader.Close();
    reader = null;
    command.Dispose();
    command = null;
 
        connection.Close();
        connection = null;
    }
 }
```

Building C\# Examples
---------------------

Save the example to a file, such as, TestExample.cs

-   Build with Mono C\# compiler:

<!-- -->

     mcs TestExample.cs /r:System.Data.dll /r:System.Data.OracleClient.dll

-   Running the Example:

<!-- -->

     mono TestExample.exe 

