---
title: ThreadSanitizer (Clang)
---

Using the ThreadSanitizer with Mono
-----------------------------------

The [ThreadSanitizer](https://clang.llvm.org/docs/ThreadSanitizer.html) is integrated into Clang 3.4+ and therefore, if Clang is installed, using it with Mono's `autogen.sh` is as simple as running:

``` bash
$ cd /home/root/of/mono
$ ./autogen.sh --prefix=/usr/local CC=clang CFLAGS=-fsanitize=thread LDFLAGS=-fsanitize=thread CXX=clang++
$ make
```

Please mind that `CXX` has to be set to `clang++` to avoid unwanted side effects and compiling errors.

After `autogen.sh` has been executed as suggested above, the following `make` command uses Clang and injects necessary reporting functions. This simple approach reports slightly more than 150 races and produces slightly more than 1.5 MB of race traces (`master` branch, July 2017).

Using Blacklists
----------------

### Getting started

Many of these 150 races are harmless - among them are hazard pointers and less important logging counters, to name a few examples. A convenient way to (de)activate reporting of specific races quickly is to work with blacklists. A blacklist file contains the names of source files and/or functions whose races should not be reported. Such blacklist files can be placed anywhere on the system. The simplest approach (an empty blacklist) would look like this:

``` bash
$ touch /home/some/path/blacklist
$ cd /home/root/of/mono
$ ./autogen.sh --prefix=/usr/local CC=clang CFLAGS="-fsanitize=thread -fsanitize-blacklist=/home/some/path/blacklist" LDFLAGS=-fsanitize=thread CXX=clang++
$ make
```

Currently (July 2017) it seems like a good idea to leave all blacklist files outside of the repository, as sometimes, `autogen.sh` treats blacklist files like source files and lists them as dependencies. As an additional, positive side effect, the blacklist files will not interfere with git.

The easiest way of blocking everything is to simply put `src:*` into the blacklist file:

``` bash
$ cat /home/some/path/blacklist
src:*
```

However, a finer granularity (toggling the reporting of functions instead of the reporting of whole source files) is often desirable. Currently at least `fun:` can be used to achieve that. Also, `src:` and `fun:` can be used in the same blacklist file and even the usage of wildcards (`*`) is supported. Please have a look at the [official documentation](https://clang.llvm.org/docs/SanitizerSpecialCaseList.html) for more details.

### Partitioning Blacklists

Changes of blacklist files are detected automatically. The first `make` command after changing a blacklist file recompiles all source files that use that specific blacklist file for compilation. While this is extremely useful, it wastes a lot of CPU and time to recompile the whole project when only debugging / toggling a few functions of a specific module. One way of working with the ThreadSanitizer more efficiently is to partition the blocked functions and source files into dedicated blacklist files. To link those dedicated blacklists to Clang, all corresponding `Makefile` files have to be altered.

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

Helpful Information
-------------------

Clang's ThreadSanitizer is currently in a try-out phase (July 2017). Many races are being evaluated and are either about to be blacklisted and documented, or reported and fixed. Due to this, updates of this page will happen frequently.

### (Stop) The Instrumentation of Atomic Operations

[atomic.h](https://github.com/mono/mono/blob/master/mono/utils/atomic.h) in `mono/utils/` containts atomic functions that are mostly harmless, however, they are rightfully detected as data races. Some examples are `InterlockedCompareExchange`, `InterlockedIncrement` or `InterlockedExchangePointer`. If all atomic instructions should be blacklisted at once, the easiest and cleanest solution is to add `-mllvm -tsan-instrument-atomics=false` to the `CFLAGS` argument of `autogen.sh`. Using it together with a blacklist could look like this:

``` bash
$ cd /home/root/of/mono
$ ./autogen.sh --prefix=/usr/local CC=clang CFLAGS="-fsanitize=thread -fsanitize-blacklist=/home/some/path/blacklist -mllvm -tsan-instrument-atomics=false" LDFLAGS=-fsanitize=thread CXX=clang++
$ make
```

### A List of Functions

As of July 2017, blacklisting the following functions should hide most data race warnings (this list can be copy-and-pasted into a blacklist file):

``` bash
# ------------------------------------------------------------ #
#   eglib/src
# ------------------------------------------------------------ #

fun:monoeg_g_hash_table_iter_next

# ------------------------------------------------------------ #
#   mono/metadata
# ------------------------------------------------------------ #

# class.c #

fun:mono_class_inflate_generic_method_full_checked
fun:mono_class_inflate_generic_type_with_mempool
fun:mono_class_init
fun:mono_method_get_context_general

# domain.c #

fun:mono_domain_alloc0

# gc.c #

fun:finalize_domain_objects
fun:finalizer_thread
fun:mono_domain_finalize
fun:mono_gc_cleanup

# image.c #

fun:mono_image_alloc
fun:mono_image_alloc0

# jit-info.c #

fun:jit_info_table_add
fun:jit_info_table_chunk_index
fun:jit_info_table_find
fun:jit_info_table_index
fun:mono_jit_compile_method_with_opt
fun:mono_jit_info_init
fun:mono_jit_info_table_find_internal

# loader.c #

fun:mon_new
fun:mono_get_method_from_token
fun:mono_method_signature_checked

# metadata.c #

fun:img_set_cache_get

# monitor.c #

fun:mono_monitor_ensure_owned
fun:mono_monitor_exit_inflated
fun:mono_monitor_try_enter_inflated
fun:ves_icall_System_Threading_Monitor_Monitor_pulse_all
fun:ves_icall_System_Threading_Monitor_Monitor_test_synchronised
fun:ves_icall_System_Threading_Monitor_Monitor_wait

# runtime.c #

fun:mono_runtime_is_shutting_down
fun:mono_runtime_try_shutdown

# sgen-mono.c #

fun:sgen_client_gchandle_created

# threadpool.c #

fun:worker_callback

# threadpool-worker-default.c #

fun:heuristic_adjust
fun:heuristic_notify_work_completed
fun:heuristic_should_adjust
fun:hill_climbing_update
fun:monitor_should_keep_running
fun:monitor_thread

# threads.c #

fun:build_wait_tids
fun:mono_thread_clr_state
fun:mono_thread_detach_internal
fun:remove_and_abort_threads

# w32handle.c #

fun:mono_w32handle_init_handle
fun:mono_w32handle_lookup_data
fun:mono_w32handle_unref_core

# ------------------------------------------------------------ #
#   mono/mini
# ------------------------------------------------------------ #

# mini.c #

fun:mini_method_compile
fun:mono_allocate_stack_slots
fun:mono_jit_compile_method_inner
fun:mono_save_seq_point_info
fun:mono_time_track_end

# mini-generic-sharing.c #

fun:mono_method_check_context_used

# mini-trampolines.c #

fun:common_call_trampoline
fun:mono_create_jit_trampoline
fun:mono_delegate_trampoline
fun:mono_magic_trampoline
fun:mono_rgctx_lazy_fetch_trampoline
fun:mono_vcall_trampoline

# ------------------------------------------------------------ #
#   mono/sgen
# ------------------------------------------------------------ #

# sgen-array-list.h #

fun:sgen_array_list_bucketize

# sgen-fin-weak-hash.c #

fun:add_stage_entry

# sgen-gc.h #

fun:sgen_set_nursery_scan_start

# sgen-gchandles.c #

fun:link_get
fun:sgen_gchandle_iterate

# sgen-marksweep.c #

fun:ensure_block_is_checked_for_sweeping
fun:major_finish_sweep_checking
fun:set_block_state
fun:sweep_block
fun:sweep_block_for_size
fun:unlink_slot_from_free_list_uncontested

# ------------------------------------------------------------ #
#   mono/utils
# ------------------------------------------------------------ #

# hazard-pointer.c #

fun:is_pointer_hazardous
fun:mono_get_hazardous_pointer

# mono-conc-hashtable.c #

fun:mono_conc_hashtable_lookup

# mono-lazy-init.h #

fun:mono_lazy_initialize

# mono-threads-posix-signals.c #

fun:restart_signal_handler
fun:suspend_signal_handler

# mono-threads-state-machine.c #

fun:check_thread_state
fun:mono_threads_transition_finish_async_suspend
```
