---
title: Install Mono on Linux
redirect_from:
  - /DistroPackages/Ubuntu/
  - /DistroPackages/Debian/
  - /docs/getting-started/install/linux/ubuntu/
  - /docs/getting-started/install/linux/debian/
---

Regardless of your distribution, you will need the Mono Project GPG signing key, which package managers require.

Debian, Ubuntu, and derivatives
-------------------------------

Add the Mono Project GPG signing key (if you don't use sudo, be sure to switch to root):

``` bash
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
```

Next, add the package repository (if you don't use sudo, be sure to switch to root):

``` bash
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
```

Update your package cache if necessary (i.e. run `apt-get update`), and run a package upgrade to upgrade existing packages to the latest available. Then install Mono as described in the [Usage](#usage) section.

*Note:* While the APT package is built against Debian Wheezy, it is compatible with a number of Debian derivatives (including Ubuntu) which means you can use the same repository across all these distributions.

#### mod_mono (Ubuntu 13.10 and later, Debian 8.0 and later)

To enable mod_mono installation on Ubuntu 13.10 and later, and Debian 8.0 and later (and their derivatives), you will need to add a second repository to your system, **in addition** to the generic Debian/Ubuntu repository above (if you don't use sudo, be sure to switch to root):

``` bash
echo "deb http://download.mono-project.com/repo/debian wheezy-apache24-compat main" | sudo tee -a /etc/apt/sources.list.d/mono-xamarin.list
```

#### Older Ubuntu releases (Ubuntu 12.10 and 12.04)

To enable installation on older Ubuntu releases such as Ubuntu 12.04 and Ubuntu 12.10 (and their derivatives), you will need to add a second repository to your system, **in addition** to the generic Debian/Ubuntu repository (if you don't use sudo, be sure to switch to root):

``` bash
echo "deb http://download.mono-project.com/repo/debian wheezy-libtiff-compat main" | sudo tee -a /etc/apt/sources.list.d/mono-xamarin.list
```

CentOS, Fedora, and derivatives
-------------------------------

Add the Mono Project GPG signing key **in a root shell** with:

``` bash
rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
```

Next, add the package repository **in a root shell**:

``` bash
yum-config-manager --add-repo http://download.mono-project.com/repo/centos/
```

Update your package cache if necessary, and run a package upgrade to upgrade existing packages to the latest available.

Users of CentOS or RHEL (or similar distributions) may need to add the [EPEL repository](https://fedoraproject.org/wiki/EPEL) to their system to satisfy all dependencies

Usage
-----

The package ***mono-devel*** should be installed to compile code.

The package ***mono-complete*** should be installed to install everything - this should cover most cases of "assembly not found" errors.

Notes
-----

After the installation completed successfully, it's a good idea to run through the basic hello world examples on [this page](/docs/getting-started/mono-basics/) to verify Mono is working correctly.

**Note:** Mono on Linux by default doesn't trust any SSL certificates so you'll get errors when accessing HTTPS resources. To import Mozilla's list of trusted certificates and fix those errors, you need to run `mozroots --import --sync`.

Accessing older releases
------------------------

If for some reason you want to pin an older version of Mono rather than updating to the latest, you can modify the Debian repository to "wheezy/snapshots/X.XX.X" instead of "wheezy". For example, "wheezy/snapshots/3.10.0" will lock you to that version.

These snapshots will cease receiving updates as soon as the next major Mono version gets uploaded - for example, as soon as Mono 3.12 gets uploaded, 3.10 will never receive updates.

On RPM distributions, force the package version in your package manager - all older versions are published in the YUM metadata and should be available.
