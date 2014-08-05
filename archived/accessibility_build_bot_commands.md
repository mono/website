---
title: "Accessibility: Build Bot Commands"
lastmodified: '2009-01-14'
redirect_from:
  - /Accessibility:_Build_Bot_Commands/
---

Accessibility: Build Bot Commands
=================================

Our friendly continuous integration system, Hudson, mirrors the mono, mcs, and gtk-sharp trees every hour looking for new code to build. However, if a commit is made to one of these projects that is required by code about to be committed to uia2atk, and Hudson hasn't had a chance to mirror the latest changes, the build will break. To avoid this situation, you can ask Hudson to rebuild individual modules on demand.

If a rebuild is required in mono or mcs:

    !hudson build mono-core_trunk_tarball

If a rebuild is required in gtk-sharp:

    !hudson build gtk-sharp212_branch_tarball

The latest targets for the build command are available on [Hudson's web interface](http://build0.sled.lab.novell.com:8010/).

