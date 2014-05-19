---
layout: obsolete
title: "FastCGI Lighttpd"
permalink: /old_site/FastCGI_Lighttpd/
redirect_from:
  - /FastCGI_Lighttpd/
---

FastCGI Lighttpd
================

by Brian Nickel \<[http://kerrick.wordpress.com](http://kerrick.wordpress.com)\>

Information on how to configure the [FastCGI]({{site.github.url}}/old_site/FastCGI "FastCGI") support for the Lighttpd server.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a>
<ul>
<li><a href="#configuration-tested-on">1.1 Configuration Tested On...</a></li>
</ul></li>
<li><a href="#general-warnings">2 General Warnings</a></li>
<li><a href="#basic-configuration">3 Basic Configuration</a>
<ul>
<li><a href="#step-1-enabling-the-fastcgi-module">3.1 Step 1: Enabling the FastCGI Module</a></li>
<li><a href="#step-2-configuring-the-fastcgi-module">3.2 Step 2: Configuring the FastCGI Module</a>
<ul>
<li><a href="#part-a-adding-the-module">3.2.1 Part A: Adding the Module</a></li>
<li><a href="#part-b-adding-the-server">3.2.2 Part B: Adding the Server</a>
<ul>
<li><a href="#automatically-spawning-a-new-server">3.2.2.1 Automatically spawning a new server</a></li>
<li><a href="#connecting-to-an-existing-server-via-tcp">3.2.2.2 Connecting to an existing server via TCP</a></li>
</ul></li>
</ul></li>
</ul></li>
<li><a href="#advanced-topics">4 Advanced Topics</a>
<ul>
<li><a href="#excluding-paths-from-aspnet">4.1 Excluding Paths from ASP.NET</a></li>
<li><a href="#limiting-aspnet-to-specific-virtual-hosts">4.2 Limiting ASP.NET to Specific Virtual Hosts</a></li>
<li><a href="#allowing-php-to-run-in-parallel">4.3 Allowing PHP to Run in Parallel</a></li>
<li><a href="#using-extensions">4.4 Using Extensions</a></li>
</ul></li>
<li><a href="#bada-bing">5 Bada Bing!</a></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
------------

[Lighttpd](http://www.lighttpd.net/) (pronounced "lighty") is a popular lightweight and easy to configure HTTP server. Adding ASP.NET support through `fastcgi-mono-server` is very quick and painless and can be done by modifying only three files.

### Configuration Tested On...

1.  [Fedora 8](http://www.fedoraproject.org) (Lighttpd 1.4.18-1, Mono 1.2.6 installed in a user account)

An earlier version of these configuration instructions was tested on the following systems with an earlier version of Mono. These instructions should still work on those systems but have not been tested there:

1.  [OpenSuSE 10.2](http://en.opensuse.org/OpenSUSE_News/10.2-Release) (Lighttpd 1.4.13-41.1 from "SUSE-Linux-10.2-Updates")
2.  [Debian 4.0](http://www.debian.org) etch (Lighttpd 1.4.13-4)
3.  [Ubuntu 7.04](http://www.ubuntu.com) feisty (Lighttpd 1.4.13-9ubuntu4)
4.  *If you have tested an additional configuration,please email me at [brian.nickel@gmail.com](mailto:brian.nickel@gmail.com).*

General Warnings
----------------

Before doing anything else, you should read [FastCGI's important information]({{site.github.url}}/old_site/FastCGI#important-information "FastCGI") on the main page.

Basic Configuration
-------------------

### Step 1: Enabling the FastCGI Module

The server is enabled through the FastCGI module. To enable the module, open /etc/lighttpd/modules.conf (or if that file does not exist open /etc/lighttpd/lighttpd.conf) and search for the following block:

    ##
    ## FastCGI (mod_fastcgi)
    ##
    #include "conf.d/fastcgi.conf"

If you find it, you need only uncomment the `include` line. If you don't find that line, or anything like it, simply add the following line to end of the file:

    include "conf.d/fastcgi.conf"

### Step 2: Configuring the FastCGI Module

Now that the server is enabled, it takes just a handful of lines to configure it.

Your distribution should have included a file /etc/lighttpd/conf.d/fastcgi.conf in the installation; if not, add it. This is the largest and most important part of the configuration. It consists of two pieces, which will be discussed in detail, and by the time you are finished the file will look something like this:

    include "conf.d/mono.conf"

    server.modules += ( "mod_fastcgi" )

    fastcgi.server = (
            "" => ((
                    "socket" => mono_shared_dir + "fastcgi-mono-server",
                    "bin-path" => mono_fastcgi_server,
                    "bin-environment" => (
                            "PATH" => "/bin:/usr/bin:" + mono_dir + "bin",
                            "LD_LIBRARY_PATH" => mono_dir + "lib:",
                            "MONO_SHARED_DIR" => mono_shared_dir,
                            "MONO_FCGI_LOGLEVELS" => "Standard",
                            "MONO_FCGI_LOGFILE" => mono_shared_dir + "fastcgi.log",
                            "MONO_FCGI_ROOT" => mono_fcgi_root,
                            "MONO_FCGI_APPLICATIONS" => mono_fcgi_applications
                    ),
                    "max-procs" => 1,
                    "check-local" => "disable"
            ))
    )

So without further ado...

#### Part A: Adding the Module

This file must have the following line in it, otherwise it will not work:

    server.modules += ( "mod_fastcgi" )

If the file was included in your distribution, it would be near the very top. If not, make sure you add it. This tells Lighttpd to load the module when it starts up.

#### Part B: Adding the Server

The next step is to add a server for the ".aspx" extension. Do a quick search for "fastcgi.server". If found, it will probably look something like the following:

    fastcgi.server = (
        ".php" => ((
            "socket" => "/tmp/php-fastcgi.socket",
            "bin-path" => "/usr/local/bin/php",
            "bin-environment" => (
                "PHP_FCGI_CHILDREN" => "16",
                "PHP_FCGI_MAX_REQUESTS" => "10000"
            )
        ))
    )

If you have it, you're going to want to add a new extension to it so it looks like the following:

    fastcgi.server = (
        ".php" => ((
            "socket" => "/tmp/php-fastcgi.socket",
            "bin-path" => "/usr/local/bin/php",
            "bin-environment" => (
                "PHP_FCGI_CHILDREN" => "16",
                "PHP_FCGI_MAX_REQUESTS" => "10000"
            )
        )),
        "" => ((
            # TO BE ADDED
            "check-local" => "disable"
        ))

    )

Otherwise, if it doesn't exist, just add the following block:

    fastcgi.server = (
        "" => ((
            # TO BE ADDED
            "check-local" => "disable"
        ))
    )

This is the beginning of a server definition for the root directory. `""` looks a little odd, but adding a trailing slash to the directory name dramatically alters how Lighttpd sends the request paths. You will be adding implementation specific settings where "`# TO BE ADDED`". The `"check-local"` line tells Lighttpd to send all requests to the Mono server regardless of whether or not the the file exists on disk. This is needed for some features of ASP.NET 2.0.

There are two recommended server implementations for the Mono server. The first has Lighttpd automatically spawn the child server when it starts and communicate over Unix sockets. This has the advantage of being easy to set up, being secure by limiting access to just Lighttpd, and having the performance boost provided by Unix sockets. The second has Lighttpd communicate via TCP sockets with an existing Mono server somewhere on the network. This has the advantage of being able to run the Mono server on an entirely different machine than Lighttpd and all the performance and logistical advantages associated with that. If you're just setting up a personal server or not trying anything fancy, I would recommend using automatic spawning, and if you're using a high bandwidth, multimachine setup, I would recommend using TCP and running the server on another system.

##### Automatically spawning a new server

Where you previously added "`# TO BE ADDED`", replace it with the following:

                    "socket" => mono_shared_dir + "fastcgi-mono-server",
                    "bin-path" => mono_fastcgi_server,
                    "bin-environment" => (
                            "PATH" => "/bin:/usr/bin:" + mono_dir + "bin",
                            "LD_LIBRARY_PATH" => mono_dir + "lib:",
                            "MONO_SHARED_DIR" => mono_shared_dir,
                            "MONO_FCGI_LOGLEVELS" => "Standard",
                            "MONO_FCGI_LOGFILE" => mono_shared_dir + "fastcgi.log",
                            "MONO_FCGI_ROOT" => mono_fcgi_root,
                            "MONO_FCGI_APPLICATIONS" => mono_fcgi_applications
                    ),
                    "max-procs" => 1,

That configuration uses several mono\_\* configuration variables to control the how the FastCGI server starts and runs. To set those configuration variables add the following line to the top of fastcgi.conf:

    include "conf.d/mono.conf"

and create conf.d/mono.conf to contain the following:

    # Add index.aspx and default.aspx to the list of files to check when a 
    # directory is requested. 
    index-file.names += ( "index.aspx", "default.aspx" )

    ### The directory that contains your Mono installation.
    # The "bin" subdir will be added to the PATH and the "lib" subdir will be
    # added to the LD_LIBRARY_PATH.
    # For a typical system-wide installation on Linux, use:
    var.mono_dir = "/usr/"
    # For an installation in a user account (lighttpd need read/exec access):
    #var.mono_dir = "/home/username/mono-1.2.6/"

    ### A directory that is writable by the lighttpd process.
    # This is where the log file, communication socket, and Mono's .wapi folder
    # will be created.
    # For a typical system-wide installation on Linux, use:
    var.mono_shared_dir = "/tmp/"
    # For an installation in a user account (dir must exist and be writable):
    #var.mono_shared_dir = "/home/username/lighttpd_scratch/"

    ### The path to the server to launch to handle FASTCGI requests.
    # For ASP.NET 1.1 support use:
    var.mono_fastcgi_server = mono_dir + "bin/" + "fastcgi-mono-server"
    # For ASP.NET 2.0 support use:
    #var.mono_fastcgi_server = mono_dir + "bin/" + "fastcgi-mono-server2"

    ### The root of your applications
    # For apps installed under the lighttpd document root, use:
    var.mono_fcgi_root = server.document-root
    # For apps installed in a user account, use something like:
    #var.mono_fcgi_root = "/home/username/htdocs/"

    ### Application map
    # A comma separated list of virtual directory and real directory
    # for all the applications we want to manage with this server. The
    # virtual and real dirs. are separated by  a  colon.
    var.mono_fcgi_applications = "/:."

Read the comments in the mono.conf and edit as appropriate for your site. If you are installing a single app directly into the lighttpd document root and Mono is installed as part of your distribution, you shouldn't need to change anything.

##### Connecting to an existing server via TCP

Where you previously added "`# TO BE ADDED`" in fastcgi.conf, replace it with the following:

           "host" => "192.168.0.3",
            "port" => 9000,
            "docroot" => "/root/on/remote/machine",

1.  `"host"` specifies the host on which theserver is running. You will want to replace it with the actual IP address.
2.  `"port"` specifies the port on which theserver is running. For this example, the ASP.NET server could have been started with the following command:

<!-- -->

    /usr/bin/fastcgi-mono-server /socket=tcp:9000

1.  `"docroot"` specifies the document root**on the remote machine**. It is not necessary if the directory structure is the same as on the local machine.

Advanced Topics
---------------

Sending all requests to ASP.NET adds some extra overhead which may not be desirable for sending large static files. It additionally prevents PHP (and other scripts) from working. The following advanced topics overcome these obstacles by enclosing the `fastcgi.server` definition in a [Conditional Configuration](http://trac.lighttpd.net/trac/wiki/Docs%3AConfiguration#conditional-configuration).

**As this prevents requests from being handled by ASP.NET, the requests do not employ ASP.NET's security features and extra security measures should be applied.**

### Excluding Paths from ASP.NET

The following example prevents files in the `/downloads/` and `/images/` directories from being sent to ASP.NET:

    server.modules += ( "mod_fastcgi" )

    $HTTP["url"] !~ "^/(downloads|images)/" {
        fastcgi.server = (
            "" => ((
        ... same as before ...
            ))
        )
    }

### Limiting ASP.NET to Specific Virtual Hosts

The following example limits ASP.NET to running on `www.example.com` and `example.com`:

    server.modules += ( "mod_fastcgi" )

    $HTTP["host"] =~ "^(www\.|)example\.com$" {
        fastcgi.server = (
            "" => ((
        ... same as before ...
            ))
        )
    }

### Allowing PHP to Run in Parallel

The following example sends `.php` requests to a PHP FastCGI server and the rest to ASP.NET:

    server.modules += ( "mod_fastcgi" )

    $HTTP["url"] !~ "\.php$" {
        fastcgi.server = (
                ""   => ((
        ... same as before ...
                ))
        )
    }

    fastcgi.server = (
            ".php"   => ((
                    "socket" => "/tmp/php-fastcgi",
                    "bin-path" => "/srv/www/cgi-bin/php5",
                    "bin-environment" => (
                            "PHP_FCGI_CHILDREN" => "16",
                            "PHP_FCGI_MAX_REQUESTS" => "10000"
                    )
            ))
    )

### Using Extensions

**Using Extensions in place place of paths is NOT recommended.** Please consult "[../index.html\#info1 Paths vs. Extensions]" on the main page for an in depth explanation. If you decide to use this configuration, please bear in mind that it is less secure suffers additional disadvantages when compared to using paths.

To start, change the extension that triggers the mono FastCGI server from "" to ".aspx". So that your fastcgi.conf file looks like this:

    fastcgi.server = (
            ... possibly other extensions like ".php" ...
        ".aspx" => ((
            ... same as before ...
        ))
    )

ASP.NET uses many extensions for its many different features. It uses ".ashx" for handlers, ".soap" for SOAP, and you really don't want anyone downloading your ".dll" files, do you?

The hard way to add a new extension is to copy and paste what your server configuration, replacing ".aspx" with ".asmx", etc. The easy way is to add a extension map, so Lighttpd just treats ".asmx" as ".aspx". As before, you are going to want to look for "fastcgi.map-extensions". If found, it will probably look something like the following:

    fastcgi.map-extensions = ( ".php3" => ".php" )

If you have it, you're going to want to add a new extension to it so it looks like the following:

    fastcgi.map-extensions = (
            ".php3" => ".php"<b>,
            ".asmx"   => ".aspx",
            ".ashx"   => ".aspx",
            ".asax"   => ".aspx",
            ".ascx"   => ".aspx",
            ".soap"   => ".aspx",
            ".rem"    => ".aspx",
            ".axd"    => ".aspx",
            ".cs"     => ".aspx",
            ".config" => ".aspx",
            ".dll"    => ".aspx"</b>
    )

 Otherwise, if it doesn't exist, just add the following block:

    fastcgi.map-extensions = (
            ".asmx"   => ".aspx",
            ".ashx"   => ".aspx",
            ".asax"   => ".aspx",
            ".ascx"   => ".aspx",
            ".soap"   => ".aspx",
            ".rem"    => ".aspx",
            ".axd"    => ".aspx",
            ".cs"     => ".aspx",
            ".config" => ".aspx",
            ".dll"    => ".aspx"
    )

Bada Bing!
----------

You should now have ASP.NET working with Lighttpd. Enjoy!

