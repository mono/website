---
title: Blacklists (Clang Sanitizers)
---

A blacklist file contains the names of source files and/or functions whose issues (races, leaks, ...) should not be reported. Such blacklist files can be placed anywhere on the system. For the sake of simplicity, this article will focus on working with the [ThreadSanitizer](/docs/debug+profile/clang/threadsanitizer/). However, the same concepts and rules apply for all [Clang sanitizers](/docs/debug+profile/clang/) when used in combination with Mono.

The simplest approach (an empty blacklist) would look like this:

``` bash
$ touch /home/some/path/blacklist
$ cd /home/root/of/mono
$ ./autogen.sh --prefix=/usr/local CC=clang CFLAGS="-fsanitize=thread -fsanitize-blacklist=/home/some/path/blacklist" LDFLAGS=-fsanitize=thread CXX=clang++
$ make
...
```

The easiest way of blocking everything is to simply put `src:*` into the blacklist file:

``` bash
$ cat /home/some/path/blacklist
src:*
```

However, a finer granularity (toggling the reporting of functions instead of the reporting of whole source files) is often desirable. Currently, `fun:` can be used to achieve that. Also, `src:` and `fun:` can be used in the same blacklist file and even the usage of wildcards (`*`) is supported. Please have a look at the [official documentation](https://clang.llvm.org/docs/SanitizerSpecialCaseList.html) for more details.

Partitioning Blacklists
-----------------------

Changes of blacklist files are detected automatically. The first `make` command after changing a blacklist file recompiles all source files that use that specific blacklist file for compilation. While this is very useful, it wastes a lot of CPU and time to recompile the whole project when only debugging / toggling a few functions of a specific module. One way of working with blacklists more efficiently is to partition the blocked functions and source files into dedicated files. To link those dedicated blacklists to Clang, all corresponding `Makefile` files have to be altered.

For example, if `mono/sgen/` was to be debugged, a setup could look like this:

``` bash
$ cd /home/root/of/mono
$ ./autogen.sh --prefix=/usr/local CC=clang CFLAGS="-fsanitize=thread -fsanitize-blacklist=/home/some/path/blacklist" LDFLAGS=-fsanitize=thread CXX=clang++
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
