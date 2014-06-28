---
layout: obsolete
title: "FastCGI Cherokee"
lastmodified: '2008-06-25'
permalink: /old_site/FastCGI_Cherokee/
redirect_from:
  - /FastCGI_Cherokee/
---

FastCGI Cherokee
================

by Brian Nickel \<[http://kerrick.wordpress.com](http://kerrick.wordpress.com)\>

Information on how to configure the [FastCGI]({{ site.github.url }}/old_site/FastCGI "FastCGI") support for the Cherokee server.

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
<li><a href="#using-paths-recommended">3 Using Paths [Recommended]</a>
<ul>
<li><a href="#warnings">3.1 Warnings</a></li>
<li><a href="#step-1-setting-up-the-handler">3.2 Step 1: Setting Up the Handler</a></li>
</ul></li>
<li><a href="#using-extensions">4 Using Extensions</a>
<ul>
<li><a href="#warnings_2">4.1 Warnings</a></li>
<li><a href="#step-1-setting-up-the-handler_2">4.2 Step 1: Setting Up the Handler</a></li>
<li><a href="#step-2-adding-index-pages">4.3 Step 2: Adding Index Pages</a></li>
</ul></li>
<li><a href="#bada-bing">5 Bada Bing!</a></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
------------

[Cherokee HTTP Server](http://www.cherokee-project.com/) is a very fast, flexible and easy to configure Web Server. Adding ASP.NET support through `fastcgi-mono-server` is very simple and requires modification of only one file. As late as Cherokee 0.5.6, the FastCGI extension fails to send and empty Record when the request contains no input. `fastcgi-mono-server` does not currently work around this. **This documentation is for the [0.6.0 series](http://www.cherokee-project.com/download/0.6/0.6.0/).**

### Configuration Tested On...

1.  [OpenSuSE10.2](http://en.opensuse.org/OpenSUSE_News/10.2-Release) (Cherokee 0.6.0b700 from its YaST repository)
2.  *If you have tested an additional configuration,please email me at [brian.nickel@gmail.com](mailto:brian.nickel@gmail.com).*

General Warnings
----------------

Before doing anthing else, you should read "[FastCGI\#ImportantInformation]({{ site.github.url }}/old_site/FastCGI#importantinformation "FastCGI")" on the main page.

Using Paths [Recommended]
-------------------------

### Warnings

**Not all the kinks of using the FastCGI Mono Server as a directory handler have been worked out.** Notably some test pages still aren't working and there appears to be some problems with running several concurrent requests.

### Step 1: Setting Up the Handler

All configuration is done in [file:///etc/cherokee/cherokee.conf /etc/cherokee/cherokee.conf] or [file:///usr/etc/cherokee/cherokee.conf /usr/etc/cherokee/cherokee.conf]. The following block can be inserted anywhere, but most appropriately near the bottom of the file.

    vserver!default!directory!/!handler = fcgi
    vserver!default!directory!/!handler!balancer = round_robin
    vserver!default!directory!/!handler!balancer!type = interpreter
    vserver!default!directory!/!handler!balancer!local1!host = localhost:8002
    vserver!default!directory!/!handler!balancer!local1!interpreter = /usr/bin/fastcgi-mono-server /socket=tcp:8002
    vserver!default!directory!/!priority = 99999

Yep, Cherokee's new format does take a few more bytes than it used to, but what can you do? This configuration tells Cherokee to look for the server at localhost:8002 and if it doesn't find it, spawn a new server using the command line:

    /usr/bin/fastcgi-mono-server /socket=tcp:8002

A few changes can be made to this. First, you can switch to the **.NET 2.0** runtime by calling "`fastcgi-mono-server2`" instead in the "`local1!interpreter`" line. Second, you can change the port. You may have another server using 8002, so you can change the port to whatever number you want (less than 65536). Just make sure, you update the port on both the "`local1!host`" line and "`local1!interpreter`" line otherwise you'll keep trying to spawn a host you can't use.

The third and biggest change is to not spawn a host at all, but instead use an existing host. To do this, you must manually start the Mono server as shown above, remove the "`local1!interpreter`" line, and update the "`local1!host`" line to the resolvable hostname or IP address and port of the server. For example, "`192.168.0.123:8002`" or "`monohost.localnetwork:8002`".

Using Extensions
----------------

### Warnings

**Using Extensions in place place of paths is NOT recommended.** Please consult "[../index.html\#info1 Paths vs. Extensions]" on the main page for an in depth explanation. If you decide to use this configuration, please bear in mind that it is less secure suffers additional disadvantages when compared to using paths.

### Step 1: Setting Up the Handler

All configuration is done in [file:///etc/cherokee/cherokee.conf /etc/cherokee/cherokee.conf] or [file:///usr/etc/cherokee/cherokee.conf /usr/etc/cherokee/cherokee.conf]. The following block can be inserted anywhere, but most appropriately near the bottom of the file.

    vserver!default!extensions!aspx,asmx,ashx,asax,ascx,soap,rem,axd,cs,config,dll!handler = fcgi
    vserver!default!extensions!aspx,asmx,ashx,asax,ascx,soap,rem,axd,cs,config,dll!handler!balancer = round_robin
    vserver!default!extensions!aspx,asmx,ashx,asax,ascx,soap,rem,axd,cs,config,dll!handler!balancer!type = interpreter
    vserver!default!extensions!aspx,asmx,ashx,asax,ascx,soap,rem,axd,cs,config,dll!handler!balancer!local1!host = localhost:8002
    vserver!default!extensions!aspx,asmx,ashx,asax,ascx,soap,rem,axd,cs,config,dll!handler!balancer!local1!interpreter = /usr/bin/fastcgi-mono-server /socket=tcp:8002
    vserver!default!extensions!aspx,asmx,ashx,asax,ascx,soap,rem,axd,cs,config,dll!priority = 99999

Yep, Cherokee's new format does take a few more bytes than it used to, but what can you do? This configuration tells Cherokee to look for the server at localhost:8002 and if it doesn't find it, spawn a new server using the command line:

    /usr/bin/fastcgi-mono-server /socket=tcp:8002

A few changes can be made to this. First, you can switch to the **.NET 2.0** runtime by calling "`fastcgi-mono-server2`" instead in the "`local1!interpreter`" line. Second, you can change the port. You may have another server using 8002, so you can change the port to whatever number you want (less than 65536). Just make sure, you update the port on both the "`local1!host`" line and "`local1!interpreter`" line otherwise you'll keep trying to spawn a host you can't use.

The third and biggest change is to not spawn a host at all, but instead use an existing host. To do this, you must manually start the Mono server as shown above, remove the "`local1!interpreter`" line, and update the "`local1!host`" line to the resolvable hostname or IP address and port of the server. For example, "`192.168.0.123:8002`" or "`monohost.localnetwork:8002`".

### Step 2: Adding Index Pages

Once you have finished Step 1, you should have a working ASP.NET server with one exception, if you look at a folder like "/", you'll get a 503 error or directory listing instead of "default.aspx". To fix this, you need modify `vserver!default!directory_index`. You'll probably see the following block:

    vserver!default!directory_index = index.php,index.html

You will need to modify it so it includes "index.aspx" and "default.aspx". For example,

    vserver!default!directory_index = index.php,index.html<b>,index.aspx,default.aspx</b>

Bada Bing!
----------

You should now have ASP.NET working with Cherokee. Enjoy!

