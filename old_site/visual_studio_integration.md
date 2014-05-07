---
layout: obsolete
title: "Visual Studio Integration"
permalink: /old_site/Visual_Studio_Integration/
redirect_from:
  - /Visual_Studio_Integration/
---

Visual Studio Integration
=========================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#Goals">1 Goals</a>
<ul>
<li><a href="#Experience">1.1 Experience</a>
<ul>
<li><a href="#One_Click_Execution">1.1.1 One Click Execution</a></li>
</ul></li>
<li><a href="#Issues">1.2 Issues</a>
<ul>
<li><a href="#Deployment">1.2.1 Deployment</a></li>
<li><a href="#Linux_Firewall_Configuration">1.2.2 Linux Firewall Configuration</a></li>
<li><a href="#Locating_Linux_Hosts">1.2.3 Locating Linux Hosts</a></li>
<li><a href="#Launching_Programs_in_Linux">1.2.4 Launching Programs in Linux</a></li>
</ul></li>
</ul></li>
<li><a href="#Design_Considerations">2 Design Considerations</a>
<ul>
<li><a href="#Questions.2C_questions">2.1 Questions, questions</a></li>
</ul></li>
<li><a href="#Implementation_How-to">3 Implementation How-to</a>
<ul>
<li><a href="#Deploying_Web_Projects">3.1 Deploying Web Projects</a>
<ul>
<li><a href="#Daemon_Actions">3.1.1 Daemon Actions</a></li>
<li><a href="#Add-in_configuration_.2F_options">3.1.2 Add-in configuration / options</a></li>
</ul></li>
<li><a href="#Deploying_Winforms_Projects">3.2 Deploying Winforms Projects</a>
<ul>
<li><a href="#Add-in_configuration_.2F_options_2">3.2.1 Add-in configuration / options</a></li>
</ul></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Goals
=====

See the section on [Design Considerations](#Design_Considerations) below for more information as to what our use cases for the Visual Studio Integration should be.

There is also a [Getting Started]({{site.github.url}}/old_site/GettingStartedWithMonoTools) guide for MonoVS.

Experience
----------

Some tenets:

-   One click execution

### One Click Execution

We need to minimize the configuration and installation process to have as few dependencies on both Windows and Linux. We should not require the user to install a plurality of tools and packages before they can get up and running with the Mono Visual Studio Integration and Linux.

The configuration should consist of:

-   Installing the Add-In into Visual Studio
-   Hit "Run on Mono"

If a Wizard or configuration are required they should have as few configuration steps as possible. For example, the above "Run on Mono" should request a machine address to debug, and be done with it.

Issues
------

### Deployment

Currently the MonoVS debugger requires the Windows and Linux machine to share a directory, this should be optional as the process to share files between Linux and Windows is less than ideal, each pose challenges from an administrative perspective, the setup is error prone and can be frustrating.

It would be ideal if the server on the Linux side could receive files uploaded by Visual Studio when they change without having to depend on a parallel configuration to share the files. The file exchange could use the same principle behind RSync: only send files that have been modified (compare sizes, if they are the same, compare md5sums; Upload new files, remove deleted files).

### Linux Firewall Configuration

openSUSE at least (and probaby other Linux Desktops) ship with firewall rules that by default block everything. Our daemon on the Linux side should probably support probing if the ports are blocked and suggest a fix, and ideally automatically reconfigure the firewall when the user chooses to open the firewall.

### Locating Linux Hosts

We could use Mono.ZeroConf on Windows and Linux to show a list of machines that are currently exposing a debugging service.

Our Linux hosts could register with ZeroConf that the debugging service is available (an this be done without running the daemon all the time, and activate-on-demand?)

### Launching Programs in Linux

Our current setup requires the developer to run a process on Linux, and then initiate the debugging session on Windows. This is less than ideal, we should probably be able to control everything from Visual Studio.

A few options that we could consider:

-   The Debugger RPM installs a listener that can launch debug processes on demand.
-   Our Visual Studio Addin uses ssh to start up the process (we then need to find out an SSH implementation that would not require something as large as Cygwin to use).

Design Considerations
=====================

Questions, questions
--------------------

-   What types of developers would be interested in deploying apps to linux through vstudio?
-   Why?
-   What types of devs would not be interested at all?

[jpobst] Taken from [here](http://lists.ximian.com/pipermail/mono-list/2006-October/033221.html):

Covering the 80/20 case, I think the following assumptions can be made:

-   Developers are primarily concerned with their apps running on Windows, but would like their apps to run on Mono/Linux if there is little to no additional development work required.
-   Windows developers are not interested in switching to Linux, or SharpDevelop, or MonoDevelop. They want to program in Visual Studio on Windows, that is, using the tools they've used for years and are most productive in.
-   Windows developers are not interested in learning how to use the various Linux tools like svn, make, yast, apt-get, rpm's, etc.
-   Windows developers are not interested in Gtk\#. Since the primary concern is their apps on Windows, Gtk\# is not useful. (Gaim on Windows sticks out pretty bad.)

Obviously, there are exceptions to the above, but for the 80% case, it should work.

To that end, I can think of four options that would be helpful to VS developers trying to port their app to Mono.

1.  **Scan 'Project/Solution' with MoMA** - This is probably the first step a developer should be taking to being porting to Mono. At the least, the standard report would come up in a new VS window. Even better would be if the items from the report would show up in the Error List window where NIEX, MISS, and PINV would be placed on the Errors tab, and TODO would be placed on the Warning tab. Clicking any of these would take you to the place in code where you are using it.
2.  **Run 'Project/Solution' with Mono** - This step would be attempting to run the developer's app in Mono on Windows. This would work just like clicking the "Start Debugging" button in VS in that the app would run using Mono as the runtime. (Debugging of course would not be supported.) This allows the developer to find any differences between the MS and Mono class libraries. (I believe this is already available in prj2make.)
3.  **Run 'Project/Solution' with Mono on Linux** - This step is like the previous step, except the app would be copied over to a Linux real machine or virtual machine, and starts running there. This allows the developer to find any issues caused by differences between Windows and Linux.
4.  **Debugging support** - Use Visual Studio as the debugger for Mono on Windows or Mono on a remote machine. Make Visual Studio a front-end to the mdb debugger.
5.  **Compile 'Project/Solution' with Mono** - The next step a developer should probably take is trying to compile their app with Mono. This menu option would do just that, with the output showing up in the Output and Error List windows, just as if the compile was done by csc.

(Porting to Mono, there may be issues that are differences between MS and Mono (Mono bugs, etc.), and differences between running on Windows and Linux (case sensitivity, permissions, etc.). Having 2 and 3 as discrete steps breaks down the possible issues into smaller steps.)

Implementation How-to
=====================

A Debug Engine now exists that can:

-   Convert PDB files into MDB files.
-   Launch under the Linux debugger a Mono process and control it from VS.

Deploying Web Projects
----------------------

Deploying web projects is essentially copying the entire project tree and all the files contained within, except source code files (unless the user wants to copy those too by selecting the appropriate option in the add-in).

Before doing any deployments, the user needs to configure the directory on the linux side that will receive the projects. The daemon should have a configuration mode that will create the directory and configure (optionally) a samba share.

### Daemon Actions

-   Samba configuration - root directory where the web project tree will reside
-   Apache configuration (vhosts)(?)

 When the add-in is run, the following options should be available to the user:

### Add-in configuration / options

-   Copy method (samba, ssh)
-   Destination machine (name or ip)
-   Destination directory (by default, project name)
-   Copy source /y/n)

After the project is copied over, the add-in opens a web browser with the site.

Deploying Winforms Projects
---------------------------

Deploying winforms projects means copying over the content of the output directory (all dlls, images, etc) of the main project in the solution (Startup project). Optionally, the add-in can also copy the source files and project files, if the user chooses the Copy Source option.

An extra feature that might be interesting as well is to convert the PDB files into the MDB format (using pdb2mdb, perhaps?), and copying those as well.

Either the add-in or the daemon could create a wrapper script to make it easier to launch the application.

When the add-in is run, the following options should be available to the user:

### Add-in configuration / options

-   Copy method (samba, ssh)
-   Destination machine (name or ip)
-   Destination directory (by default, project name)
-   Copy source /y/n)
-   Copy debug files


