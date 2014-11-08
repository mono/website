---
title: Porting ASP.NET Applications
redirect_from:
  - /Guide:_Porting_ASP.NET_Applications/
---

by Marek Habersack

This guide is meant to help Linux and Windows developers alike in porting ASP.NET 2.0 applications from Windows to Unix operating systems.

Introduction
------------

By their nature, Web applications tend to be more portable to other platforms than traditional desktop applications. The interaction with the user is done through the web browser the user is running, which in most cases, guarantees interface portability nearly without effort. There exist incompatibilities in the DOM (Document Object Model), JavaScript, CSS and HTML implementations in the web browsers, but for the sake of this guide we will assume that all the browsers work in the same way in this regard.

In this guide we will focus on issues arising from differences between the Unix and Windows platforms, as well as between the database systems (RDBMS) in common use by developers on each of the platforms.

In this guide I will demonstrate the porting process based on the **Blog Starter Kit** application (you can download the original C# source from [http://www.shankun.com/BlogStarterKit.aspx](http://www.shankun.com/BlogStarterKit.aspx)):

[![BlogStarterKit StartPage.png](/archived/images/8/83/BlogStarterKit_StartPage.png)](/archived/images/8/83/BlogStarterKit_StartPage.png)

Getting started
---------------

No assumptions as to the experience level of the developer porting an ASP.NET application are made throughout the guide. The information presented here should be useful both to a Windows developer and a Unix developer porting the application to run on a Unix platform.

> **Windows developers**. If you are a working in the Windows environment, it is advised that you download the [VMWare Virtual Image](/download/) to have it handy when you get to the testing phase of your porting effort. The VMware virtual machine comes with the latest release of Mono preinstalled.

If your application uses MS SQL then on your Unix system you will need to install the [PostgreSQL](http://postgresql.org/) RDBMS, as this is the product which will be used to port MS SQL databases to. It is recommended that you use PostgreSQL 8.0 or newer.

### Prerequisite software

-   Npgsql version from [CVS](http://pgfoundry.org/scm/?group_id=1000140).
    The CVS version is required, since the ASP.NET 2.0 Membership classes rely on the DbProviderFactories model which is not available in Npgsql shipped with Mono.
-   ASP.NET PostgreSQL Membership/Role providers. I recommend the version from [Nauck, It](http://dev.nauck-it.de/projects/show/aspsqlprovider), which is the code I use in all the ported starter kits. Make sure that you use the version of the above provider from the [Mono branch](https://github.com/dnauck/AspSQLProvider/tree/mono) as it contains changes necessary for the provider to work correctly with the CVS version of Npgsql.
-   [PostgreSQL 8.2](http://www.postgresql.org/ftp/binary/v8.2.4/)

Porting the code
----------------

When initially testing the application on Unix, you might choose not to deal with case-sensitivity issues described below, but instead use the MONO_IOMAP approach. By using the MONO_IOMAP feature, you can ignore the differences between the Windows file system (case insensitive, and uses \\ as a path separator) and the Unix file system (case sensitive, and uses / as the path separator).

Required assemblies
-------------------

Put the Npgsql and PostgreSQL providers assemblies in the `bin/` subdirectory of your application.

### Configuration files

#### DbProviderFactory configuration

As we're using Npgsql from CVS, which is not configured for use with ADO.NET 2.0 in Mono by default, we need to add the section shown below to the `Web.config` file:

``` xml
<system.data>
 <DbProviderFactories>
  <add name="Npgsql2 Data Provider"
       invariant="Npgsql2"
       description=".Net Framework Data Provider for PostgreSQL"
       type="Npgsql.NpgsqlFactory, Npgsql2, Version=1.0.0.0, Culture=neutral, PublicKeyToken=5d8b90d52f46fda7" />
 </DbProviderFactories>
</system.data>
```

Remember the *Npgsql* invariant name, as it will be used below.

#### Npgsql and \~/App_Code

Make sure that Npgsql is included in the set of assemblies to link with code compiled from `~/App_Code` and/or generated from your ASP.NET files by adding the following fragment to your `Web.config` file:

``` xml
<system.web>
 <compilation>
  <assemblies>
   <add assembly="Npgsql2, Version=1.0.0.0, Culture=neutral, PublicKeyToken=5d8b90d52f46fda7"/>
  </assemblies>
 </compilation>
</system.web>
```

#### Connection string

Change the connection string to point to your PostgreSQL server and database. The code below shows the string for the Blog Starter Kit database named `blogstarterkit`, user login `test`, password `test`:

``` xml
<connectionStrings>
 <add name="Blog"
      connectionString="SERVER=localhost;Database=blogstarterkit;User name=test;Password=test"
      providerName="Npgsql2"/> <!-- provider invariant name, configured above -->
</connectionStrings>
```

#### Membership/Roles provider configuration

The Membership/Roles provider requires a few changes to the application configuration. The XML below shows the relevant segment of the `<system.web>` section for the **Blog Starter Kit**:

``` xml
<roleManager enabled="true">
 <providers>
  <clear/>
   <add name="AspNetSqlRoleProvider"
        connectionStringName="Blog" applicationName="/"
        type="NauckIT.PostgreSQLProvider.PgRoleProvider, PostgreSQLProviders, Version=1.0.2698.20744, Culture=neutral, PublicKeyToken=e35c7087b53d61d1"/>
 </providers>
</roleManager>
 
<membership defaultProvider="AspNetSqlMembershipProvider">
 <providers>
  <clear/>
   <add name="AspNetSqlMembershipProvider"
        type="NauckIT.PostgreSQLProvider.PgMembershipProvider, PostgreSQLProviders, Version=1.0.2698.20744, Culture=neutral, PublicKeyToken=e35c7087b53d61d1"
        connectionStringName="Blog"
        enablePasswordRetrieval="false"
        enablePasswordReset="true"
        requiresQuestionAndAnswer="true"
        applicationName="/"
        requiresUniqueEmail="true"
        passwordFormat="Hashed"
        maxInvalidPasswordAttempts="5"
        minRequiredPasswordLength="7"
        minRequiredNonalphanumericCharacters="1"
        passwordAttemptWindow="10"
        passwordStrengthRegularExpression=""/>
 </providers>
</membership>
```

A point to note above is that we're clearing the list of providers. This is done because we're overriding the standard `ASP.NET` provider name string, to minimize the set of changes required to port the application.

#### Filesystem paths

Avoid specifying paths to files in the .config files. If you can't avoid them, either provide a separate version for every supported platform with appropriate paths, or provider commented-out versions in a single .config file.

Another option is to use application relative URIs of the form:

    ~/App_Data/MyFile.dat

Alternatively, you can provide the setting versions with different names, auto-detect the platform on the runtime and choose the appropriate setting (make sure you use proper file/directory name case in the Unix version of the setting):

``` xml
<?xml version="1.0"?>
<configuration xmlns="http://schemas.microsoft.com/.NetConfiguration/v2.0">
  <appSettings>
     <add key="Windows_KeyFile" value="c:\keys\file.key"/>
     <add key="Unix_KeyFile" value="/etc/keys/file.key"/>
  </appSettings>
</configuration>
```

The runtime detection code could look like this:

``` csharp
using System;
using System.Configuration;
 
class MyClass
{
   string PlatformName {
      get {
         switch (Environment.OSVersion.Platform) {
           case PlatformID.Unix:
             return "Unix";
 
           default:
             return "Windows";
         }
      }
   }
 
   public string GetKeyFilePath ()
   {
      return ConfigurationManager.AppSettings[String.Format ("{0}_KeyFile", PlatformName)];
   }
}
```

#### machineKey storage

Currently (as of June 2007) no Mono version supports persisting of the auto-generated machineKey values. For that reason, if you want your user sessions/logins to survive application restarts, you need to put the key values explicitly in the application top-level Web.config file.

Very useful utilities to generate the machineKey section can be found [here](http://www.leastprivilege.com/MSDNUSWebCastAuthenticationAndAuthorizationWithASPNET20.aspx) and [here](http://aspnetresources.com/tools/keycreator.aspx)

A sample `<machineKey>` element to put in the `<system.web>` section:

``` xml
<machineKey validationKey="66FF84B434578C6C442D8A5E5183CBD33C02E95FF918A1BF94809AA01081D508BBDD91EBC8D7F0AE47CF3B621516C875B95CBE9051FA7C8D1C9AA09B08CC816A"
decryptionKey="354A893316E7BD02297E07BD2C0E1310D6F0C40F651335C7" validation="SHA1" />
```

Make sure that you **generate your own set of keys** for your site security.

#### File access permissions

Make sure your files which contain sensitive information are owned by a trusted user and have safe file permissions:

    chmod 600 ''FILE_NAME''

Note that the `Web.config` files should be owned by the user under which the webserver (XSP or Apache) runs.

### Markup

#### URL case

All the markup elements that refer to resources external to a file they are in should use proper case - matching the file/directory name on disk. Mirosoft Windows and IIS are case-insensitive in that respect whereas Unix systems and webservers are not. It might be a good idea to make all the web-accessible file names all lower case.

### Code-Behind

#### Filesystem path syntax

This section is based on [Porting Winforms Applications](/docs/gui/winforms/porting-winforms-applications/#the-path-separator)**

The issue you should pay great attention to is the platform-specific filesystem paths. Windows systems use a backslash (`"\"`) as path separator, while Unix systems use the forward slash (`"/"`) for the same purpose.

There are two ways of dealing with the issue:

**System.IO.Path.DirectorySeparatorChar**

``` csharp
public string LoadDataFile (string filename)
{
  string path = String.Format ("{0}{1}DataFiles{1}{2}", HttpRuntime.AppDomainAppPath, Path.DirectorySeparatorChar,
filename);
  if (File.Exists (path))
     return File.ReadAllText (path);
  else
     return String.Empty;
}
```

**System.IO.Path.Combine**

``` csharp
public string LoadDataFile (string filename)
{
  string path = Path.Combine (HttpRuntime.AppDomainAppPath, "DataFiles");
  string file = Path.Combine (path, filename);
  if (File.Exists (path))
     return File.ReadAllText (path);
  else
     return String.Empty;
}
```

#### File name case

Make sure that names of files you access from within your code-behind files are in proper case. Remember - Unix systems are case-sensitive.

Porting the data
----------------

It is assumed that your application uses MS SQL and you are porting the database to PostgreSQL.

### MDF files

MS SQL/SQLExpress allow the developer to attach to a database stored in a file (usually located in the `~/App_Data/` directory). This feature is not available with PostgreSQL so all your data must live in a database stored on the machine where the RDBMS runs.

### Npgsql data provider

At the time of this writing (June 2007), you will need to use the [CVS](http://pgfoundry.org/scm/?group_id=1000140) version of the [Npgsql](http://npgsql.projects.postgresql.org/) data provider, as the one shipped with Mono does not support ADO.NET 2.0.

#### Membership/Roles/Profile provider schema

The providers require specific database schema to be present in your database. Make sure you execute the script below in the context on your database before using the **Blog Starter Kit** for the first time:

    CREATE TABLE Users (
     pId                                     character(36)           NOT NULL,
     Username                                character varying(255)  NOT NULL,
     ApplicationName                         character varying(255)  NOT NULL,
     Email                                   character varying(128)  NOT NULL,
     Comment                                 character varying(128)  NULL,
     Password                                character varying(255)  NOT NULL,
     PasswordQuestion                        character varying(255)  NULL,
     PasswordAnswer                          character varying(255)  NULL,
     IsApproved                              boolean                 NULL,
     LastActivityDate                        timestamptz             NULL,
     LastLoginDate                           timestamptz             NULL,
     LastPasswordChangedDate                 timestamptz             NULL,
     CreationDate                            timestamptz             NULL,
     IsOnLine                                boolean                 NULL,
     IsLockedOut                             boolean                 NULL,
     LastLockedOutDate                       timestamptz             NULL,
     FailedPasswordAttemptCount              integer                 NULL,
     FailedPasswordAttemptWindowStart        timestamptz             NULL,
     FailedPasswordAnswerAttemptCount        integer                 NULL,
     FailedPasswordAnswerAttemptWindowStart  timestamptz             NULL,
     CONSTRAINT users_pkey PRIMARY KEY (pId),
     CONSTRAINT users_username_application_unique UNIQUE (Username, ApplicationName)
    );

    CREATE INDEX users_email_index ON Users (Email);
    CREATE INDEX users_islockedout_index ON Users (IsLockedOut);

    CREATE TABLE Roles (
     Rolename                                character varying(255)  NOT NULL,
     ApplicationName                         character varying(255)  NOT NULL,
     CONSTRAINT roles_pkey PRIMARY KEY (Rolename, ApplicationName)
    );

    CREATE TABLE UsersInRoles (
     Username                                character varying(255)  NOT NULL,
     Rolename                                character varying(255)  NOT NULL,
     ApplicationName                         character varying(255)  NOT NULL,
     CONSTRAINT usersinroles_pkey PRIMARY KEY (Username, Rolename, ApplicationName),
     CONSTRAINT usersinroles_username_fkey FOREIGN KEY (Username, ApplicationName) REFERENCES Users (Username, ApplicationName) ON DELETE CASCADE,
     CONSTRAINT usersinroles_rolename_fkey FOREIGN KEY (Rolename, ApplicationName) REFERENCES Roles (Rolename, ApplicationName) ON DELETE CASCADE
    );

    CREATE TABLE Profiles (
     pId                                     character(36)           NOT NULL,
     Username                                character varying(255)  NOT NULL,
     ApplicationName                         character varying(255)  NOT NULL,
     IsAnonymous                             boolean                 NULL,
     LastActivityDate                        timestamptz             NULL,
     LastUpdatedDate                         timestamptz             NULL,
     CONSTRAINT profiles_pkey PRIMARY KEY (pId),
     CONSTRAINT profiles_username_application_unique UNIQUE (Username, ApplicationName),
     CONSTRAINT profiles_username_fkey FOREIGN KEY (Username, ApplicationName) REFERENCES Users (Username, ApplicationName) ON DELETE CASCADE
    );

    CREATE INDEX profiles_isanonymous_index ON Profiles (IsAnonymous);

    CREATE TABLE ProfileData (
     pId                                     character(36)           NOT NULL,
     Profile                                 character(36)           NOT NULL,
     Name                                    character varying(255)  NOT NULL,
     ValueString                             text                    NULL,
     ValueBinary                             bytea                   NULL,
     CONSTRAINT profiledata_pkey PRIMARY KEY (pId),
     CONSTRAINT profiledata_profile_name_unique UNIQUE (Profile, Name),
     CONSTRAINT profiledata_profile_fkey FOREIGN KEY (Profile) REFERENCES Profiles (pId) ON DELETE CASCADE
    );

### Source code

Make sure that any queries issued directly from your source code use the correct syntax for PostgreSQL (modify them as described [below](#annotated-files)).

Remember to modify your [connection strings](#connection-string) to use Npgsql format.

#### Data provider changes

Search and replace all the instances of SqlClient data access classes with their Npgsql counterparts. The code samples below come from Blog Starter Kit's `~/App_Code/Utilities/SqlDatabase.cs`

-   Make sure your code uses Npgsql.

Original code:

``` csharp
using System.Data.SqlClient;
```

Ported code:

``` csharp
using Npgsql;
using NpgsqlTypes;
```

-   Use Npgsql versions of the database access classes.

Original code:

``` csharp
SqlConnection connection = CreateConnection();
SqlCommand command = CreateCommand(connection, query, parameters);
SqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);
```

Ported code:

``` csharp
NpgsqlConnection connection = CreateConnection();
NpgsqlCommand command = CreateCommand(connection, query, parameters);
NpgsqlDataReader reader = command.ExecuteReader(CommandBehavior.CloseConnection);
```

-   Modify command parameters to use syntax understood by Npgsql by replacing the `@` marker character with `:`

Original code:

``` csharp
sb.AppendFormat("({0} = @{0})", fieldValues[i]);
parameters.Add("@" + fieldValues[i]);
```

Ported code:

``` csharp
sb.AppendFormat("({0} = :{0})", fieldValues[i]);
parameters.Add(":" + fieldValues[i]);
```

-   If you encounter references to **@@IDENTITY** in the queries made by your application, replace them with a call to the **lastval()** function.

Original code:

``` csharp
sb.Append("); SELECT @@IDENTITY");
```

Ported code:

``` csharp
sb.Append("); SELECT lastval()");
```

### XSD files

XSD files define in a, theoretically, database provider independent fashion the structure of the database. The files can be placed in the `~/App_Code/` directory for automatic conversion into compilable code, or they can be processed from the command line with the XSD utility to produce compilable source code which contains type-safe DataSets for each table defined in the `.xsd` file:

    xsd ''InputFile.xsd'' /d

The resulting `.cs` (or `.vb` if you chose VisualBasic for the output) file can be put in `~/App_Code/` to be automatically compiled at the application startup.

#### Annotated files

Mono version of the `xsd` utility supports the standard contents of the `.xsd` files and generates correct code for it. However, if the input file contains a section which looks as follows, the generated code will **not** be as expected by your application:

``` xml
<xs:annotation>
    <xs:appinfo source="urn:schemas-microsoft-com:xml-msdatasource">
    ...
    </xs:appinfo>
</xs:annotation>
```

If this is the case with your file(s), you should generate the code using the Microsoft version of the `xsd` utility, put the generated code in `~/App_Code` and remove (or rename) the corresponding `.xsd` file(s) so that their extension is different.

#### Modifying annotated files

Before processing the `.xsd` file on Windows you need to edit it to make sure the generated code is compatible with Npgsql. There are two sets of changes that need to be made in order to achieve the goal:

1.  Make sure the provider mentioned in the file is Npgsql
    To do so, locate the `<Connections>` section within the `<xs:appinfo>` element and modify each `<Connection>` element's `Provider` attribute to say **Npgsql**
2.  Edit the queries and parameters as described [below](#editing-queries)

#### Editing queries

The annotation section of the `.xsd` file may contain elements shown below:

``` xml
<!-- attributes omitted for brevity -->
<DbSource>
 <DeleteCommand>
  <DbCommand CommandType="Text" ModifiedByUser="False">
   <CommandText>DELETE FROM [dbo.MemberInfo] WHERE (([memberid] = @Original_memberid))</CommandText>
   <Parameters>
    <Parameter AllowDbNull="False" AutogeneratedName="" DataSourceName=""
               DbType="Guid" Direction="Input" ParameterName="@Original_memberid"
               Precision="0" ProviderType="UniqueIdentifier" Scale="0"
               Size="0" SourceColumn="memberid"
               SourceColumnNullMapping="False" SourceVersion="Original">
    </Parameter>
   </Parameters>
  </DbCommand>
 </DeleteCommand>
 <InsertCommand>
   <!-- contents similar to shown above -->
 </InsertCommand>
 <SelectCommand>
   <!-- contents similar to shown above -->
 </SelectCommand>
 <UpdateCommand>
   <!-- contents similar to shown above -->
 </UpdateCommand>
</DbSource>
```

With the sample section shown above, you need to make several changes in order for the generated code to work properly with Npgsql:

-   Make sure the DbType value is a valid type in Npgsql
-   Change the `ParameterName` by replacing the **`@`** character with **`:`** which is the standard parameter quoting character for Npgsql. Also any ocurrence of the parameter name in the query text needs to be modified in the same way.
-   Remove all **`[`** and **`]`** characters from the query text.
-   Make sure the query is syntactically correct for PostgreSQL (refer to PostgreSQL documentation at [[1]](http://www.postgresql.org/docs/))

### SQL syntax differences

Information below is based on [this document](http://www.postgresql.org/docs/techdocs.27)

The information below is only an excerpt from the document referenced above containing the most commonly occurring issues. It is advised that you read the above document in addition to this guide.

1.  Remove all the **[** and **]** characters from the table definitions and/or queries
2.  Remove all the `dbo.` owner prefixes
3.  Remove all the file group keywords (**ON PRIMARY**, **TEXTIMAGE_ON**, **CLUSTERED**
4.  Remove all occurrences of **SET ANSI_NULLS** and **SET QUOTED_IDENTIFIERS**
5.  Remove all occurrences of **WITH NOCHECK**
6.  Replace all instances of the **GO** keyword with semicolons (**;**)

### SQL type mapping

Information below is based on [this document](http://www.postgresql.org/docs/techdocs.27)

The information below is only an excerpt from the document referenced above containing the most commonly occurring issues. It is advised that you read the above document in addition to this guide.

**nvarchar** 

replace with **varchar**

**ntext** 

replace with **text**

**datetime** and **smalldatetime** 

replace with **timestamptz**

**bit** 

can be replaced with either of **boolean**, **int2** or **smallint**. The difference is in the syntax when referring to the field's value in the queries (**boolean** accepts '0', '1', TRUE, FALSE, while the two integer fields accept only 0 and 1)

**image** 

replace with **bytea**

**decimal** 

even though PostgreSQL supports this type, it is deprecated in favor of **numeric**

**tinyint** 

replace with **smallint**

**UniqueIdentifier** 

replace with **text** in the SQL definition and **String** in the `.xsd` file. Typically, the ASP.NET apps will use this type to store the value of a Guid. If it is so in your case, make sure any and all code in your application that passes a value of type Guid to a method, first converts this value to a string (using the `.ToString()` method called on the Guid object). If your application does not use the field to store Guid values, you can replace the type with **bigint**. Also, see the document referenced at the start of this section for more information about the type.

**int IDENTITY(1,1) : replace with**serial**(or**bigserial**if you expect to have a very large number of rows)**

### Stored procedures

Porting the stored procedures is the most time consuming and the most difficult task in the process of moving to PostgreSQL. First of all, you must make sure that your target database has the `PL/pgsql` language created. You must issue the command below as a PostgreSQL superuser:

    CREATE LANGUAGE plpgsql;

PL/pgsql is the most similar to the MS SQL stored procedure language, so in theory it should be the easiest way to port the database. In practice, if you're more familiar with Perl, Tcl, Python or C, you can write your procedures from scratch in any of those languages (making sure to previously create the language in the database in the way shown above).

Before you start porting, please read [http://www.postgresql.org/docs/8.2/interactive/plpgsql.html](http://www.postgresql.org/docs/8.2/interactive/plpgsql.html)

Steps to port the stored procedures:

1.  Replace all the **CREATE PROCEDURE** statements with **CREATE FUNCTION**. PostgreSQL functions need to have return types, so if you want to return no value, you need to define the procedure as follows:

        CREATE FUNCTION foo () RETURNS void AS $$
        BEGIN
        ...
        END
        $$ language 'plpgsql'

#### Tips for porting

-   Contrary to what the document quoted at the top of the section says, PostgreSQL 8.1 and newer stored procedures do support output parameters.
-   Default values for parameters are not supported. If you want to emulate them, overload the procedure:

        CREATE FUNCTION Foo () RETURNS SETOF FooTable AS $$
        DECLARE
                r RECORD;
        BEGIN
                FOR r IN SELECT * FROM Foo (1, 10) LOOP
                    RETURN NEXT r;
                END LOOP;
                RETURN;
        END;
        $$ LANGUAGE plpgsql;

        CREATE FUNCTION Foo (ppageNum int) RETURNS SETOF FooTable AS $$
        DECLARE
                r RECORD;
        BEGIN
                FOR r IN SELECT * FROM Foo (ppageNum, 10) LOOP
                    RETURN NEXT r;
                END LOOP;
                RETURN;
        END;
        $$ LANGUAGE plpgsql;

        CREATE FUNCTION Foo (ppageNum int, ppageSize int) RETURNS SETOF FooTable AS $$
        DECLARE
               r RECORD;
        BEGIN
                FOR r IN SELECT * FROM FooTable LOOP
                    RETURN NEXT r;
                END LOOP;
                RETURN;
        END;
        $$ LANGUAGE plpgsql;

-   The sample procedures above show also how to return result sets. In MS SQL the operation is implicit, in PostgreSQL you need to declare a variable of type RECORD and loop over the results returned from a query, returning each set using the **RETURN NEXT** statement. This statement does **not** actually return from the function, it merely stores away the result set which is then returned to the caller when the **RETURN;** statement is parsed.
-   Also in the sample procedures above, you can see how to declare the return type if you're returning result sets.
-   If you plan to return only a subset of columns from a table, you should create a new type with only those columns and declare your function to return the new type:

        CREATE TYPE FooTableSubset AS (column1 text, column2 int);

        CREATE FUNCTION Bar() RETURNS SETOF FooTableSubset AS $$
        DECLARE
                r RECORD;
        BEGIN
                FOR r IN SELECT column1, CAST(COUNT(*) AS int) AS num FROM FooTable *:LOOP
                   RETURN NEXT r;
                END LOOP;
                RETURN;
        END;
        $$ LANGUAGE plpgsql;

-   The procedure above demonstrates another thing to pay attention to. The result of the `COUNT(*)` aggregate function in PostgreSQL is **bigint** (Int64 in .NET) while in MS SQL it's **int** (Int32 in .NET). Therefore you need to either modify your application to expect an Int64 value, or (preferred) cast the `COUNT(*)` result as shown above.
-   Try not to use temporary tables in your PostgreSQL stored procedure. MS SQL procedures can contain code like the one shown below:

        SELECT INTO #temptable ....

    Instead of using `CREATE TEMPORARY TABLE`, you should rather create a new type and return result sets from a query limited to the columns you're interested in.

-   Use **FOUND** instead of **@@FETCH_STATUS**
-   Use **currval(*sequence_name*)** instead of **@@IDENTITY**
-   Make sure to end each statement with semicolons (**;**)
-   Conditional execution blocks in PL/pgsql do not use **BEGIN/END**, instead they use the following syntax:

        IF ''condition''' THEN
         ....
        ELSIF ''condition'' THEN
         ....
        END IF;

Running the application on Unix
-------------------------------

**Using MONO_IOMAP**

> On Unix systems, Mono supports an I/O compatibility mode which allows you to ignore the file name case when accessing files on disk. The mode also takes care of disk designators (e.g. `c:`). Enabling the translation carries, obviously, some performance penalty, but is a good way to get your application up and running quickly. To enable the compatibility mode, make sure your web server's (XSP's or Apache's) environment contains the `MONO_IOMAP` variable set to **all**:
>
>     MONO_IOMAP=all
>     export MONO_IOMAP
>
> If you're using `mod_mono`, put the following line in your virtual host config file:
>
>     MonoSetEnv MONO_IOMAP=all

Supporting Multiple Platforms
-----------------------------

Some applications require advanced configuration settings that are OS-specific or deployment specific. For example, Mono uses this to set the default membership and role managers on Linux to use SQLite by default, as opposed to a larger database.

Configuration is driven by the settings.map file, for a detailed explanation of it see the [[[2]](/ASP.NET_Settings_Mapping)] document.

More Tutorials
--------------

Nathan Bridgewater wrote this very nice 3-part tutorial on how to port an ASP.NET MVC application to Mono:

-   Part 1: [Installing the Software](http://www.integratedwebsystems.com/2010/01/installing-opensuse-11-2-with-mono-2-6-1-and-apache-using-text-mode-configuration-porting-to-mono-part-1-of-3/)
-   Part 2: [Setting up and Configuring MySQL](http://www.integratedwebsystems.com/2010/02/how-to-setup-and-configure-mysql-membership-provider-6-2-2-porting-to-mono-part-2-of-3/)
-   Part 3: [Walk through porting the ASP.NET MVC website](http://www.integratedwebsystems.com/2010/02/walkthrough-porting-asp-net-mvc-website-to-mono-2-6-1-and-mysql-on-linux-apache-porting-to-mono-part-3-of-3/).

Novell: [From .NET to Linux in 5 Easy Steps](http://www.novell.com/connectionmagazine/2010/02/mono_tools.html)

