---
title: Install Mono on Linux
---

The Linux community has made Mono available for various distributions, check the [download page](/download) for a list of packages.

Xamarin offers package up-to-date repositories for a variety of [Apt-based](/docs/getting-started/install/linux/debian/) and [Yum-based](/docs/getting-started/install/linux/debian/) distributions. Users running Debian 7+, Ubuntu 11.04+, or similar distributions, should follow the Apt link. Users running CentOS 7+, openSUSE 12+, or similar distributions, should follow the Yum link.

After the installation completed successfully, it's a good idea to run through the basic hello world examples on [this page](/docs/getting-started/mono-basics/) to verify Mono is working correctly.

**Note:** Mono on Linux by default doesn't trust any SSL certificates so you'll get errors when accessing HTTPS resources. To import Mozilla's list of trusted certificates and fix those errors, you need to run `mozroots --import --sync`.
