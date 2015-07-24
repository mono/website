---
title: Database Access
redirect_from:
  - /Database_Access/
---

Mono has many ADO.NET Data Providers to get you connected. Find the database you want to connect to and follow the link for instructions on how to set it up, as well as sample code for accessing the database.

Providers for Open Source databases:

-   [PostgreSQL](/docs/database-access/providers/postgresql/): Npgsql is a managed provider for PostgreSQL
-   [SQLite](/docs/database-access/providers/sqlite/): provider for [SQLite](http://www.sqlite.org) versions 2 and 3. Requires native sqlite library.
-   [Firebird](/docs/database-access/providers/firebird/): managed provider for Firebird
-   [MySQL](/docs/database-access/providers/mysql/): [MySQL Connector/Net](http://dev.mysql.com/downloads/connector/net/) is the recommended provider for MySQL from [MySQL](http://www.mysql.com/). ByteFX.Data.MySqlClient is no longer maintained.

Providers for commercial databases:

-   [Mimer SQL](/archived/mimer_sql) Mimer Data Provider for Mimer SQL, from Mimer [[1]](http://developer.mimer.com/platforms/productinfo_39.htm)
-   [ODBC](/docs/database-access/providers/odbc/) requires ODBC software which is available for Unix and Windows
-   [Oracle](/docs/database-access/providers/oracle/) provider for Oracle 8i, 9i, 10g, and 11g and requires Oracle client software
-   [Microsoft SQL Server](/docs/database-access/providers/sqlclient/) managed provider for Microsoft SQL Server 7.0, 2000 and 2005 databases

Commercially Supported Providers:

-   [VistaDB](http://www.vistadb.com) The VistaDB embeddable and commercial library.
-   [OpenLink Software](http://www.openlinksw.com/) has High-Performance, Fully Managed .NET Data Providers for Major Databases which you can [download](http://oplweb.openlinksw.com:8080/download/).

Open Source Providers:

-   [MySQL Connector/Net from MySQL AB](http://dev.mysql.com/downloads/connector/net/) is the recommended .NET and Mono data provider for MySQL
-   [NPgsql](http://npgsql.projects.postgresql.org/) is a fully managed provider for PostgreSQL and is included with Mono.
-   [Firebird](http://sourceforge.net/projects/firebird/) fully managed provider for Firebird databases and is included with Mono.
-   [Advanced Data Provider](http://advanced-ado.sourceforge.net/) ADP, is a transparent factory for ADO.NET which loads providers dynamically.
-   [MaxDB](/archived/maxdb) MaxDB database.

Object Persistent Libraries and Object Databases

-   [NHibernate](http://nhibernate.info/) NHibernate is a .NET based object persistence library for relational databases. NHibernate is a port of the excellent Java Hibernate relational persistence tool.

Commercial Object Persistent Libraries and Object Databases:

-   [db4o](/DB4O) is an open source object database for .NET and Mono, a non-intrusive persistence system that stores any complex object with one single line of code.
-   [siaqodb](http://siaqodb.com) is an object database for Mono, .NET and Silverlight.

Database Tools

-   [MonoDevelop Database](http://www.monodevelop.com/) - an Add-In to MonoDevelop providing a SQL Query and Database Browser tool.

Unmaintained Providers in Mono:

-   [OLE DB](/archived/ole_db)
-   [Ancient Microsoft SQL Server and Sybase databases](/archived/tds_generic)
-   [ByteFX.Data.MySqlClient](http://sourceforge.net/projects/mysqlnet/) is a MySQL Managed data provider. ByteFX.Data is no longer maintained, but it is included with Mono. Please use the MySQL Connector/Net provider from MySQL AB instead.
-   [IBM DB2 Universal Database](/docs/database-access/providers/db2/) provider for IBM DB2 requires DB2 client software
-   [Sybase](/docs/database-access/providers/sybase/) managed provider for Sybase ASE 12.0 and up databases

