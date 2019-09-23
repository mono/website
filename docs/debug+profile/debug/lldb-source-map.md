---
title: Debugging Mono binaries with LLDB
---

## Summary

It is possible to use LLDB to debug (with source code stepping, etc) a prebuilt
Mono package (for example from Jenkins) without compiling it locally.  This is
useful if you want to be certain that what you're debugging is exactly what a
customer is running.

## Steps

Let's say we're interesed in Mono 6.0.0.x (2019-02) (see: [Mono source versioning](/docs/about-mono/versioning/#mono-source-versioning))

1. Download and install the latest green `*.pkg` file from [the Jenkins per-commit builds for 2019-02](https://jenkins.mono-project.com/view/Per-commit%20packages/job/build-package-osx-mono/job/2019-02/)
2. Check out the Mono source code somewhere in your home directory, for example `/Users/work/2019-02/mono`
3. Start debugging `lldb mono example.exe`
4. Lookup a mono symbol to find out where the source code was when Jenkins built the package

   ```bash
   (lldb) image lookup -vn mini_init
   1 match found in /Library/Frameworks/Mono.framework/Versions/Current/Commands/mono:
        ...
    CompileUnit: id = {0xffffffff00084fd3}, file = "/Users/builder/jenkins/workspace/build-package-osx-mono/2019-02/external/bockbuild/builds/mono-x64/mono/mini/mini-runtime.c", language = "c99"
       ...
   ```

5. Set up a "source map" telling LLDB where the code really is

   ```bash
   (lldb) settings set -- target.source-map "/Users/builder/jenkins/workspace/build-package-osx-mono/2019-02/external/bockbuild/builds/mono-x64" "/Users/work/2019-02/mono"
   ```

6. Set a breakpoint and start running

   ```bash
    (lldb) b mini_init
    (lldb) r
    * thread #1, queue = 'com.apple.main-thread', stop reason = breakpoint 1.1
     frame #0: 0x0000000100011bb8 mono`mini_init(filename="foo.exe", runtime_version=0x0000000000000000) at mini-runtime.c:4134:2 [opt]
       4131    MonoDomain *
       4132    mini_init (const char *filename, const char *runtime_version)
       4133    {
    -> 4134        ERROR_DECL (error);
       4135        MonoDomain *domain;
       4136        MonoRuntimeCallbacks callbacks;
       4137        MonoThreadInfoRuntimeCallbacks ticallbacks;
    Target 0: (mono) stopped.
   ```

### Debugging more than one piece of code

To add symbols for some other shared library, use `settings append -- target.source-map <old-path> <new-path>` to add a second mapping, instead of `settings set`.
