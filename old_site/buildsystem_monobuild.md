---
layout: obsolete
title: "BuildSystem/MonoBuild"
permalink: /old_site/BuildSystem/MonoBuild/
redirect_from:
  - /BuildSystem/MonoBuild/
---

BuildSystem/MonoBuild
=====================

MonoBuild is no longer used. This page here for historical purposes.

Current build status is [here](http://wrench.mono-project.com/builds).

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#overview">1 Overview</a></li>
<li><a href="#background">2 Background</a></li>
<li><a href="#howto">3 HOWTO</a>
<ul>
<li><a href="#detailed-documentation">3.1 Detailed documentation</a></li>
<li><a href="#interacting-with-build-clients">3.2 Interacting with build clients</a></li>
<li><a href="#shutting-down-monobuild">3.3 Shutting down monobuild</a></li>
<li><a href="#setting-up-a-new-build-client">3.4 Setting up a new build client</a></li>
<li><a href="#removing-a-build-client">3.5 Removing a build client</a></li>
<li><a href="#add-new-packagemodule-to-monobuild">3.6 Add new package/module to MonoBuild</a></li>
<li><a href="#configuring-apache-for-the-monobuild-webview">3.7 Configuring Apache for the MonoBuild Webview</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Overview
========

Monobuild is a tinderbox/buildbot-like system to continually build and run tests and build steps. It differs from buildbot in that no client it necessary on the build host. Everything is done from a centralized server and jobs are pushed over ssh. (Jobs can also be done locally as well).

Monobuild also facilitates rpm packaging, although it has an alternate system that stores builds in .zip files for systems that don't use rpm.

There is also a set of scripts that will publish released builds to a server and generate some static html pages with links.

It is designed around Mono, but there's no reason it couldn't be used for other projects. Most (possibly all) of the hardcoded configuration is in trunk/release/pyutils/config.py .

[Mono's Monobuild](http://mono.ximian.com/monobuild).

Background
==========

Mono used to use buildbot for its' continual build system and Ximian BuildBuddy for doing packaging. We had issues with buildbot because when client connections were lost, we had to restart the server, which lost all build logs and metadata. (Monobuild currently has build metadata ranging back to April of 2006). BuildBuddy worked well enough for packaging, but it was unmaintained after some time, and it was a pain to sync ximian-build.conf files with native .spec files that were submitted to suse autobuild. We now use only .spec files for building rpms.

The original scripts that were written by Ben were all done in Bash. It was getting harder and kludgier to add features, plus, differing versions of bash behaved differently. We were starting to build on other unix systems which also made it more difficult to use shell. This is when it was decided to use python instead. (Perl was considered since I knew it best, but Duncan was talking about how much better python was over perl, so I decided to give it a shot. Thank goodness I did :)

HOWTO
=====

Detailed documentation
----------------------

To see more detailed documentation, check the following link: [BuildSystem/MonoBuild/DetailedDocs]({{site.github.url}}/old_site/BuildSystem/MonoBuild/DetailedDocs "BuildSystem/MonoBuild/DetailedDocs")

Interacting with build clients
------------------------------

You can check out some scripts that will allow you to cancel running builds and log into build clients.

    svn co svn://anonsvn.mono-project.com/source/trunk/release
    cd release/packaging

Running ./jail-do will give a usage of all the methods.

To log in:

    ./jail-do sles-9-x86_64

To run 'ls':

    ./jail-do sles-9-x86_64 run ls

You can also lock the client, check to see if it's locked, unlock it, or interrupt the current job.

(Note: a lot of ssh calls are made to do these operations... surely they can be optimized/minimized, so if you start getting tired of typing in the ssh password, ask for the ssh key that will allow you to log in to any of the build clients)

You can also lock the clients by placing some files in the appropriate places. The internal workings may change at some point, so it's probably better to use jail-do. But if you insist, put these two files in place:

    touch /tmp/monobuild/locked
    touch /tmp/monobuild/interrupted

This will keep the scheduler from farming builds to that client.

To interrupt the current job manually instead of using jail-do, put the above two files in place, and then run the following on the client:

    kill -9 -`cat /tmp/monobuild/pgid_kill`

Shutting down monobuild
-----------------------

In order to shut down monobuild (which is usually done during release time) edit trunk/release/pyutils/config.py and change all \_active variables to 'False' instead of 'True'. This will prevent any additional jobs from being scheduled.

Setting up a new build client
-----------------------------

For linux, this is done by creating a chroot environment. Scripts to create this can be found in [svn://anonsvn.mono-project.com/source/trunk/release/jailbuilder](svn://anonsvn.mono-project.com/source/trunk/release/jailbuilder). Inside of that chroot env, you must create a user account (typically 'builder') that has non-interactive (meaning you don't need to enter a password) sudo rights. Python must be installed.

For other systems, as well as for linux running in a non-chroot env, you need python and a user account with full sudo rights as described above.

Removing a build client
-----------------------

After a distribution or OS is no longer maintained it is removed from monobuild. This keeps the list of distros to a minimum. Here are the steps to remove a distro:

1.  Remove packaging/conf/\<distro name\>
2.  Remove references to that distro from all packaging/def files
3.  If noarch or \$ARCH builds were done on that distro, move all build metadata info (release/monobuild/www/builds/) to the distro that will be replacing this distro. For \$DISTRO def files, the metadata for this distro can safely be removed (note: this step won't be needed once we don't share rpms any longer)

Note: Snapshot repositories and class status pages are built on certain distros. (SLE10 at this point). When those distros go away, these processes need to be configured to use the replacement distros instead. Also, all references in release/packaging/defs/\* need to be replaced as well.

To update the class status distros, modify:

-   release/monobuild/collect-class-status.py

To update the snapshot distros, update:

-   release/packaging/upload-snapshot

Add new package/module to MonoBuild
-----------------------------------

Create a new file in release/packaging/defs to add a new package. The .def file is typically named after the svn module name, rpm package, or the tarball name.

You can use another .def file as a template as well as refer to the [BuildSystem/MonoBuild/DetailedDocs]({{site.github.url}}/old_site/BuildSystem/MonoBuild/DetailedDocs "BuildSystem/MonoBuild/DetailedDocs").

The main things to know are:

-   svn trunk and tag paths
-   which distros to build on
-   whether the package is noarch or should be shared across distros
-   If the package isn't building on a system that uses rpm, you'll need to fill out the \_zip vars
-   For rpm base systems, you'll need a .spec file in release/packaging/rpm\_defs/\<def file\>

If you want the module to be published with sources and added to the snapshot repositories, you'll need to add your module to the following files:

-   release/website/sources-index
-   release/website/distro-index
-   release/website/repo-config/config.py

If you want the module to automatically be built in monobuild, add it to:

-   release/pyutils/config.py

Make sure that the distros you want it built on are also listed in that file, otherwise the build won't get started.

Configuring Apache for the MonoBuild Webview
--------------------------------------------

The webview gives a nice dashboard overview of the status of all of the latest builds in the system. You can see Mono's webview [here](http://mono.ximian.com/monobuild).

To configure the build server you must have mod\_python installed. Here's an example of how to configure a suse 10.2 system.

    zypper install apache2-mod_python

Place these contents in /etc/apache2/conf.d/python.conf

    LoadModule python_module /usr/lib64/apache2/mod_python.so

    # Override type-map handler for /var/www/manual
    <Directory "/var/www/manual/mod/mod_python">
            <Files *.html>
                    SetHandler default-handler
            </Files>
    </Directory>

    #<Directory /www/htdocs/mp>
    <Directory /home/wberrier/wa/msvn/release/monobuild/www/python>
            AddHandler mod_python .py
            PythonHandler mod_python.publisher
            #PythonPath ['/home/wberrier/wa/msvn/release/monobuild']
            # They say this is slow... what's the best way to do this?
            PythonPath "sys.path+['/home/wberrier/wa/msvn/release/pyutils']"
            PythonDebug On
    </Directory>

You'll need the following changes to view log files from the browser:

Append 'log log.gz' to the 'text/plain' entry in /etc/apache2/mime.types so it matches the following:

    text/plain txt asc log log.gz

For /etc/apache2/mod\_mime-defaults.conf, uncomment:

    AddEncoding x-gzip .gz .tgz

and comment out:

    #AddType application/x-gzip .gz .tgz

In /etc/apache2/default-server.conf, set DocumentRoot:

    DocumentRoot "/home/wberrier/wa/msvn/release/monobuild/www"

and replace the corresponding \<Directory \> tag with the same path.

Update "Options" in the \<Directory\> stanza to be:

    Options FollowSymLinks Indexes MultiViews

That should be it! The mime handling changes are for viewing the compressed log files that monobuild creates. Unfortunately, InternetExplorer opens these unix formatted files in notepad, which looks horrible. Open them instead in an editor that understands unix line endings.

