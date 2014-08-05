---
title: "Guide:StarterKitPrimer"
lastmodified: '2007-03-09'
permalink: /archived/Guide:StarterKitPrimer/
redirect_from:
  - /Guide:StarterKitPrimer/
---

Guide:StarterKitPrimer
======================

 This page contains guides to installing and running various Micosoft ASP.NET Starter Kit applications with Mono.

Personal Web Site Starter Kit
-----------------------------

Below are instructions on how to run the **Personal Web Site Starter Kit** on Mono.

-   Download the kit from [http://asp.net/downloads/starterkits/default.aspx?tabid=62](http://asp.net/downloads/starterkits/default.aspx?tabid=62)
-   Make sure you have the installvst utility available on your system (it will be available with Mono starting from the 1.2.4 release, or current from current SVN)
-   Unpack the PWS zip file to some directory
-   Run the following command:

<!-- -->

``` bash
installvst PATH_TO_PWS_DIRECTORY/ PersonalWebSite.vstemplate PATH_TO_TARGET_DIRECTORY
```

-   Go to the PATH\_TO\_TARGET\_DIRECTORY/PersonalWebSite/ directory, edit the web.config file you find there find the Personal and LocalSqlServer connection strings and replace their connectionString attributes with, respectively, the following values:

<!-- -->

``` bash
Data Source=XXX.YYY.VVV.ZZZ;Integrated Security=False;Database=startkit_personal;User ID=sktest;Password=sktest
Data Source=XXX.YYY.VVV.ZZZ;Integrated Security=False;Database=aspnetdb;User ID=sktest;Password=sktest
```

Substitute the XXX.YYY.VVV.ZZZ strings with the IP number of your SQL server

Having completed the above steps, you need to prepare your Microsoft SQL server (either the full version or SQLExpress) for use with the starter kit. Follow the instructions below:

-   Make sure your SQL server uses mixed SQL + Windows authentication, allow connections over TCP/IP (server port 1433)
-   Create an SQL user named 'sktest' with the password 'sktest'
-   Create an empty database named aspnetdb, then fill it with required schema using the aspnet\_regsql utility that comes with Microsoft .Net 2.0 SDK. This database can be shared among all the starter kits ported to Mono. Add the 'sktest' user to this database users and make it the database owner.
-   Create an empty database named startkit\_personal, then use personal-add.sql script found in the PWS zip archive to populate it with the necessary schema and data. Add the 'sktest' user to this database users and make it the database owner.

At this point you are ready to run the application. To do so, issue the following command on your mono machine:

> `MONO_IOMAP=all xsp2 --root PATH_TO_TARGET_DIRECTORY/PersonalWebSite/`

and then point your browser to <http://localhost:8080/> (replace 8080 with the port number your xsp is configured for).

If everything went well, here's what you should see in your browser:

 **The welcome screen**

[![abc]({{ site.github.url }}/archived/images/d/d3/Pws_welcome_screen.png)]({{ site.github.url }}/archived/images/d/d3/Pws_welcome_screen.png "abc")

**The welcome screen after logging in**

[![abc]({{ site.github.url }}/archived/images/6/6b/Pws_logged_in_screen.png)]({{ site.github.url }}/archived/images/6/6b/Pws_logged_in_screen.png "abc")

One thing should be noted about the user registration with this starter kit. The application is configured so that every new user is created in the disabled state - that is, you will not be able to log in even though the user has been created successfully.

To remedy that, you have two options:

1.  Edit the Register.aspx file and remove (or set to **false**) the DisableCreatedUser attribute to the \<asp:CreateUserWizard\> tag in that file.
2.  On your Windows machine launch the SQL Server Management application, connect to the aspnetdb database and issue the following query:

<!-- -->

``` sql
UPDATE dbo.aspnet_Membership SET IsApproved=1
```

It will approve all the users you have registered (if you want to do it for individual users, you need to consult the dbo.aspnet\_Users table, look up your user, note its ID and append **WHERE UserId=YOUR\_USER\_ID** clause to the above query)

