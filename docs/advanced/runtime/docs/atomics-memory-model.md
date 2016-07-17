---
title: Atomics and Memory Model
---

# Atomics and Memory Model

## Introduction

This document describes the semantics of atomic operations and the managed memory model in C#, CIL, and the BCL.

The information here is based on the Ecma 334 and 335 specifications, MSDN documentation for the relevant BCL methods
and equivalent Win32 functions, and the source code of CoreCLR and CoreFX.

It is assumed that the reader understands basic concepts of memory models: Different memory barrier kinds, acquire and
release semantics, the meaning of atomicity, and so on.

The actual implementation of these operations in Mono is described at he end.

## Semantics

### Atomicity in the CLI

Any load or store that is smaller than or equal to `IntPtr.Size` shall be atomic, but does not imply a barrier of any
kind. Operations on 64-bit quantities are only atomic on 64-bit systems.

The source/destionation address of a load/store operation must be properly aligned for the data type for the above
guarantees to hold.

If a load or store to an address happens at the same time as another load or store to that address but of a different
size, all bets are off and no atomicity is guaranteed.

These rules apply to high-level languages like C# and F# as they target the CLI.

### `volatile.` prefix opcode in CIL

When the `volatile.` prefix opcode is used in CIL, it imposes acquire/release semantics on the next non-prefix opcode.
For loads, it results in acquire semantics. For stores, it results in release semantics.

This prefix opcode has no effect on atomicity beyond the standard rules of the CLI.

### `volatile` keyword in C\#

The `volatile` keyword in C# compiles down to CIL loads and stores prefixed with the `volatile.` opcode.

C#'s `volatile` cannot be applied to 64-bit quantities because regular loads and stores in CIL do not guarantee
atomicity for 64-bit quantities on 32-bit systems, and the `Volatile` class did not exist when the `volatile` keyword
was designed. Today, `volatile` on 64-bit quantities could conceivably be compiled down to `Volatile.Read` and
`Volatile.Write` calls.

### `Thread` class

The `VolatileRead` and `VolatileWrite` methods perform loads and stores with acquire and release semantics,
respectively. They guarantee absolutely nothing about atomicity beyond the standard rules of the CLI. In effect, this
means that the 64-bit overloads of these methods are not atomic on 32-bit systems.

There is a quirk in the .NET implementation where these methods actually use the `MemoryBarrier` method to insert a
barrier. This is stronger than a simple acquire or release barrier. We do the same for compatibility.

The MSDN documentation incorrectly states that the C# compiler emits calls to `VolatileRead` and `VolatileWrite` when
using the `volatile` keyword.

The `MemoryBarrier` method inserts a full sequential consistency barrier.

### `Volatile` class

The methods on the `Volatile` class are all atomic regardless of system bitness, and result in acquire and release
barriers for loads and stores respectively.

The 64-bit methods on this class are not atomic with respect to loads or stores made through other means than the
methods on this class and the `Interlocked` class. This is because such 64-bit operations may need to be implemented
with a lock on 32-bit systems.

The MSDN documentation incorrectly states that the C# compiler emits calls to this class's methods when using the
`volatile` keyword.

### `Interlocked` class

The methods on the `Interlocked` class are all atomic regardless of system bitness, and all have sequential consistency
semantics.

The 64-bit methods on this class are not atomic with respect to loads or stores made through other means than the
methods on this class and the `Volatile` class. This is because such 64-bit operations may need to be implemented with a
lock on 32-bit systems.

The `MemoryBarrier` method is just an alias for `Thread.MemoryBarrier`.

## Implementation

### CLI rules

When we see a CIL opcode prefixed with `volatile.`, we insert a `memory_barrier` IR opcode before or after the IR
opcodes that make up the operation. This `memory_barrier` opcode is flagged with the appropriate barrier kind
(`MONO_MEMORY_BARRIER_ACQ` or `MONO_MEMORY_BARRIER_REL`). `memory_barrier` opcodes are never reordered, and impose
the necessary reordering restrictions on the surrounding IR opcodes as well.

We expect all targets to support a `memory_barrier` opcode.

### `Thread`, `Volatile`, and `Interlocked` methods

The unoptimized behavior for these methods is to perform an icall into the runtime where they are implemented in C code
usually through C compiler intrinsics, or in the case of the 64-bit `Volatile` and `Interlocked` methods on a 32-bit
system, with a lock.

We only use the icalls on targets where, for whatever reason, we can't replace calls to these methods with IR opcodes.

### Intrinsics

On most targets, we replace calls to the BCL methods with IR opcodes.

#### `Thread` methods

Calls to `MemoryBarrier` (and the alias on `Interlocked`) are replaced with the `memory_barrier` IR opcode with the
`MONO_MEMORY_BARRIER_SEQ` kind.

Calls to `VolatileRead` and `VolatileWrite` are replaced with regular `load*_membase` and `store*_membase` IR opcodes
coupled with a `memory_barrier` IR opcode with either `MONO_MEMORY_BARRIER_ACQ` or `MONO_MEMORY_BARRIER_REL`.

#### `Volatile` methods

Calls to `Read` and `Write` are replaced with `atomic_load_*` and `atomic_store_*` IR opcodes flagged with
`MONO_MEMORY_BARRIER_ACQ` or `MONO_MEMORY_BARRIER_REL`. These opcodes imply a memory barrier by themselves and as such
cannot be reordered and impose reordering restrictions on surrounding opcodes, like the `memory_barrier` IR opcode.

#### `Interlocked` methods

Calls to `Read` are replaced with the `atomic_load_i8` IR opcode flagged with `MONO_MEMORY_BARRIER_SEQ`.

Calls to `Increment` and `Decrement` are replaced with the `atomic_add_i4` and `atomic_add_i8` IR opcodes.

Calls to `Exchange` are replaced with the `atomic_exchange_i4` and `atomic_exchange_i8` IR opcodes.

Calls to `CompareExchange` are replaced with the `atomic_cas_i4` and `atomic_cas_i8` IR opcodes.

The `atomic_add_*`, `atomic_exchange_*`, and `atomic_cas_*` IR opcodes all imply `MONO_MEMORY_BARRIER_SEQ` barriers
(despite not explicitly being flagged) and behave as such in the IR with respect to reordering restrictions.
