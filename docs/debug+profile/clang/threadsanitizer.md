---
title: ThreadSanitizer (Clang)
---

Using the ThreadSanitizer with Mono
-----------------------------------

The [ThreadSanitizer](https://clang.llvm.org/docs/ThreadSanitizer.html) is integrated into Clang 3.4+ and therefore, if Clang is installed, using it with Mono's `autogen.sh` is as simple as running the following:

``` bash
$ cd /home/root/of/mono
$ ./autogen.sh --prefix=/usr/local CC=clang CFLAGS=-fsanitize=thread LDFLAGS=-fsanitize=thread CXX=clang++
$ make
```

Please mind that `CXX` has to be set to `clang++` to avoid unwanted side effects and compiling errors.

After `autogen.sh` has been executed as suggested above, the following `make` command uses Clang and injects necessary reporting functions. Later, `make` uses [roslyn](https://github.com/dotnet/roslyn) to compile `mcs` with the freshly built Mono runtime. This reports a bit more than 150 races and produces slightly more than 1.5 MB of race traces (`master` branch, July 2017).

Using Blacklists
----------------

### Getting started

Many of these 150 races are harmless - among them are hazard pointers and less important logging counters, to name a few examples. A convenient way to (de)activate the report of specific races quickly is to work with blacklists. A blacklist file contains the names of source files and/or functions whose races should not be reported. Such blacklist files can be placed anywhere on the system. The simplest approach (an empty blacklist) would look like this:

``` bash
$ touch /home/some/path/blacklist
$ cd /home/root/of/mono
$ ./autogen.sh --prefix=/usr/local CC=clang CFLAGS="-fsanitize=thread -fsanitize-blacklist=/home/some/path/blacklist" LDFLAGS=-fsanitize=thread CXX=clang++
$ make
```

Currently (July 2017) it seems like a good idea to leave all blacklist files outside of the repository, as sometimes `autogen.sh` treats blacklist files like source files and lists them as dependencies. As an additional, positive side effect, the blacklist files will not interfere with git.

The easiest way of blocking everything is to simply put `src:*` into the blacklist file:

``` bash
$ cat /home/some/path/blacklist
src:*
```

However, a finer granularity (toggling the reporting of functions instead of the reporting of whole source files) is often desirable. Currently, at least `fun:` can be used to achieve that. Also, `src:` and `fun:` can be used in the same blacklist file and even the usage of wildcards (`*`) is supported. Please have a look at the [official documentation](https://clang.llvm.org/docs/SanitizerSpecialCaseList.html) for more details.

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

Permanent Blacklisting (Function Annotation)
--------------------------------------------

While blacklist files are handy when it comes to debugging, they are less convenient when looking for permanent solutions that work without the setup process of blacklists. As mentioned above, some data races are known, can be ignored, and will not be fixed. These races should be blacklisted via function annotation. Functions that are flagged with [`MONO_NO_SANITIZE_THREAD`](https://github.com/mono/mono/blob/master/mono/utils/mono-compiler.h) behave exactly as if their name was found in a blacklist file. If, for example, `foo ()` contains a known race, the following code could be used:

``` c
MONO_NO_SANITIZE_THREAD
void
foo (void)
{
  // ...
}
```

Please mind that these annotations should be used with **great caution**! Many functions contain more than just one data race. Furthermore, other (new) races might arise due to code refactoring but stay hidden if racy functions were annotated before. Therefore, all occurrences of `MONO_NO_SANITIZE_THREAD` should come with meaningful and detailed descriptions of all expected data races.

Customise the ThreadSanitizer
-----------------------------

The default setup of the ThreadSanitizer is pretty decent. Nonetheless, there are a some options that can improve certain aspects of working with it.

### Compiler Options

Clang's ThreadSanitizer supports a lot of [compiler options](https://github.com/google/sanitizers/wiki/ThreadSanitizerFlags#compiler-flags-llvm-specific) that should be provided via `CFLAGS` when running `autogen.sh`. One of these options proves to be extremely useful:

#### (Stop) The Instrumentation of Atomic Operations

[atomic.h](https://github.com/mono/mono/blob/master/mono/utils/atomic.h) in `mono/utils/` containts atomic functions that are mostly harmless; however, they are rightfully detected as data races. Some examples are `InterlockedCompareExchange`, `InterlockedIncrement` or `InterlockedExchangePointer`. If all atomic instructions should be blacklisted at once, the easiest and cleanest solution is to add `-mllvm -tsan-instrument-atomics=false` to the `CFLAGS` argument of `autogen.sh`. Using it together with a blacklist could look like this:

``` bash
$ cd /home/root/of/mono
$ ./autogen.sh --prefix=/usr/local CC=clang CFLAGS="-fsanitize=thread -fsanitize-blacklist=/home/some/path/blacklist -mllvm -tsan-instrument-atomics=false" LDFLAGS=-fsanitize=thread CXX=clang++
$ make
```

### Runtime Options

Clang's ThreadSanitizer also supports various [runtime options](https://github.com/google/sanitizers/wiki/ThreadSanitizerFlags). In combination with `make`, they can be applied like so:

``` bash
$ cd /home/root/of/mono
$ TSAN_OPTIONS="foo=bar foo2=bar2 foo3=bar3" make
```

Please be aware that the runtime options have to be set everytime a ThreadSanitizer-annotated program is used. `TSAN_OPTIONS` is only applied to the `make` process in the example code above. When using `mono` later, `TSAN_OPTIONS` has to be provided again.

Two runtime flags in particular seem to be useful when working with Mono:

#### Increase the Memory Access History

Sometimes, races extend over a long period of time; however, they might not be harmless. By default, only the last two memory accesses get remembered per thread. This can lead to incomplete stack traces that are hard (or impossible) to comprehend. To avoid this, the runtime flag `history_size=4` seems to be a good trade-off between memory consumption and complete stack traces.

#### Exit with 0

By default, the ThreadSanitizer exits with `66` whenever at least one race was detected. This can be inconvenient, when compiling a batch of files. Luckily, the runtime option `exitcode=0` (or `1`, `2`, ...) can help with that.

Additional Information
----------------------

### Evaluation

Clang's ThreadSanitizer is currently in a try-out phase (July 2017). Many races are being evaluated and are either about to be blacklisted and documented, or reported and fixed. Due to this, updates of this page will happen frequently.

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

fun:make_generic_param_class
fun:mono_class_create_from_typedef
fun:mono_class_from_generic_parameter_internal
fun:mono_class_get_methods
fun:mono_class_has_failure
fun:mono_class_has_finalizer
fun:mono_class_inflate_generic_method_full_checked
fun:mono_class_inflate_generic_type_no_copy
fun:mono_class_inflate_generic_type_with_mempool
fun:mono_class_init
fun:mono_class_setup_fields
fun:mono_class_setup_methods
fun:mono_class_setup_vtable_full
fun:mono_class_setup_vtable_general
fun:mono_generic_class_get_class
fun:mono_method_get_context_general

# class-accessors.c #

fun:mono_class_get_flags
fun:mono_class_get_method_count
fun:mono_class_set_method_count

# class-inlines.h #

fun:mono_class_is_ginst
fun:mono_class_is_gtd

# domain.c #

fun:mono_domain_alloc0

# gc.c #

fun:finalize_domain_objects
fun:finalizer_thread
fun:mono_domain_finalize
fun:mono_gc_cleanup

# icall.c #

fun:ves_icall_System_Reflection_MonoMethodInfo_get_parameter_info
fun:ves_icall_RuntimeType_GetConstructors_native

# image.c #

fun:mono_image_alloc
fun:mono_image_alloc0
fun:mono_image_strdup

# jit-info.c #

fun:jit_info_table_add
fun:jit_info_table_chunk_index
fun:jit_info_table_find
fun:jit_info_table_index
fun:mono_jit_compile_method_with_opt
fun:mono_jit_info_init
fun:mono_jit_info_table_find_internal

# loader.c #

fun:cache_memberref_sig
fun:mon_new
fun:mono_get_method_from_token
fun:mono_method_get_signature_checked
fun:mono_method_signature_checked

# marshal.c #

fun:mono_marshal_get_native_wrapper
fun:mono_marshal_isinst_with_cache

# metadata.c #

fun:img_set_cache_get
fun:_mono_metadata_generic_class_equal
fun:mono_metadata_get_canonical_generic_inst
fun:mono_metadata_lookup_generic_class
fun:mono_type_get_type

# monitor.c #

fun:mono_monitor_ensure_owned
fun:mono_monitor_exit_inflated
fun:mono_monitor_try_enter_inflated
fun:mono_object_hash
fun:ves_icall_System_Threading_Monitor_Monitor_pulse_all
fun:ves_icall_System_Threading_Monitor_Monitor_test_synchronised
fun:ves_icall_System_Threading_Monitor_Monitor_wait

# mono-conc-hash.c #

fun:mono_conc_g_hash_table_lookup_extended
fun:set_key

# mono-hash.c #

fun:mono_g_hash_table_max_chain_length

# object.c #

fun:mono_class_compute_gc_descriptor
fun:mono_class_create_runtime_vtable
fun:mono_class_vtable_full
fun:mono_delegate_ctor_with_method
fun:mono_runtime_class_init_full

# reflection.c #

fun:method_object_construct
fun:reflected_equal

# reflection-cache.h #

fun:cache_object_handle

# runtime.c #

fun:mono_runtime_is_shutting_down
fun:mono_runtime_try_shutdown

# sgen-mono.c #

fun:mono_gc_wbarrier_set_arrayref
fun:sgen_client_gchandle_created
fun:sgen_client_gchandle_destroyed

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
fun:create_thread
fun:mono_thread_clr_state
fun:mono_thread_detach_internal
fun:mono_threads_add_joinable_thread
fun:mono_threads_join_threads
fun:remove_and_abort_threads

# w32handle.c #

fun:mono_w32handle_init_handle
fun:mono_w32handle_lookup_data
fun:mono_w32handle_unref_core

# ------------------------------------------------------------ #
#   mono/mini
# ------------------------------------------------------------ #

# alias-analysis.c #

fun:recompute_aliased_variables

# mini.c #

fun:mini_method_compile
fun:mono_allocate_stack_slots
fun:mono_jit_compile_method_inner
fun:mono_save_seq_point_info
fun:mono_time_track_end
fun:mono_type_to_load_membase

# mini-generic-sharing.c #

fun:mini_get_basic_type_from_generic
fun:mini_is_gsharedvt_type
fun:mono_generic_context_check_used
fun:mono_method_check_context_used

# mini-native-types.c #

fun:mini_native_type_replace_type

# mini-runtime.c #

fun:mono_jit_find_compiled_method_with_jit_info

# mini-trampolines.c #

fun:common_call_trampoline
fun:mini_resolve_imt_method
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

# sgen-array-list.c #

fun:sgen_array_list_add
fun:sgen_array_list_find_unset

# sgen-fin-weak-hash.c #

fun:add_stage_entry

# sgen-gc.h #

fun:sgen_set_nursery_scan_start

# sgen-gc #

fun:mono_gc_wbarrier_generic_store

# sgen-gchandles.c #

fun:is_slot_set
fun:link_get
fun:mono_gchandle_free
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

# memfuncs.c #

fun:mono_gc_memmove_aligned

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
