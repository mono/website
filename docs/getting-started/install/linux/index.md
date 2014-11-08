---
title: Install Mono on Linux
redirect_from:
  - /DistroPackages/Ubuntu/
  - /DistroPackages/Debian/
  - /docs/getting-started/install/linux/ubuntu/
  - /docs/getting-started/install/linux/debian/
---

The Linux community has made Mono available for various distributions, check the [download page](/download/) for a list of packages.

Regardless of your distribution, you will need the Mono Project GPG signing key, which package managers require.

Debian, Ubuntu, and derivatives
-------------------------------

Add the Mono Project GPG signing key **in a root shell** with:

``` bash
apt-key adv --keyserver pgp.mit.edu --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
```

Next, add the package repository **in a root shell**:

``` bash
echo "deb http://download.mono-project.com/repo/debian wheezy main" > /etc/apt/sources.list.d/mono-xamarin.list
```

Update your package cache if necessary (i.e. run `apt-get update`), and run a package upgrade to upgrade existing packages to the latest available. Then install Mono as described in the [usage](#usage) section.

Note: While the APT package is built against Debian Wheezy, it is compatible with a number of Debian derivatives (including Ubuntu) which means you can use the same repository across all these distributions.

#### Ubuntu 12.04 and 12.10

To enable installation on Ubuntu 12.04 and Ubuntu 12.10 (and their derivatives), you will need to add a second repository to your system, in addition to the generic Debian/Ubuntu repository above:

``` bash
echo "deb http://download.mono-project.com/repo/debian wheezy-libtiff-compat main" >> /etc/apt/sources.list.d/mono-xamarin.list
```

#### mod_mono on Ubuntu 13.10 and later, Debian 8.0 and later

To enable mod_mono installation on Ubuntu 13.10 and later, and Debian 8.0 and later (and their derivatives), you will need to add a second repository to your system, in addition to the generic Debian/Ubuntu repository above:

``` bash
echo "deb http://download.mono-project.com/repo/debian wheezy-apache24-compat main" >> /etc/apt/sources.list.d/mono-xamarin.list
```

CentOS, Fedora, and derivatives
-------------------------------

Add the Mono Project GPG signing key **in a root shell** with:

``` bash
rpm --import "https://pgp.mit.edu/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
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
