---
title: ThreadSanitizer (Clang Sanitizers)
---

The [ThreadSanitizer](https://clang.llvm.org/docs/ThreadSanitizer.html) is integrated into [Clang](https://clang.llvm.org/) 3.4+ and therefore, if Clang is installed, using it with Mono's `autogen.sh` is as simple as running the following:

``` bash
$ cd /home/root/of/mono
$ ./autogen.sh --prefix=/usr/local CC=clang CFLAGS=-fsanitize=thread LDFLAGS=-fsanitize=thread CXX=clang++
$ make
...
```

Please keep in mind that `CXX` has to be set to `clang++` to avoid unwanted side effects and compiling errors.

After `autogen.sh` has been executed as suggested above, the following `make` command will use Clang. In turn, Clang then injects necessary reporting functions into the code. Later, `make` uses [roslyn](https://github.com/dotnet/roslyn) to compile  the `mscorlib.dll` with the freshly built Mono runtime. This reports a bit more than 150 races and produces slightly more than 1.5 MB of race traces (`master` branch, August 2017).

Dynamic Blacklisting
--------------------

Many of these 150 races are harmless &ndash; among them are hazard pointers and less important logging counters, to name a few examples. A convenient way to (de)activate the report of specific races quickly is to work with blacklists. Please have a look at [this article](/docs/debug+profile/clang/blacklists/) to find out how to work with blacklists in combination with Mono.

Furthermore, the [blacklist](https://github.com/mono/mono/blob/master/scripts/ci/clang-thread-sanitizer-blacklist) in `scripts/ci/` can be a good starting point when exploring Mono with the ThreadSanitizer.

Permanent Blacklisting
----------------------

While blacklist files are handy when it comes to debugging, they are less convenient when looking for solutions that work without the setup process of blacklists. As mentioned above, some data races are known, can be ignored, and will not be fixed. These races should be blacklisted permanently.

### Function Annotation

Functions that are flagged with [`MONO_NO_SANITIZE_THREAD`](https://github.com/mono/mono/blob/master/mono/utils/mono-compiler.h) behave exactly as if their name was found in a blacklist file. If, for example, `foo ()` contains a known race that should be ignored, the following code could be used:

``` c
MONO_NO_SANITIZE_THREAD
void
foo (void)
{
  // ...
}
```

Please note that these annotations should be used with **great caution**! Many functions contain more than just one data race. Furthermore, other (new) races might arise due to code refactoring but may stay hidden if racy functions are annotated. Therefore, all occurrences of `MONO_NO_SANITIZE_THREAD` should come with meaningful and detailed descriptions of all expected data races.

### Unlocked Operations

Closely related to [`atomic.h`](https://github.com/mono/mono/blob/master/mono/utils/atomic.h), [`unlocked.h`](https://github.com/mono/mono/blob/master/mono/utils/unlocked.h) provides a set of functions that can be used to blacklist simple load / store operations. Unlike `Interlocked* ()` functions, the `Unlocked* ()` functions do not guarantee atomicity but speed: due to inlining, they execute as fast as `x ++`, `x += y`, ... if the ThreadSanitizer is not active. Additionally, the signature of the `Unlocked* ()` functions should always match the signature of the `Interlocked* ()` functions (where interlocked functions exist) to make switching between `Interlocked* ()` and `Unlocked* ()` as easy as possible.

Compile Time Options
--------------------

The ThreadSanitizer can be personalised in many ways. [This article](/docs/debug+profile/clang/customisation/#runtime-options) describes in detail how compile time options can be used in combination with Mono. In addition, all available flags can be found on [Google's GitHub page](https://github.com/google/sanitizers/wiki/ThreadSanitizerFlags#compiler-flags-llvm-specific). There is one especially useful option:

### (Stop) The Instrumentation of Atomic Operations

[atomic.h](https://github.com/mono/mono/blob/master/mono/utils/atomic.h) in `mono/utils/` contains atomic functions that are mostly harmless; however, they are rightfully detected as data races. Some examples are `InterlockedCompareExchange`, `InterlockedIncrement` or `InterlockedExchangePointer`. If all atomic instructions should be blacklisted at once, the easiest and cleanest solution is to use `-mllvm -tsan-instrument-atomics=false`.

Runtime Options
---------------

Runtime options can be provided by using the environment variable `TSAN_OPTIONS`. Please find detailed information about runtime options and Mono in [this article](/docs/debug+profile/clang/customisation/#runtime-options) and all available options on [Google's GitHub page](https://github.com/google/sanitizers/wiki/ThreadSanitizerFlags#runtime-flags). Two runtime flags in particular seem to be useful when working with Mono:

### Increase the Memory Access History

Sometimes, races extend over a long period of time; however, they might not be harmless. By default, the ThreadSanitizer only remembers the last two memory accesses per thread which can lead to incomplete stack traces that are hard (or impossible) to comprehend. Using `history_size=7` (`7` is the maximum size) often seems to help with resolving this issue.

### Exit with 0

By default, the ThreadSanitizer exits with `66` whenever at least one race or leak was detected. This can be inconvenient when working with a batch of executions that depend on clean program shutdowns. Luckily, the runtime option `exitcode=0` (or `1`, `2`, ...) can help with that.

Additional Information
----------------------

### Evaluation

Clang's ThreadSanitizer is currently in a try-out phase (August 2017). Many races are being evaluated and are either about to be blacklisted and documented, or reported and fixed. Due to this, updates of this page will happen frequently.
