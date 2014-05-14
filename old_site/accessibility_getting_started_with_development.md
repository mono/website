---
layout: obsolete
title: "Accessibility: Getting Started With Development"
permalink: /old_site/Accessibility:_Getting_Started_With_Development/
redirect_from:
  - /Accessibility:_Getting_Started_With_Development/
---

Accessibility: Getting Started With Development
===============================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#getting-the-code">2 Getting the Code</a></li>
<li><a href="#setting-up-your-environment">3 Setting Up Your Environment</a></li>
<li><a href="#building-the-code">4 Building the Code</a></li>
<li><a href="#making-changes">5 Making Changes</a>
<ul>
<li><a href="#coding-guidelines">5.1 Coding Guidelines</a></li>
<li><a href="#good-resources">5.2 Good resources</a></li>
</ul></li>
<li><a href="#testing-your-changes">6 Testing Your Changes</a>
<ul>
<li><a href="#getting-code-coverage">6.1 Getting Code Coverage</a></li>
</ul></li>
<li><a href="#submitting-patches">7 Submitting Patches</a></li>
<li><a href="#committing-changes-to-svn">8 Committing Changes to SVN</a>
<ul>
<li><a href="#before-committing-setting-up-svn-auto-props">8.1 BEFORE COMMITTING: Setting up SVN auto-props</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
------------

So you've just joined the [UIA team]({{site.github.url}}/old_site/Accessibility:_Team "Accessibility: Team"), or are interested in contributing to the development effort. Welcome! Here are some guidelines to get started with building our software, making changes, submitting patches, and committing to SVN.

Getting the Code
----------------

The UIA code is located in Mono SVN. It is contained in the uia2atk module. We suggest that you keep all Mono SVN checkouts in one common directory, such as \~/mono-svn. Change to this directory and run the following command:

    svn co svn+ssh://[yournamehere]@mono-cvs.ximian.com/source/trunk/uia2atk

As of this writing, you will also need gtk-sharp, mono, and mcs from SVN.

    svn co svn+ssh://[yournamehere]@mono-cvs.ximian.com/source/trunk/mono
    svn co svn+ssh://[yournamehere]@mono-cvs.ximian.com/source/trunk/mcs
    svn co svn+ssh://[yournamehere]@mono-cvs.ximian.com/source/trunk/gtk-sharp

Setting Up Your Environment
---------------------------

-   You need a bunch of bleeding edge stuff in your GAC. Easiest way to do that is to set up [Parallel Mono Environments]({{site.github.url}}/old_site/Parallel_Mono_Environments "Parallel Mono Environments"). We recommend using a user-writable path for your prefix, so you don't have to use \`sudo\` whenever you \`make install\`. On this page we'll use the example prefix of /home/[user]/parallel-mono
    -   Follow the wiki page exactly, installing mono/gtk-sharp/etc from latest SVN (not from tarballs).
    -   Follow the same instructions but for uia2atk/UIAutomation.
    -   Install [Mono.Addins 0.3.1 from tarball](http://www.go-mono.com/sources/mono-addins/mono-addins-0.3.1.tar.bz2) in the parallel environment.
    -   Install MonoDevelop in the parallel environment:
        -   Checkout the latest MonoDevelop trunk (or use MonoDevelop 1.9.1 (aka 2.0 Alpha 2)):

<!-- -->

     svn co svn+ssh://[yournamehere]@mono-cvs.ximian.com/source/trunk/monodevelop

-   -   -   And build it with:

<!-- -->

    cd monodevelop
    ./configure --profile=core --prefix=/home/[user]/parallel-mono
    make

-   -   -   You can run it uninstalled if you like:

<!-- -->

    make run

-   -   -   Or install it in your parallel environment (may require sudo):

<!-- -->

    make install

-   -   -   If you have trouble starting your new MD, you may need to delete your old addin configuration by doing \`rm -rf \~/.config/MonoDevelop/addin\*\`.
    -   **Whenever you deal with mono-a11y stuff, make sure you're running in the parallel environment!** You do this by doing everything from a terminal that has run \`source \~/mono-dev-env\` (replace \~/mono-dev-env with the location of your parallel mono environment script).

Building the Code
-----------------

First, always make sure you are running in the parallel mono environment when you work with this code:

    sandy@linux:~> source ~/mono-dev-env
    [mono] ~ @

(If you don't have your [CONFIG\_SITE]({{site.github.url}}/Parallel_Mono_Environments#Tip:_CONFIG_SITE) set up, you will need to specify the correct prefix when you run autogen.sh, for example \`./autogen.sh --prefix=/home/[user]/parallel-mono\`)

    [mono] ~/mono-svn/uia2atk/UIAutomation @ ./autogen.sh && make && make install

    [mono] ~/mono-svn/uia2atk/UiaAtkBridge @ ./autogen.sh

    [mono] ~/mono-svn/uia2atk/UIAutomationWinforms @ ./autogen.sh

You can then open uia2atk/Uia2Atk.mds in MonoDevelop to modify our code and build your changes:

    [mono] ~/mono-svn/uia2atk @ monodevelop Uia2Atk.mds

You will need to \`make install\` UiaAtkBridge and UIAutomationWinforms in order to have a11y support for winforms.

Making Changes
--------------

We highly recommend using MonoDevelop to edit UIA code. If you are adding any new files, MonoDevelop will automatically update our makefiles to include those files in the build. Also, those new files will be added to your SVN working copy, so your patches will come out correctly.

### Coding Guidelines

In general we follow the [Mono Coding Guidelines]({{site.github.url}}/old_site/Coding_Guidelines "Coding Guidelines"), with the following notable exceptions:

-   We use camelCase instead of names\_with\_underscores for all private/protected fields and local variables.
-   We put the opening curly brace ('{') for a class on the next line.
-   We align method call arguments the same way method declaration arguments are aligned according to the Mono guidelines (this is MonoDevelop's default behavior).
-   Almost every non-private class you write should be internal instead of public. Make sure you have a good reason for making a class public.
-   Names in UIA are so long that we often cannot avoid going over 80 characters per line. Try your best to keep your lines short and your code readable, though.

### Good resources

-   [Writing Provider from Scratch]({{site.github.url}}/old_site/Accessibility:_Provider_From_Scratch "Accessibility: Provider From Scratch")
-   [Windows Forms Implementation]({{site.github.url}}/old_site/Accessibility:_Winforms_Implementation "Accessibility: Winforms Implementation")

Testing Your Changes
--------------------

1.  Make sure your changes build by rebuilding the MonoDevelop solution.
2.  Install your modifications to the system using \`make install\`.
3.  Run unit tests to make sure nothing broke.
4.  Test to make sure your changes do what you think they do.

### Getting Code Coverage

If you install monocov from svn, you can do something like this to get code coverage when you run your unit tests:

    cd ~/mono-svn/uia2atk/UIAutomationWinforms/UIAutomationWinformsTests/bin/Debug
    MONO_OPTIONS="--profile=monocov:outfile=mytest.cov,+[UIAutomationWinforms]" nunit-console2 UIAutomationWinformsTests.dll
    monocov mytest.cov

This can be really helpful if you want to make sure that your tests are really exercising your code sufficiently.

Submitting Patches
------------------

Now you have made your changes and tested them and would like them to be reviewed so that they can be committed. First, generate a patch from the top level of your working copy with this command (in this example, notice that my current directory is the top level of the uia2atk SVN module):

    [mono] ~/mono-svn/uia2atk @ svn diff > my-cool-fix.patch

Then send an email to the mono-a11y list ([mono-a11y@forge.novell.com](http://forge.novell.com/mailman/listinfo/mono-a11y)) describing your patch, with the patch attached to the email. The development team will review your patch, and may request some changes. If that is the case, please follow the process above to re-test and re-submit your patch. If the patch is approved, a team member may commit it to SVN for you, or you may be asked to commit it yourself.

Committing Changes to SVN
-------------------------

If you have a Mono SVN account, you may be asked to commit your changes. We highly recommend using MonoDevelop to do this, to ensure that your commit messages and ChangeLog entries follow the same convention that we use.

Open up the MonoDevelop solution in which you have been working, right-click it in the Solution Explorer, and select "Version Control -\> Review Changes". You will be presented with a lovely UI where you can see what files have been changed, review diffs, etc. Make sure only the files you want to commit are checked. Click on a file and a text entry will appear where you can document the changes you made. This text will automatically be converted into appropriate ChangeLog entires and commit log messages. After entering a message for each file (HINT: you can select multiple files at once and give them the same message), click the "Commit..." button, review the ChangeLog entries, and select "Commit".

### BEFORE COMMITTING: Setting up SVN auto-props

Some of our files should be editable in Windows and in Linux. To make sure we don't get mixed line endings in our files, all files should have the svn:eol-style property set to "native". You should configure Subversion to automatically set this property on new files.

You need to edit your subversion configuration file. On Linux, this file is located at \~/.subversion/config . On Windows, using TortoiseSVN, right-click anywhere on the Desktop and go to TortoiseSVN -\> Settings -\> General -\> Subversion configuration file, and select the Edit button.

Unless you have already customized yours, most of the file will be commented out with "\#" characters. Add this to your configuration file:

    ### Set enable-auto-props to 'yes' to enable automatic properties
    ### for 'svn add' and 'svn import', it defaults to 'no'.
    ### Automatic properties are defined in the section 'auto-props'.
    enable-auto-props = yes

    ### Section for configuring automatic properties.
    [auto-props]
    ### The format of the entries is:
    ###   file-name-pattern = propname[=value][;propname[=value]...]
    ### The file-name-pattern can contain wildcards (such as '*' and
    ### '?').  All entries which match (case-insensitively) will be
    ### applied to the file.  Note that auto-props functionality
    ### must be enabled, which is typically done by setting the
    ### 'enable-auto-props' option.
    *.c = svn:eol-style=native
    *.cpp = svn:eol-style=native
    *.h = svn:eol-style=native
    *.cs = svn:eol-style=native
    *.py = svn:eol-style=native
    *.boo = svn:eol-style=native
    Makefile = svn:eol-style=native
    ChangeLog = svn:eol-style=native
    *.dll.sources = svn:eol-style=native

