---
title: "BuildSystem/MonoBuildPlanning"
lastmodified: '2007-10-09'
redirect_from:
  - /BuildSystem/MonoBuildPlanning/
---

BuildSystem/MonoBuildPlanning
=============================

 Note: this is an obsolete old copy of:

[BuildSystem/MonoBuild](/BuildSystem/MonoBuild "BuildSystem/MonoBuild")

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#design">1 Design</a>
<ul>
<li><a href="#phase-2">1.1 Phase 2</a></li>
<li><a href="#phase-3">1.2 Phase 3</a></li>
</ul></li>
<li><a href="#howto">2 HOWTO</a>
<ul>
<li><a href="#configuration-path-to-release-work-area">2.1 Configuration: Path to release Work Area</a></li>
<li><a href="#configuring-apache-for-monobuild">2.2 Configuring Apache for MonoBuild</a></li>
<li><a href="#working-example-of-etcapache2confdmod-perlconf">2.3 Working example of /etc/apache2/conf.d/mod_perl.conf</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Design
======

-   Each of the build hosts contact the web server for specific jobs
-   The web server is responsible for assigning jobs to each client
-   the build client will pop the job (text file) out of it's directory (hostname)
-   When the build client is done, it sends the success/fail message back to the web server (puts it in a directory), and also puts the log file in a directory
-   Need to automatically generate some pages (or combine the following information into a page):

-   Status page: Shows success/fail and links to log files (which get posted after the build)
-   Control Center Page: build components on specific platforms

-   Need to have archives of the builds (rpms) as well as the logs... very important

-   How to know that the builds are in progress? (Without using a database... flat state file I guess)

Open questions:

-   Will we only want to be able to build HEAD from the webpage, or be able to pick a revision?
-   Do we need web accessible archives (builds and logs)...? How will these archives get cleaned up?

On the log and download page that Ben sent me, we can have all the logs and builds available from there

The xml format:

-   I don't want to have to parse tons of xml files for every hit to the main status page...
    -   I don't, because you can get the revisions from the directory listing, you'll only need to parse the xml once you go to the downloads page, but you still need to get the status... have an index xml file? That means status updates will also need to go there...
-   One of the main issues is whether to have the xml contain multiple builds, or have an xml document for each build.
-   It would probably be easier to remove a build if you could just delete the directory... I think I'll do that

Phase 2
-------

-   Later... a cron job will set up mandatory job requests, so that the builds get run every night
-   to utilize the hardware better, we need to find the best build box to assign the job to
-   We need to track and calculate dependencies so we know which components to build when we need a new build (this gets somewhat complicated... always rebuild dep, what if parent project doesn't change??, etc...)

Phase 3
-------

-   Test suites, not only build, but do unit tests on the builds
-   Ben mentioned something that we need to get our test cases running against an installed Mono instead of a compiled source tree

HOWTO
=====

Configuration: Path to release Work Area
----------------------------------------

Modify the Build/Config.pm and point \$releaseRepo to the working copy of the following Subversion repository: mono-cvs.ximian.com/source/trunk/release

Configuring Apache for MonoBuild
--------------------------------

Make sure you have mod\_perl installed and working

-   On SUSE type systems, make sure perl is included as part of the APACHE\_MODULES list in /etc/sysconfig/apache2

Add the following to /etc/apache2/mod\_perl-startup.pl:

``` perl
use lib qw(/home/wberrier/wa/mono/msvn/release/monobuild);
```

The above will point to your working copy.

Make sure that your mod\_perl configuration includes the startup file.

Also, include the following Perl Directives: PerlInitHandler Apache::Reload

Working example of /etc/apache2/conf.d/mod\_perl.conf
-----------------------------------------------------

    <Directory "/srv/www/perl-lib">
        AllowOverride None
        Options None
        Order allow,deny
        Deny from all
    </Directory>

    <IfModule mod_perl.c>
        PerlRequire "/etc/apache2/mod_perl-startup.pl"

        ScriptAlias /perl/ "/srv/www/cgi-bin/"
        <Location /perl/>
            # mod_perl mode
            SetHandler perl-script
            PerlResponseHandler ModPerl::Registry
            PerlOptions +ParseHeaders
            Options +ExecCGI
        </Location>

        # Important stuff
        ##############################################################
        PerlInitHandler Apache::Reload
        #ScriptAlias /cgi-perl/ "/srv/www/cgi-bin/"
        ScriptAlias /cgi-perl/ "/home/wberrier/wa/mono/msvn/release/monobuild/www/cgi-perl/"
        <Location /cgi-perl>
            # perl cgi mode
            SetHandler  perl-script
            PerlResponseHandler ModPerl::PerlRun
            PerlOptions +ParseHeaders
            Options +ExecCGI
        </Location>
        ##############################################################

        # The /cgi-bin/ ScriptAlias is already set up in httpd.conf

    </IfModule>

