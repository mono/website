---
title: Compiling Mono on Windows
redirect_from:
  - /Compiling_Mono_on_Windows/
---

To build Mono on Windows, a Cygwin setup is required. You'll also need Visual Studio 2015 or Visual Studio 2015 Build Tools for command line builds. Visual Studio 2017 is also supported.

**NOTE**, below instructions apply to Cygwin. If WSL (Windows Subsystem for Linux) is used instead of Cygwin, corresponding packages needs to be installed into WSL environment.

It is possible to build Mono runtime and BCL using Visual Studio without any prerequisites on Cygwin or WSL environment, see [build Mono without Cygwin or WSL](/docs/compiling-mono/windows/no-cygwin/) for details.

**NOTE**, for full build and execution of tests, a Cygwin environment is still needed as outlined below.

## Install prerequisites

* Enable `Developer Mode` in the Windows 10 Settings app (Update & Security -> For developers tab)
* Download and install 64 bit Cygwin from [www.cygwin.com](http://www.cygwin.com).
* Install [Visual Studio 2015 or later](https://www.visualstudio.com) - Community Edition works fine.
* Download and install [Mono for Windows](/docs/getting-started/install/windows/) or use `monolite` build step as described below.
* Run the following command in cmd.exe to install Cygwin and required packages:

```bash
setup-x86_64.exe -P autoconf,automake,bison,gcc-core,gcc-g++,mingw64-i686-runtime,mingw64-i686-binutils,mingw64-i686-gcc-core,mingw64-i686-gcc-g++,mingw64-i686-pthreads,mingw64-i686-w32api,mingw64-x86_64-runtime,mingw64-x86_64-binutils,mingw64-x86_64-gcc-core,mingw64-x86_64-gcc-g++,mingw64-x86_64-pthreads,mingw64-x86_64-w32api,libtool,make,python,gettext-devel,gettext,intltool,libiconv,pkg-config,git,curl,wget,libxslt,bc,patch,cmake,perl,yasm,unzip
```

Make sure that the following GIT setting is used to avoid issues with line endings:

`git config --global core.autocrlf input`

## Cloning Mono from GitHub repository

First step is to clone Mono repository directly from GitHub, `PREFIX` is you Mono installation location (see below for details):

``` bash
export PREFIX=[mono installation location]
export PATH=$PREFIX/bin:$PATH
git clone https://github.com/mono/mono.git
cd mono
```

## Pre-configured build instructions

Pre-configured build instructions, building a default Visual Studio Mono runtime, mingw Mono runtime, Mono BCL and install into `PREFIX`. For further detailed build configurations and instructions, see next section. Run one of the following set of commands from a Cygwin command prompt after all steps in section above have been completed.

64-bit Mono runtime using SGEN GC and default BCL profile (net_4_x):
```bash
./autogen.sh --prefix=$PREFIX --host=x86_64-w64-mingw32 --enable-msvc --disable-boehm
make -j4
make install
```

32-bit Mono runtime using SGEN GC and default BCL profile (net_4_x):
```bash
./autogen.sh --prefix=$PREFIX --host=i686-w64-mingw32 --enable-msvc --disable-boehm
make -j4
make install
```

## Detailed build instructions

If one of the pre-configured set of build instructions above doesn't match configuration needs, this section outline detailed step by step build instructions.

Build will use configured `PREFIX` where an existing Mono distribution exists that will be used and later replaced by build. **NOTE**, to keep existing Mono distribution untouched, setup a different `PREFIX` where the new build will be installed.

It is possible to only configure `PATH` to point to an existing Mono distribution without specify `PREFIX` but then `make install` will install build into default location.

Another option is to build without an existing pre-installed Mono distribution, see section related to `monolite` for more details or the section describing how to use a Visual Studio build Mono runtime in `MONO_EXECUTABLE` environment variable as part of build.

The following configure steps shows different supported Mono build configurations.

64-bit Mono runtime using SGEN GC and default BCL profile (net_4_x). The Boehm GC is not supported on 64-bit Windows build:

```bash
./autogen.sh --prefix=$PREFIX --host=x86_64-w64-mingw32 --disable-boehm
```

32-bit Mono runtime using SGEN GC and default BCL profile (net_4_x):

```bash
./autogen.sh --prefix=$PREFIX --host=i686-w64-mingw32 --disable-boehm
```

32-bit Mono runtime using Boehm GC and default BCL profile (net_4_x):

```bash
./autogen.sh --prefix=$PREFIX --host=i686-w64-mingw32
```

**NOTE**, 32-bit Mono runtime supports both SGEN and Boehm GC. Boehm GC is still available for legacy reasons but not supported on 64-bit Windows builds. It is recommended to use SGEN GC for both 32 and 64-bit Windows builds.

### Enable BTLS as cryptographic backend for Windows builds.

Mono on Windows supports BTLS library as an alternative cryptographic backend for SSL/TLS. It is not the default alternative and must be enabled to build and be used by Mono runtime. To enable BTLS, pass `--enable-btls` to the `autogen.sh` step above.

BTLS build will add a couple of additional prerequisites for Visual Studio builds. The easiest way to get additional needed packages is to install and use [Chocolatey](https://chocolatey.org/) package manager. See https://chocolatey.org/install for instructions on how to install Chocolatey package manager into the build system.

Once Chocolatey has been installed, add the following packages to the build system:

```cmd
choco install cmake
```

Optional, in order to build BTLS with assembler optimization support, additional packages needs to be installed. It is still possible to build without these packages using Visual Studio as cmake build generator, but that configuration won't be able to build assembler optimized cryptographic functions.

```cmd
choco install activeperl
choco install ninja
choco install yasm
```

Make sure they are all visible to the build environment used by Visual Studio (restart any command prompts or Visual Studio IDE's used in the build).

### Enable LLVM for Windows builds.

Mono on Windows supports LLVM in several different build combinations. When doing Windows cross compiler builds, host == Win32 but target != Win32, standard LLVM build instructions can be used.

For regular Windows builds, host == Win32, target == Win32 (described in this page), only x64 Visual Studio build supports LLVM. To enable LLVM, pass `--enable-llvm` to the `autogen.sh` step above.

Windows build supports most of the LLVM configuration flags, except `--enable-loadedllvm`. If configured with `--with-llvm`, Visual Studio build will use pre-build LLVM version pointed to by `llvm-config.exe` instead of building internal LLVM version as part of Visual Studio build.

NOTE, since only x64 Visual Studio build supports LLVM for regular Windows builds, a warning will be generated in the `autogen.sh` output indicating that LLVM will be disabled for mingw builds. Similar warning will be generated when building an unsupported build configuration from within Visual Studio (using the Win32 build configurations).

There is also a couple of MSBuild properties directly controlling the use of LLVM from Visual Studio builds (in case `autogen.sh` is not used or needs to be overridden).

MONO_ENABLE_LLVM

When set to true, enable Visual Studio LLVM build. Could be explicitly passed to MSBuild or set in `mono.props` in order to force LLVM build.

MONO_EXTERNAL_LLVM_CONFIG

When set to a path pointing to a pre-build version of `llvm-config.exe`, specified LLVM build will be used instead of doing local internal LLVM build as part of regular Visual Studio Mono runtime build. Could be explicitly passed to MSBuild or set in `mono.props` in order to force LLVM build.

Additional prerequisites only applies when building LLVM as part of Visual Studio Mono runtime build. If using `--with-llvm` configuration option or MONO_EXTERNAL_LLVM_CONFIG MSBuild property, no additional prerequisites are needed.

LLVM build will add a couple of additional prerequisites for Visual Studio builds. The easiest way to get additional needed packages is to install and use [Chocolatey](https://chocolatey.org/) package manager. See https://chocolatey.org/install for instructions on how to install Chocolatey package manager into the build system.

Once Chocolatey has been installed, add the following packages to the build system:

```cmd
choco install cmake
choco install python2
```

Optional, by default LLVM build will use Visual Studio as cmake build generator. Build also support ninja as cmake build generator. In order to use ninja, install the following packages to the build system:

```cmd
choco install ninja
```

Make sure they are all visible to the build environment used by Visual Studio (restart any command prompts or Visual Studio IDE's used in the build).

### Use monolite instead of pre-installed Mono distribution.

If no Mono distribution is available, you can build using `monolite`. Just run the command below before running `make`:

```bash
make get-monolite-latest
```

## Build Mono using Visual Studio

The native runtime libraries can be built using Visual Studio and msbuild. However, the .NET libraries and tests must currently be built in Cygwin using `make`. The steps below describe how to build the runtime libraries in Visual Studio and use the Visual Studio built Mono executable when building the class libraries and tests as well as running the test suites in Cygwin.

### Build 64-bit Mono using Visual Studio

Open the Mono solution `msvc\mono.sln` in Visual Studio IDE. Rebuild the solution using Release and x64 platform configurations. For command line build, see below.

### Build 32-bit Mono using Visual Studio

Open the Mono solution `msvc\mono.sln` in Visual Studio IDE. Rebuild the solution using Release and Win32 platform configurations. For command line build, see below.

### Build Mono from Visual Studio command line

Instead of building from within Visual Studio IDE you can run `msbuild.exe` directly from the command line. It is recommended to run the build from a Visual Studio Developer Command Prompt to get a correctly setup build environment.

For Visual Studio 2015: Run `"%ProgramFiles(x86)%\Microsoft Visual Studio 14.0\Common7\Tools\VsDevCmd.bat"` from command prompt used in build or launch new command prompt using ´Developer Command Prompt for VS2015´ from start menu (if installed).

For Visual Studio 2017: Run `"%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Community\Common7\Tools\VsDevCmd.bat"` from the command prompt used in build or launch new command prompt using ´Developer Command Prompt for VS2017´ from start menu (if installed).

**NOTE**, paths to installed Visual Studio files could be different depending on install location and Visual Studio edition.

Example of a Visual Studio 2015 32-bit Mono runtime release build using SGEN GC:

```cmd
msbuild.exe /p:PlatformToolset=v140 /p:Platform=Win32 /p:Configuration=Release /p:MONO_TARGET_GC=sgen msvc/mono.sln
```

Example of a Visual Studio 2015 64-bit Mono runtime release build using SGEN GC:

```cmd
msbuild.exe /p:PlatformToolset=v140 /p:Platform=x64 /p:Configuration=Release /p:MONO_TARGET_GC=sgen msvc/mono.sln
```

Example of a Visual Studio 2017 32-bit Mono runtime release build using SGEN GC:

```cmd
msbuild.exe /p:PlatformToolset=v141 /p:Platform=Win32 /p:Configuration=Release /p:MONO_TARGET_GC=sgen msvc/mono.sln
```

Example of a Visual Studio 2017 64-bit Mono runtime release build using sgen GC:

```cmd
msbuild.exe /p:PlatformToolset=v141 /p:Platform=x64 /p:Configuration=Release /p:MONO_TARGET_GC=sgen msvc/mono.sln
```

There is also a build script that can be used to run `msbuild.exe` from a Visual Studio build environment, `msvc\run-msbuild.bat`. The script selects Visual Studio version toolchain based on `VisualStudioVersion` environment variable. 

For Visual Studio 2015 64-bit Mono Runtime build:

```cmd
set VisualStudioVersion=14.0
msvc\run-msbuild.bat "/p:Configuration=Release /p:Platform:x64 /p:MONO_TARGET_GC=sgen /t:Build"
```

For Visual Studio 2017 64-bit Mono Runtime build:

```cmd
set VisualStudioVersion=15.0
msvc\run-msbuild.bat "/p:Configuration=Release /p:Platform=x64 /p:MONO_TARGET_GC=sgen /t:Build"
```

**NOTE**, while it is possible to run `msbuild.exe` from Cygwin environment it is not recommended since the build might pick up build tools and dependencies from Cygwin instead of Windows environment. There is however a build script `msvc/run-msbuild.sh` that can be called from Cygwin that will try to setup original Windows environment before running `msbuild.exe`.

### Visual Studio MSBuild build properties.

Building Mono runtime using Visual Studio offers a number of additional options compared to regular `autogen.sh`configuration steps. These properties can be explicitly passed to MBuild or set in `mono.props` property file, read by Mono Visual Studio build.

It is also possible to change property values within Visual Studio IDE through "Property Manager", "View" -> "Other Windows" -> "Property Manager", open Mono property sheet under Mono project (any configuration will do), and select "Common Properties" -> "User Macros". When a value has been changed, select OK and all Visual Studio build configurations should be updated accordingly. If property values are changed directly in `mono.props`, while solution is loaded in Visual Studio, changes will not take place until after solution has been reloaded. If property values are change using IDE's "Property Manager" dialog, changes applies directly to loaded solution.

MONO_BUILD_DIR_PREFIX

Build tree location. Change to enable out of source tree builds, example `c:\mono-build\`. Default value is `.\build\` meaning build will end up in `mono-root\msvc\build`

MONO_TARGET_GC

GC used in build, sgen or boehm. NOTE, boehm is only supported on 32-bit build configurations. Default is sgen for all build configuration.

MONO_USE_STATIC_C_RUNTIME

Link Mono binaries using static c-runtime. When false, all binaries and libraries will link using dynamic c-runtime. Default value is false.

MONO_USE_STATIC_LIBMONO

Link Mono binaries using static libmono. When false, Mono binaries will link using dynamic libmono. Default value is false.

MONO_ENABLE_LLVM

Mono runtime will link and include LLVM. If MONO_EXTERNAL_LLVM_CONFIG is not set, this will also build Mono LLVM repository as part of regular Mono runtime build. When false, Mono runtime will not link and include llvm libraries. Default value is false.

NOTE, this options can also be set through standard configuration, using `--enable-llvm`.

MONO_EXTERNAL_LLVM_CONFIG

Use an external pre-build LLVM library instead of internal build. NOTE, this requires MONO_ENABLE_LLVM to be set or won't have effect. Default value is empty.

NOTE, this options can also be set through standard configuration, using `--with-llvm=full-path-to-llvm-config.exe`.

MONO_ENABLE_BTLS

Mono runtime will link and include BTLS. Setting this value to true will also build Mono BTLS repository as part of regular Mono runtime build. When false, Mono runtime will not link and include BTLS. Default value is false.

NOTE, since BTLS support is part of BCL build, just setting this when doing Mono runtime build will not include needed BTLS support in BCL build. It is recommended to use `--enable-btls` as part of configuration step since that will make sure BTLS support is included in both BCL as well as Mono runtime build.

### Configure `make` to use Visual Studio build Mono runtime.

For make to use Visual Studio build Mono runtime when building BCL and test, set `MONO_EXECUTABLE` environment variable to Visual Studio build Mono runtime. Switch to the Cygwin shell previously used and run:

```bash
export MONO_EXECUTABLE=/cygdrive/c/mono-source-location/msvc/build/sgen/x64/bin/Release/mono-sgen.exe
```

**NOTE**, above path will change depending on source location, build location, 32/64-bit build configuration and used GC. The example above uses the default build location for a 64-bit release build Mono runtime configured to use SGEN GC.

## Build Mono mingw runtime, BCL and Tests.

Switch to the Cygwin shell previously used and run:

```bash
make -j4
```

**NOTE**, the mingw build Mono runtime will still be built even if a Visual Studio build Mono runtime has been build and configured. The mingw runtime will however not be used as part of the BCL or test builds since `MONO_EXECUTABLE` has been configured.

#### Known Issue: "failed to create symbolic link"

If you run `make V=1` and see this after a successful BCL build:

```bash
make[8]: Entering directory '/home/user/work/mono/mcs/class/corlib'
CYGWIN=winsymlinks:nativestrict ln -s /home/user/work/mono/mcs/class/lib/build-win32 /home/user/work/mono/mcs/class/lib/build
ln: failed to create symbolic link '/home/user/work/mono/mcs/class/lib/build': Operation not permitted
make[8]: *** [../../build/library.make:336: ../../class/lib/build/.stamp] Error 1
```

you need to enable `Developer Mode` in the Windows 10 Settings app (Update & Security -> For developers tab) which will allow your user to create symbolic links without administrator privileges.

If you use an earlier Windows versions, you need to run the build as administrator.

## Run all tests

Make sure `MONO_EXECUTABLE` has been setup to use Visual Studio build Mono runtime, see above for instructions. For all tests to run and pass, the Cygwin shell will need elevated permissions. Without additional permissions, some test failures will be identified. 

```bash
make check
```

## Install build

```bash
make install
```
