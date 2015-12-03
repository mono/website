---
title: Weekly Snapshot packages
---

The Mono project is making packages available containing the absolute latest code, in an untested state - use these to verify and validate the latest changes.

Source Code
-----------

Source tarballs can be found [here](http://download.mono-project.com/sources/mono/nightly/)

Mac OS X
--------

Mac OS X packages can be found [here](http://download.mono-project.com/archive/nightly/macos-10-universal/)

Debian, Ubuntu, and derivatives
-------------------------------

Assuming you have already configured the other Mono repositories required for your distribution:

``` bash
echo "deb http://download.mono-project.com/repo/debian nightly main" | sudo tee /etc/apt/sources.list.d/mono-nightly.list
sudo apt-get update
```

CentOS, Fedora, and derivatives
-------------------------------

Assuming you have already configured the other Mono repositories required for your distribution:

``` bash
yum-config-manager --add-repo http://download.mono-project.com/repo/centos-nightly/
```
