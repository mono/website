---
layout: obsolete
title: "BuildSystem/ReleaseProcess"
lastmodified: '2013-01-19'
permalink: /old_site/BuildSystem/ReleaseProcess/
redirect_from:
  - /BuildSystem/ReleaseProcess/
---

BuildSystem/ReleaseProcess
==========================

Description of the Mono release process

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#branching-and-tagging-policy">1 Branching and Tagging Policy</a></li>
<li><a href="#tagging">2 Tagging</a></li>
<li><a href="#rolling-source-tarballs">3 Rolling Source Tarballs</a></li>
<li><a href="#builds">4 Builds</a></li>
<li><a href="#installers">5 Installers</a></li>
<li><a href="#release-notes">6 Release Notes</a></li>
<li><a href="#publishing-previews-and-final-release">7 Publishing Previews and final release</a></li>
<li><a href="#update-mono-projectcom-wiki">8 Update mono-project.com wiki</a></li>
<li><a href="#obs-and-autobuild">9 OBS and autobuild</a></li>
</ul></td>
</tr>
</tbody>
</table>

Branching and Tagging Policy
----------------------------

Typically the same modules are released as a set:

-   gluezilla
-   libgdiplus
-   mcs
-   mod\_mono
-   mono
-   mono-basic
-   mono-tools
-   monodoc
-   xsp

Other projects usually use their own schedule:

-   monodevelop
-   moonlight
-   gtk\#

Mono versions for tags and branches in subversion don't use periods in the version numbers. IE: branches/mono-1-9 and tags/mono-1-9

Some modules have their own branching and tagging standards, and those standards are listed in their respective def file (trunk/release/packaging/defs).

The typical flow is to branch from trunk, solidify the branch, and then create a tag from that branch. Dot releases are then based on that branch and are tagged from the branch.

The Mono policy about re-tagging is that it is allow as long as the tarballs haven't been published as a final release. This means that tarballs published in a preview may change.

If you're building from trunk you'll usually branch or tag most of the modules because they've usually all changed. (Use svn diff to be sure).

Tagging
-------

If you're building from a branch, there's a helper script to see changes:

    release/packaging/mono_branch_diff

Before you actually create the tag, the version needs to be updated in the source. This is usually done in 'configure.in'. (For hints on how to update a specific module, you can check the module's release/packaging/def file for update\_version\_file, otherwise configure.in is updated)

Make sure this version update happens in trunk or on the branch; NEVER commit to a tag.

After you've committed the version update change, you're ready to create the tags. Example:

    svn mkdir $MSVN/tags/mono-1-9-2
    svn cp $MSVN/branches/mono-1-9/mono $MSVN/tags/mono-1-9-2
    svn cp $MSVN/branches/mono-1-9/mcs $MSVN/tags/mono-1-9-2

Rolling Source Tarballs
-----------------------

After subversion tags have been created, monobuild is used to create a tarball.

This is done with ./mktarball in trunk/release/packaging. (You can run that command with no args to get a usage). A typical example would be:

    ./mktarball mono 1.9

That will place the tarball in release/packaging/sources/mono

Builds
------

To do the actual build you run ./build. IE:

    ./build sles-9-i586 mono 1.9

To build mono 1.9 on all the platforms you can run:

    ./build-all mono 1.9

That will simultaneously build mono on all the distros/platforms.

If several modules need to be built, you'll need to run ./build-all for each of those modules in their build dependency order. The order can be deduced from MONO\_DEPS in each of the module's .def file.

The best way to monitor the builds is through the webview.

Note: aside about build mono from a branch: If the .spec files have diverged between trunk and the mono branch, you'll need to temporarily copy packaging/rpm\_defs/mono-branch/mono-core.spec to packaging/rpm\_defs/mono . After the builds and before you enable the monobuild scheduler again, don't forget to revert this change.

Installers
----------

The installers use the .rpm and .zip outputs of the builds created by ./build.

Here's how to run each of the installers:

    cd release/linux-installer
    ./buildlinux-installer 1.9.1

    cd release/windows-installer
    ./buildwindows-installer 1.9.1

    cd release/macosx
    ./buildpackage universal

Each of the installer scripts take an optional 'release' argument as the last parameter. It signifies the build revision for a particular release.

Release Notes
-------------

Release notes are in subversion:

    trunk/release/announce

Those changes are typically done by Miguel, who gathers important changes from the team via email, as well as reviews ChangeLogs from the svn diff.

Once the file is ready, there's a Makefile in announce that needs to be updated to publish the latest release notes.

Publishing Previews and final release
-------------------------------------

Once a build is done QA tests the build. In case something is found, we publish a 'preview' instead of a final release. This will give us a chance to retag and rebuild before shipping the final version.

To publish the preview, first update release/packaging/bundles/PRE-RELEASE. Update 'archive\_version' as well as 'bundle\_short\_desc'. Then run from release/packaging:

    ./upload-preview

Some variables in this script may be edited to also upload the preview to c100 for faster internal downloads.

After QA gives the go-ahead, you publish to ftp.novell.com. Again, first update packaging/bundles/RELEASE to have the correct mono release version. Then run:

    ./upload-prod --generate RELEASE

This will generate the webpages and download repositories. Then you can run:

    ./upload-prod RELEASE

This does a dry-run rsync. The purpose being able to see what packages are being copied to ftp.novell.com. I only like to publish the final release builds and not the preview builds. This helps save some space. So if you have 3 preview releases, I'll look at the rsync command to find duplicate packages and installers and go remove them by hand. I'll repeat this command a few times until I'm satisfied that I'm not using any more disk space than necessary. When everything looks good, then run:

    ./upload-prod --publish RELEASE

That will do the actual copy.

Update mono-project.com wiki
----------------------------

Add current release to the list of releases at [OldReleases]({{site.github.url}}/old_site/OldReleases "OldReleases"). Update download page by editing:

    release/website/download_page/release_data.js

You'll need to commit that file and then run 'svn up' in \~/release on go-mono.com.

OBS and autobuild
-----------------

An account is required in order to submit sources to the openSUSE Build Service. You must also have access to the 'Mono' namespace. There is OBS documentation on en.opensuse.org.

Usually it is best to disable publishing in OBS for the Mono project while builds are being done. That way if you have to rebuild a few times multiple rpms don't get distributed. Once everything is building fine, re-enable publishing.

Autobuild submissions are done from macintyre.suse.de (although any autobuild machine will do). But, for opensuse 11.1 the distro will be built out of OBS.

