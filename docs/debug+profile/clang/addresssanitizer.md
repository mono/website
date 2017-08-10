---
title: AddressSanitizer (Clang Sanitizers)
---

The [AddressSanitizer](https://clang.llvm.org/docs/AddressSanitizer.html) is integrated into [Clang](https://clang.llvm.org/) 3.4+ and therefore, if Clang is installed, using it with Mono's `autogen.sh` is as simple as running the following:

``` bash
$ cd /home/root/of/mono
$ ./autogen.sh --prefix=/usr/local CC=clang CFLAGS=-fsanitize=address LDFLAGS=-fsanitize=address CXX=clang++
$ make
...
```

Please keep in mind that `CXX` has to be set to `clang++` to avoid unwanted side effects and compiling errors.

After `autogen.sh` has been executed as suggested above, the following `make` command uses Clang and injects necessary reporting functions.

In the context of Mono, the AddressSanitizer (without the LeakSanitizer, [see below](#ignore-the-leaks)) produces a lot less false positives than the [ThreadSanitizer](/docs/debug+profile/clang/threadsanitizer/), which makes working with it more straight forward.

Dynamic Blacklisting
--------------------

Still, false positives need to be hidden, and so far, the best option is to work with blacklists. Please have a look at [this article](/docs/debug+profile/clang/blacklists/) to find out how to work with blacklists in combination with Mono.

Since there are only a handful of false positives, no macros or special functions can be used to permanently blacklist anything directly within the code (August 2017).

Runtime Options
---------------

Runtime options can be provided by using the environment variable `ASAN_OPTIONS`. Please find detailed information about runtime options and Mono in [this article](/docs/debug+profile/clang/customisation/#runtime-options) and all available options on [Google's GitHub page](https://github.com/google/sanitizers/wiki/AddressSanitizerFlags#run-time-flags). The following two options prove to be particularly useful:

### Ignore the Leaks

By default, the AddressSanitizer starts the [LeakSanitizer](https://clang.llvm.org/docs/LeakSanitizer.html) as soon as the program terminates otherwise successfully. In the context of Mono this means several 100 (sometimes up to a few 1000) reported leaks. `detect_leaks=0` tells the AddressSanitizer to shut down without starting the LeakSanitizer.

### Never Stop

If not told otherwise, the AddressSanitizer exits the program after detecting the first error. While this is helpful when debugging a specific issue, it can be an unwanted side effect when trying to find all problems of a program at once. Using `halt_on_error=false` can help there.
