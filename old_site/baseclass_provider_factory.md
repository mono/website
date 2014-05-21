---
layout: obsolete
title: "BaseClass Provider Factory"
lastmodified: '2006-05-17'
permalink: /old_site/BaseClass_Provider_Factory/
redirect_from:
  - /BaseClass_Provider_Factory/
---

BaseClass Provider Factory
==========================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#generic-database-access">1 Generic Database Access</a></li>
<li><a href="#configuartion-entries">2 Configuartion Entries</a></li>
<li><a href="#sample-code">3 Sample Code</a></li>
<li><a href="#provider-support">4 Provider Support</a></li>
</ul></td>
</tr>
</tbody>
</table>

Generic Database Access
-----------------------

Generic database access provides a way to access the database in a database independant manner. That is, the layer available in the System.Data provides the necessary abstraction to the user so that he can write database component code irrespective of the databases and the user can change the underlying database without affecting the other layers of the system.

In the previous releases, the developer has to explicitly create the database classes specific to the databases. Developers found their own way to abstract these and the new API availble with the latest release gives a way to do that.

The features of this factory implementation are

-   The provider information is stored in configuration files so that the providers can be changed dynamically at runtime.

-   The connection string information is stored in configuration files.

-   The developer can iterate through the available providers.

-   Many of the database independant implemenations are provided by the provider base classes and the provider writers could only implement the database dependant features.

Configuartion Entries
---------------------

The followiing configuration section entries are needed to be added to either machine.config or your application configuration files.

``` xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
    <configSections>
        <section name="connectionStrings"
            type="System.Data.Common.ConnectionStringsSectionHandler, System, Version=2.0, Culture=neutral"/>    
 
        <section name="system.data"
            type="System.Data.Common.DbProviderFactoriesConfigurationHandler, System, Version=2.0, Culture=neutral"/>    
 
    </configSections>
     <system.data>
        <DbProviderFactories>
           <add name="System.Data.SqlClient"         
               invariant="System.Data.SqlClient"         
               support="FF" 
               description="SqlClient Provider Factory"      
               type="System.Data.SqlClient.SqlClientFactory, System.Data, Version=2.0.3600.0, Culture=neutral"/>
           <add name="System.Data.OdbcFactory"         
               invariant="System.Data.OdbcFactory"         
               support="FF" 
               description="Odbc Provider Factory"      
               type="System.Data.Odbc.OdbcFactory, System.Data, Version=2.0.3600.0, Culture=neutral"/>
        </DbProviderFactories>
    </system.data>
    <connectionStrings>
        <add name="MonoTest" providerName="System.Data.SqlClient" 
         connectionString="Data Source=<SERVER>;Initial Catalog=<Database>;User Id=<uid>;Password=<pwd>;" />
        <add name="MonoTestOdbc" providerName="System.Data.OdbcFactory" 
         connectionString="DSN=<ODBC DSN>;UID=<uid>;PWD=<pwd>;" />
    </connectionStrings>
</configuration>
```

Sample Code
-----------

The following sample code shows how to use the provider factories for various model of execution in mono.

``` csharp
//  factory.cs
//       compile with gmcs -r:System.Data.dll factory.cs
//
using System;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.ProviderBase;
 
 
public class MainClass
{
        public static void Main (string [] args)
        {
                ConnectionStringSettings cs = ConfigurationSettings.ConnectionStrings ["MonoTest"];
                string connString = cs.ConnectionString;
                DbProviderFactory factory = DbProviderFactories.GetFactory (cs.ProviderName);
                DbConnection conn = factory.CreateConnection ();
                using (conn){
                        /********************* ExecuteReader  ***************************/
                        conn.ConnectionString = connString;
                        conn.Open ();
                        DbCommand cmd = conn.CreateCommand ();
                        //DbCommand cmd = factory.CreateCommand ();
                        //cmd.Connection = conn;
                        cmd.CommandText = "select * from test";
                        DbDataReader reader = (DbDataReader) cmd.ExecuteReader ();
                        while (reader.Read ()) {
                                Console.WriteLine (reader [0].ToString ());
                        }
                        reader.Close ();
 
                        /********************* ExecuteNonQuery ***************************/
                        conn.ConnectionString = connString;
                        int ret = cmd.ExecuteNonQuery ();
                        Console.WriteLine ("ExecuteNonQuery returned : {0}", ret);
 
                        /********************* ExecuteScalar *****************************/
                        cmd.CommandText = "select COUNT(*) from test;";
                        int count = (int) cmd.ExecuteScalar ();
                        Console.WriteLine ("ExecuteScalar returned : {0}", count);
 
                        /********************* Query with parameters ********************/
                        cmd.CommandText = "select * from test where pk_tint > ?";
                        DbParameter param = factory.CreateParameter ();
                        param.ParameterName = "id";
                        param.DbType = DbType.Int32;
                        param.Value = 3;
                        cmd.Parameters.Add (param);
 
                        reader = (DbDataReader) cmd.ExecuteReader ();
 
                        while (reader.Read ()) {
                                Console.WriteLine (reader [0].ToString ());
                        }
                        reader.Close ();
                        conn.Close ();
                }
 
        }
 
}
```

Provider Support
----------------

Currently, following providers can be accessed through this factory model.

-   System.Data.SqlClient
-   System.Data.Odbc


