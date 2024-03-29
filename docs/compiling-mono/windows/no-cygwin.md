---
title: Compiling Mono on Windows without Cygwin
redirect_from:
  - /Compiling_Mono_on_Windows_without_Cygwin/
---

The Mono runtime on Windows can be built using Visual Studio only toolchain. You will need the latest version of Visual Studio 2017.

If you encounter issues you may want to build using [the older Cygwin+Visual Studio process](/docs/compiling-mono/windows/).

## Prerequisites

* Enable `Developer Mode` in the Windows 10 Settings app (Update & Security -> For developers tab)
* Install [Visual Studio 2017 or later](https://www.visualstudio.com) - Community Edition works fine. If it is already installed, use the `Visual Studio Installer` to ensure you have the latest updates.
* Install [Git for Windows](https://git-scm.com/download/win) and enable use of it from cmd with the `Use Git from the Windows Command Prompt` option in the installer.

## Build Mono 64-bit using Visual Studio Command Prompt

The Mono runtime can currently be built using Visual Studio. Building and running tests will still require the use of Cygwin and Bash, which you can see described in the [Cygwin build documentation](/docs/compiling-mono/windows/).

You will need to run the build commands inside a Visual Studio command prompt - run `C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\VsDevCmd.bat` from the command prompt used in build or launch new command prompt using ´Developer Command Prompt for VS2017´ from start menu (if installed).

**NOTE**, paths to installed Visual Studio files could be different depending on install location and Visual Studio edition.

Note that in the commands below we explicitly specify the use of the SGEN garbage collector instead of Boehm, because Boehm is not supported on 64-bit Windows.

```cmd
git clone https://github.com/mono/mono.git
cd mono
git submodule update --init --recursive
msbuild msvc\mono.sln /p:Platform=x64 /p:Configuration=Release /p:MONO_TARGET_GC=sgen
```

*Parallel builds can be performed by passing the `/m` switch to msbuild*

## Build Mono 64-bit using Visual Studio

Follow the git commands above, then open `msvc\mono.sln` in Visual Studio 2017. Ensure you do not open it in an older version you might have installed, like 2013 or 2015. Select the platform and configuration you prefer (Win32, x64, etc.) and then build.
