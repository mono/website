---
layout: obsolete
title: "FastCGI Abyss"
lastmodified: '2008-06-25'
permalink: /old_site/FastCGI_Abyss/
redirect_from:
  - /FastCGI_Abyss/
---

FastCGI Abyss
=============

by Brian Nickel \<[http://kerrick.wordpress.com](http://kerrick.wordpress.com)\>

Information on how to configure the [FastCGI]({{site.github.url}}/old_site/FastCGI "FastCGI") support for the Abyss server.

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
<li><a href="#general-warnings">2 General Warnings</a>
<ul>
<li><a href="#step-1-setting-up-the-interpreter">2.1 Step 1: Setting Up the Interpreter</a></li>
<li><a href="#step-2-extending-the-server-lifetime">2.2 Step 2: Extending the Server Lifetime</a></li>
<li><a href="#step-3-disabling-directory-listing">2.3 Step 3: Disabling Directory Listing</a></li>
</ul></li>
<li><a href="#using-extensions">3 Using Extensions</a>
<ul>
<li><a href="#warnings">3.1 Warnings</a></li>
<li><a href="#step-1-setting-up-the-interpreter_2">3.2 Step 1: Setting Up the Interpreter</a></li>
<li><a href="#step-2-extending-the-server-lifetime_2">3.3 Step 2: Extending the Server Lifetime</a></li>
<li><a href="#step-3-adding-index-pages">3.4 Step 3: Adding Index Pages</a></li>
</ul></li>
<li><a href="#bada-bing">4 Bada Bing!</a></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
------------

[Abyss Web Server](http://www.aprelium.com/) is a easy to use and feature rich Web Server. Although closed source, the X1 server is *"a free and fully functional software: no nag screens, no time limitations, no spyware, and no advertisements."* ([Download](http://www.aprelium.com/abyssws/download.php))

 True to its claims of "ease of use", Abyss was the easiest server to set up thus far. This is largely due to its simple and straightforward control center.

### Configuration Tested On...

-   [OpenSuSE 10.2](http://en.opensuse.org/OpenSUSE_News/10.2-Release) (Abyss X1)\</li\>
-   *If you have tested an additional configuration, please email me at [brian.nickel@gmail.com](mailto:brian.nickel@gmail.com).*

General Warnings
----------------

Before doing anthing else, you should read [FastCGI\#Important\_Information]({{site.github.url}}/old_site/FastCGI#important-information "FastCGI") section on the main FastCGI page.

### Step 1: Setting Up the Interpreter

Upon starting the Abyss Web Server, a control center web server starts up as well, by default at <http://localhost:9999>. Simply open it up in your web browser to that address and follow the steps outlined below:

1.  Click "Configure" on the host you wish to add ASP.NET support to.
2.  Click on "Scripting Parameters".
3.  Click on "Add" in the "Interpreters" box.
4.  You are now on the page to add the ASP.NET interpretter. The two options I would recommend are "FastCGI (Local - Pipes)" and "FastCGI (Remote - TCP/IP sockets)":
    -   **FastCGI (Local - Pipes)** - Abyss will start the Mono server by itself using a piped socket. Pipes are the fastest way to communicate and having the Abyss spawn its own server means you don't have to do it manually. This is possibly the simplest option.
        If using this option, simply set "Interpreter" to "/usr/bin/fastcgi-mono-server" or "/usr/bin/fastcgi-mono-server2".
    -   **FastCGI (Remote - TCP/IP sockets)** - Abyss will look for the Mono server at a specified IP address and port. You can use this to run the server on another machine and redistribute the processor load. The only caveat is that you will need to start the Mono server on the other computer manually, using a command like "`fastcgi-mono-server2 /socket=tcp:8002`"
        If using this option, simply set "Remote server IP Address" to the IP address of the machine running the Mono server, and "Port" to the port you used in the command line. For the command line shown above, this would be 8002.

5.  Uncheck "Check for file existence before execution". This option improves performance but can cripple ASP.NET 2.0 as it sometimes uses paths that don't necessarily exist like WebResource.axd.
6.  Uncheck "Use the associated extensions to automatically update the Script Paths".
7.  Add "\*" to "Extensions". It is not a real, but it'll be used to make sure all requests are directed at the FastCGI Mono Server.
8.  Click "OK".
9.  You should have automatically returned to "Scripting Parameters". Click on "Add" in the "Script Paths" box.
10. Enter "/\*" in "Virtual Path".
11. Click "OK".

### Step 2: Extending the Server Lifetime

Upon completion of the previous step, you should have automatically returned to "Scripting Parameters". Click on "Edit..." next to "FastCGI Parameters". The option "FastCGI Processes Timeout" specifies the number of seconds after the last request you're going to want to wait before shutting down the Mono (or any) FastCGI server. Because ASP.NET pages need to recompiled and AppDomains need to be recreated every time the server starts up, you want to set this value to some arbitrarily high value. 604800 is the number of seconds in a week and the value I chose for my server. Once you've chosen your value, click "OK".

### Step 3: Disabling Directory Listing

Upon completion of the previous step, you should have automatically returned to "Scripting Parameters". Click "OK" at the bottom of the page to get back to the host configuration page. Once there, click "Directory Listing" and proceed to set "Type" to "Disabled". If directory listing is enabled, paths aren't automatically sent to the FastCGI Mono Server.

Using Extensions
----------------

### Warnings

**Using Extensions in place place of paths is NOT recommended.** Please consult [FastCGI\#Paths\_vs.\_Extensions]({{site.github.url}}/old_site/FastCGI#paths-vs-extensions "FastCGI") on the main page for an in depth explanation. If you decide to use this configuration, please bear in mind that it is less secure suffers additional disadvantages when compared to using paths.

### Step 1: Setting Up the Interpreter

Upon starting the Abyss Web Server, a control center web server starts up as well, by default at <http://localhost:9999>. Simply open it up in your web browser to that address and follow the steps outlined below:

1.  Click "Configure" on the host you wish to add ASP.NET support to.
2.  Click on "Scripting Parameters".
3.  Click on "Add" in the "Interpreters" box.
4.  You are now on the page to add the ASP.NET interpretter. The two options I would recommend are "FastCGI (Local - Pipes)" and "FastCGI (Remote - TCP/IP sockets)":
    -   **FastCGI (Local - Pipes)** - Abyss will start the Mono server by itself using a piped socket. Pipes are the fastest way to communicate and having the Abyss spawn its own server means you don't have to do it manually. This is possibly the simplest option.
        If using this option, simply set "Interpreter" to "/usr/bin/fastcgi-mono-server" or "/usr/bin/fastcgi-mono-server2".
    -   **FastCGI (Remote - TCP/IP sockets)** - Abyss will look for the Mono server at a specified IP address and port. You can use this to run the server on another machine and redistribute the processor load. The only caveat is that you will need to start the Mono server on the other computer manually, using a command like "`fastcgi-mono-server2 /socket=tcp:8002`"
         If using this option, simply set "Remote server IP Address" to the IP address of the machine running the Mono server, and "Port" to the port you used in the command line. For the command line shown above, this would be 8002.

5.  Uncheck "Check for file existence before execution". This option improves performance but can cripple ASP.NET 2.0 as it sometimes uses paths that don't necessarily exist like WebResource.axd.
6.  Add the following extensions:
    -   aspx
    -   asmx
    -   ashx
    -   asax
    -   ascx
    -   soap
    -   rem
    -   axd
    -   cs
    -   config
    -   dll

7.  Click "OK".

### Step 2: Extending the Server Lifetime

Upon completion of the previous step, you should have automatically returned to "Scripting Parameters". Click on "Edit..." next to "FastCGI Parameters". The option "FastCGI Processes Timeout" specifies the number of seconds after the last request you're going to want to wait before shutting down the Mono (or any) FastCGI server. Because ASP.NET pages need to recompiled and AppDomains need to be recreated every time the server starts up, you want to set this value to some arbitrarily high value. 604800 is the number of seconds in a week and the value I chose for my server. Once you've chosen your value, click "OK".

### Step 3: Adding Index Pages

Upon completion of the previous step, you should have automatically returned to "Scripting Parameters". Click "OK" at the bottom of the page to get back to the host configuration page. Once there, click "Index Files" and proceed to add `index.aspx`, `default.aspx`, and `Default.aspx`. Click "OK" and then "Reset" to restart the web server.

Bada Bing!
----------

You should now have ASP.NET working with Abyss Web Server. Enjoy!

