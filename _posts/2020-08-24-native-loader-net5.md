---
layout: blog
title: "Native Library Loading in .NET 5"
author: Ryan Lucia
tags: [loader]
---

After years of work, Mono can now be built out of the [dotnet/runtime repository](https://github.com/dotnet/runtime) in a .NET 5-compatible mode! This mode means numerous changes in the available APIs, managed and embedding, as well as internal runtime behavioral changes to better align Mono with CoreCLR and the .NET ecosystem.

One area with multiple highly impactful changes to the runtime internals is library loading. For managed assemblies, Mono now follows the algorithms outlined on [this page](https://docs.microsoft.com/en-us/dotnet/core/dependency-loading/loading-managed), which result from the removal of `AppDomain`s and the new `AssemblyLoadContext` APIs. The only exception to this is that Mono still supports bundles registered via the embedding API, and so the runtime will check that after the active `AssemblyLoadContext` cache.

The managed loading changes are fairly clear and well documented, but unmanaged library loading has changed in numerous ways, some of them far more subtle.

First off, Mono now follows [this algorithm](https://docs.microsoft.com/en-us/dotnet/core/dependency-loading/loading-unmanaged) for P/Invoke resolution. Notably absent here is DllMap's XML config files, which have been disabled entirely in .NET 5. The DllMap embedding APIs are also disabled by default on desktop platforms, but can be enabled by building with `--enable-minimal=dllmap`.

In place of DllMap, users are encouraged to utilize the [NativeLibrary](https://docs.microsoft.com/en-us/dotnet/api/system.runtime.interopservices.nativelibrary?view=netcore-3.1) resolution APIs, which are set in managed code, and the [runtime hosting properties](https://docs.microsoft.com/en-us/dotnet/core/tutorials/netcore-hosting#step-3---prepare-runtime-properties), which are set by embedders with the `monovm_initialize` function. If these are insufficient for your use case, please [tell us about it](https://github.com/dotnet/runtime/issues/37213)! We're always looking to improve our interop functionality, and in particular with .NET 6 will be evaluating `NativeLibrary`, so please speak up.

A more subtle, yet no less impactful change is that native library loading now defaults to `RTLD_LOCAL` to be consistent with CoreCLR and Windows, as opposed to our historical behavior of `RTLD_GLOBAL`. This change prevents symbol collision, and will both break and enable various scenarios/libraries. What this means in practice is that on Unix-like platforms, libraries are longer loaded into a single global namespace and when looking up symbols, the specified library must be correctly specified.

Historically, in Mono on Linux it was possible to load library `foo` containing symbol `bar`, and then invoke `bar` with a P/Invoke like so: 
```
[DllImport("asdf")]
public static extern int bar();
```

This will no longer work. For that P/Invoke to function correctly, the attribute would need to use the correct library name: `[DllImport("foo")]`. A lot of code in the wild that was using incorrect library names will need to be updated. However, this means that when loading two libraries containing the same symbol name, there is no longer a conflict.

There have been some embedding API changes as part of this. `MONO_DL_MASK` is no longer a full mask, as `MONO_DL_GLOBAL` has been introduced to specify `RTLD_GLOBAL`. If both `MONO_DL_LOCAL` and `MONO_DL_GLOBAL`, are set, Mono will use local. See mono/utils/mono-dl-fallback.h for more info.

This also means that dynamically linking libmonosgen and attempting to resolve Mono symbols from `dlopen(NULL, ...)` will no longer work. `__Internal` has been preserved as a Mono-specific extension, but its meaning has been expanded. When P/Invoking into `__Internal`, the runtime will check both `dlopen(NULL)` and the runtime library in the case that they differ, so that users attempting to call Mono APIs with `__Internal` will not have those calls break.

Mono now supports the `DefaultDllImportSearchPathsAttribute` attribute! In particular, passing `DllImportSearchPath.AssemblyDirectory` is now required to have the loader search the executing assembly's directory for native libraries.

On non-Windows platforms, Mono and CoreCLR both no longer attempt to probe for A/W variants of symbols.

The default logging level for most of the loader has been changed from INFO to DEBUG, and additional logging has been added for each stage of the new resolution algorithm.

And that's it! If you have any further questions, feel free to ping us on [Discord](https://aka.ms/dotnet-discord) or [Gitter](https://gitter.im/mono/mono).