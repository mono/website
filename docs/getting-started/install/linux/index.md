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

Add the Mono Project GPG signing key and the package repository to your system (if you don't use sudo, be sure to switch to root):

``` bash
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
sudo apt-get update
```

Run a package upgrade to upgrade existing packages to the latest available. Then install Mono as described in the [Usage](#usage) section.

*Note:* While the APT package is built against Debian Wheezy, it is compatible with a number of Debian derivatives (including Ubuntu) which means you can use the same repository across all these distributions.

#### mod_mono (Ubuntu 13.10 and later, Debian 8.0 and later)

To enable mod_mono installation on Ubuntu 13.10 and later, and Debian 8.0 and later (and their derivatives), you will need to add a second repository to your system, **in addition** to the generic Debian/Ubuntu repository above (if you don't use sudo, be sure to switch to root):

``` bash
echo "deb http://download.mono-project.com/repo/debian wheezy-apache24-compat main" | sudo tee -a /etc/apt/sources.list.d/mono-xamarin.list
```

#### libgdiplus (Debian 8.0 and later, NOT Ubuntu)

To enable libgdiplus installation on Debian 8.0 and later (and their derivatives), you will need to add a second repository to your system, **in addition** to the generic Debian/Ubuntu repository above (if you don't use sudo, be sure to switch to root):

``` bash
echo "deb http://download.mono-project.com/repo/debian wheezy-libjpeg62-compat main" | sudo tee -a /etc/apt/sources.list.d/mono-xamarin.list
```

#### Older Ubuntu releases (Ubuntu 12.10 and 12.04)

To enable installation on older Ubuntu releases such as Ubuntu 12.04 and Ubuntu 12.10 (and their derivatives), you will need to add a second repository to your system, **in addition** to the generic Debian/Ubuntu repository (if you don't use sudo, be sure to switch to root):

``` bash
echo "deb http://download.mono-project.com/repo/debian wheezy-libtiff-compat main" | sudo tee -a /etc/apt/sources.list.d/mono-xamarin.list
```

CentOS 7, Fedora 19 (and later), and derivatives
-------------------------------

Add the Mono Project GPG signing key and the package repository **in a root shell** with:

``` bash
yum install yum-utils
rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
yum-config-manager --add-repo http://download.mono-project.com/repo/centos/
```

Run a package upgrade to upgrade existing packages to the latest available. Then install Mono as described in the [Usage](#usage) section.

Users of CentOS or RHEL (or similar distributions) may need to add the [EPEL repository](https://fedoraproject.org/wiki/EPEL) to their system to satisfy all dependencies.

openSUSE and SLES
-----------------

You can install using SUSE One-Click files (see below for descriptions):

[![mono-devel](/images/OneClick.svg)](https://download.mono-project.com/repo/mono-devel.ymp) **mono-devel**

[![mono-complete](/images/OneClick.svg)](https://download.mono-project.com/repo/mono-complete.ymp) **mono-complete**

[![referenceassemblies-pcl](/images/OneClick.svg)](https://download.mono-project.com/repo/referenceassemblies-pcl.ymp) **referenceassemblies-pcl**

<hr/>

Usage
=====

The package ***mono-devel*** should be installed to compile code.

The package ***mono-complete*** should be installed to install everything - this should cover most cases of "assembly not found" errors.

The package ***referenceassemblies-pcl*** should be installed for PCL compilation support - this will resolve most cases of "Framework not installed: .NETPortable" errors during software compilation.

The package ***ca-certificates-mono*** should be installed to get SSL certificates for HTTPS connections. Install this package if you run into trouble making HTTPS connections.

The module ***mono-xsp4*** should be installed for running ASP.NET applications.

Notes
-----

After the installation completed successfully, it's a good idea to run through the basic hello world examples on [this page](/docs/getting-started/mono-basics/) to verify Mono is working correctly.

Mono on Linux before 3.12 by default didn't trust any SSL certificates so you got errors when accessing HTTPS resources. This is not required anymore as 3.12 and later include a new tool that runs on package installation and syncs Mono's certificate store with the system certificate store (on older versions you had to import Mozilla's list of trusted certificates by running `mozroots --import --sync`). Some systems are configured in a way so that the necessary package isn't pulled in when Mono is installed, in those cases **make sure the `ca-certificates-mono` package is installed**.

Accessing older releases
------------------------

If for some reason you want to pin an older version of Mono rather than updating to the latest, you can modify the Debian repository to "wheezy/snapshots/X.XX.X" instead of "wheezy". For example, "wheezy/snapshots/3.10.0" will lock you to that version.

These snapshots will cease receiving updates as soon as the next major Mono version gets uploaded - for example, as soon as Mono 3.12 gets uploaded, 3.10 will never receive updates.

On RPM distributions, force the package version in your package manager - all older versions are published in the YUM metadata and should be available.

Security updates for older releases
-----------------------------------

Due to our repository management software, we are unable to directly offer security fixes in our standard repositories for any version of Mono other than the latest.

If you are running a snapshot version, and want security support, add a repository as appropriate from the list below:

``` bash
echo "deb http://download.mono-project.com/repo/debian 38-security main" | sudo tee -a /etc/apt/sources.list.d/mono-xamarin-security.list
```

``` bash
echo "deb http://download.mono-project.com/repo/debian 310-security main" | sudo tee -a /etc/apt/sources.list.d/mono-xamarin-security.list
```

``` bash
echo "deb http://download.mono-project.com/repo/debian 312-security main" | sudo tee -a /etc/apt/sources.list.d/mono-xamarin-security.list
```

``` bash
echo "deb http://download.mono-project.com/repo/debian 40-security main" | sudo tee -a /etc/apt/sources.list.d/mono-xamarin-security.list
```

Beta update channel
--------------------

If you want to test bleeding-edge updates to Mono, we now have a beta update channel. Please report bugs promptly, so we have time to fix them before packages are migrated to stable!

#### Debian, Ubuntu, and derivatives (beta channel)

``` bash
echo "deb http://download.mono-project.com/repo/debian beta main" | sudo tee /etc/apt/sources.list.d/mono-xamarin-beta.list
sudo apt-get update
```

#### CentOS, Fedora, and derivatives (beta channel)

``` bash
yum-config-manager --add-repo http://download.mono-project.com/repo/centos-beta/
```

This repository URL is also valid for SUSE when added to YaST. This can be done using the [YaST GUI](https://en.opensuse.org/SDB:Add_package_repositories#YaST_software_repositories), or via [zypper](https://en.opensuse.org/SDB:Add_package_repositories#Zypper):

``` bash
zypper ar -f http://download.mono-project.com/repo/centos-beta/ mono-project-beta
```
