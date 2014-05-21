---
layout: obsolete
title: "Howto Mono Extension"
lastmodified: '2010-03-26'
permalink: /old_site/Howto_Mono_Extension/
redirect_from:
  - /Howto_Mono_Extension/
---

Howto Mono Extension
====================

This document is intended to provide a basic overview of how to configure and test a Mono environment based on the [SUSE Linux Enterprise Mono Extension](http://www.novell.com/products/mono/).

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#mono-extension-environment">1 Mono Extension Environment</a>
<ul>
<li><a href="#setting-up-the-mono-extension-environment">1.1 Setting up the Mono Extension environment</a></li>
<li><a href="#verifying-that-the-mono-extension-environment-is-setup-correctly">1.2 Verifying that the mono extension environment is setup correctly</a></li>
<li><a href="#making-the-mono-extension-environment-permanent">1.3 Making the mono extension environment permanent</a></li>
</ul></li>
<li><a href="#configuration-verification-mono-addon-check-script">2 Configuration verification (mono-addon-check script)</a>
<ul>
<li><a href="#implications-of-warnings">2.1 Implications of Warnings</a>
<ul>
<li><a href="#apache-mpm-mpm-type-probably-prefork-is-in-use-while-mpm-type-probably-worker-is-recommended">2.1.1 &quot;Apache MPM &lt;mpm type, probably 'prefork'&gt; is in use while &lt;mpm type, probably 'worker'&gt; is recommended&quot;</a></li>
<li><a href="#unknown-apache-mpm-mpm-type-is-in-use-but-mpm-type-probably-worker-is-recommended">2.1.2 &quot;Unknown Apache MPM &lt;mpm type&gt; is in use but &lt;mpm type, probably 'worker'&gt; is recommended&quot;</a></li>
<li><a href="#found-mono-version-mono-version-while-version-mono-version-is-recommended">2.1.3 &quot;Found Mono version &lt;mono version&gt;, while version &lt;mono version&gt; is recommended&quot;</a></li>
<li><a href="#virtual-host-virtual-host-name">2.1.4 &quot;Virtual host &lt;virtual host name&gt;&quot;</a></li>
</ul></li>
<li><a href="#correction-of-errors">2.2 Correction of Errors</a>
<ul>
<li><a href="#apache2ctl-missing">2.2.1 &quot;apache2ctl missing&quot;</a></li>
<li><a href="#unable-to-determine-apache-configuration-directory">2.2.2 &quot;Unable to determine Apache configuration directory&quot;</a></li>
<li><a href="#apache-v2-package-missing">2.2.3 &quot;Apache v2 package missing&quot;</a></li>
<li><a href="#unable-to-determine-the-apache-mpm">2.2.4 &quot;Unable to determine the Apache MPM&quot;</a></li>
<li><a href="#internal-error">2.2.5 &quot;Internal error&quot;</a></li>
<li><a href="#configuration-not-found-or-invalid-syntax-details-logged">2.2.6 &quot;Configuration not found or invalid syntax (details logged)&quot;</a></li>
<li><a href="#the-mod-mono-apache-module-is-not-loaded-or-configuration-syntax-error-details-logged">2.2.7 &quot;The mod_mono Apache module is not loaded or configuration syntax error (details logged)&quot;</a></li>
<li><a href="#unable-to-find-mod-mono-configuration">2.2.8 &quot;Unable to find mod_mono configuration&quot;</a></li>
<li><a href="#the-mod-mono-binary-file-does-not-exist-at-path-to-the-expected-mod-mono-binary">2.2.9 &quot;The mod_mono binary file does not exist at &lt;path to the expected mod_mono binary&gt;&quot;</a></li>
<li><a href="#unknown-os-architecture-os-arch">2.2.10 &quot;Unknown OS architecture $OS_ARCH&quot;</a></li>
<li><a href="#mod-mono-has-unresolvable-shared-library-dependencies-details-logged">2.2.11 &quot;mod_mono has unresolvable shared library dependencies (details logged)&quot;</a></li>
<li><a href="#mod-mono-might-not-be-loadable-on-this-architecture-os-arch-bit-details-logged">2.2.12 &quot;mod_mono might not be loadable on this architecture (${OS_ARCH}-bit, details logged)&quot;</a></li>
<li><a href="#some-packages-are-missing-list-of-missing-packages">2.2.13 &quot;Some packages are missing: &lt;list of missing packages&gt;&quot;</a></li>
<li><a href="#unable-to-determine-mono-version">2.2.14 &quot;Unable to determine mono version&quot;</a></li>
<li><a href="#virtual-host-improperly-configured-vhost">2.2.15 &quot;Virtual host &lt;improperly configured vhost&gt;&quot;</a></li>
<li><a href="#missing-virtual-host-path-parameter">2.2.16 &quot;Missing virtual host path parameter&quot;</a></li>
<li><a href="#virtual-host-configuration-file-path-to-vhost-config-file-does-not-exist">2.2.17 &quot;Virtual host configuration file &lt;path to vhost config file&gt; does not exist&quot;</a></li>
</ul></li>
</ul></li>
<li><a href="#configuring-mod-mono">3 Configuring mod_mono</a>
<ul>
<li><a href="#mono-extension-specific-configuration">3.1 Mono Extension specific configuration</a></li>
</ul></li>
<li><a href="#publishing-a-web-site--web-application">4 Publishing a web site / web application</a></li>
<li><a href="#moma-validation-of-application-compatibilitysupportability">5 MoMA validation of application compatibility/supportability</a></li>
<li><a href="#validating-an-application-runs-with-xsp">6 Validating an application runs with xsp</a></li>
</ul></td>
</tr>
</tbody>
</table>

Mono Extension Environment
==========================

Setting up the Mono Extension environment
-----------------------------------------

To make it easier for administrators to use the mono extension, we've included a script that will temporarily set the default mono used in the administrators shell to the mono in the mono extension. Once this script is sourced, when the administrator runs the "mono" command, it will be the mono from the mono extension. Additionally, when an application is compiled with Mono's C\# compiler, "gmcs", it will use the gmcs from the mono extension and it will compile against the mono libraries included in the mono extension.

To setup the mono extension environment, execute the following command:

       source /opt/novell/mono/bin/mono-addon-environment.sh

Verifying that the mono extension environment is setup correctly
----------------------------------------------------------------

After executing this command, the command line prompt should be prefixed with "[mono-addon]".

To further verify that the mono extension environment is setup correctly, execute the following command:

       which mono

The output from this command should be "/opt/novell/mono/bin/mono"

Making the mono extension environment permanent
-----------------------------------------------

If the administrator knows that they aren't using the system mono for anything, and they know that they want to always default to the mono extension environment when they login to the machine, they can make the mono extension environment permanent by executing the following command:

       cp /opt/novell/mono/bin/mono-addon-environment.sh /etc/profile.d

Once this is copied, the administrator will need to logout and back into the box for it to take effect.

Configuration verification (mono-addon-check script)
====================================================

Mono Extension ships with the mono-addon-check script as a tool to verify that the Mono Extension environment has been configured correctly.

Once the Mono Extension environment has been sourced according to the steps above, the mono-addon-check can be executed with the following command:

       mono-addon-check

Implications of Warnings
------------------------

Warnings show up with "[ warn ]" on the left side of the message. Here are some warnings that the user can receive.

#### "Apache MPM \<mpm type, probably 'prefork'\> is in use while \<mpm type, probably 'worker'\> is recommended"

For best performance of ASP.Net apps, it is recommended that you install the apache2-worker. prefork uses process model - that is, each request is serviced by a separate process. Worker, on the other hand, uses a mixture of processes and threads - less processes and more threads. In general, its latency and resource usage is lower because more data is shared and thread scheduling and synchronization is more efficient than with processes. Also, worker scales better with multi-core machines.

#### "Unknown Apache MPM \<mpm type\> is in use but \<mpm type, probably 'worker'\> is recommended"

For best performance of ASP.Net apps, it is recommended that you install the apache2-worker. There are other apache processing modules (for instance event based) but they are considered unstable/experimental.

#### "Found Mono version \<mono version\>, while version \<mono version\> is recommended"

For some reason, the version we found is older than recommended. This is odd because this script ships with Mono, so it really shouldn't say this unless there is a configuration problem. One possible cause is the PATH variable - user may have in their path some other version of Mono (compiled by hand for instance).

#### "Virtual host \<virtual host name\>"

The named virtual host has problems. See the log for more information.

Correction of Errors
--------------------

Errors show up with "[ Error ]" on the left side of the message. Here are some errors that the user can receive.

#### "apache2ctl missing"

For some reason we can't find the apache2ctl utility. Either there is a path problem, or it isn't installed. Alternatively, apache2ctl might not have execute permissions set.

#### "Unable to determine Apache configuration directory"

Whatever output we got from apache2ctl wasn't a valid directory, so something is improperly configured. Script parses output of 'apache2ctl -V' for the SERVER\_CONFIG\_FILE variable. User might be asked to provide output of the above command.

#### "Apache v2 package missing"

Searching through the rpm database, we couldn't find the apache2 rpm. Use

       "rpm -qa|grep -i apache"    

to see what apache related packages are installed on your system.

#### "Unable to determine the Apache MPM"

Using the apache program "find\_mpm", we couldn't determine what MPM is being used. Run this program manually to determine what went wrong. The program is part of SuSE Apache packaging, it is NOT a standard part of Apache distribution. By default is located in /usr/share/apache2/find\_mpm - user needs to type the full path in order to be able to run it.

#### "Internal error"

This should never be displayed. If it is, it is probably a bug in the script. Please file a bug report with details including the configuration that this was found on. User might be asked to run the script like this:

       bash -x mono-check > /tmp/mono-check-output.log 2>&1

and then asked to mail the /tmp/mono-check-output.log file for examination.

#### "Configuration not found or invalid syntax (details logged)"

While having apache2ctl check the apache configuration, it found errors. We've logged the output of the command to the log file.

#### "The mod\_mono Apache module is not loaded or configuration syntax error (details logged)"

We had apache2ctl list the loaded modules, and mod\_mono wasn't one of them. We've logged the output of the command to the log file (by default it's /var/log/mono/mono-check.log)

#### "Unable to find mod\_mono configuration"

We searched for the mod\_mono config file and we couldn't find it. It might have been accidentally removed. File should be located in the conf.d/ subdirectory of main apache configuration dir.

#### "The mod\_mono binary file does not exist at \<path to the expected mod\_mono binary\>"

We can't find the mod\_mono binary in the path we found in the mod\_mono conf file. So either the conf file is pointing to the wrong binary (look for LoadModule mono\_module directive in Apache config), or mod\_mono isn't installed.

#### "Unknown OS architecture \$OS\_ARCH"

This script is running on an architecture that it doesn't recognize. The most likely cause is that the mono extension is installed on an unsupported architecture (which is rather unlikely, but may happen). It might be because of unsupported/invalid output from the 'arch' and 'uname -m' commands ('arch' might be obsolete). Right now (2009-07-21) we recognize:

       * x86_64
       * i?86 (with ? being any digit)
       * s390x

 User should be asked to run 'arch' and 'uname -m' and provide their output.

#### "mod\_mono has unresolvable shared library dependencies (details logged)"

We ran ldd against the mod\_mono binary, and ldd reported that some dependency was "not found". We've logged the output of the command to the log file. Ask the user to run ldd on the mod\_mono.so module and report the output (mod\_mono.so location can be found by looking for the LoadModule mono\_module directive in mod\_mono.conf)

#### "mod\_mono might not be loadable on this architecture (\${OS\_ARCH}-bit, details logged)"

We ran ldd against the mod\_mono binary, and we noticed that libc wasn't the one we were expecting. We've logged the output of the command to the log file (by default it's /var/log/mono/mono-check.log).

#### "Some packages are missing: \<list of missing packages\>"

We checked the rpm database for the above packages, and they didn't exist. These packages need to be installed for the mono extension to operate properly.

#### "Unable to determine mono version"

We ran "mono --version" and didn't get back the output we expected. Try running the command yourself to see why.

#### "Virtual host \<improperly configured vhost\>"

The specified virtual host above is improperly configured. Check the configuration. Details of the issues are shown as notices.

#### "Missing virtual host path parameter"

There's a vhost configured in apache that doesn't have a path configured. Check your apache conf file for a misconfiguration.

#### "Virtual host configuration file \<path to vhost config file\> does not exist"

We were expecting the virtual host path file at the above location, but it can't be found. This means that apache is improperly configured.

Configuring mod\_mono
=====================

The [Apache mod\_mono configuration tool](http://go-mono.com/config-mod-mono/) can generate a configuration for name-based Virtual Hosts (i.e., how this site is configured to handle traffic to mono-project.com, www.mono-project.com, etc), and configurations for ASP.NET Applications (what IIS traditionally referred to as a Virtual Directory), such as the mod\_mono configuration application served at [http://go-mono.com/config-mod-mono/](http://go-mono.com/config-mod-mono/)

More details about the mod\_mono configuration tool can be found on the [Mod\_mono]({{site.github.url}}/old_site/Mod_mono "Mod mono") section of this site.

Mono Extension specific configuration
-------------------------------------

By default, the mod\_mono configuration tool will generate a config file suitable for use with the mod-mono-server2 installed in /usr/bin. In order to use the generated configuration with the SUSE Linux Enterprise Mono Extension, the config should be updated to use the mod-mono-server2 installed in /opt/novell. This can easily be done by uncommenting the /opt/novell MonoServerPath directive and commenting out the /usr/bin MonoServerPath directive, so that these lines read like so:

     # For SUSE Linux Enterprise Mono Extension, uncomment the line below:
     MonoServerPath APPLICATION_NAME "/opt/novell/mono/bin/mod-mono-server2"
     # For Mono on openSUSE, uncomment the line below instead:
     # MonoServerPath APPLICATION_NAME "/usr/bin/mod-mono-server2"

Publishing a web site / web application
=======================================

Publishing a web site from Visual Studio requires you to provide a Target Location and lets you choose whether you want to be able to update the files at that location. You can choose a local folder as the Target Location and then just copy all the files to your Suse Linux machine or use FTP to upload the files.

We recommend that the site is precompiled, especially if you use VB.NET in your code. This has several advantages like the well-known faster initial request and not deploying source code, and will avoid any potential problems parsing and compiling your pages.

Also, if you select the 'Allow this precompiled site to be updatable' option, you will be able to modify the files on the server and those changes will be available immediately. On the other hand, you will be shipping source code if the precompiled site is updatable.

Alternatively, a web site or web application can be precompiled for use with Mono from the Visual Studio command prompt, using the following command:

       c:\test\>aspnet_compiler -f -p c:\test\BlogEngine.Web -v /blog c:\test\output

MoMA validation of application compatibility/supportability
===========================================================

One of the easiest ways to see if an application is compatible with Mono is to scan it with the Mono Migration Analyzer (MoMA). For web projects, to get the most accurate results, it's important that the developer go into the project settings and uncheck "Allow this precompiled site to be updatable". This will allow Visual Studio to pre-compile more of the web site. After unchecking this setting, make sure to run another build.

You can scan a web project on either Windows or Linux (MoMA runs on both), but it is assumed you are doing this on Windows. To scan a website with MoMA, follow these steps:

1.  Download [MOMA](/index.php?title=MOMA&action=edit&redlink=1 "MOMA (page does not exist)").
2.  Unzip MoMA
3.  Execute moma.exe.
4.  Follow the wizard, and point MoMA at the entire web project folder. After scanning through the entire folder, MoMA will give you a report.

It is important to note that MoMA only scans .NET assemblies. So any code that is not compiled will not be scanned. There are more indepth instructions on how to use MoMA on the MoMA download site referenced above.

Validating an application runs with xsp
=======================================

A good way to see if a web application isn't running because of a misconfiguration or because of an incompatibility with Mono is to run the web application under our standalone ASP.NET web server, which is called "xsp". Xsp is very easy to run.

To run an application under xsp: 1. Make sure you are running the xsp from the mono extension by running "which xsp". The expected response is "/opt/novell/mono/bin/xsp". 2. Copy the web application to the linux box that has the mono extension installed 3. Change directory to the root of the web application (this directory usually contains the file "Web.config") 4. Run "xsp". Or, to enable platform abstraction, execute the following statement:

       MONO_IOMAP=all xsp

5. The output from xsp should be something like: xsp2 Listening on address: 0.0.0.0 Root directory: / Listening on port: 8080 (non-secure) Hit Return to stop the server. 6. Open a web browser and connect to the linux box on port 8080 or whatever port xsp says it's Listening on. 7. To close xsp, press "\<enter\>" in the terminal where xsp is running.

