---
title: IBM DB2
redirect_from:
  - /IBM_DB2/
---

Info
----

-   ADO.NET Data Provider for [IBM DB2 Universal Database](http://www-3.ibm.com/software/data/db2/).

-   Exists in namespace IBM.Data.DB2 and assembly IBM.Data.DB2.

-   This IBM DB2 data provider is built on top of Call Level Interface, a C interface similar to ODBC. The required libraries are db2cli.dll on Windows and db2_36.so under Linux. Note, the version of the shared library could be different.

Current Status
--------------

This IBM DB2 managed provider is in a stable stage. It was tested on Linux and Windows platforms on x86 hardware. All the features one would expect from a .NET managed provider are implemented, including:

-   Connecting / disconneting to local and remote datasources

-   Connection pooling

-   Statement execution support using the ExecuteNonQuery(), ExecuteScalar(), ExecuteReader() methods of the DB2Command

-   Transactions support

-   Filling datasets with the DB2DataAdapter from direct statement execution or from stored procedures cursors

-   Updating datasources with the changes in DataSets using DB2DataAdapter.Update() method

-   Full stored procedures invocation support; IN/OUT/INOUT and return parameters

-   Generating Insert/Update/Delete commands with the DB2CommandBuilder

Action plan
-----------

Future plans:

-   Fixing all the bugs as soon as they will be discovered

-   Exhaustive test cases suite

-   Enhanced bulk insert operations support

-   Switching from the C interface to the DB2 wire protocol

Testing
-------

**Prerequisites**

In order to test.

-   Download and install mono from [here](/download/stable/)

-   Make sure you have a working C compiler on the machine you will install DB2 on, since this will be required for compiling stored procedures

-   Install IBM DB2 and make sure you have created the links for the DB2 files using the db2ln command. You can register and download IBM DB2 Personal Developer Edition from [here](http://www14.software.ibm.com/webapp/download/search.jsp?rs=db2pde). If you cannot install DB2 using the automatic installation due to the java user interface issues, you can perform a manual installation following these [instructions](http://publib.boulder.ibm.com/infocenter/db2help/index.jsp?topic=/com.ibm.db2.udb.doc/start/t0006742.htm).

-   Make sure the assembly IBM.Data.DB2.dll was built and installed where the other class libraries are installed.
