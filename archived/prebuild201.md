---
title: "Prebuild:2.0.1"
lastmodified: '2007-04-11'
redirect_from:
  - /Prebuild%3A2.0.1/
---

Prebuild:2.0.1
==============

prebuild-1.7.xsd has been updated to include optional solution and project version information

Version 2.0.1 incorporates the new Autotools target from the Prebuild-cjac branch:

-   solution-level build system
    -   the solution-level build system builds all projects
    -   autogen.sh
    -   configure.ac
    -   Makefile.am
-   project-level build systems
    -   each project-level build system is autonomous
    -   standard targets work: all, clean, dist, install, uninstall
    -   exe and winexe targets build a wrapper script that calls the .exe
    -   library targets build a .pc file and install it to \$prefix/lib/mono/\$project
    -   If strongname key is provided, libraries will be installed into the GAC
    -   support for /doc
    -   support for /unsafe
    -   support for /key
    -   If there is an AssemblyInfo.cs for the project, it is queried for the assembly's version
