---
title: Finding memory leaks in the runtime
---

The Mono runtime is written in C which cannot benefit from automated garbage collection that C# enjoys so much. In a language without automatic memory management occasional memory leaks are inevitable. This page is meant to describe tools and tricks that should help in tracking down and eliminating memory leaks within the runtime.

* Table of contents
{:toc}

# macOS leaks tool

macOS provides very handy memory debugging facilities which can be used to detect memory leaks in the runtime in many cases. Of particular interest is the `leaks` tool that scans the process's memory and makes sure that all memory allocations are "reachable", that is, there is at least one value within the process memory referencing that allocation.

## Usage

Below is a step-by-step guide describing how to find and fix a memory leak.

### Building Mono

For the sake of performance Mono allocates memory in large chunks that can accomodate multiple objects per one `malloc` invocation. That default behaviour needs to be overridden by building Mono with `--with-malloc-mempools`. Additionally, debugging data should be available for the tool so that it could identify the location of the leak.

``` bash
./autogen.sh CFLAGS='-O0 -g' --with-malloc-mempools --prefix=.../build && make -j8 && make -j8 install
```

### Running Mono

Once Mono is built, we can run it with `MallocStackLogging=1` to start Mono with logging all memory allocations into a temporary file.

``` bash
MallocStackLogging=1 .../build/bin/mono-sgen program.exe
```

### Finding leaks

While Mono is running, the leaks report can be obtained.

``` bash
leaks mono-sgen
```

Alternatively, allocation data can be saved into a persistent log file and analyzed later.

### Fixing the leak

The leak report is fairly self-explanatory. For instance, in this case:

> Leak: 0x7fb329c01990  size=64  zone: DefaultMallocZone_0x10b8f3000  length: 61  ".../build/mempools/lib/mono/4.5//Facades"
> Call stack: [thread 0x7fff7d9a6000]: | 0x2 | start | main .main.c:339 | mono_main_with_options .main.c:46 | mono_main driver.c:2055 | mini_init mini-runtime.c:3707 | mono_init_from_assembly domain.c:808 | mono_init_internal domain.c:555 | mono_assembly_load_corlib assembly.c:3366 | load_in_path assembly.c:546 | mono_assembly_open_predicate assembly.c:1832 | mono_assembly_load_from_predicate assembly.c:2171 | mono_assembly_invoke_load_hook assembly.c:1347 | load_aot_module aot-runtime.c:2298 | load_image aot-runtime.c:270 | mono_assembly_load assembly.c:3553 | mono_assembly_load_full_internal assembly.c:3506 | mono_assembly_load_full_nosearch assembly.c:3461 | mono_assembly_load_corlib assembly.c:3371 | monoeg_g_strdup_printf gstr.c:186 | g_vasprintf gstr.c:77 | monoeg_malloc gmem.c:121 | malloc | malloc_zone_malloc

by looking at the implementation of `load_aot_module()`

``` c
if (!sofile) {
    aot_name = g_strdup_printf ("%s%s", assembly->image->name, MONO_SOLIB_EXT);

    sofile = mono_dl_open (aot_name, MONO_DL_LAZY, &err);
    if (sofile) {
        found_aot_name = g_strdup (aot_name);
    } else {
        mono_trace (G_LOG_LEVEL_INFO, MONO_TRACE_AOT, "AOT: image '%s' not found: %s", aot_name, err);
        g_free (err);
    }
}
```

we can quickly deduce that `g_free (aot_name);` was missing.

## Limitations

`leaks` is meant to find unreferenced memory allocations, so structures like ever growing lists or hash tables in the runtime which are reachable but unused will not be considered as "leaks". `leaks` can also report false positives if the direct address of the allocation is not stored in the memory, and instead is computed on the fly.

## Additional information

* Full description of the tools can be obtained from the man pages for `malloc` and `leaks`.
* Apple developer [documentation](https://developer.apple.com/library/content/documentation/Performance/Conceptual/ManagingMemory/Articles/FindingLeaks.html).
* A [GUI alternative](https://developer.apple.com/library/content/documentation/DeveloperTools/Conceptual/InstrumentsUserGuide/FindingLeakedMemory.html) is also available as part of Xcode.

# Built-in mono profiler

There is a custom allocation profiler available for Mono. It allows to keep track of how much memory every function in the runtime has allocated without freeing, as well as provides different statistical data.

To activate the profiler, use the `--profile=malloc:log-malloc` parameter with Mono.

Currently available from a [branch](https://github.com/kumpera/mono/tree/profiler-improvements).

TODO.
