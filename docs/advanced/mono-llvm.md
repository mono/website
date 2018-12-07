---
title: Mono LLVM
redirect_from:
  - /Mono_LLVM/
---

Mono support two compilation engines, a fast, JIT-friendly compilation
engine which does not generate very fast code, and a slower
compilation engine based on the [LLVM](http://llvm.org/) optimizing compiler that produces
superior code.

For example the SciMark score goes from 609 to 851.

This extra performance comes at a cost: it consumes more time and more
memory to JIT compile using LLVM than using Mono's built-in JIT, so it
is not a solution for everyone.

Compiling LLVM support for Mono
===============================

You need to install both LLVM and Mono from git, as follows:

Get and install Mono and LLVM like this:

Alternatively, you can try our LLVM branch which removes some restrictions so more methods can be compiled with LLVM:

``` bash
git clone git://github.com/mono/llvm.git
cd llvm
./configure --prefix=/mono --enable-optimized --enable-targets="x86 x86_64"
make && make install
```

Use 'git checkout mono' when compiling against mono HEAD.

Then get Mono as usual:

``` bash
git clone git://github.com/mono/mono
cd mono
```

Since I am using the non-standard prefix for the LLVM installation
(`/mono`), we need to make sure that we add `/mono/bin` to the `PATH` so
that the configure script can detect the llvm installation:

``` bash
export MONO_USE_LLVM=1
PATH=/mono/bin:$PATH
```

The next step is to run the configure script, the one flag that matters here is one of:

- `--enable-llvm`
- `--enable-loadedllvm`

You can either link LLVM into your mono executable, or you can split
it in a separate shared library (for example for Linux distributions
that might want to ship both a slim Mono by default).

NOTE, `--enable-loadedllvm` configuration is not supported for Windows hosted builds.

``` bash
./autogen.sh --prefix=/mono --enable-llvm=yes
make && make install
```

Now you have an LLVM-powered Mono. By default, the mono JIT is used to
compile code, to make the runtime use LLVM, pass the '--llvm' command
line option, or add it to the `MONO_ENV_OPTIONS` environment variable.

LLVM generates better code at runtime, but also takes longer to
execute. This is why you need to explicitly tell Mono's runtime to use
the LLVM backend. This is achieved by either setting the environment
variable `MONO_USE_LLVM` or by passing the --llvm command line option to
Mono.

Limitations
===========

LLVM is not able to support some of the features that Mono needs, so
in those cases the JIT compiler will still fall back to Mono's JIT
engine (methods that contain try/catch clauses or methods that do
interface calls).

When building LLVM for regular Windows builds (**not** building Windows
hosted cross compilers), only x64 Visual Studio builds support LLVM
powered Mono runtime. Mono runtime build using mingw only supports
LLVM for Windows hosted cross compilers. For more details around
regular Mono Windows LLVM builds (**not** building Windows hosted cross
compilers), see [Compiling Mono On Windows](/docs/compiling-mono/windows/)