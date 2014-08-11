---
title: Install Mono on Linux
---

Mono for Linux is available for various distributions, check the [download page]({{ site.github.url }}/download) for a list of packages.

After the installation completed successfully, it's a good idea to run through the basic hello world examples on [this page]({{ site.github.url }}/docs/getting-started/mono-basics/) to verify Mono is working correctly.

**Note:** Mono on Linux by default doesn't trust any SSL certificates so you'll get errors when accessing HTTPS resources. To import Mozilla's list of trusted certificates and fix those errors, you need to run `mozroots --import --sync`.
