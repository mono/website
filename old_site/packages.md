---
layout: obsolete
title: "Packages"
lastmodified: '2007-09-24'
permalink: /old_site/Packages/
redirect_from:
  - /Packages/
---

Packages
========

ASP.Net Starter Kits
====================

The following starter kits have been packaged for Mono:

-   BlogStarterKit
-   Classifieds Starter Kit
-   Club Web Sit

Installing and running the applications
---------------------------------------

Note: All the commands below must be run as root

All the applications come configured with one user account:

``` bash
       Login: test
    Password: test
```

After installation of the chosen RPMs, the following command may be issued to list all the available applications:

``` bash
    # mono-asp-apps list
    Installed apps:
    Mono_ASP.NET_BlogStarterKit-1.0.0
    Mono_ASP.NET_ClassifiedsStarterKit-1.0.0
    Mono_ASP.NET_ClubWebSite-1.0.0
```

The names shown are used with all the mono-asp-apps operations that require an application name.

Some applications may require initialization (e.g. creation of a PostgreSQL database). In such cases, the following command must be issued before running the application for the first time:

``` bash
    # mono-asp-apps init APPLICATION_NAME
```

If everything works fine, you should be prompted to enter the database user password (all the starter kits use the test/test pair as the user login/password). If the PostgreSQL configuration is not valid, you will be informed about the fact and given instructions on how to modify the configuration.

After applications are initialized, the following command should be issued in order to launch the application(s) (bash shell is assumed):

``` bash
    MONO_IOMAP=all xsp2 --root /usr/share/mono/asp.net/apps/ --appconfigdir /etc/xsp/2.0/applications-available/
```

After the above command executes successfully, the packaged applications can be accessed with the following URLs:

-   Blog Starter Kit: <http://localhost:8080/BlogStarterKit/>
-   Classifieds Starter Kit: <http://localhost:8080/ClassifiedsStarterKit>
-   Club Web Site: <http://localhost:8080/ClubWebSite>

Download Repository
-------------------

-   [http://download.opensuse.org/repositories/Mono:/apps](http://download.opensuse.org/repositories/Mono:/apps)

Follow the above link, open distro folder, and then click on noarch. The rpms are named according to the following convention: Mono\_ASP.NET\_\<name\>StarterKit.

