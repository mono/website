---
layout: obsolete
title: "Provider Factory"
lastmodified: '2006-09-23'
permalink: /old_site/Provider_Factory/
redirect_from:
  - /Provider_Factory/
---

Provider Factory
================

The assembly Mono.Data.dll has classes for a Provider Factory and Data Tools for Mono ADO.NET. This gives us a foundation for abstract data provider access within Mono.

Sure ADO.NET 2.0 has this functionality, but Mono.Data provides some of this ability for .net 1.0, .net 1.1, .net 2.0, mono 1.0, and mono 1.1. Also, many of the ADO.NET 2.0 features still need to be implemented in Mono and the providers may not have these ADO.NET 2.0 features implemented.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#here-are-the-details">1 Here are the details:</a></li>
<li><a href="#overview-of-the-providerfactory-object-model">2 Overview of the ProviderFactory object model:</a></li>
<li><a href="#c-source-code-samples-for-creating-a-connection">3 C# source code samples for creating a connection:</a></li>
<li><a href="#recent-additions-to-monodata">4 Recent Additions to Mono.Data</a></li>
<li><a href="#about-configuration-files">5 About Configuration Files</a></li>
</ul></td>
</tr>
</tbody>
</table>

Here are the details:
---------------------

-   The Provider information is seperate from the connection string information. This allows the list of providers to be stored in the machine.config file.

-   Provider and ProviderCollection objects are available to access the list of providers and modify them at runtime.

-   The ProviderFactory object is used to create new connections, commands, dataadapters, parameters, etc.

Overview of the ProviderFactory object model:
---------------------------------------------

-   **ProviderFactory**: used to create new Connections, Commands, DataAdapters, or Commands. All objects are returned using the provider interfaces such as IDbConnection, IDbCommand, IDbDataAdapter, or IDataParamter

-   **DataTools**: static methods for doing common tasks like filling a DataSet with the contents of a select statement.

-   **ProviderCollection**: list of providers configured in the system. Initially loaded from app.config, but can be modified at run-time.

-   **Provider**: represents a given provider (factory) and holds information needed to create the types.

-   **ProviderSectionHandler**: works behind the scenes to load the list of providers from the app.config into a ProviderCollection.

C\# source code samples for creating a connection:
--------------------------------------------------

     // Create connection using enhanced connection string
     // The factory attribute specifies which provider
     // to use. The factory attribute is parsed out, the
     // object is created, and then the rest of the
     // connection string is passed into the provider. The
     // providers are defined in
     // the app.config (or machine.config).
     IDbConnection conn;
     string connectionString =
        "factory=System.Data.SqlClient;" +
        "server=speedy;database=pubs;uid=sa";
     conn = ProviderFactory.CreateConnection(connectionString);

     // Create connection specifying provider
     // and standard connection string
     IDbConnection conn;
     string provider = "System.Data.SqlClient";
     string connectionString = "server=speedy;database=pubs;uid=sa";
     conn = ProviderFactory.CreateConnection(provider,connectionString);

     // Create connection using connection string stored
     // in app.config under <appSettings>
     IDbConnection conn;
     string appSetting = "PubsConnStr";
     conn = ProviderFactory.CreateConnectionFromConfig(appSetting);

C\# Sample for Creating a DataAdapter and filling a DataSet.

    // Create Connection
    IDbConnection conn =
    ProviderFactory.CreateConnectionFromConfig("PubsConnStr");

    // Select command
    IDbCommand cmd=conn.CreateCommand();
    cmd.Text="select * from author";

    // Data Adapter
    DataSet ds=new DataSet();
    IDbDataAdapter adapter=ProviderFactory.CreateDataAdapter(cmd);
    adapter.Fill(ds, "Table1");

Here's some sample code on displaying a list

of configured ADO.NET providers:

    Console.WriteLine("Configured Providers:");
    foreach (Provider p in ProviderFactory.Providers)
        Console.WriteLine(p.Description);

A Super lazy overload to the FillDataSet method (in DataTools.cs) that will fill a dataset in one line of code.

     DataSet ds=DataTools.FillDataSet("PubsConnStr", "select * from authors"); 

 Example of using CreateCommandBuilder

    string providerName = "System.Data.SqlClient";
    string connectionString = "server=localhost;database=pubs;uid=sa";
    Provider provider = ProviderFactory.Providers[providerName];
    IDbConnection conn;
    conn = Provider.CreateConnection();
    conn.Open();
    IDbCommand cmd;
    IDbTransaction trans = conn.BeginTransaction();
    cmd = new con.CreateCommand();
    cmd.CommandText = "SELECT * FROM sometable";
    cmd.Transaction = trans;
    IDbDataAdapter adapter = new CreateDataAdapter();
    adapter.SelectCommand = cmd;
    provider.CreateCommandBuilder(adapter);
    // CreateCommandBuilder looks for commandbuilder in app.config file
    DataSet ds = new DataSet();
    adapter.Fill(ds);
    DataRow row = ds.Tables[0].NewRow();
    row[0] = "test";
    row[1] = 123;
    ds.Tables[0].Rows.Add(row);
    adapter.Update(ds);
    conn.Commit();

Recent Additions to Mono.Data
-----------------------------

      These additions will appear in the next release of Mono (maybe 1.1.14?)
      
      Exceptions are thrown for missing arguments.

      Warning message is displayed in the console if there 
      are no providers defined in your app.config file.

      Property ParameterPrefix in Provider: allows you to
      figure out what parameter prefix to use when adding parameters.
      What is defined for parameterfix in the app.config file will show up 
      as a character using the property ParameterPrefix.
      
      at will be @ for a prefix for a named parameter

      colon will be : for a prefix for a named parameter

      questionmark will be ? for a positional parameter

      GetCommandBuilder() will allow you to create 
      a CommandBuilder add set an IDbAdapter to it.  
      It uses the commandbuilder attribute from the app.config file

About Configuration Files
-------------------------

Information about [app.config](http://msdn.microsoft.com/library/en-us/vbcon/html/vboriintroductiontoapplicationsettingstorage.asp?frame=true) files can be found at [MSDN](http://msdn.microsoft.com/). See the mcs/class/Mono.Data/app.config for sample configuration file in the mcs source. Basically, if your application is named blah.exe, you would create an app.config file named blah.exe.config Here's a sample app.config file showing the provider declarations along with sample connection strings:

``` xml
<?xml version="1.0" encoding="utf-8" ?>
<configuration>
    <configSections>
        <sectionGroup name="mono.data">
            <section name="providers" type="Mono.Data.ProviderSectionHandler,Mono.Data" />
        </sectionGroup>
    </configSections>
    <appSettings>
        <add key="PubsConnStr" value="factory=System.Data.SqlClient;server=localhost;database=pubs;uid=sa;pwd=mypassword" />
        <add key="OraConnStr" value="factory=System.Data.OracleClient;data source=testdb;user id=scott;password=tiger" />
        <add key="PgConnStr" value="factory=Npgsql;Server=localhost;Database=monotest;User ID=monotest;Password=monotest" />
        <add key="MySqlByteFXConnStr" value="factory=ByteFX.Data.MySqlClient;Database=test" />
        <add key="FireConnStr" value="factory=FirebirdSql.Data.Firebird;Database=C:\FIREBIRD\EXAMPLES\EMPLOYEE.FDB;User=SYSDBA;Password=masterkey;Dialect=3;Server=localhost" />
        <add key="Sqlite2ConnStr" value="factory=Mono.Data.SqliteClient;URI=file:sqlitetest2.db" />
        <add key="Sqlite3ConnStr" value="factory=Mono.Data.SqliteClient;URI=file:sqlitetest3.db,Version=3" />
        <add key="SybaseConnStr" value="factory=Mono.Data.SybaseClient;Server=MYSERVER,5000;Database=testdb;User ID=sa;Password=;" />
        <add key="MySqlConnStr" value="factory=MySql.Data;server=localhost;user id=user;password=pass;database=mysql;pooling=false" />       
    </appSettings>
    <mono.data>
        <providers>
            <provider 
              name="System.Data.SqlClient" 
              connection="System.Data.SqlClient.SqlConnection" 
              adapter="System.Data.SqlClient.SqlDataAdapter" 
              command="System.Data.SqlClient.SqlCommand" 
              assembly="System.Data, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
              description="Microsoft SQL Server 7.0/2000/2005"
              parameterprefix="at"
              commandbuilder="System.Data.SqlClient.SqlCommandBulder" />
            <provider 
              name="System.Data.OleDb" 
              connection="System.Data.OleDb.OleDbConnection" 
              adapter="System.Data.OleDb.OleDbDataAdapter" 
              command="System.Data.OleDb.OleDbCommand" 
              assembly="System.Data, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
              description="OLE DB" />
            <provider 
              name="System.Data.Odbc" 
              connection="System.Data.Odbc.OdbcConnection" 
              adapter="System.Data.Odbc.OdbcDataAdapter" 
              command="System.Data.Odbc.OdbcCommand" 
              assembly="System.Data, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
              description="ODBC" />
            <provider 
              name="System.Data.OracleClient" 
              connection="System.Data.OracleClient.OracleConnection" 
              adapter="System.Data.OracleClient.OracleDataAdapter" 
              command="System.Data.OracleClient.OracleCommand" 
              assembly="System.Data.OracleClient, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
              description="Oracle"
  parameterprefix="colon"
  commandbuilder="System.Data.OracleClient.OracleCommandBuilder" />
            <provider 
              name="ByteFX.Data.MySqlClient" 
              connection="ByteFX.Data.MySqlClient.MySqlConnection" 
              adapter="ByteFX.Data.MySqlClient.MySqlDataAdapter" 
              command="ByteFX.Data.MySqlClient.MySqlCommand"
              assembly="ByteFX.Data, Version=0.7.6.1, Culture=neutral, PublicKeyToken=0738eb9f132ed756"
              description="MySQL (ByteFX)" />
            <provider 
              name="Npgsql" 
              connection="Npgsql.NpgsqlConnection" 
              adapter="Npgsql.NpgsqlDataAdapter" 
              command="Npgsql.NpgsqlCommand" 
              assembly="Npgsql, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=5d8b90d52f46fda7"
              description="PostgreSQL" />
            <provider 
              name="Mono.Data.SqliteClient" 
              connection="Mono.Data.SqliteClient.SqliteConnection" 
              adapter="Mono.Data.SqliteClient.SqliteDataAdapter" 
              command="Mono.Data.SqliteClient.SqliteCommand" 
              assembly="Mono.Data.SqliteClient, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=0738eb9f132ed756"
              description="SQL Lite" />
            <provider 
              name="Mono.Data.SybaseClient" 
              connection="Mono.Data.SybaseClient.SybaseConnection" 
              adapter="Mono.Data.SybaseClient.SybaseDataAdapter" 
              command="Mono.Data.SybaseClient.SybaseCommand" 
              assembly="Mono.Data.SybaseClient, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=0738eb9f132ed756"
              description="Sybase" />
            <provider 
              name="FirebirdSql.Data.Firebird" 
              connection="FirebirdSql.Data.Firebird.FbConnection" 
              adapter="FirebirdSql.Data.Firebird.FbDataAdapter" 
              command="FirebirdSql.Data.Firebird.FbCommand" 
              assembly="FirebirdSql.Data.Firebird, Version=1.6.3.0, Culture=neutral, PublicKeyToken=e1b4f92304d7b12f"
              description="Firebird" />
            <provider 
              name="IBM.Data.DB2" 
              connection="IBM.Data.DB2.DB2Connection" 
              adapter="IBM.Data.DB2.DB2DataAdapter" 
              command="IBM.Data.DB2.DB2Command" 
              assembly="IBM.Data.DB2, Version=1.0.1728.9997, Culture=neutral, PublicKeyToken=7c307b91aa13d208"
              description="IBM DB2 Universal Database" />
            <provider 
              name="MySql.Data" 
              connection="MySql.Data.MySqlClient.MySqlConnection" 
              adapter="MySql.Data.MySqlClient.MySqlDataAdapter" 
              command="MySql.Data.MySqlClient.MySqlCommand"
              assembly="MySql.Data, Version=1.0.7.30073, Culture=neutral, PublicKeyToken=8e323390df8d9ed4"
              description="MySQL (MySQL AB)" />                     
        </providers>
    </mono.data>
</configuration>
```

