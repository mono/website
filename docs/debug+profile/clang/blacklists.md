---
title: Blacklists (Clang Sanitizers)
---

A blacklist file contains the names of source files and/or functions whose issues (races, leaks, ...) should not be reported. Such blacklist files can be placed anywhere on the system. For the sake of simplicity, this article will focus on working with the [ThreadSanitizer](/docs/debug+profile/clang/threadsanitizer/). However, the same concepts and rules apply for all [Clang sanitizers](/docs/debug+profile/clang/) when used in combination with Mono.

The simplest approach (an empty blacklist) would look like this:

``` bash
$ touch /home/some/path/blacklist
$ cd /home/root/of/mono
$ ./autogen.sh --prefix=/usr/local CC=clang CFLAGS="-fsanitize=thread -fsanitize-blacklist=/home/some/path/blacklist" LDFLAGS=-fsanitize=thread CXX=clang
$ make
...
```

Content of Blacklist Files
--------------------------

The easiest way of blocking everything is to simply put `src:*` into a blacklist file:

``` bash
$ cat /home/some/path/blacklist
src:*
```

However, a finer granularity (toggling the reporting of functions instead of the reporting of whole source files) is often desirable. While `fun:` can be used to achieve that, only top level functions (where the races occur) can be blacklisted. For example, the following race could only be blacklisted if the C standard library was built from source, as the top level function is `calloc ()`. Blacklisting `monoeg_g_calloc ()` or `monoeg_malloc0 ()` would not blacklist this specific race.

``` text
#0 calloc <null> (mono-sgen+0x43a477)
#1 monoeg_g_calloc /home/root/of/mono/mono/eglib/src/gmem.c:114:9 (mono-sgen+0xf2081b)
#2 monoeg_malloc0 /home/root/of/mono/mono/eglib/src/gmem.c:121:9 (mono-sgen+0xf208bf)
#3 inflate_generic_signature_checked /home/root/of/mono/mono/mono/metadata/loader.c:537:31 (mono-sgen+0xb9
...
```

`src:` and `fun:` instructions can be used in the same blacklist file and the usage of wildcards (`*`) is supported. Please have a look at the [official documentation](https://clang.llvm.org/docs/SanitizerSpecialCaseList.html) for more details.

Partitioning Blacklists
-----------------------

Changes of blacklist files are detected automatically. The first `make` command after changing a blacklist file recompiles all source files that use that specific blacklist file for compilation. While this is very useful, it wastes a lot of CPU and time to recompile the whole project when only debugging / toggling a few functions of a specific module. One way of working with blacklists more efficiently is to partition the blocked functions and source files into dedicated files. To link those dedicated blacklists to Clang, all corresponding `Makefile` files have to be altered.

For example, if `mono/sgen/` was to be debugged, a setup could look like this:

``` bash
$ cd /home/root/of/mono
$ ./autogen.sh --prefix=/usr/local CC=clang CFLAGS="-fsanitize=thread -fsanitize-blacklist=/home/some/path/blacklist" LDFLAGS=-fsanitize=thread CXX=clang
$ cat /home/some/path/blacklist-sgen
fun:sweep_block
fun:sweep_block_for_size
$ # alter mono/sgen/Makefile
$ cat mono/sgen/Makefile
...
CCASFLAGS = -fsanitize=thread -fsanitize-blacklist=/home/some/path/blacklist-sgen ...
...
CFLAGS = -fsanitize=thread -fsanitize-blacklist=/home/some/path/blacklist-sgen ...
...
CFLAGS_FOR_BUILD = -fsanitize=thread -fsanitize-blacklist=/home/some/path/blacklist-sgen ...
...
$ make
```
