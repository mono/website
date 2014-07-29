---
layout: obsolete
title: "Writing Connected Mode Testcases"
lastmodified: '2007-04-11'
permalink: /archived/Writing_Connected_Mode_Testcases/
redirect_from:
  - /Writing_Connected_Mode_Testcases/
---

Writing Connected Mode Testcases
================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#what-is-this-framework-all-about">1 What is this framework all about?</a></li>
<li><a href="#what-is-connected-mode--disconnected-mode">2 What is Connected Mode &amp; Disconnected mode?</a></li>
<li><a href="#where-is-it">3 Where is it?</a></li>
<li><a href="#how-to-run-these-tests">4 How to run these tests?</a></li>
<li><a href="#how-to-write-a-connected-mode-test">5 How to write a connected mode test?</a></li>
<li><a href="#how-to-add-a-new-database-provider-framework">6 How to add a new database provider framework?</a></li>
<li><a href="#guidelines">7 Guidelines</a></li>
</ul></td>
</tr>
</tbody>
</table>

What is this framework all about?
---------------------------------

What is Connected Mode & Disconnected mode?
-------------------------------------------

Connected mode is a behavior in ADO.NET where it deals with the live data communication with a database server. Whereas, the disconnected mode deals with in-memory data. Basically, the disconnected mode is a cache of your data whereas the connected mode is a stream access to a data source.

Disconnected mode tests does not require a database connection and can be tested without any external servers or libraries. So, it is easier to write tests for this. But, the connected mode tests require a particular database and needs a kind of setup before running these setups. There are a lot of databases available and all offer different feature set, semantics for communication and SQL syntax. So it would be a difficult task to write common tests to test all of them. So, we have to write tests for each and every provider out there and there would be a lot of duplicate work. We tried to minimize this effort and complexity by categorizing them and maximizing the sharing of common code.

Few of the classes which constitute the connected mode behavior are given below.

-   DataSet
-   DataTable
-   DataRow
-   DataColumn
-   DataRelation
-   DataView
-   DataAdapter

The disconnected mode behavior is provided by the specific provider classes derived from the following common base classes.

-   Connection
-   Command
-   DataReader

Where is it?
------------

The connected mode test suite for ADO.NET is under mcs/class/System.Data/Test/ProviderTests. The disconnected mode tests are scattered under mcs/class/System.Data/Test into their respective namespaces.

The directory Structure of this suite is as

         ProviderTests
        + Common            - common helper classes for test suite
        + ProviderIndependantTests  - Set of test fixtures which can be shared across providers
        + sql               - sql scripts to set up test database.
        + System.Data.SqlClient     - Microsoft Sql Server specific tests
        + System.Data.Odbc      - Odbc specific tests.

How to run these tests?
-----------------------

You need to first setup the connection string for the database provider for which you want to run the tests. The connection strings are given in the respective database provider's configuration file. Say, if you want to run tests for sqlserver you need to edit the sqlserver.config file. There should be a key with name "ConnString" which should be having a valid connection string.

The tests operate on a common data pool. So, you need to set up the common data pool by populating the schema given in the sql subdirectory. Say, if you want to populate schema for sqlserver, run

       tsql -S sql-server -U user -P password < sql/sqlserver.sql

Then you can run the tests any number of times by giving the following make with target

          make run-test DATABASE=<your database>

Allowed keywords for \<your database\> are sqlserver, odbc.

How to write a connected mode test?
-----------------------------------

-   Identify which provider you are going to write the test case for. If your database is not in the test framework, see the below section to add a new provider framework.

-   For testing any provider class, you need a database connection. Use the ConnectionManager singleton class to create,open and close connection. The best way is to copy an existing test case and change.

-   Write tests as normal tests and follow the guidelines given in the following section. See [Writing Nunit Testcases]({{ site.github.url }}/Test_Suite).

-   Include a category of your database as attribute for the test. Say, if you are writing test case Microsoft Sql Server, write [Category ("sqlserver")].

How to add a new database provider framework?
---------------------------------------------

-   If you want to use this framework to test a new database provider, create a directory by the name of your namespace under ProviderTests.

Guidelines
----------

-   It is recommended to create all the connected mode classes through Provider Factory classes. So that, if your test case is generic enough, it can be moved to ProviderIndependant tests without much code changes. Wherever possible, use IDb\* interfaces.


