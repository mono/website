---
layout: obsolete
title: "VSIntegration"
lastmodified: '2008-12-05'
permalink: /old_site/VSIntegration/
redirect_from:
  - /VSIntegration/
---

VSIntegration
=============

This is a plan to define what needs to be done for a Visual Studio add-in that would allow Visual Studio developers to target Linux and Mono.

Once the plugin is installed, the following should be possible from Visual Studio:

-   Deploying:
    -   Deploying an ASP.NET application to a remote Linux/Mono installation
    -   Deploying a Windows.Forms application to a remote Linux/Mono installation
-   Execution
    -   Windows.Forms applications started remotely (ssh + mono app.exe)
    -   ASP.NET applications started remotely (deploy + launch local web browser).
-   Debugging
    -   Debugging symbols converted from PDB to MDB (Robert Jordan's tool) during deployment (done in MonoVS/MonoAddin).
    -   Executables, libraries, symbols and config files from bin/Debug transfered to the remote Linux system.
        -   Might want to use zsync, but we need to implement Content-Range: support in HttpListener.
        -   A simple SCP would do, perhaps in the future "rsync" could be used.
        -   This tool runs on Windows, uses the MS APIs to read PDBs, and Mono APIs to generate the MDBs
    -   Run .NET applications under the debugger
        -   This can probably be done entirely in C\# using the [DebugEngineSample](http://code.msdn.microsoft.com/debugenginesample/Release/ProjectReleases.aspx?ReleaseId=501) as a reference.
        -   Write/design a protocol to communicate between VS and the remote debugger
        -   Remote debugger is a thin wrapper around Mono.Debugger.dll
        -   Use the Mono.Debugger.dll library to host the process
    -   Start Windows.Forms application connected to the Visual Debugger.
    -   Start an ASP.NET application connected to the Visual Studio Debugger.
-   Packaging
    -   Create [Mono-compliant deployments]({{ site.github.url }}/old_site/Guidelines:Application_Deployment "Guidelines:Application Deployment") of .NET executables
    -   Create RPM and DEB packages for various distributions
        -   It could be easy to ship tools that do both on a single system
        -   Alternatively, for open source software, expose the openSUSE Build Service


