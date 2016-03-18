---
title: Checked Builds
---

Introduction
============

The Mono VM uses asserts throughout to ensure it is in a correct state. There are a few classes of asserts which are useful for debugging Mono, but which are too expensive to include in a production VM. If you are doing development on Mono, you can enable these with a specially built VM.

## Enabling

To enable the checked modes, you must build with the `--enable-checked-build=` argument passed to `autogen.sh`/`configure`, and then run the built mono with the `MONO_CHECK_MODE` environment variable. Both `--enable-checked-build` and `MONO_CHECK_MODE` accept a mode list, which can be either the word `all`, or a comma-separated list of mode names. The mode list passed to `--enable-checked-build=` determines which check modes will be built into the executable. The mode list passed to `MONO_CHECK_MODE` determines which check modes will be actually tested at runtime. The modes selected at runtime must be a subset of the modes selected at compile time; the modes are specified in two passes like this because some checks may introduce performance penalties even when they are not run.

If you do not need fine-grained control over which modes run, run autogen with the `--enable-checked-build=all` argument and mono with the `MONO_CHECK_MODE=all` environment variable.

## Modes

The checked-build asserts are separated into several different "modes". The current modes are `gc`, `thread` and `metadata`.

### `gc` mode

These asserts verify the cooperative GC. This includes two categories of check:

- Ensuring the thread state is correct for memory operations: Various operations such as allocation can only be performed when the GC is known to be in a `safe`, `unsafe` or `neutral` state. See the comments in `checked-build.h`.
- Ensuring `mono_threads_reset_blocking_start`/`mono_threads_reset_blocking_end` are always nested correctly.

### `thread` mode

This mode also verifies that thread state transitions (again, used by the cooperative GC) only occur between legal states.

This mode also enables tracking history of thread state transition points. Asserts related to state transitions will print stack traces of the last few transition points if `thread` mode is enabled. The number of thread transitions printed is controlled by the `MONO_CHECK_THREAD_TRANSITION_HISTORY` environment variable.

### `metadata` mode

This mode causes assignments from one metadata mempool to another to be checked to ensure they are following the reference rules for assemblies. The reference rules are described in the comments in `checked-build.c`.

This mode is most useful if you are seeing crashes following the unloading of an app domain. You are very likely to want to disable this mode if you do not need it, as it is very slow.

Adding checked-build asserts
============================

### General asserts

To add code to one of the checked-build modes, wrap your code in a `ENABLE_CHECKED_BUILD_GC`, `ENABLE_CHECKED_BUILD_THREAD`, or `ENABLE_CHECKED_BUILD_METADATA` ifdef. Then before running your code, check the value of `mono_check_mode_enabled()` with one of the `MonoCheckMode` enums in `checked-build.h`.

There is also a general `ENABLE_CHECKED_BUILD` define which is true if any checked mode is enabled, and a `g_assert_checked` which is an assert in any checked mode but does nothing if checked mode is disabled.

### Adding a new mode

To add a new mode, add a new check to the `enable-checked-build` definition in `configure.ac` and a new value to the `MonoCheckMode` enum.

### Adding `gc` asserts

See the `MONO_REQ_GC_SAFE_MODE`, `MONO_REQ_GC_UNSAFE_MODE`, `MONO_REQ_GC_NEUTRAL_MODE`, `MONO_PREPARE_GC_CRITICAL_REGION` and `MONO_REQ_GC_NOT_CRITICAL` macros in `checked-build.h`.

### Adding `thread` asserts

If you have a failure where it would be helpful to print out state transition history, use `mono_fatal_with_history` instead of `g_error`. This will degrade to `g_error` when not in the `thread` checked mode.

### Adding `metadata` asserts

See the `CHECKED_METADATA_WRITE_PTR`, `CHECKED_METADATA_WRITE_PTR_LOCAL`, `CHECKED_METADATA_WRITE_PTR_ATOMIC`, and `CHECKED_METADATA_WRITE_PTR_EXEMPT` macros in `checked-build.h`. Ideally, eventually all assignments of a pointer into an assembly-owned mempool should use one of these macros.