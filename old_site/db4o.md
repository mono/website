---
layout: obsolete
title: "DB4O"
permalink: /old_site/DB4O/
redirect_from:
  - /DB4O/
  - /Db4o/
---

DB4O
====

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#Info">1 Info</a></li>
<li><a href="#The_Basic_Principle_of_db4o">2 The Basic Principle of db4o</a></li>
<li><a href="#Downloads">3 Downloads</a></li>
<li><a href="#Current_Status">4 Current Status</a></li>
<li><a href="#Action_plan">5 Action plan</a></li>
<li><a href="#Testing_db4o">6 Testing db4o</a></li>
</ul></td>
</tr>
</tbody>
</table>

Info
----

-   Open source object database for .NET and Mono

-   Distributed by [db4objects](http://www.db4o.com?src=Mono) under the GPL or commercial license based on your needs

-   Also available for .NET CompactFramework and Java, with the same feature set and database file format, enabling cross-platform development

-   The db4o engine comes as a single 600kB dll with no dependancies outside of core Mono

-   Click here to access the
    -   [Community Forums](http://developer.db4o.com/forums/),
    -   [db4o Mono Project Space](http://developer.db4o.com/ProjectSpaces/view.aspx/Mono),
    -   [db4o Mono Product News blog feed](http://forums.db4o.com/blogs/product_news/archive/category/1008.aspx) and
    -   [More Developer Resources](http://developer.db4o.com).

The Basic Principle of db4o
---------------------------

db4o is a non-intrusive persistence system that stores any complex object with one single line of code. The class schema of your application classes is analysed and adjusted in real time when objects are stored. Object-oriented querying functionality is provided through Native Queries (NQ), the ability to query the database using .NET syntax and semantics (similar in concept to LINQ/DLINQ), Query by Example (QBE) which uses prototype objects for querying and other APIs. High performance is achieved with indexed fields and by reducing database-file-internal redirections to the absolute minimum. db4o features ACID transactions, fast embedded single-user mode and multi-transactional Client/Server access, locally and through TCP, object-oriented replication, and the ObjectManager to browse database files... [more](http://www.db4o.com/about/productinformation/)

Downloads
---------

**db4o Mono downloads** - Download under GPL:

-   [db4o-6.2-mono.noarch.rpm](http://www.db4o.com/downloads/db4o-6.2-mono.noarch.rpm) (noarch RPM, binary dll, no sources)

-   [db4o-6.2-mono.src.rpm](http://www.db4o.com/downloads/db4o-6.2-mono.src.rpm) (source RPM, no pre-compiled binary dll)

-   [db4o-6.2-mono.tar.gz](http://www.db4o.com/downloads/db4o-6.2-mono.tar.gz) (tar with pre-compiled binary dll and sources)

-   [db4o-6.4-net2.msi](http://www.db4o.com/downloads/db4o-6.4-net2.msi) (windows installer with binary dll and sources for .NET 2.0)

-   [db4o-6.4-net1.msi](http://www.db4o.com/downloads/db4o-6.4-net1.msi) (windows installer with binary dll and sources for .NET 1.0/1.1)

If you need Unix binaries for versions later than v6.2 check the [Mono Project Space](http://developer.db4o.com/ProjectSpaces/view.aspx/Mono)

More versions and add ons in the [db4o Download Center](http://downloads.db4o.com)

Current Status
--------------

Current versions:

-   Production v6.4
-   Development v7.0

[Release Notes for 6.4 and 7.0](http://developer.db4o.com/blogs/product_news/archive/2007/11/13/release-notes-for-6-4-prod-and-7-0-dev.aspx)

Action plan
-----------

Major milestones for 2007

-   "Canada", featuring transparent activation and fast collections
-   "Denmark", featuring unique field constraints and J2ME/CLDC support
-   "Egypt", featuring indexed collections and the split of local and C/S core
-   "7.x", featuring [Trasparent Activation](http://developer.db4o.com/blogs/product_news/archive/2007/11/12/the-7th-dimension.aspx)

See actual [work in progress in Jira](http://tracker.db4o.com/jira/secure/Dashboard.jspa)

Testing db4o
------------

**Prerequisites**

-   Have a working mono and mcs

-   Download and install the db4o noarch RPM

-   The db4o engine is a single .dll file (Db4objects.Db4o.dll) that will be located in /usr/lib/db4o/ after installation (or in the corresponding path on a different Linux distribution). Simply place the Db4objects.Db4o.dll into the directory to where you build your application.

**C\# Example**

``` csharp
using System;
 
using Db4objects.Db4o;
 
public class Test {
 
    static string _file = "store.db4o";
 
    // A very basic db4o example that demonstrates
    // automatic schema generation and Query-By-Example
    public static void Main (string [] args)
    {
        using (IObjectContainer db = Db4oFactory.OpenFile (_file)) {
            db.Set (new Pilot ("Michael Schumacher", 101));
            db.Set (new Pilot ("Rubens Barrichello", 99));
            db.Commit ();
 
            IObjectSet pilots = db.Get (new Pilot(null, 101));
            foreach (Pilot p in pilots) {
                Console.WriteLine (p);
            }
        }
    }
}
 
public class Pilot {
 
    string _name;
    int _points;
 
    public Pilot (string name, int points)
    {
        _name = name;
        _points = points;
    }
 
    public override string ToString ()
    {
        return _name + "/" + _points;
    }
}
```

**Building the C\# example**

-   Save the example to a file, such as, Test.cs

-   Copy the Db4objects.Db4o.dll from /usr/lib/db4o/ to the same folder

-   Compile

<!-- -->

     $ mcs Test.cs -r:Db4objects.Db4o.dll

-   Running the example:

<!-- -->

     $ mono Test.exe

-   Many more examples can be found in the tutorial that comes with the db4o download.

**On UNIX**

-   We recommend to download and install the noarch RPM that comes with a precompiled Db4objects.Db4o.dll.

-   After the installation Db4objects.Db4o.dll, Db4objects.Db4o.Tools.dll and Db4objects.Db4o.Tests.exe will be found in /usr/lib/db4o/ (or the corresponding path on other Linux distributions).

-   The db4o documentation will be found in /usr/share/doc/packages/db4o/ (or the corresponding path on other Linux distributions). A tutorial and API documentation is provided.

-   Check your Mono installation on your system by running the db4o regression tests.

<!-- -->

    cd /usr/lib/db4o/ mono Db4objects.Db4o.Tests.exe 

-   As the final result you should get:

<!-- -->

    "AllTests completed."
    "No errors detected." 

 **On Windows**

-   We recommend to download the .NET version with the Windows installer. It will work just as good for Mono and it will additionally come with a tutorial that can be run against a live database.

-   Run the msi installation.

**On all platforms**

-   Work through the tutorial. It will provide very detailed help to get you started with db4o.

-   Create db4o database applications by programming against the db4o API.

-   Deploy the single Db4objects.Db4o.dll along with your applications.


