---
layout: obsolete
title: "Compiling Mono 1.0.x From SVN"
lastmodified: '2008-12-03'
permalink: /old_site/Compiling_Mono_1.0.x_From_SVN/
redirect_from:
  - /Compiling_Mono_1.0.x_From_SVN/
---

Compiling Mono 1.0.x From SVN
=============================

Note: Mono 1.0 has been deprecated.

### Checking out for the first time

If you are checking out Mono 1.0.x from SVN for the first time, use the following command:

     $ svn co svn+ssh://USER@mono-cvs.ximian.com/source/branches/mono-1-0

If you do not have an account on the main Subversion repository, you can use anonymous access:

      $ svn co svn://anonsvn.mono-project.com/source/branches/mono-1-0

### Updating an existing checkout

     $ (cd mono-1-0; svn update) 

### Compiling your Mono 1.0.x from SVN

Then you can run:

     (cd mono-1-0/mono; make bootstrap) 

 Now you can install the result:

     (cd mono; make install) 

Notice that following the above procedure does not require you to manually install the software in the \`mcs' directory, as the relevant files will be copied by the \`mono' makefiles.

