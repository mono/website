---
title: "FAQ: MonoVS"
lastmodified: '2010-07-28'
redirect_from:
  - /FAQ:_MonoVS/
---

FAQ: MonoVS
===========

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#general">1 General</a></li>
<li><a href="#running-on-mono">2 Running on Mono</a></li>
<li><a href="#packaging">3 Packaging</a></li>
</ul></td>
</tr>
</tbody>
</table>

General
-------

**How do I find out the IP address and port used by the server?**

Right click on the server's tray icon and select "Preferences." Then click on the networking tab. This will display the port and all of the IP addresses that the server is accessible on.

**My server isn't showing up in the server browser dialog**

If your server isn't being discovered (which could be due to firewalls), you can manually enter your server's IP address. The default port used by the server is 8805.

**My server is showing up with the wrong IP address**

This is generally caused by NAT, which masks the server's true IP address. You can manually enter your server's real IP address.

**I selected "Always use this host", how do I change my host?**

This can be reset from:

-   Tools
-   Options
-   Mono (You may need to enable "Show all settings")
-   Check "Run host selector at startup"

**I'm running a firewall on Linux, what ports do I need to open?**

-   8805 - monovs-server.exe server
-   8806-8815 - session threads
-   8816-8872 - xsp hosting ports

If you want to use different ports, you can change them in the configuration files:

-   /usr/lib/monovs-gui-server.exe.config for the GUI version
-   /usr/lib/monovs-server.exe.config for the command line version

**What are the passwords for the MonoVS virtual machine image?**

-   The default account is rupert/mono.
-   The root account is root/mono.

Running on Mono
---------------

**How can I see output/enter input to a console program?**

-   Go to the Linux VM
-   Right click the Mono icon in the bottom right.
-   Choose "Run in Terminal"

Now when you run your program, a console will appear on the Linux VM you can interact with.

**Where does my application get put on Linux when I run/debug remotely?**

Your application gets placed in: /tmp/monovs-{random-guid}

However, it is only there until you stop running it. Once you close it via the tray icon on windows or the application finished running, it will delete this directory (or else it would fill up your hard drive).

If you don't want it to get deleted on completion, you can change the "Delete_Temp_Directory" setting in the configuration files:

-   /usr/lib/monovs-gui-server.exe.config for the GUI version
-   /usr/lib/monovs-server.exe.config for the command line version

**I reference a .dll in the GAC in my web.config that isn't available when I run in Mono**

There are a couple of options here.

##### - Place a copy of the .dll in the Mono GAC

On Windows:

``` bash
mono gacutil -i MyAssembly.dll
```

On Linux:

``` bash
gacutil -i MyAssembly.dll
```

##### - Add a project reference to the .dll

-   Right click on References.
-   Add a reference to the .dll.
-   In the properties for the .dll, set Copy Local = true.

##### - Place a copy of the .dll in your website's Bin folder

Packaging
---------

**Can I create packages for Ubuntu/Debian?**

At this time, we only support creating packages for SUSE Linux (.rpm). Creating packages for Ubuntu/Debian (.deb) is something we will definitely be considering for a future release.

**How can I package a precompiled version of my web site?**

If you are using the "Precompile Web Applications" option when running and debugging your ASP.NET solutions, you should package a precompiled version of your solution to ensure the same behavior within the packaged solution. This can be done in the "Files" tab of Package Configuration wizard by clicking the "Precompile this website to a temporary location and add files to list" link at the bottom of the form.

