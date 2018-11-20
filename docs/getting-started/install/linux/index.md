---
title: Install Mono on Linux
redirect_from:
  - /DistroPackages/Ubuntu/
  - /DistroPackages/Debian/
  - /docs/getting-started/install/linux/ubuntu/
  - /docs/getting-started/install/linux/debian/
---

Follow the instructions on the [download page](/download/stable/#download-lin) for the latest stable release. Alternatively, you can also try the [preview](/download/preview/#download-lin) version.

Accessing older releases
------------------------

If for some reason you want to pin an older version of Mono rather than updating to the latest, you can modify the Debian repository to "stable-jessie/snapshots/X.XX.X" instead of "stable-jessie". For example, "stable-jessie/snapshots/3.10.0" will lock you to that version.

_Note:_ you'll get a warning similar to this one when running `apt update`, it is harmless and can be ignored:

> W: Conflicting distribution: https://download.mono-project.com stable-jessie/snapshots/3.10.0.160 InRelease (expected stable-jessie/snapshots but got jessie)

These snapshots will cease receiving updates as soon as the next major Mono version gets uploaded - for example, as soon as Mono 3.12 gets uploaded, 3.10 will never receive updates.

On RPM distributions, force the package version in your package manager - all older versions are published in the YUM metadata and should be available.
