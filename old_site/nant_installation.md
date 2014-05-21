---
layout: obsolete
title: "NAnt Installation"
lastmodified: '2005-04-22'
permalink: /old_site/NAnt_Installation/
redirect_from:
  - /NAnt_Installation/
---

NAnt Installation
=================

Here is a brief outline of the steps necessary to install NAnt on mono.

The latest release, version 0.85-rc3, had a critical build problem that caused it to fail. As such, it's suggested that users install NAnt from one of the recent nightly tarballs.

**Downloading**

* * * * *

The latest nightly tarball can be found on the NAnt sourceforge site [here](http://nant.sourceforge.net/nightly/latest/nant-src.tar.gz). As this is a nightly snapshot, no guarantees can be made as to whether the latest tarball builds properly on mono. The most recent version known to build, from April 20th, 2005, can be downloaded [here](http://nant.sourceforge.net/nightly/2005-04-20-0.85/nant-src.tar.gz).

**Building**

* * * * *

Building NAnt is relatively trivial. Recent tarballs include a simple Makefile that includes all the necessary pieces to build NAnt. The following commands assume the present working directory is the top level directory of the source tarball.

    $ make
    $ make prefix=/some/prefix install
      OR
    $ make install

If you chose not to explicitly request a prefix, the default prefix of */usr/local* will be used.

**Known Problems**

* * * * *

-   Docs generation:

If you are using a mono version from SVN or newer than mono-1.1.6, you may experience problems building related to documentation generation. Unfortunately, there is no single convenient location to disable documentation generation, but the following tidbit of bash can be used to disable the documentation building. The script assumes your present working directory is the top level folder of the NAnt source tarball.

    $ for file in $(find ./src -name '*.build') ; do sed -i "s: doc=.*>:>:" ${file} ; done

**Basic Usage**

* * * * *

After installation, the command **nant** is available for use. Information on using the nant command can be found by running **nant -help**. By default, nant will search in the present working directory for any files ending in the extension *.build*. You can specify the build file explicitly by doing **nant -buildfile:foo.build**. Further information on using nant, and creating NAnt build files can be found on the NAnt site at [http://nant.sourceforge.net/release/latest/help/](http://nant.sourceforge.net/release/latest/help/).

