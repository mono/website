---
title: Compiling Mono From Git
redirect_from:
  - /Compiling_Mono_From_Git/
  - /Compiling_Mono_From_git/
  - /Compiling_Mono_From_GIT/
---

For full details about checking out your source code, see the [Mono page on GitHub](https://github.com/mono) page.

### Checking out for the first time

If you are checking out Mono from Git for the first time, you can use anonymous access:

      $ git clone https://github.com/mono/mono.git

If you are interested in contributing back submitting changes, create an account on GitHub, add a public key (the content of your ~/.ssh/id_rsa.pub with any title) and fork the relevant project, and clone it:

     $ git clone git@github.com:username/mono.git

After committing and pushing your changes, you can send a pull request from GitHub so we can consider your changes.

### Switching to a branch

If you want to work with a branch instead of HEAD (master), you still need to clone the repository in the same way as explained in the previous section, but after that you would switch to it this way:

      $ (cd mono; git checkout mono-2-6)

Beware! If you wanted to work from a branch in your fork of the Mono repository, you should do:

      $ (cd mono; git checkout -t origin/mono-2-6)

### Updating an existing checkout

     $ (cd mono; git pull --rebase)

### Building the source

Then, go into the Mono directory, and configure:

``` bash
  $ cd mono
  $ ./autogen.sh --prefix=/usr/local
  $ make
  $ make install
```

In order to use mcs and Mono binaries during the build process which do not reside in your PATH, you can set two make variables, EXTERNAL_MCS and EXTERNAL_RUNTIME:

``` bash
make EXTERNAL_MCS=/foo/bar/mcs EXTERNAL_RUNTIME=/somewhere/else/mono
```

If you do not currently have Mono installed, build and install Mono from a recently released tarball or run:

``` bash
# ./autogen.sh must be run prior to this
make get-monolite-latest
make
```

The file [README.md](https://github.com/mono/mono/blob/master/README.md) contains more information about ways to compile Mono from the repository, consult it if you need more details.

Also to get the latest changes in System.Drawing.dll and System.Windows.Forms.dll you also need configure, build and install libgdiplus.

      $ cd libgdiplus
      $ ./autogen.sh --prefix=/usr/local
      $ make
      $ make install

If you use a different prefix then you may need to adjust your LD_LIBRARY_PATH environment variable to ensure libgdiplus.so can be loaded.

      export LD_LIBRARY_PATH=/your/own/prefix:$LD_LIBRARY_PATH
