---
title: Mono LLVM
redirect_from:
  - /Mono_LLVM/
---

Mono from SVN is now able to use LLVM as a backend for code generation in addition to Mono's built-in JIT compiler.

This allows Mono to benefit from all of the compiler optimizations done in LLVM. For example the SciMark score goes from 482 to 610.

This extra performance comes at a cost: it consumes more time and more memory to JIT compile using LLVM than using Mono's built-in JIT, so it is not a solution for everyone.

Long running desktop applications like Banshee and Gnome-Do want to keep memory usage low and also would most likely not benefit from better code generation. Our own tests show that ASP.NET applications do not seem to benefit very much (but web apps are inherently IO-bound).

But computationally intensive applications will definitely benefit from this. Financial and scientific users will surely appreciate this performance boost.

Taking it out for a spin
========================

You need to install both LLVM and Mono from SVN, as follows:

-   Mono 2.6 requires LLVM 2.6
-   Mono trunk (post 2.6) works with LLVM 2.6 or LLVM trunk.

Get and install LLVM like this:

``` bash
svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm
cd llvm
./configure --prefix=/mono --enable-optimized --enable-targets="x86 x86_64"
make && make install
```

Alternatively, you can try our LLVM branch which removes some restrictions so more methods can be compiled with LLVM:

``` bash
git clone git://github.com/mono/llvm.git
cd llvm
git checkout mono-2-8
./configure --prefix=/mono --enable-optimized --enable-targets="x86 x86_64"
make && make install
```

Note that on OSX mono is a 32 bit app, so you need to configure llvm with the --target=i386-apple-darwin10.8.0 flag as by default it will build a 64 bit version of the libraries.

Use 'git checkout mono' when compiling against mono HEAD.

Then get Mono as usual:

``` bash
git clone git://github.com/mono/mono
cd mono
```

Since I am using the non-standard prefix for the LLVM installation (/mono), we need to make sure that we add /mono/bin to the PATH so that the configure script can detect the llvm installation:

``` bash
export MONO_USE_LLVM=1
PATH=/mono/bin:$PATH
```

The next step is to run the configure script, the one flag that matters here is one of:

-   --enable-llvm
-   --enable-loadedllvm

You can either link LLVM into your mono executable, or you can split it in a separate shared library (for example for Linux distributions that might want to ship both a slim Mono by default).

``` bash
./autogen.sh --prefix=/mono --enable-llvm=yes
make && make install
```

Now you have an LLVM-powered Mono. By default, the mono JIT is used to compile code, to make the runtime use LLVM, pass the '--llvm' command line option, or add it to the MONO_ENV_OPTIONS environment variable.

LLVM generates better code at runtime, but also takes longer to execute. This is why you need to explicitly tell Mono's runtime to use the LLVM backend. This is achieved by either setting the environment variable MONO_USE_LLVM or by passing the --llvm command line option to Mono.

Limitations
===========

LLVM is not able to support some of the features that Mono needs, so in those cases the JIT compiler will still fall back to Mono's JIT engine (methods that contain try/catch clauses or methods that do interface calls).

