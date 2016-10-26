---
title: "Accessibility: Moonlight"
lastmodified: '2010-07-26'
redirect_from:
  - /Accessibility%3A_Moonlight/
---

Accessibility: Moonlight
========================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#moonlight-accessibility">1 Moonlight Accessibility</a>
<ul>
<li><a href="#for-developers">1.1 For Developers</a>
<ul>
<li><a href="#building-firefox-with-plugin-accessibility-mozilla-192">1.1.1 Building Firefox with Plugin Accessibility (mozilla-1.9.2)</a></li>
<li><a href="#building-firefox-with-plugin-accessibility-mozilla-central">1.1.2 Building Firefox with Plugin Accessibility (mozilla-central)</a></li>
<li><a href="#useful-notes">1.1.3 Useful notes</a></li>
<li><a href="#development-with-firefox">1.1.4 Development with Firefox</a></li>
<li><a href="#setting-up-your-moonlight-environment">1.1.5 Setting up your Moonlight Environment</a>
<ul>
<li><a href="#supplies">1.1.5.1 Supplies</a></li>
<li><a href="#setting-up-the-base-environment">1.1.5.2 Setting up the Base Environment</a></li>
<li><a href="#building-for-firefox-mozilla-192">1.1.5.3 Building for Firefox (mozilla-1.9.2)</a></li>
<li><a href="#building-for-firefox-mozilla-central">1.1.5.4 Building for Firefox (mozilla-central)</a></li>
<li><a href="#useful-notes-2">1.1.5.5 Useful notes</a></li>
<li><a href="#setting-up-the-moonatkbridge-environment-mozilla-192">1.1.5.6 Setting up the MoonAtkBridge Environment (mozilla-1.9.2)</a></li>
<li><a href="#setting-up-the-moonatkbridge-environment-mozilla-central">1.1.5.7 Setting up the MoonAtkBridge Environment (mozilla-central)</a></li>
</ul></li>
</ul></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Moonlight Accessibility
=======================

As part of their second phase, the Mono Accessibility team will be implementing full UIA support for [Moonlight](/Moonlight).

The following platforms will be supported using our plugin:

-   SUSE Linux Enterprise Desktop 10
-   openSUSE 11.0
-   openSUSE 11.1
-   openSUSE 11.2
-   SUSE Linux Enterprise Desktop 11
-   Fedora 10
-   Fedora 11
-   Fedora 12
-   Ubuntu 9.04 (Jaunty Jackalope)

For Developers
--------------

In order to enable Moonlight Accessibility in Firefox you have to apply a patch, this patch depends on the version of Firefox. We have two patches, one for *mozilla-1.9.2* and one for *mozilla-central*. Make sure you are using compatible revisions and patches otherwise Moonlight Accessibility will not compile nor work.

-   *mozilla-1.9.2* is compatible with [Moon 2.0 (branch)](https://github.com/mono/moon/tree/moon/moon-2-0) and MoonAtkBridge (trunk).
-   *mozilla-central* is compatible with [Moon (master)](https://github.com/mono/moon) and MoonAtkBridge+patch (trunk).

Before building Firefox you will need to install the following libraries:

-   [autoconf 2.13](http://software.opensuse.org/ymp/mozilla/openSUSE_11.1/autoconf213.ymp)
-   libnotify-devel

Also you will need to create a .mozconfig file to help you building Firefox, use the following template:

    . $topsrcdir/browser/config/mozconfig

    ac_add_options --enable-application=browser
    mk_add_options MOZ_CO_PROJECT=browser

    mk_add_options MOZ_OBJDIR=@TOPSRCDIR@/obj-debug
    mk_add_options MOZ_MAKE_FLAGS=-j4

    ac_add_options --enable-debug
    ac_add_options --disable-optimize
    ac_add_options --enable-tests
    ac_add_options --disable-crashreporter
    ac_add_options --disable-necko-wifi

Notice latest patch is tracked in [Mozilla Bug #480317](https://bugzilla.mozilla.org/show_bug.cgi?id=480317)

### Building Firefox with Plugin Accessibility (mozilla-1.9.2)

-   [Check out](https://developer.mozilla.org/en/Mozilla_Source_Code_(Mercurial)) Firefox from *mozilla-1.9.2 (Firefox 3.6)*
-   Apply the latest plugin accessibility patch from [uia2atk/MoonAtkBridge](https://github.com/mono/uia2atk/blob/master/MoonAtkBridge/patches/ff-plugin-a11y.patch)
-   Move your .mozconfig to your checkout folder and build for the first time:

<!-- -->

    make -f client.mk build

-   Then you can continue to [#Building for Firefox (mozilla-1.9.2)](#building-for-firefox-mozilla-192)

### Building Firefox with Plugin Accessibility (mozilla-central)

-   [Check out](https://developer.mozilla.org/en/Mozilla_Source_Code_(Mercurial)) Firefox from *mozilla-central (Firefox 4.0)*
-   Apply the latest plugin accessibility patch from [uia2atk/MoonAtkBridge](https://github.com/mono/uia2atk/blob/master/MoonAtkBridge/patches/mozilla-central/ff-plugin-a11y.patch)
-   Move your .mozconfig to your checkout folder and build for the first time:

<!-- -->

    make -f client.mk build

-   Then you can continue to [#Building for Firefox (mozilla-central)](#building-for-firefox-mozilla-central)

### Useful notes

Incremental build is enabled after you build Firefox for the first time. This will allow you to only build what has changed instead of the entire project, saving hours of time. To use this, simply change directory into `obj-debug/FolderYouChanged` and type make.

If I changed something in the `accessible/` directory, I would:

    cd obj-debug/accessible/
    make

### Development with Firefox

If you find yourself in the position of maintaining a patch against Firefox for a long time, Mercurial can be your best friend.

When you get to a good stopping point, `hg commit` your code, and continue working as normal.

Sooner or later, you'll have to pull in the latest changes from HEAD into your branch. To make this easier, enable the Mercurial `rebase` plugin by putting

    [extensions]
    hgext.rebase =

into your `~/.hgrc` file.

Now, to update your local repository:

    brad@blackbird:~/build/firefox-trunk$ hg pull
    pulling from http://hg.mozilla.org/mozilla-central/
    searching for changes
    adding changesets
    adding manifests
    adding file changes
    added 76 changesets with 276 changes to 228 files (+1 heads)
    (run 'hg heads' to see heads, 'hg merge' to merge)
    brad@blackbird:~/build/firefox-trunk$ hg rebase
    merging accessible/src/atk/Makefile.in
    merging accessible/src/base/nsAccessibilityService.cpp
    merging accessible/src/base/nsAccessibilityService.cpp
    warning: conflicts during merge.
    merging accessible/src/base/nsAccessibilityService.cpp failed!
    abort: fix unresolved conflicts with hg resolve then run hg rebase --continue
    ...
      Resolve any conflicts...
    ...
    brad@blackbird:~/build/firefox-trunk$ hg rebase --continue
    saving bundle to /home/brad/build/firefox-trunk/.hg/strip-backup/b67e49ad7fa4-temp
    adding branch
    adding changesets
    adding manifests
    adding file changes
    added 81 changesets with 292 changes to 232 files
    rebase completed
    brad@blackbird:~/build/firefox-trunk$

### Setting up your Moonlight Environment

#### Supplies

-   A working parallel development environment. See [Parallel Mono Environments](/Parallel_Mono_Environments) or [Pulque](http://blog.carrion.mx/2010/01/25/parallel-development-environments-pulque/).
-   Matching versions of `mono`, `mcs`, and `moon` from trunk
-   A checkout of `uia2atk` from trunk
-   Firefox trunk with plugin patch applied (see above)
-   An hour, a [good](http://icanhascheezburger.com) [build-time](http://thedailykitten.com/) [distraction](http://youlooknicetoday.com) and a tall glass of water
-   Notice that you will always have to use your parallel environment when building and installing all modules.

#### Setting up the Base Environment

-   Set up a development profile in Firefox

<!-- -->

    firefox -no-remote -ProfileManager

Press the *Create Profile* button. Set the profile name to `dev` and the path to `~/.mozilla/firefox/profiles-dev`.

-   Create an alias to the development version of Firefox

<!-- -->

    alias ffd='$HOME/build/firefox-trunk/obj-debug/dist/bin/firefox -no-remote -P dev'

#### Building for Firefox (mozilla-1.9.2)

-   Using your parallel development environment (see above) checkout *mono*, *moon*, *mono-basic*, *uia2atk* and *gtk-sharp*, use the valid branches:

<!-- -->

    git clone git://github.com/mono/mono.git && cd mono && git branch moon-2-0 origin/moon/moon-2-0 && git checkout moon-2-0
    git clone git://github.com/mono/moon.git && cd moon && git branch moon-2-0 origin/moon/moon-2-0 && git checkout moon-2-0
    git clone git://github.com/mono/mono-basic.git && cd mono-basic && git branch moon-2-0 origin/moon/moon-2-0 && git checkout moon-2-0
    git clone git://github.com/mono/gtk-sharp.git && cd gtk-sharp && git branch gtk-sharp-2-12 origin/gtk-sharp-2-12-branch && git checkout gtk-sharp-2-12
    git clone git://github.com/mono/uia2atk.git

-   Make and install Mono (make sure you are using your parallel environment prefix):

<!-- -->

    cd mono && ./autogen.sh --prefix=/path/to/my/prefix && make && make install

-   Double check your mono version:

<!-- -->

    mono --version

-   It should be something like: *Mono JIT compiler version 2.6.1 (tarball rXXXXXX)*
-   Make and install gtk-sharp-2-12:

<!-- -->

    cd .../gtk-sharp/ && ./bootstrap-2.12 --prefix=/path/to/my/prefix && make && make install

-   Patch Moonlight:

<!-- -->

    cd ../moon
    patch -p 0 < ../uia2atk/MoonAtkBridge/patches/moonlight-a11y-core-extension.diff
    patch -p 0 < ../uia2atk/MoonAtkBridge/patches/moonlight-a11y-slot-tree.diff
    ./autogen.sh --prefix=/path/to/my/prefix --with-mcspath=../mono/mcs

Autogen takes a little bit to run, then make sure that `./autogen.sh`'s output includes something like:

      Silverlight Support:
            Silverlight 1.0: yes
            Silverlight 2.0: yes
              Browser plugin assemblies: yes
                Path to mcs tree: ./../mcs
                Path to mono-basic tree: ./../mono-basic
              Desktop application assemblies: yes

      Browser Support:
            Firefox: yes
              Plugin Installer (.xpi): yes
              Gecko 1.8 (Firefox 2): no (reason: missing FF2 development packages)
              Gecko 1.9 (Firefox 3): yes
              Curl bridge: embedded
            Chrome (.crx): no (no chrome executable)

The most important thing to notice is **Plugin Installer (.xpi): yes**.

-   Build `moon`

<!-- -->

    make && make install

-   Build `moon` XPI file

<!-- -->

    make user-plugin

-   Install Moon XPI into Firefox

<!-- -->

    ffd plugin/install/novell-moonlight.xpi

-   Then you can continue to [#Setting up the MoonAtkBridge Environment (mozilla-1.9.2)](#setting-up-the-moonatkbridge-environment-mozilla-192)

#### Building for Firefox (mozilla-central)

-   Checkout *gtk-sharp-2-12-branch*:

<!-- -->

    git clone git://github.com/mono/gtk-sharp.git && cd gtk-sharp && git branch gtk-sharp-2-12 origin/gtk-sharp-2-12-branch && git checkout gtk-sharp-2-12

-   Building moon requires its own copy of mcs/mono/mono-basic so make a new directory and change to it:

<!-- -->

    mkdir moon_checkout && cd moon_checkout

-   Using your parallel development environment (see above) checkout *moon*:

<!-- -->

    git clone git://github.com/mono/moon.git

-   Open the README file in moon and look for the section called: **Requirements**, in that section you will notice the revisions required to build moonlight, for example *[moon 79a21b](https://github.com/mono/moon/commit/79a21bf3713bef8832a5c8c04f3c3e4ca84295d6)*:

<!-- -->

    git clone git://github.com/mono/mono.git mono && cd mono && git reset --hard 9c8cb87fe336e678e902
    && cd .. git clone git://github.com/mono/mono-basic.git mono-basic && cd mono-basic && git reset --hard HEAD

-   Copy the folders to a lower level (you can also checkout the **same modules** and **the same revisions**, copying should be faster)

<!-- -->

    cp -r mono ..
    cp -r mono-basic ..
    cd ..

-   You should have 3 folders in your current working directory:

<!-- -->

    mono  mono-basic  moon_checkout

-   Build and install mono:

<!-- -->

    cd mono && ./autogen.sh --prefix=/path/to/my/prefix && make && make install

-   Double check your mono version:

<!-- -->

    mono --version

-   It should be something like: *Mono JIT compiler version 2.7 (rXXXXX)*
-   Make and install gtk-sharp-2-12-branch:

<!-- -->

    cd ../gtk-sharp-2-12/ && ./bootstrap-2.12 --prefix=/path/to/my/prefix && make && make install

-   Change to moon_checkout/moon and apply the following patch:

<!-- -->

    cd ../moon_checkout/moon
    patch -p0 < ~/path/to/uia2atk/MoonAtkBridge/patches/moon_trunk/moonlight-a11y-core-extension.diff

-   Run autogen.sh:

<!-- -->

    ./autogen.sh --prefix=/path/to/my/prefix

Autogen takes a while to run, then make sure that `./autogen.sh`'s output includes something like:

      Browser Support:
        Firefox: yes
              Plugin Installer (.xpi): yes
              Gecko 1.8 (Firefox 2): no (reason: missing FF2 development packages)
              Gecko 1.9 (Firefox 3): yes
        Fallback bridge support:
              Curl bridge: embedded
            Chrome (.crx): no (no chrome executable)

      Platform abstraction layer:
        Windowing system: gtk (hardcoded)
        Messaging layer: glib+unix (hardcoded)
        NetworkAvailability layer: dbus-glib (hardcoded)
            Capture Service: linux (hardcoded)
            Video capture backends: v4l2 (hardcoded)
            Audio capture backends: none (hardcoded)

The most important thing to notice is **Plugin Installer (.xpi): yes**.

-   Build `moon`

<!-- -->

    make && make install

-   Build `moon` XPI file

<!-- -->

    make user-plugin

-   Install Moon XPI into Firefox

<!-- -->

    ffd plugin/install/novell-moonlight.xpi

-   Then you can continue to [#Setting up the MoonAtkBridge Environment (mozilla-central)](#setting-up-the-moonatkbridge-environment-mozilla-central)

#### Useful notes 2

If you're making changes to Moonlight, you'll often have to:

    make && rm plugin/install/novell-moonlight.xpi && make user-plugin
    ffd plugin/install/novell-moonlight.xpi

Don't forget to update to the revisions specified in the README accordingly.

#### Setting up the MoonAtkBridge Environment (mozilla-1.9.2)

-   MoonAtkBridge requires a *moon* folder in the same level, make sure the folder exists before compiling MoonAtkBridge
-   Configure and build MoonAtkBridge

<!-- -->

    cd uia2atk/MoonAtkBridge
    ./autogen.sh --prefix=/path/to/my/prefix
    make

This will create a `stage/` directory containing all of the files required for a Firefox extension. We could make and install an XPI right away with `make xpi`, but for development, it's much easier if we just symlink this directory into our Mozilla plugins folder:

     cd ~/.mozilla/firefox/profiles-dev/extensions/
     ln -s /path/to/uia2atk/MoonAtkBridge/stage moonlight-a11y@novell.com

Now, when you run Firefox, our extension should load and you should be able to see a live accessibility hierarchy inside of Accerciser.

When developing in MoonAtkBridge, just `make` after you make changes, and re-run Firefox to see the results.

#### Setting up the MoonAtkBridge Environment (mozilla-central)

-   MoonAtkBridge requires a *moon* folder in the same level, so you will have to create a symbolic link to moon_checkout/moon/ first.

<!-- -->

    cd ../.. && ln -s moon_checkout/moon/ .

-   Patch MoonAtkBridge to enable OOPP:

<!-- -->

    cd uia2atk/
    patch -p 1 < MoonAtkBridge/patches/moon_trunk/moonatkbridge-oop.patch

-   Configure and build MoonAtkBridge

<!-- -->

    cd MoonAtkBridge
    ./autogen.sh --prefix=/path/to/my/prefix
    make

This will create a `stage/` directory containing all of the files required for a Firefox extension. We could make and install an XPI right away with `make xpi`, but for development, it's much easier if we just symlink this directory into our Mozilla plugins folder:

     cd ~/.mozilla/firefox/profiles-dev/extensions/
     ln -s /path/to/uia2atk/MoonAtkBridge/stage moonlight-a11y@novell.com

Now, when you run Firefox, our extension should load and you should be able to see a live accessibility hierarchy inside of Accerciser.

When developing in MoonAtkBridge, just `make` after you make changes, and re-run Firefox to see the results.

