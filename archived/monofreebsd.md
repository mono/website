---
title: "Mono:FreeBSD"
lastmodified: '2010-02-04'
redirect_from:
  - /Mono:FreeBSD/
---

Mono:FreeBSD
============

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#bsd">1 BSD#</a>
<ul>
<li><a href="#who-are-we">1.1 Who Are We?</a>
<ul>
<li><a href="#former-members">1.1.1 Former members</a></li>
</ul></li>
<li><a href="#mailing-list">1.2 Mailing list</a></li>
<li><a href="#project-hosting">1.3 Project hosting</a></li>
<li><a href="#irc">1.4 IRC</a></li>
<li><a href="#introduction">1.5 Introduction</a></li>
<li><a href="#volunteer">1.6 Volunteer!</a></li>
<li><a href="#using-mono-on-freebsd">1.7 Using Mono on FreeBSD</a>
<ul>
<li><a href="#obtaining-mono">1.7.1 Obtaining Mono</a>
<ul>
<li><a href="#using-the-freebsd-ports-tree-stability">1.7.1.1 Using the FreeBSD ports tree (Stability)</a></li>
<li><a href="#using-the-bsd-ports-tree-development">1.7.1.2 Using the BSD# Ports Tree (Development)</a></li>
</ul></li>
<li><a href="#problems-with-mono">1.7.2 Problems with Mono</a></li>
</ul></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

BSD\#
=====

Packaging for Mono and related applications on [FreeBSD](http://www.freebsd.org) is handled by the BSD\# Project. The purpose of this project is to maintain the existing Mono/C\# ports in the FreeBSD ports tree, port new applications, and work on resolving FreeBSD specific issues with Mono. BSD\# is entirely user supported and is not an official FreeBSD or Mono project.

Who Are We?
-----------

-   Romain Tartière \<romain@FreeBSD.org\>

### Former members

-   Christopher Nehren
-   Jeremy Messenger
-   Phillip Neuman
-   Tom McLaughlin

Mailing list
------------

-   mono@FreeBSD.org [(subscribe)](http://lists.freebsd.org/mailman/listinfo/freebsd-mono) [(archives)](http://lists.freebsd.org/pipermail/freebsd-mono/)

Project hosting
---------------

-   [BSD\# on Google Code](http://code.google.com/p/bsd-sharp/)

IRC
---

-   \#bsd-sharp on [Freenode](http://freenode.net)

Introduction
------------

The BSD\# Project is devoted to porting and maintaining the Mono .NET framework for FreeBSD. The Mono framework consists of not only the Mono Runtime environment and compiler but the XSP web server for handling ASP.NET applications, the IKVM Java virtual machine for handling Java within the framework, and numerous data providers to provide common library functions in C\# or integration with existing C libraries.

The BSD\# Project is hosted on [Google Code](http://code.google.com/p/bsd-sharp/). The project's [SVN repository](http://code.google.com/p/bsd-sharp/source/browse) currently contains FreeBSD ports for all Mono packages released by Novell. It also includes ports for applications and libraries from third parties as well with the intent that they be integrated into the standard FreeBSD ports tree. The project aims to act as a central testing point for porting new releases from Novell, for introducing new applications, and for testing framework wide changes that will affect all applications that rely on Mono before they reach the FreeBSD ports tree.

Volunteer
---------

Mono on FreeBSD is user supported and there is a lot of work to do. Previous C\# or .NET is not even required. We have many needs that can be handled by anybody knowledgeable of FreeBSD (or is willing to learn). Most of our work is porting related and anyone that has read the [FreeBSD Porters Handbook](http://www.freebsd.org/doc/en_US.ISO8859-1/books/porters-handbook/) can easily get started with work updating the existing ports or creating new ports. The project makes a great starting point for those interested in Mono and are looking for something to do. If you are interested in volunteering just subscribe and email [mono@FreeBSD.org](http://lists.freebsd.org/mailman/listinfo/freebsd-mono) and ask what we currently need done.

Using Mono on FreeBSD
---------------------

### Obtaining Mono

FreeBSD users interested in Mono can obtain it in two ways. For stability users can use the Mono port in the FreeBSD ports tree. For those interested in furthering Mono on FreeBSD they can use the BSD\# Ports Tree. The BSD\# Project also maintains [different versions of Mono within in the BSD\# Ports Tree](http://code.google.com/p/bsd-sharp/wiki/Branches).

**NOTE:** It is generally recommended that FreeBSD users NOT download the standard source tarball from the Mono download page and attempt to build/install it but use their ports system instead due to local patches contained in the ports tree. FreeBSD users interested in Mono can obtain it in two ways.

#### Using the FreeBSD ports tree (Stability)

Mono and many other related applications can already be found in the FreeBSD Ports Tree. The version there represents the latest tested version of Mono's stable release line and is meant for those users that value a stable and working port the most. Those users that want a version of Mono simply to run other ports should use this version.

#### Using the BSD\# Ports Tree (Development)

Those users more interested in using or developing with the latest stable version of Mono or the latest developmental version should use the BSD\# Ports. We cannot guarentee that the BSD\# Ports are always stable but we do our best to test ports before committing them and try to resolve reported breakage as quickly as possible.

Integrating the BSD\# Ports Tree with your own is done through the portshaker script and is available in the BSD\# Project.

-   [portshaker](http://code.google.com/p/bsd-sharp/downloads/list): Merges BSD\# Ports Tree with local tree.

[Instruction for using portshaker](http://code.google.com/p/bsd-sharp/wiki/Installing) are provided on the BSD\# Wiki.

### Problems with Mono

Before reporting problems with Mono on FreeBSD to the regular [Mono mailing lists](/Mailing_Lists "Mailing Lists") it is better to report them to our [mono@FreeBSD.org](http://lists.freebsd.org/mailman/listinfo/freebsd-mono) so we can take a look at the issue first. We have a few unresolved FreeBSD issues that do crop up from time to time.

Please see our [problem reporting page](/Mono:FreeBSD-Problems "Mono:FreeBSD-Problems") to help give us enough information to solve your problem.

