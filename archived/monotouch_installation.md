---
title: "MonoTouch Installation"
lastmodified: '2009-09-13'
redirect_from:
  - /MonoTouch_Installation/
---

MonoTouch Installation
======================

[MonoTouch](/MonoTouch) is an SDK for developing applications for the iPhone using Mono. In addition to the Unix SDK, we are also releasing an optional alpha release of MonoDevelop 2.2 that contains support for iPhone application development.

Our [MonoTouch_Beta](/MonoTouch_Beta) page contains other useful information for developers getting started with MonoTouch on the iPhone Beta program, and instructions for signing up for the beta program.

**The SDK can only be downloaded if you have received a beta invitation. Invitations are going out in waves to people who have filled out the [beta signup form](http://spreadsheets.google.com/viewform?hl=en&formkey=dHRXeFI5b1NjUWdRRkpiSmxkanh6T1E6MA..).**

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#basic-requirements">1 Basic Requirements</a></li>
<li><a href="#mono-installation">2 Mono Installation</a></li>
<li><a href="#monotouch-sdk-installation">3 MonoTouch SDK Installation</a></li>
<li><a href="#monodevelop-installation">4 MonoDevelop Installation</a></li>
<li><a href="#downloads">5 Downloads</a></li>
<li><a href="#documentation">6 Documentation</a></li>
<li><a href="#samples">7 Samples</a></li>
</ul></td>
</tr>
</tbody>
</table>

Basic Requirements
==================

To try out MonoTouch, you will need to have Apple's iPhone SDK 3.0 or higher, available from [Apple's iPhone Dev Center](http://developer.apple.com/iphone/).

With the iPhone SDK you will be able to write applications and test them on the iPhone simulator. Additionally, if you want to deploy the resulting applications on the device for AppStore, Ad-Hoc or Enterprise distribution you will need to be part of the [iPhone developer program](http://developer.apple.com/iphone/program/).

Make sure that you can launch the iPhone simulator before continuing to the next step.

Mono Installation
=================

Download and install the latest version of Mono 2.4 for OSX from [the Mono downloads page](/download/).

MonoTouch SDK Installation
==========================

**Do not bother performing this step until you have Mono 2.4 from the previous step done. If you do not install Mono 2.4, your install will not work.**

Download and install the [MonoTouch DMG](http://www.go-mono.com/monotouch-download/monotouch-0.9.10-20090913-0.pkg) file. This will give you access to the command line tools to develop applications with MonoTouch. The [tutorials](/MonoTouch_Tutorials) on this site will guide you through the steps of getting your sample applications running from the command line.

MonoDevelop Installation
========================

To get you up and running in the shortest amount of time, you will want to install MonoDevelop on your system. Keep in mind that MonoDevelop for OSX is a preview of the upcoming MonoDevelop 2.2 and has a few rendering glitches.

To get MonoDevelop 2.2 up and running, you need:

-   The MonoTouch-enabled version of [MonoDevelop 2.2 Alpha for OSX](http://go-mono.com/archive/MonoDevelop-MonoTouch-Preview-20090904-0.dmg).

Downloads
=========

-   [MonoTouch Installer](http://www.go-mono.com/monotouch-download/monotouch-0.9.10-20090913-0.pkg)
-   [MonoTouch-enabled MonoDevelop 2.2 Alpha Installer](http://go-mono.com/archive/MonoDevelop-MonoTouch-Preview-20090904-0.dmg).

[Release History](/MonoTouch_ReleaseNotes)

Documentation
=============

In addition to the tutorials on this site, our web site at [www.go-mono.com/docs](http://www.go-mono.com/docs) contains the API documentation for the libraries shipped with MonoTouch. Look for the MonoTouch namespace.

The API design for the CIL/Objective-C binding is covered in our [MonoTouch_API](/MonoTouch_API) document.

Samples
=======

We have ported some sample applications from CocoaTouch/Objective-C to [MonoTouch](/MonoTouch), you can:

-   [Browse the Source Code on the web](http://anonsvn.mono-project.com/viewvc/trunk/monotouch/samples/)
-   Use [AnonSVN](/SourceCodeRepository) to download a copy to your machine using SVN.
-   [Download a tarball.](http://www.go-mono.com/archive/monotouch-samples-2009-09-11.tar.gz)

Most of the samples are built using the pure SDK and Unix makefiles. This is done to illustrate the process used.

There is one MonoDevelop for iPhone setup called `monocatalog-md` which is identical to `monocatalog`. The only difference is that this is a pre-made MonoDevelop solution file.

The samples require [MonoTouch to be installed](/MonoTouch_Installation).

