---
title: "BuildSystem/MonoBuild/DetailedDocs"
lastmodified: '2008-06-27'
redirect_from:
  - /BuildSystem/MonoBuild/DetailedDocs/
---

BuildSystem/MonoBuild/DetailedDocs
==================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#monobuild-documentation">1 monobuild documentation</a>
<ul>
<li><a href="#ssh-and-jailshosts-packagingconf-file">1.1 ssh and jails/hosts (packaging/conf file)</a></li>
<li><a href="#package-info-def-file">1.2 package info (def file)</a>
<ul>
<li><a href="#options-specific-to-branching">1.2.1 Options specific to branching</a></li>
</ul></li>
<li><a href="#tarball-creation-and-svn">1.3 tarball creation and svn</a></li>
<li><a href="#package-building">1.4 Package Building</a>
<ul>
<li><a href="#rpm-packaging-do-build">1.4.1 rpm packaging (do-build)</a></li>
<li><a href="#zip-build-system-do-zip-build">1.4.2 zip build system (do-zip-build)</a></li>
</ul></li>
<li><a href="#install-deps">1.5 install-deps</a></li>
<li><a href="#webview">1.6 Webview</a></li>
<li><a href="#bundles">1.7 bundles</a></li>
<li><a href="#dependency-builder">1.8 dependency builder</a></li>
<li><a href="#monobuild-scheduler">1.9 monobuild scheduler</a></li>
<li><a href="#interaction-between-zips-rpms-and-installers">1.10 Interaction between zips, rpms, and installers</a></li>
<li><a href="#web-publishing-and-content-creation">1.11 web publishing and content creation</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

monobuild documentation
=======================

Features:

Components:

ssh and jails/hosts (packaging/conf file)
-----------------------------------------

Builds are done on clients over ssh. The interaction with clients is abstracted and defined in pyutils/buildenv.py . This includes executing commands and copying files back and forth. It also abstracts whether the client is in a chroot environment (jail) or on a full install, as well as executing commands as a normal user or as root. This system eliminates the need to run a daemon on each of the clients. This class also handles build client locking, so that builds don't stomp on each other.

Explanation of all options in a conf file: username: ssh user of the machien the jail is hosted on. hostname: ssh host of the machine the jail is hosted on. chroot_path: optional directory of where the jail root is located. If this entry is missing, system assumes client is not inside a jail. arch_change: command to run to switch architectures on a machine. IE: on x86_64 you can run linux32 to get a 32bit environment. On s390x, you can run s390. distro_aliases: array of distros to create symlinks to equivalent distros. (IE, stuff you build on suse 10.1 can run on sle10, but instead of having two environments and building twice, you can add sle10 as a distro alias to 10.1)

``` nowiki
*_path
```

: optional method of overriding the default values which are in pytutils/config.py for this client.

USE_ZIP_PKG: if this is set, use the zip build system (described below). Otherwise, the build client uses the rpm build system.

YAST_REPO: 1 or 0 that says whether to create a yast repository when publishing for this distro. YAST_INSTALL: 1 or 0 that determines generating yast installation instructions on the download page.

RPM_MD_REPO: 1 or 0 that says whether to create an rpm-md repository when publishing for this distro.

YUM_INSTALL: 1 or 0 that determines generating yum installation instructions on the download page.

target_command_prefix: prepend this to each command that is executed

web_index: order (starting from zero) to list the jails for the webview. All client conf files not containing this directive are listed alphabetically after the rest of the other sorted hosts.

build_location: path to use for monobuild when building instead of the default /tmp/monobuild. This is for when space is limited in /tmp.

package info (def file)
-----------------------

Configuration file for a package definition in shell syntax.

BUILD_HOSTS: all clients that this package builds on USE_HOSTS: all clients/distros that use this package

MONO_DEPS: other defs/packages that this package depends on (either build time or runtime... sorta, more on this later) MONO_RECOMMEND_DEPS: install this as well if it's available, but don't fail if it isn't

HEAD_DEPS: grab dependencies from other modules from the HEAD package repository, overriding the default, which is to use whatever you are building. (IE: if you're building a module from a tag (RELEASE), it will use RELEASE packages by default.

RELEASE_DEPS: override default and use RELEASE dependencies.

MK_TARBALL_HEAD_DEPS: mktarball will use RELEASE deps by default. If you need to use HEAD deps instead, set this to 1.

``` nowiki
*_ZIP_RUNTIME_DEPS: runtime dependencies, which is a list of urls, only used for the installers at this point.
 
*_ZIP_DEPS: list of urls that this package depends on, where * is for which distro.
 
*_ZIP_BUILD: function listing a sequence of commands that are used to build this package on the * build client in the zip build system.  ZIP_BUILD by itself will mean that the function will be used for all zip builds if one for that distro isn't defined.
```

get_destroot: function to determine what time of package this is. Options are: noarch, \$ARCH, or \$DISTRO. Can also contain some shell code for to programatically determine the destroot. They are used in the following manner; noarch: used for all conf files. ARCH: shared across all distros of the same architecture, but only applies to linux distros. DISTRO: The package can only be used for the build configuration is was built on.

HEAD_PATH: relative svn path of where trunk is located. This is a list, and if there are more than one, they are checked out side by side. The base path is located in pyutils/config.py. The first module listed is the one entered before creating the tarball. Or, BUILD_DIR is specified as the directory to be entered (either relative or absolute).

RELEASE_PATH: relative svn paths of tagged sources. version is translated from x.x.x on the command line to x-x-x in the svn path. versiondot does not perform this translation.

BUILD_DIR: the name of the directory that the source is located in if it can't be deduced from HEAD_PATH or RELEASE_PATh (using dirname). (This really isn't used in favor of EXTERNAL_SOURCE).

make_dist: function containing commands to create source dist after entering the source tree.

POSTBUILD_STEP_NAME?: name of ?th step to execute after build has succeeded POSTBUILD_STEP?=commands to run for the ?th step after the build has succeeded

Note: STEPS will be ignored if --skip_steps is passed to release/packaging/build.

POSTBUILD_TEST_NAME?: same as POSTBUILD_STEP_NAME, but ignore if '--skip_tests' is passed to release/packaging/build. POSTBUILD_TEST?: same as POSTBUILD_STEP, but ignore if '--skip_tests' is passed to release/packaging/build.

get_source: function to run to get the source for this package. When this directive exists, it overrides the normal procedure of checking out from svn. Current uses are using curl to download a previously created source tarball, or to do something funky to determine the svn path (gtk#2 for example). (Note: this isn't used anymore in favor of EXTERNAL_SOURCE=1)

EXTERNAL_SOURCE: flag a module that is built in monobuild but isn't hosted in mono svn. This also means that this module won't have HEAD builds. So when deps are used for other modules, RELEASE will always be used for this module. This usually means that when new versions of this source come out, you can manually place the source in the appropriate dir (ie: release/packaging/sources/\<module\>)

USE_PATCHES: 1 or 0 to signify if patches from packaging/rpm_defs/\<module\> should be applied to the source. This is only honored with the zip build system. (For RPM builds, use the .spec file to determine which patches should be used.) With this flag, all patches are applied with -p1 so formulate your patches accordingly. Patches must be named with .patch and the filenames are alphabetically sorted to determine the order of which they are applied.

web_index: order, starting at 0, of the webview. All files not containing web_index are sorted alphabetically after the entries that contain web_index.

MKTARBALL_HOST: override which distro/conf to create the tarball on. The default is listed in pyutils/config.py.

### Options specific to branching

bundle: specify a specific bundle for this package (more on bundles later) (This isn't really used anymore, and version_selection_reg was created to replace it).

version_selection_reg: python compatible regular expression that selects candidates from which the latest version is selected from. (Example, gtk-sharp-2.? packs def_alias to gtk-sharp, which means the sources and binaries are all in the same directory, but gtk-sharp only selects from 1.0.x, whilc gtk-sharp-2.0 only selects from 2.4.x).

Another note about branches: it works out well to create another def file for an additional branch, (ex: mono-branch). Then you can use HEAD_PATH to point to the branch path, where RELEASE_PATH is usually the same as the 'trunk' def file.

tarball creation and svn
------------------------

Implemented with mktarball and do-msvn-tar. This makes it possible to create a tarball for a package. This can be done either for a 'snapshot' from HEAD_PATH, or for a version from RELEASE_PATH. All necessary files are copied to the build client, and the tarball creation options in the def file define the options pertaining to the process. Typically source is checked out from svn, the svn revision is appeneded to the version in AM_INIT_AUTOMAKE, then ./autogen.sh and make dist is run. Then the source file is copied back to packaging/sources/\<def file name\>. packaging/tarball_map contains a list of tarballs created. This file is also consulted when checking for duplicates so that a tarball isn't overridden. This file also keeps track of failures.

Package Building
----------------

-building a package is implemented with release/packaging/build, do-build, and do-zip-build. install-deps is also used to install prerequisites on the build client. ./build outputs xml files to store status and info about each build. It also stores the log files. This info and it's structure is stored in release/monobuild/www/builds.

### rpm packaging (do-build)

Linux rpm packaging is done with Ximian Build Buddy. A portion of Build Buddy is used for xml based package descriptions. These are translated into rpm .spec files. (debian packaging could also be used, although this has never been tested in monobuild). The xml package descriptions help tremendously in maintaining and building packages for 20+ distros. BuildBuddy specific documentation is found here \<link\>. monobuild xml conf files are stored in release/conf/\<def name\>/ximain-build.conf.

### zip build system (do-zip-build)

Since not all platforms use rpm, another system was needed to compensate this. Instead of implementing a system for each specific native packaging format, a generic system was implemented. This system was originally used to build mono on Windows but later Solaris, and then Mac. noarch packages are always built on linux, and then unpacked to be used as deps on zip build clients. This is so that noarchs only need to be built once. When the system looks for \*\_ZIP\_BUILD, it first looks for \<os name\>\_ZIP\_BUILD, then \<osname\>\_\<osver\>\_ZIP\_BUILD, and then \<osname\>\_\<osver\>\_\<osarch\>\_ZIP\_BUILD.

install-deps
------------

install url deps and/or MONO_DEPS onto the build client for a particular package. This is used by both mktarball and build.

Webview
-------

The webview uses mod_python along with apache to create a webpage to display the information that is outputted by ./build described above. The initial page shows a matrix of build clients and packages. This matrix contains up to the last two builds. The inner box is the latest build, and the outer is the next to latest build. Since builds are almost continuously done, it helps to see the status of the previous build. There's a legend at the bottom of the page signifying what the colors mean. If a box is grey, that means that build exists for that def file platform combo, but it hasn't been built yet. If it's white, that means the package doesn't exist for that build client. Clicking on the version in the box will list all the builds for that package/platform. For each build listed, you can see the status, start stop times, and logs of the tarball creation, build, and the postbuild steps. If the website also has the builds available, you can download the rpms, tarballs, and zip files.

bundles
-------

A bundle configuration is used to designate a selection of packages at specific versions. This usually signifies a release. A bundle can be specified by setting the environment variable BUNDLE. This is used for doing the following based on a release: generating web pages (described below), building a package using packages from a release, construct download repositories, and building installers.

The format is of shell syntax. And contains the following directives:

archive_version: which path and version to use when creating archive indexes for the web bundle_urlname: which url name to use for sources, rpms, and repo downloads on the web. versions: array of package_name version pairs, as described below. The versions doesn't exist, the latest versions for all packages are used.

-   If version map is there, only those packages will be used
-   If a version without a release is specified, that version using the latest release will be used.
-   If a version with a release is used, that exact release will be used and scripts will fail if it's not there. Specify release of 0 to get a version without a release
-   If the version is "", the latest version for that package will be used

HEAD_or_RELEASE can be specified in the bundle configuration file. This defaults to RELEASE if not specified. This would only be useful if we wanted to build an installer or web publish from trunk.

dependency builder
------------------

used for the zip build system to track which deps to build and how to build them. It's implemented in packaging/dep_builder. This used to be manual, but doing this makes it much easier to reproduce and build. Config files for the dep builder are in packaging/dep_defs.

monobuild scheduler
-------------------

There are 3 main threads that run to allow continuous builds.

The tarball-build-thread scans HEAD_PATHS for a select set of packages (defined in pyutils/config.py) and checks for changes. The Subversion implementation is in pyutils/src_repo_utils.py. Surely the class interface would need to be updated to accommodate other systems. The thread scans at an interval defined in release/pyutils/config.py. packaging/tarball_map is checked for existing tarballs and once a checkin is detected, mktarball is called. This thread can be configured to either build the latest checkin, or all checkins. It was implemented using a single thread simply because that was the only way I found to be able to interrupt the thread in python without killing child processes while still allowing the last tarball creation loop to continue.

The build scheduler thread starts a thread for each build client. Each thread scans for new tarballs for the configured packages (in pyutils/config.py) and when one is found, a build is started with packaging/build.

The sync-thread runs a loop every 10 (defined in config.py) seconds and scans for all the directories containing the last 20 (defined in config.py) builds for each build_client/package combo. The dirs are synced over ssh using rsync and is very efficient. Yay for rsync! This was done out of necessity because the main build server is behind a firewall and the webview server needed to be public.

Note: settings in config.py are reloaded very often from the threads so settings can be changed and updated while the scheduler is running.

Interaction between zips, rpms, and installers
----------------------------------------------

The installers are all a bit different but share the same idea. They each have a list of zip packages and or rpms to include. These are extracted and packaged up in some kind of installer. Each of them inherently honor the BUNDLE environment variable.

web publishing and content creation
-----------------------------------

packaging/upload-prod uses rsync commands to copy the sources, builds, and installers to the web server. It also runs some web scripts and found in release/website to generate html pages as well as download repositories.

-   mk-sources-index.py: generate source index for the bundle as well as the archive.
-   mk-distro-index.py: generate index for the download page for a particular distro based on a bundle, as well as put some instructions about how to install from the repos, if the distro supports them.
-   mk-archive-index.py: create an index page that is to be linked from “Old Releases” linking to sources, all distros, and installers for a particular release based on a bundle.
-   mk-repos.py: generate repos for opencarpet, yum, and yast.

TODO: Wishlist features:

