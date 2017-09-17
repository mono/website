---
title: Customisation (Clang Sanitizers)
---

Usually, the default setup of [Clang's sanitizers](https://clang.llvm.org/docs/index.html) is pretty decent. Nonetheless, all of the sanitizers ship with a large amount of options that allow very detailed tuning to support a vast variety of different scenarios. A selection of individual options will be discussed within the articles that are dedicated to the specific sanitizers. The aim of this article is to provide general information about how to apply these options.

To keep things simple, code examples in this article will feature the [ThreadSanitizer](/docs/debug+profile/clang/threadsanitizer/). However, the same concepts and rules apply for all [Clang sanitizers](/docs/debug+profile/clang/) when used in combination with Mono.

Compile Time Options
--------------------

One group of options have to be applied at compile time when the sanitizers inject functions into the code. Therefore, they have to be set as part of `CFLAGS` that is given to `autogen.sh`. Usually, there is no limit to the number of flags that can be set simultaneously. One example is the [blacklist flag](/docs/debug+profile/clang/blacklists/) that will be used with almost all sanitizers:

``` bash
$ cd /home/root/of/mono
$ ./autogen.sh --prefix=/usr/local CC=clang CFLAGS="-fsanitize=thread -fsanitize-blacklist=/home/some/path/blacklist" LDFLAGS=-fsanitize=thread CXX=clang
$ make
...
```

Runtime Options
---------------

Runtime options can be set by using environment variables (like `TSAN_OPTIONS`). The name of these variables are different for every sanitizer and will be mentioned in the dedicated articles. For instance, in combination with `make`, they can be applied like so:

``` bash
$ cd /home/root/of/mono
$ TSAN_OPTIONS="foo=bar foo2=bar2 foo3=bar3" make
...
```

Please be aware that `TSAN_OPTIONS` have to be set every time an annotated program is executed. In the example above, `TSAN_OPTIONS` is only applied to the `make` process and all its sub-processes. When using the compiled and annotated runtime later, `TSAN_OPTIONS` has to be provided again.

Since the runtime options are casual environment variables, all other means of setting them work as well. Have a look at the [official Ubuntu manual](https://help.ubuntu.com/community/EnvironmentVariables), for instance, for more details.
