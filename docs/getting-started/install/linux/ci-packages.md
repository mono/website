---
title: Continuous Integration packages
redirect_from:
  - /DistroPackages/Jenkins/
---

The Mono Project hosts a [public Jenkins instance](http://jenkins.mono-project.com/), which attempts to compile distribution packages for major GNU/Linux distributions for every commit made to the public Mono git repository on [GitHub](https://github.com/mono/mono).

Requirements
------------

We are building our packages twice, in the most cross-release-compatible way we can manage.

For **Debian-derived** distributions (any distribution which uses .deb files), you need the **GNU C library 2.13** or above, and an **x86-64** or **x86** processor - this should cover Debian 7+, Ubuntu 11.04+, Mint 11+, Elementary 0.2+, and a huge number of other distributions.

For **Red Hat-derived** distributions (any distribution which uses .rpm files), you need the **GNU C library 2.17** or above, and an **x86-64** processor - this should cover CentOS 7+, Mageia 3+, Fedora 19+, openSUSE 12.3+, and a huge number of other distributions.

Installation
------------

Regardless of your distribution, you will need the Mono Project public Jenkins GPG signing key, which package managers require:

[http://jenkins.mono-project.com/repo/xamarin.gpg](http://jenkins.mono-project.com/repo/xamarin.gpg)

### Debian, Ubuntu, and derivatives

Add the GPG key **in a root shell** with:

``` bash
apt-key add xamarin.gpg
```

Next, add the package repository **in a root shell**:

``` bash
echo "deb http://jenkins.mono-project.com/repo/debian sid main" > /etc/apt/sources.list.d/mono-jenkins.list
```

Update your package cache if necessary (i.e. run `apt-get update`).

### CentOS, Fedora, and derivatives

Add the GPG key **in a root shell** with:

``` bash
rpm --import xamarin.gpg
```

Next, add the package repository **in a root shell**:

``` bash
yum-config-manager --add-repo http://jenkins.mono-project.com/repo/centos/
```

Update your package cache if necessary.

Usage
-----

Search your package manager for **mono-snapshot** to find a number of possible packages to install:

``` bash
[directhex@centossy ~]$ yum search mono-snapshot
Loaded plugins: fastestmirror
Loading mirror speeds from cached hostfile
 * base: mirror.econdc.com
 * extras: mirrors.clouvider.net
 * updates: mirrors.clouvider.net
========================== N/S matched: mono-snapshot ==========================
mono-snapshot-20140807112602.x86_64 : Mono runtime snapshot - runtime (git commit 76c34a1)
mono-snapshot-20140807112602-assemblies.noarch : Mono runtime snapshot - assemblies (git commit 76c34a1)
mono-snapshot-20140807155904.x86_64 : Mono runtime snapshot - runtime (git commit 766e8c3)
mono-snapshot-20140807155904-assemblies.noarch : Mono runtime snapshot - assemblies (git commit 766e8c3)
mono-snapshot-common.noarch : Common helper tools for Mono snapshot packages
mono-snapshot-latest.noarch : Mono runtime snapshot - latest version metapackage

  Name and summary matches only, use "search all" for everything.
```

Install the **mono-snapshot-XXXXXXXXX** package for a specific version, or **mono-snapshot-latest** to install whatever the latest available version is. With **mono-snapshot-latest**, your package manager will keep updating you to the latest available version whenever it runs.

Whenever you install any snapshot package, the **`mono-snapshot`** utility will be installed alongside it. Run **`mono-snapshot`** to see which snapshot packages are available and installed:

``` bash
[directhex@centossy ~]$ mono-snapshot
This script will help you to set up your environment to use a
snapshot package of Mono. To use it, run:

    . mono-snapshot APP/VER

You have the following possible combinations of APP/VER:

    mono/20140807112602
    mono/20140807155904

Calling APP without specifying VER will load the latest version
```

You can then configure your environment to use the desired version by calling **`. mono-snapshot APP/VER`** - for example, **`. mono-snapshot mono/20140807112602`** (or simply **`. mono-snapshot mono`**). Please note the leading "**`. `**":

``` bash
[directhex@centossy ~]$ . mono-snapshot mono
[mono-20140807155904][directhex@centossy ~]$ mono --version
Mono JIT compiler version 3.8.1 (tarball Fri Aug  8 05:39:07 EDT 2014)
Copyright (C) 2002-2014 Novell, Inc, Xamarin Inc and Contributors. www.mono-project.com
    TLS:           __thread
    SIGSEGV:       altstack
    Notifications: epoll
    Architecture:  amd64
    Disabled:      none
    Misc:          softdebug
    LLVM:          supported, not enabled.
    GC:            sgen
```

Note: On Debian-based distributions, any distribution-provided Mono libraries (such as GTK#) are automatically installed into your mono-snapshot GAC and are available for use. This is not automatic on Red Hat-based distributions.
