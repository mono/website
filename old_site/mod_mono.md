---
layout: obsolete
title: "Mod mono"
permalink: /old_site/Mod_mono/
redirect_from:
  - /Mod_mono/
---

Mod mono
========

Mod\_Mono is an Apache 2.0/2.2/2.4.3 module that provides [ASP.NET]({{site.github.url}}/old_site/ASP.NET "ASP.NET") support for the web's favorite server, [Apache](http://httpd.apache.org).

The module passes off requests for ASP.NET pages to an external program, **mod-mono-server**, which actually handles the requests. The communication between the Apache module and mod-mono-server is established using a Unix socket or a TCP socket.

The most simple scenario uses Apache as the HTTP server front end which passes the requests to mod-mono-server to handle, the following diagram illustrates how this setup works:

[![Modmono-basic-setup.PNG]({{site.github.url}}/old_site/images/c/cc/Modmono-basic-setup.PNG)]({{site.github.url}}/old_site/images/c/cc/Modmono-basic-setup.PNG)

Mod\_mono is an Apache module that is hosted inside Apache. Depending on your configuration the Apache box could be one or a dozen of separate processes, all of these process will send their ASP.NET requests to the mod-mono-server process. The mod-mono-server process in turn can host multiple independent applications. It does this by using Application Domains to isolate the applications from each other, while using a single Mono virtual machine.

Although AppDomains provide an adequate level of isolation, mod\_mono can also be configured to route different urls to different mod-mono-server processes. You can use this to:

-   As an ISP, isolate different customers to different processes
-   Allow experimental code to run in one server, independent of production code.
-   Allow the kernel to enforce different isolation rules for different processes (for example with AppArmor or SELinux)
-   Setup different CPU, Disk and memory quotas to different processes

[![Modmono-multiple-servers.PNG]({{site.github.url}}/old_site/images/9/9b/Modmono-multiple-servers.PNG)]({{site.github.url}}/old_site/images/9/9b/Modmono-multiple-servers.PNG)

For example, in the setup above, the various Apache workers will route requests to /forums and /support to a mod-mono-server that is used by the "community" user on the server. This mod-mono-server will still use two separate AppDomains to isolate the forums software from the support software.

The /blog url will be sent to the mod-mono-server that is ran by the marketing group, the /api url will be sent to the mod-mono-server for user engineering while the application in /testing will be handled by an experimental version of Mono.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#requirements">1 Requirements</a></li>
<li><a href="#distribution-specific-documentation">2 Distribution-Specific Documentation</a></li>
<li><a href="#easy-configuration-of-mod-mono">3 Easy Configuration of Mod_Mono</a></li>
<li><a href="#apache-performance-tweaks">4 Apache performance tweaks</a>
<ul>
<li><a href="#keep-alive">4.1 Keep alive</a></li>
<li><a href="#mpm-worker">4.2 MPM worker</a></li>
</ul></li>
<li><a href="#configuring-mod-mono">5 Configuring Mod_Mono</a>
<ul>
<li><a href="#mod-mono-configuration-tool">5.1 Mod_Mono Configuration Tool</a></li>
<li><a href="#manual-mod-mono-configuration">5.2 Manual Mod_Mono Configuration</a></li>
<li><a href="#more-on-applications">5.3 More on Applications</a></li>
<li><a href="#multiple-applications-multiple-mod-mono-servers">5.4 Multiple Applications, Multiple mod-mono-servers</a></li>
<li><a href="#control-panel">5.5 Control panel</a></li>
</ul></li>
<li><a href="#advanced-options">6 Advanced options</a>
<ul>
<li><a href="#automatic-restart-of-the-mod-mono-server-backend">6.1 Automatic restart of the mod-mono-server backend</a></li>
<li><a href="#limiting-the-number-of-concurrent-requests">6.2 Limiting the number of concurrent requests</a></li>
<li><a href="#setting-hard-memory-and-time-limits">6.3 Setting hard memory and time limits</a></li>
<li><a href="#unix-and-tcp-sockets">6.4 Unix and TCP sockets</a></li>
<li><a href="#paths">6.5 Paths</a></li>
</ul></li>
<li><a href="#troubleshooting">7 Troubleshooting</a>
<ul>
<li><a href="#aspnet-2-applications-do-not-work">7.1 ASP.NET 2 applications do not work</a></li>
<li><a href="#access-forbidden">7.2 Access forbidden</a></li>
<li><a href="#mod-mono-server-does-not-start">7.3 mod-mono-server does not start</a></li>
<li><a href="#restarting-apache-does-not-kill-the-spawned-mod-mono-serverexes">7.4 Restarting apache does not kill the spawned mod-mono-server.exe(s)</a></li>
<li><a href="#problems-with-mod-mono-and-cookie-less-sessions">7.5 Problems with mod_mono and cookie-less sessions</a></li>
<li><a href="#under-high-load-mono-process-consumes-a-lot-of-memory-website-stops-responding">7.6 Under high load, mono process consumes a lot of memory, website stops responding</a></li>
</ul></li>
<li><a href="#mod-mono-on-windows">8 mod_mono on Windows</a></li>
<li><a href="#profiling-mod-mono-server">9 Profiling mod-mono-server</a></li>
<li><a href="#compiling-mod-mono-from-source">10 Compiling mod_mono From Source</a></li>
<li><a href="#improving-mod-mono">11 Improving mod_mono</a></li>
</ul></td>
</tr>
</tbody>
</table>

Requirements
============

You will need [apache](http://httpd.apache.org) , the web server, installed.

From [Downloads]({{site.github.url}}/old_site/Downloads "Downloads") you will need **mono**, **xsp** and **mod\_mono**.

Distribution-Specific Documentation
===================================

If you are using one of these linux distributions, you should look at the corresponding documentation before reading the rest of this page, as some things are different on every distro. It is also always recommended to use your distribution's official packages when available, rather than compiling from source.

-   [Mod\_Mono on Ubuntu](https://help.ubuntu.com/community/ModMono)
-   [Mod\_Mono on Fedora 9](http://www.inprose.com/articles/10-enable-aspnet-support-in-fedora-linux.html)

Easy Configuration of Mod\_Mono
===============================

When you installed XSP, a bunch of sample ASP.NET pages and web services were installed too. If the prefix used to configure XSP was /usr, the sample files are located in /usr/lib/xsp/test.

If your needs are not very complicated, all you need is to use [AutoHosting]({{site.github.url}}/old_site/AutoConfiguration), this basically means that you load the mod\_mono.conf file, like this in your Apache configuration file:

    Include /etc/apache2/mod_mono.conf

And applications will start to be served. To try it out, copy the /usr/lib/xsp/test directory to your Apache home (in openSUSE this is /srv/www/hdtocs).

It is recommended that you create a directory per application that you want served. This will allow you to xcopy deploy your applications from Windows to Linux if you want to.

More on automatic configuration of mod\_mono applications is in [AutoHosting]({{site.github.url}}/old_site/AutoConfiguration).

mod\_mono.conf loads the mod\_mono module, associates ASP.NET file extensions with the ASP.NET MIME type and adds index.aspx, Default.aspx, and default.aspx as automatic directory index pages (with the DirectoryIndex directive). If you don't include mod\_mono.conf in your main Apache configuration, you will at least need to have the mod\_mono.so module loaded with:

    LoadModule mono_module /usr/lib/httpd/modules/mod_mono.so

For more detailed configuration and manual tuning keep reading.

mod\_mono will automatically launch mod-mono-server and start the web application on the first request for a page handled by mod\_mono. In the early days of mod\_mono, you had to start mod-mono-server by yourself, ensuring that it had all the parameters needed to understand the requests forwarded by the module. This is still an option for those who want mod-mono-server to have a separate life cycle from apache, but you will probably prefer to use mod\_mono built-in ability to start and stop mod-mono-server for you.

Apache performance tweaks
=========================

You might want to consider modifying the apache configuration so that mod\_mono performs better.

Keep alive
----------

The HTTP/1.1 protocol defines a theoretically performance-improving mechanism - keep alive. What it means is that the web server can keep the connection open for a while for the client to request several resources over the same connection. In reality, however, very often that feature becomes a performance killer. The reason is that each keep alive session requires the server to keep the process (or thread) busy in order for the timeout to happen or for the client to close the connection. Apache contains configuration directives to set the number of maximum clients serviced, the number of threads/processes (servers) to spawn etc (for more information see [http://httpd.apache.org/docs/2.2/](http://httpd.apache.org/docs/2.2/)). Each time a keep alive session is open and the client does not use it, Apache will still keep the server process/thread busy and thus it won't be able to accept another connection on that server - which will limit the throughput. There are two solutions to this problem. The better one, in my opinion, is to turn keep alive off completely by putting this directive somewhere in your Apache config:

    KeepAlive Off

If, however, you want to use keep alive, you might try decreasing the session timeout to a small value (for instance 2 seconds) by putting this directive in the Apache configuration:

    KeepAliveTimeout 2

MPM worker
----------

Apache 2.x comes with several processing modules (that is - servers, so-called MPMs for Multi Processing Module) implementing different server models. The one installed by default by most distributions is the `prefork` MPM which implements the traditional, one OS process per server, model and is the same what in the earlier Apache versions. Another module usually available with your distribution is the `worker` MPM. That module implements a mixed process/thread model which spawns several processes as well, but each of them can create a configurable number of service threads. It is advisable to use the `worker` MPM with mod\_mono. Unfortunately, PHP seems to not necessarily work with the `worker` MPM, so you may not be able to go this route.

Configuring Mod\_Mono
=====================

When [AutoHosting]({{site.github.url}}/old_site/AutoConfiguration) does not fit your needs, you will need to include several mod\_mono Apache directives in your main Apache configuration file (often /etc/httpd/conf/httpd.conf, or the like in /etc/apache2) to get the site running.

### Mod\_Mono Configuration Tool

The [Apache mod\_mono configuration tool](http://go-mono.com/config-mod-mono/) can generate a configuration for name-based Virtual Hosts (i.e., how this site is configured to traffic to mono-project.com, www.mono-project.com, etc), and configurations for ASP.NET Applications (what IIS traditionally referred to as a Virtual Directory), such as the mod\_mono configuration application served at [http://go-mono.com/config-mod-mono/](http://go-mono.com/config-mod-mono/)

In the simplest case, you shouldn’t have to supply the tool with anything more than a server or application name; the tool will suggest a path where you can deploy your application. With the intention of making developing and porting applications as painless as possible, the default configuration will set mod\_mono to run with both mono debugging and platform abstraction enabled. These may not be the best options for production web sites, so consider disabling those features if/when you no longer need them.

Once you’ve completed the form, the tool will generate a configuration you can save to disk (/etc/apache2/conf.d/ on SUSE/openSUSE). To begin serving your newly configured application, simply restart apache:

            sudo /sbin/service apache2 restart

### Manual Mod\_Mono Configuration

The following assumes you have included mod\_mono.conf in your main configuration file as described above. Further, it is important (as of Mono 1.2.5) to place the remaining mod\_mono directives after the User and Group directives. They can just go at the end, or inside VirtualHost sections.

A basic setup is as follows (with line numbers added for convenience):

    1   MonoAutoApplication disabled
    2   AddHandler mono .aspx .ascx .asax .ashx .config .cs .asmx .axd
    3   MonoApplications "/:/home/username/www"

The first line disables the [AutoHosting]({{site.github.url}}/old_site/AutoConfiguration) feature. (If inside a VirtualHost section, it disables it just for that virtual host).

The second line instructs Apache that processing of files with .aspx, etc. extensions should be delegated to mod\_mono (rather than Apache processing them itself as plain-text files).

The third line instructs mod\_mono that an ASP.NET application exists at the root directory of the web site (i.e. at [http://www.example.com/](http://www.example.com/)), and that this virtual path corresponds to the physical path on disk of /home/username/www. Normally, the physical path will match whatever Apache would map the given virtual path to. So if the virtual path is /, as in this example, the physical path matches what is in the DocumentRoot directive for Apache. This is important because in that virtual path, Apache itself will continue to serve images, static HTML, and other files, based on the physical path it knows in DocumentRoot, while mod\_mono will handle files with .aspx, etc. extensions (or whatever was specified in AddHandler) based on the physical path provided in the MonoApplications directive.

Here is another configuration that sets up the ASP.NET test suite that comes with mod\_mono.

Let's say you want those file to be available under the virtual path /test. Edit your httpd.conf file (hint: /etc/httpd, /etc/apache2) and append the following lines (remove the numbers ;-):

    1   Alias /test "/usr/share/doc/xsp/test"
    2   MonoApplications "/test:/usr/share/doc/xsp/test"
    3   <Location /test>
    4       SetHandler mono
    5   </Location>

Unlike the first example, this example assumes that the virtual path "/test" does not already correspond to the physical path /usr/share/doc/xsp/test. The Alias directive is a standard Apache directive to map a virtual path to a physical path. The second line creates an ASP.NET application in something other than the root virtual path. Lines 3-5 instruct Apache that absolutely all files in the /test virtual path are to be handled by mod\_mono. (mod\_mono can handle non-ASP.NET pages as well. It will just send other files to the client directly without special processing.)

Now start/restart Apache and browse [http://hostname/test/index.aspx](http://hostname/test/index.aspx) (where *hostname* is the name of the server, or 127.0.0.1 if you're running Apache locally). If you cannot see the test page, go to the troubleshooting section. Otherwise, welcome to ASP.NET!

Okay, it worked. But, what happened? When you started apache, mod\_mono launched mod-mono-server. Later, when you requested any page under /test, mod\_mono connected to mod-mono-server, forwarded the request data and retrieved the response that is sent to your browser. Finally, if you stop apache, mod\_mono will tell mod-mono-server to die.

It is possible to put these directives inside a VirtualHost section as well.

If your site uses .NET 2.0 classes, you will need to instruct mod\_mono to spawn the .NET 2.0 version of mod-mono-server, instead of the default .NET 1.1 version. To do that, use the following, changing the path to mod-mono-server2 as needed:

    MonoServerPath /usr/bin/mod-mono-server2

If you use AddHandler you might want to let mod-mono-server know about your DirectoryIndex directive by doing something like this in your web.config file:

``` xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
<appSettings>
<add key="MonoServerDefaultIndexFiles" value="mywierdindexfile.html,index.aspx" />
</appSettings>
</configuration>
```

More on Applications
--------------------

How do you go about making mod\_mono handle several applications? Let's try the easiest option. You will need this in your httpd.conf:

    1   Alias /test "/usr/share/doc/xsp/test"
    2   Alias /personal "/home/user/mypages"
    3   AddMonoApplications default "/test:/usr/share/doc/xsp/test,/personal:/home/user/mypages"
    4   <Location /test>
    5       SetHandler mono
    6   </Location>
    7   <Location /personal>
    8       SetHandler mono
    9  </Location>

The significant change is in line 4:

    AddMonoApplications "/test:/usr/share/doc/xsp/test,/personal:/home/user/mypages"

        ...is equivalent to...

    AddMonoApplications "/test:/usr/share/doc/xsp/test"
    AddMonoApplications "/personal:/home/user/mypages"

This way you can keep all the configuration related to an application in a separate file (Alias, AddMonoApplications, Location,...).

If you serve mod\_mono applications in multiple virtual hosts, you can use this syntax:

    AddMonoApplications "www.example.com:/:/home/exampledotcom/www"
    AddMonoApplications "www.sample.com:/:/home/sampledotcom/www"

The above example instructs mod-mono-server to create two applications, one mapping [http://www.example.com/](http://www.example.com/) to /home/exampledotcom/www and the other mapping [http://www.sample.com/](http://www.sample.com/) to /home/sampledotcom/www.

Multiple Applications, Multiple mod-mono-servers
------------------------------------------------

You might want to run different applications in different instances of mod-mono-server. There are a number of reasons for doing this:

-   If you want to run a production and testing environments.
-   You need completely separate Mono instances running.
-   If you don't want Session or Application level objects to be shared among applications or that you want to set certain memory or CPU usage restrictions for an application.

Let's see the configuration needed to achieve this separation for the two applications in the previous example. (Alias directives are omitted for brevity, and this example assumes the AddHandler directive has been used to associate ASP.NET file extensions with mod\_mono.)

    1   MonoApplications testing "/test:/usr/share/doc/xsp/test"
    2   <Location /test>
    3      MonoSetServerAlias testing
    4   </Location>
    5
    6   MonoApplications personal "/personal:/home/user/mypages"
    7   <Location /personal>
    8      MonoSetServerAlias personal
    9   </Location>

When (Add)MonoApplications is given two arguments, the first argument is understood as a name or alias for a particular instance of the mod-mono-server backend. With this configuration mod\_mono will start two instances of mod-mono-server whose aliases are 'testing' and 'personal'. The 'testing' instance will handle /test and the 'personal' instance will handle /personal.

MonoSetServerAlias tells mod\_mono which instance of mod-mono-server will be used to process the requests for this \<Location\>. It can be used with apache \<Directory\> too.

The alias used when no alias is provided, as in the earlier examples, is "default". All of the mod\_mono directives below that show an alias as the first argument also can be specified by leaving the alias out, in which case the "default" alias is used.

Control panel
-------------

mod\_mono provides a simple web-based control panel for restarting the mod-mono-server, which is useful when assemblies need to be reloaded from disk after they have been changed. To activate the control panel, place the following in your httpd.conf:

    <Location /mono>
      SetHandler mono-ctrl
      Order deny,allow
      Deny from all
      Allow from 127.0.0.1
    </Location>

The Order/Deny/Allow access controls above restrict access to the control panel to the computer with IP address 127.0.0.1. Replace this (or add more Allow lines) with the IP address of your own computer so that you can access the control panel. Note that anyone on the machine 127.0.0.1 will have the ability to affect any configured mod\_mono applications. (These directives placed in a VirtualHost section allow access to only mod\_mono applications configured within that virtual host.)

The control panel is then accessible at [http://yourdomain.com/mono](http://yourdomain.com/mono). It allows you to:

-   Restart mod-mono-server backends for all or individual applications.
-   Stop or resume handling pages for all or individual applications.
-   See how many concurrent requests are currently being processed.
-   See how many requests are waiting to be processed, according to the MonoMaxActiveRequests directive (explained below).
-   See how many requests have been served since the last restart if the MonoAutoRestartMode Requests directive is used (explained below).
-   See how much time has elapsed since the last restart if the MonoAutoRestartMode Time directive is used (explained below).

Advanced options
================

Automatic restart of the mod-mono-server backend
------------------------------------------------

mod\_mono can automatically restart the Mono (mod-mono-server) backend that is handling requests after a certain amount of time. This is useful if you find that the mono process is growing indefinitely over time, or if you just need to make sure you clean house every so often.

There are two automatic restart methods: one based on time, and one based on the number of requests served. You can active them as follows:

    # Auto-restart after three hours.
    1 MonoAutoRestartMode Time
    2 MonoAutoRestartTime 00:03

The time format above is DD[:HH[:MM[:SS]]].

    # Auto-restart after 10,000 requests served.
    1 MonoAutoRestartMode Requests
    2 MonoAutoRestartRequests 10000

As with most other mod\_mono directives, the first parameter to a directive can be the name or alias of a mod-mono-server. This is always optional and is omitted in the examples above.

Limiting the number of concurrent requests
------------------------------------------

The number of concurrent requests that can be processed by the mod-mono-server backend is limited by the size of the ThreadPool, and you could [experience deadlocks]({{site.github.url}}/old_site/Article:ThreadPool_Deadlocks) when too many requests are going at once. As a result of the deadlocks, Apache child process instances that are processing requests get backed up until no more incoming HTTP connections can be made (even for any virtual host).

mod\_mono will limit the number of concurrent requests that are passed off to mod-mono-server, and when the limit is reached, incoming requests wait for a certain amount of time until more requests can be passed off to the backend. The default limit of concurrent requests is 20, and the default limit of requests waiting to be passed off to the backend is 20. This should be just below the amount mod-mono-server can process without reaching the ThreadPool limit on a single processor machine.

To adjust the limits, use these directives:

    1 MonoMaxActiveRequests 20
    1 MonoMaxWaitingRequests 20

A value of zero disables the limits.

To adjust the number of threads in the threadpool, you have two choices: this can be either configured as part of your ASP.NET application configuration or it can be made global to Mono. you can do this by using the MONO\_THREADS\_PER\_CPU environment variable, the default being 50 (25 on windows):

``` bash
export MONO_THREADS_PER_CPU=2000
```

If you are using Mono from [Apache](http://www.apache.org/) to run ASP.NET, you can use the MonoSetEnv configuration option in Apache:

    MonoSetEnv MONO_THREADS_PER_CPU=2000

For ASP.NET applications it's also a good idea to tweak the default values found in machine.config, inside \<system.web\> section:

``` xml
    <httpRuntime executionTimeout="90"
           maxRequestLength="4096"
           useFullyQualifiedRedirectUrl="false"
               minFreeThreads="8"
           minLocalRequestFreeThreads="4"
           appRequestQueueLimit="100" />
```

Setting hard memory and time limits
-----------------------------------

Here's an example on how to set memory and CPU limits for a given server:

    1   LoadModule mono_module modules/mod_mono.so
    2   Alias /jeanette "/home/jeanette/web"
    3   AddMonoApplications jeanette "/jeanette:/home/jeanette/web"
    4   MonoMaxMemory jeanette 200000000
    5   MonoMaxCPUTime jeanette 3600
    6   <Location /jeanette>
    7       MonoSetServerAlias jeanette
    8       SetHandler mono
    9   </Location>

Lines 4 and 5 set the maximum memory to be used (bytes) and the maximum CPU time consumed (seconds) by the 'jeanette' mod-mono-server instance. After reaching the limit, the OS will kill mod-mono-server. A new instance should start automatically on the next request. (But, JT notes that these directives don't work at all for him.)

Unix and TCP sockets
--------------------

We said that mod\_mono and mod-mono-server can use a unix or a TCP socket to sent data back and forth. Use of unix sockets is the default, but you can use a TCP socket in case you have several computers running apache and one single machine providing mod-mono-server services.

The only parameter that you can control when using a unix socket is the file name. The directive is *MonoUnixSocket*:

        LoadModule mono_module modules/mod_mono.so

        Alias /julia "/home/julia/web"
        AddMonoApplications default "/julia:/home/julia/web"
        # When no MonoUnixSocket is provided, the default
        # is /tmp/mod_mono_server[_alias]
        # In this case, for the 'default' alias: /tmp/mod_mono_server
        <Location /julia>
            SetHandler mono
        </Location>

        Alias /jennie "/home/jennie/web"
        AddMonoApplications jennie "/jennie:/home/jennie/web"
        # In this case, alias 'jennie': /tmp/mod_mono_server_jennie
        <Location /jennie>
            MonoSetServerAlias jennie
            SetHandler mono
        </Location>

        Alias /juno "/home/juno/web"
        AddMonoApplications juno "/juno:/home/juno/web"
        # Uses a file under juno's home directory
    -   MonoUnixSocket juno /home/juno/tmp/juno_server
        <Location /juno>
            MonoSetServerAlias juno
            SetHandler mono
        </Location>

You can set the file name to whatever you want as long as the user running apache has the necessary permissions to create and remove that file.

In order to run an instance of mod-mono-server that listens on a TCP socket, there's a mandatory *MonoListenPort*directive and an optional *MonoListenAddress*. See them in action:

        LoadModule mono_module modules/mod_mono.so

        Alias /jazmin "/home/jazmin/web"
        AddMonoApplications jazmin "/jazmin:/home/jazmin/web"
        # 'jazmin' mod-mono-server will be listening on
        # port 9000, address 127.0.0.1
    -   MonoListenPort jazmin 9000
        <Location /jazmin>
            MonoSetServerAlias jazmin
            SetHandler mono
        </Location>

        Alias /joan "/home/joan/web"
        AddMonoApplications joan "/joan:/home/joan/web"
        # 'joan' mod-mono-server will be listening on
        # port 7000, any address (0.0.0.0)
    -   MonoListenPort joan 7000
    -   MonoListenAddress joan 0.0.0.0
        <Location /joan>
            MonoSetServerAlias joan
            SetHandler mono
        </Location>

*MonoUnixSocket* and *MonoListenPort* are mutually exclusive. Don't use both.

Paths
-----

In case it is needed, you can provide alternative locations for mod-mono-server. Other directories containing assemblies that mono could not find in the default search paths can also be specified. Mono needs a writable directory used by the windows I/O emulation layer that is usually in the user's home .wapi directory (\$HOME/.wapi). In mod\_mono, the directory where .wapi is created is set to /tmp, but you can change that too.

        LoadModule mono_module modules/mod_mono.so

        Alias /jane "/home/jane/web"
        AddMonoApplications jane "/jane:/home/jane/web"

        MonoServerPath jane /nfs/mono-1.1.17/mod-mono-server

        <Location /jane>
            MonoSetServerAlias jane
            SetHandler mono
        </Location>

        Alias /jackie "/home/jackie/web"
        AddMonoApplications jackie "/jane:/home/jackie/web"

        # This uses mono from SVN and the ASP.NET 2.0 mod-mono-server
        MonoServerPath jackie /svn/install/bin/mod-mono-server2

        #
        # Add this directories to the default paths searched by mono
        # when looking for assemlies
        MonoPath jackie "/home/jackie/NET/assemblies:/usr/local/assemblies"
        # The .wapi directory will be created in /home/jackie
        MonoWapidir jackie "/home/jackie"
        <Location /jackie>
            MonoSetServerAlias jackie
            SetHandler mono
        </Location>

Troubleshooting
===============

ASP.NET 2 applications do not work
----------------------------------

If your site uses .NET 2.0 classes, you will need to instruct mod\_mono to spawn the .NET 2.0 version of mod-mono-server, instead of the default .NET 1.1 version. To do that, use the following, changing the path to mod-mono-server2 and the alias as needed:

    MonoServerPath default /usr/bin/mod-mono-server2

Access forbidden
----------------

If you're getting a 403 response from apache that probably means that the user running apache does not have proper permissions to read the physical directory. Check the permissions on all the directories and the files and make then readable by the user running apache.

mod-mono-server does not start
------------------------------

Check the apache error\_log file (/var/log/apache2/error\_log ...). It might contain some hints on what's happening. Possible causes are that mono or mod-mono-server are not found in the path, that a file with the same name as the unix socket mod-mono-server tries to create already exists and mod-mono-server can't remove it or a stale .wapi directory.

Restarting apache does not kill the spawned mod-mono-server.exe(s)
------------------------------------------------------------------

Use 'apachectl reload' instead of 'apachectl restart'. There is some problem (may be fixed in apache 2.0.54) that made 'restart' not work properly.

Problems with mod\_mono and cookie-less sessions
------------------------------------------------

For cookie-less sessions to work, you need to use **SetHandler**. AddHandler won't work.

Under high load, mono process consumes a lot of memory, website stops responding
--------------------------------------------------------------------------------

These symptoms have been reported, but their underlying causes are not known. Set the MonoAutoRestartMode, MonoAutoRestartRequests, MonoMaxActiveRequests, and MonoMaxWaitingRequests directives as described earlier to limit the lifetime of the mono process and to restrict the concurrency happening in the server.

mod\_mono on Windows
====================

For a Windows port of mod\_mono, see [here](http://dev.anmar.eu.org/mono/mod_mono/). This is a work in progress.

Profiling mod-mono-server
=========================

If you want to find the bottleneck in you ASP.NET application using mod\_mono, and assuing you're letting mod\_mono start mod-mono-server, you'll need to follow these steps:

1.  Start apache.
2.  Run 'ps aux' and copy the command line used to run mod-mono-server.exe
3.  Stop apache
4.  With the same user that runs apache, run the command line copied in 2 adding the '--profile' parameter to mono.
5.  Start apache.
6.  Do a few requests (they will take a lot to process).
7.  Stop apache
8.  mod-mono-server will stop and you'll get profile output.

Note that when --profile is enabled, mono is \*extremely\* slow. Do as many request as you need to get a result that excludes start up stuff.

Compiling mod\_mono From Source
===============================

If you already have installed mod\_mono as a package, skip this section.

Before compiling mod\_mono, you need the development packages for apache installed (apache-dev...). You should have a file called mod\_mono-X.Y.Z.tar.gz at this stage. Follow these steps:

``` bash
    $ tar xzf mod_mono-X.Y.Z.tar.gz
    $ cd mod_mono-X.Y.Z
(1) $ ./configure
    $ make
(2) $ sudo make install
```

There are a few interesting options for (1) that you might want/need to use:

--prefix= /xxx/yyy   
This will set the base path for installing mod\_mono files.

--with-mono-prefix= /aaa/bbb   
If the prefix for mod\_mono is different from the one used for mono, you should set this to the prefix used for mono in order to make the default paths to mono executable and mod-mono-server.exe be correct. It is not mandatory, but useful.

--with-apxs= /xxx/yyy/apxs   
If your system has different apache development files installed (ie, 1.3, 2.0 or 2.2) you might need this to choose the target version for mod\_mono. Provide the full path to the apxs executable of the version that you want.

--with-apr-config= /xxx/yyy   
If you get errors when compiling for apache 2 because some headers files are not found, use this option. It takes the full path to apache 2 apr-config tool.

--enable-debug   
You will get more output in the apache error\_log file. Useful when debugging.

Improving mod\_mono
===================

See our [Improving mod\_mono]({{site.github.url}}/old_site/ImprovingModMono "ImprovingModMono") page for details on things that could be improved in the module.

