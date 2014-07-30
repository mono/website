---
title: "GitMigration"
lastmodified: '2009-12-16'
permalink: /archived/GitMigration/
redirect_from:
  - /GitMigration/
---

GitMigration
============

A page to keep track of the requirements to do the SVN to GIT migration:

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#timeline">1 Timeline</a></li>
<li><a href="#discussion-topics">2 Discussion Topics</a>
<ul>
<li><a href="#modules">2.1 Modules</a>
<ul>
<li><a href="#proposal-1-jonp">2.1.1 Proposal 1 [jonp]</a></li>
</ul></li>
<li><a href="#action-moving-mcs-into-mono">2.2 Action: Moving mcs into mono</a></li>
<li><a href="#branches">2.3 Branches</a></li>
<li><a href="#policies">2.4 Policies</a></li>
<li><a href="#history">2.5 History</a></li>
<li><a href="#github">2.6 GitHub</a></li>
<li><a href="#monodevelop">2.7 MonoDevelop</a></li>
</ul></li>
<li><a href="#testing">3 Testing</a></li>
<li><a href="#other-dependencies">4 Other Dependencies</a></li>
</ul></td>
</tr>
</tbody>
</table>

Timeline
========

To do the migration, we need to come up with a migration plan and address the points in the "Discussion Topics" and "Testing" parts of this document.

We could start the migration after the 2.6 release goes out.

Discussion Topics
=================

Modules
-------

Should we split the jumbo SVN repository into separate GIT, self-contained modules?

There are certain components that probably need to be kept in sync for the sake of the branches (like mono-2-6/{mono,mcs,libgdiplus,mod\_mono,xsp}).

Detail what the toplevel modules will be here.

git becomes slow with huge repositories, like the current mcs module.

### Proposal 1 [jonp]

Since we're moving mcs into mono, perhaps we should restrict the directories in mcs/class (now mono/class? or mono/mcs/class?) to those that:

1.  Are tied to mono via internal calls and P/Invoke (which would thus require mscorlib.dll, System.dll, System.Net, System.Configuration, Mono.Security, Mono.WebBrowser, Mono.Posix.dll, CustomMarshalers, etc.)
2.  Are dependencies of the above (which would pull in System.Xml for System.dll, etc.)
3.  Are required by mcs/tools (assuming we want to keep all of the mcs/tools in the combined repo). I know that for "circular dependency" reasons I would want to keep mdoc, monodoc, and xbuild in the combined tree (so that Documentation can continue to be kept in-tree, as is currently the case, and xbuild because, in an ideal/mythical world, the modules depending on the combined mono module would use xbuild for building).
4.  Otherwise desired (System.Core?, System.Xml.Linq?)

Outside of this list (i.e. mcs/class/\* directories not referenced by the above) would include System.Data and related DB provider code, Mono.C5, Mono.Cairo, Mono.GetOptions (unless it's a dep for some tool), System.Design, System.DirectoryServices\*, System.Drawing, etc., etc.

Does this actually make sense? Maybe. Problem is, I don't know the entire dependency graph -- where should System.Dynamic, System.Numerics, or System.ServiceModel go? System.Web?

[grendel] How would it work regarding history splitting? Is there a way to copy e.g. System.Web's history only to a separate git module?

[alan] What exactly do you mean? I think we have two options:

-   Before migrating to git we do all our reorganising in SVN using "svn mv". This will keep history intact as we shuffle everything.
-   After migrating to git we use some "git mv"s (or equivalent) and shuffle everything around there.
-   I don't think it's possible to move module source/trunk/x/y in svn to source/trunk/x\_y in git directly. We might be able to do it that way by importing modules one by one from SVN, but that might be overly complex.

Regardless, the above might suggest the minimum modules:

-   mono
-   mono-data (System.Data, ADO.NET providers, etc.)
-   mono-web (System.Web, etc.)
-   mono-core (System.\* & related assemblies not in mono?)
-   mono-obsolete (Mono.GetOptions, anything else we'd like to jettison)

Action: Moving mcs into mono
----------------------------

We have had this discussion already, and other than "it is going to cost someone a new checkout" there have been no good reasons to not move "mcs" into the "mono" directory. Let us just do that in preparation for the move.

It would be nice to split mcs into core stuff + extra stuff, and only move the core stuff to mono.

Branches
--------

How do we keep track of all the branches that we need?

Does Gonzalo script actually pull all the branches, and is that enough? -\> Need feedback from QA/Release Engineering.

Check out the [mcs git-svn repo](http://repo.or.cz/w/mcs.git). There's also mono, xsp, monodevelop and mod\_mono.

Policies
--------

QA/Release Engineering team:

We need to describe what our policies will become for branching and tagging releases when using GIT.

We need to come up with an updated document or rules for how we will use branches in GIT.

History
-------

Is there any mapping between the rXXXXX that we have been using over the years to what GIT uses?

git-svn stores it in the git commit messages:

git-svn-id: svn+ssh://mono-cvs.ximian.com/source/trunk/mono@147662 e3ebcda4-bce8-0310-ba0a-eca2169e7518

GitHub
------

It would be nice to have a presence on github/gitorius, so people could fork our repo, post merge requests, use the extensive functionality like version trees, view source etc.

MonoDevelop
-----------

We'll need a MonoDevelop add-in for Git. Several team members are using the current SVN add-in as a regular basis so we need to provide a Git add-in to avoid workflow disruptions.

Testing
=======

Currently Gonzalo publishes SVN to GIT and publishes it at XXXX, we need to test this out for more than trunk development, we need release engineering/QA to give the go ahead that using the export as provided is all that we need.

We need to determine a timeline for testing.

Other Dependencies
==================

-   Keep [http://lists.ximian.com/pipermail/mono-patches](http://lists.ximian.com/pipermail/mono-patches) working
-   Keep [http://groups.google.com/group/mono-svn-patches](http://groups.google.com/group/mono-svn-patches) working
-   Keep [http://cia.vc/stats/project/mono](http://cia.vc/stats/project/mono) working
-   Keep [http://www.ohloh.net/p/mono](http://www.ohloh.net/p/mono) working
-   Keep [http://build.mono-project.com/](http://build.mono-project.com/) working


