---
title: Compiling Mono on Windows
redirect_from:
  - /Compiling_Mono_on_Windows/
---

To build Mono on Windows, a Cygwin setup is required since it provides some tools required by Mono at build time. You'll also need Visual Studio 2015 or later installed.

## Install prerequisites

* Download and install 64 bit Cygwin from [www.cygwin.com](http://www.cygwin.com).
* Install [Visual Studio 2015 or later](https://www.visualstudio.com) - Community Edition works fine.
* Download and install [Mono for Windows](/docs/getting-started/install/windows/) or use `monolite` build step as described below.
* Run the following command in cmd.exe to install the required packages:

``` bash
setup-x86_64.exe -q -P autoconf,automake,bison,gcc-core,gcc-g++,mingw64-i686-runtime,mingw64-i686-binutils,mingw64-i686-gcc-core,mingw64-i686-gcc-g++,mingw64-i686-pthreads,mingw64-i686-w32api,mingw64-x86_64-runtime,mingw64-x86_64-binutils,mingw64-x86_64-gcc-core,mingw64-x86_64-gcc-g++,mingw64-x86_64-pthreads,mingw64-x86_64-w32api,libtool,make,python,gettext-devel,gettext,intltool,libiconv,pkg-config,git,curl,wget,libxslt,bc,patch
```

Make sure that the following GIT setting is set to avoid issues with line endings:

`git config --global core.autocrlf input`

## Build Mono 64-bit using Visual Studio

The native runtime libraries can be built using Visual Studio and msbuild. However the .NET libraries and tests must currently be built in cygwin using make. The steps below describe how you use cygwin to first configure the build, then build the runtime libraries in Visual Studio and use the Visual Studio built mono executable when building the class libraries and tests in cygwin.

Below we specify 64-bit build and sgen GC (The boehm GC is not supported on 64-bit windows), installing build into `$PREFIX` where mono distribution already exists (replacing). NOTE, in order to keep existing mono distribution untouched, setup a different
`$PREFIX`. You may also only set `PATH` to point to existing mono distribution and not specify `$PREFIX` at all.

``` bash
PATH=$PREFIX/bin:$PATH
git clone https://github.com/mono/mono.git
cd mono
./autogen.sh --prefix=$PREFIX --host=x86_64-w64-mingw32 --disable-boehm
```

Now open the mono solution `msvc\mono.sln` in Visual Studio. (Re)Build the solution and point the `MONO_EXECUTABLE` to the mono exe you just built in Visual Studio. Eg:

```bash
export MONO_EXECUTABLE=/cygdrive/c/..../msvc/build/sgen/x64/bin/Release/mono-sgen.exe
```

if you built 64-bit Debug version.

Next step is to build the BCL and all System libraries. Go back to cygwin and run make:

``` bash
make
make install
```

It is possible to parallelize the cygwin build passing in for example `-j8`,  where 8 in this case is the number of parallel builders to run.

### Building without installed Mono distribution

If no Mono distribution is installed, you can build using `monolite`. Just run the below before running `make`:

``` bash
make get-monolite-latest
```

### 32-bit build

To build Mono 32-bit, run autogen with `--host=i686-w64-mingw32` instead and choose 32-bit when building in Visual Studio.

### Command line using msbuild.exe

Instead of building from within Visual Studio you can use `msbuild.exe` directly in the cygwin terminal:

``` bash
/cygdrive/c/Program\ Files\ \(x86\)/MSBuild/14.0/Bin/MSBuild.exe /p:PlatformToolset=v140 /p:Platform=x64 /p:Configuration=Release /p:MONO_TARGET_GC=sgen msvc/mono.sln
```

Use desired parameters in the Platform and Configuration parameters to change between 64 and 32 bit builds as well as Release and Debug builds.

If only changes has been done to the native code and no changes have been
done to base class libraries or .NET tests, building/rebuilding using Visual Studio solution
is enough. If, however there are changes done to the base class libraries or tests, you need to run make in cygwin to rebuild the class libraries and/or tests.

## Building Mono from a Release Package

Mono releases are distributed as .tar.bz2 packages from the Mono web site. Once you have your dependencies installed all you need to do is run the following command where VERSION is the package version number and PREFIX is your installation prefix:

``` bash
PREFIX=/usr/local
VERSION=4.2.1
tar xvf mono-$VERSION.tar.bz2
cd mono-$VERSION
<same as above>
```

See also these articles:

* [Compiling with Visual Studio](/docs/compiling-mono/windows/compiling-with-visualstudio/)
* [Cross-compiling Mono for Windows](/docs/compiling-mono/windows/cross-compiling-mono-for-windows/)
