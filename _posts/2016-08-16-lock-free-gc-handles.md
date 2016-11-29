---
layout: blog
title: "Lock-free GC Handles"
author: Jon Purdy
tags: [performance]
---

In Mono 4.4.0, we improved the performance of GC handles by changing to a lock-free implementation. In this post we’ll take a look at the original implementation and its limitations, and how the new implementation solved these problems.

## Background

For those unfamiliar, the [`GCHandle`][GCHandle] API provides access to the low-level GC handle primitive used to implement several types of “handles” to managed objects:

[GCHandle]: https://msdn.microsoft.com/en-us/library/system.runtime.interopservices.gchandle(v=vs.110).aspx

* **Normal handles** prevent an object from being collected, even if no managed references to the object exist.

* **Pinned handles** prevent an object from being moved in memory.

* **Weak references** reference an object *without* preventing it from being collected.

In addition to programmers’ regular use of handles, Mono uses them in its implementation of the [`Monitor`][Monitor] class, the basis of synchronization using [`Monitor.Enter`][Monitor.Enter] or the C♯ `lock` statement. As such, it’s important that accesses to GC handles be as fast as possible.

[Monitor]: https://msdn.microsoft.com/en-us/library/system.threading.monitor(v=vs.110).aspx
[Monitor.Enter]: https://msdn.microsoft.com/en-us/library/de0542zz(v=vs.110).aspx

## Original Implementation

A `GCHandle` object consists of a type and an index, packed together into a 32-bit unsigned integer. To get the value of a handle, say with `WeakReference.Target`, we first look up the array of handle data corresponding to its type, then look up the value at the given index; in pseudocode:

```text
(type, index) = unpack(handle)
value = handles[type][index]
```

The original implementation of GC handles was based on a bitmap allocator. For each handle type, it stored a bitmap indicating the available slots for allocating new handles, and an array of pointers to their target objects:

```text
bitmap   = 11010…
pointers = [0xPPPPPPPP, 0xPPPPPPPP, NULL, 0xPPPPPPPP, NULL, …]
```

There’s an interesting constraint, though: when we unload an `AppDomain`, we want to be able to free all of the weak references that point to objects in that domain, because we know they’ll never be accessed again.

But if the weak reference has expired, we can’t tell what domain it came from, because we no longer have an object to look at! So for weak references, we kept a parallel array of domain pointers:

```text
domains  = [0xDDDDDDDD, 0xDDDDDDDD, NULL, 0xDDDDDDDD, NULL, …]
```

Unfortunately, this implementation was wasteful in a few ways:

* To synchronize access to the handle allocator, we would lock a mutex on every access to a GC handle—[`GCHandle.Alloc`][GCHandle.Alloc], [`GCHandle.Target`][GCHandle.Target], and so on. This was especially expensive on OS X, where `pthread_mutex_lock` can be very costly.

[GCHandle.Alloc]: https://msdn.microsoft.com/en-us/library/1246yz8f(v=vs.110).aspx
[GCHandle.Target]: https://msdn.microsoft.com/en-us/library/system.runtime.interopservices.gchandle.target(v=vs.110).aspx

* For correctness, the domain-pointer array always had to be allocated for weak references, spending memory even though it was unused most of the time.

* For historical reasons related to Mono’s support of the Boehm GC, much of this information was duplicated in a separate hash table, wasting even more memory.

## New Implementation

After removing the redundant hash table, the first step toward a new lock-free implementation was to use *one* array to store the information from the *three* arrays of the previous implementation. We did so using *tagged pointers:* because objects are aligned to multiples of 8 bytes, the lower 3 bits of any object reference are guaranteed to be zero—so we can store extra information in those bits.

We ended up with a single array of *slots* in the following bit format:

```text
PPPPPPPP…0VX
```

Where `PPPP…` are pointer bits, `V` is the “valid” flag, and `X` is the “occupied” flag, packed together with bitwise OR:

```text
slot = pointer | valid_bit | occupied_bit
```

If the “occupied” flag is clear, the slot is free to be claimed by `GCHandle.Alloc`. To allocate a handle, we use a CAS (“compare and swap”, also known as [`Interlocked.CompareExchange`][Interlocked.CompareExchange]) to replace a null slot with a tagged pointer, where the “occupied” and “valid” flags are set:

[Interlocked.CompareExchange]: https://msdn.microsoft.com/en-us/library/system.threading.interlocked.compareexchange(v=vs.110).aspx

```text
cas(slot, tag(pointer), NULL)

00000000…000
     ↓
PPPPPPPP…011
```

If the CAS succeeds, we now own a valid handle. If it fails, it means that another thread happened to be allocating a handle at the same time, so we just try the next free slot until we can successfully claim one. Unless you have many threads allocating many handles, allocating a handle will almost always succeed on the first try, without waiting to take a lock. And setting the target of a handle, with `WeakReference.Target` for example, works similarly.

As for `AppDomain` unloading, we can observe that we only need to store a domain pointer for *expired* weak references. If the reference hasn’t expired, then we have a valid object, and we can inspect it to find out which domain it came from.

Therefore, when a weak reference expires, all we have to do is clear the “valid” flag and replace the object pointer with a domain pointer:

```text
PPPPPPPP…011
     ↓
DDDDDDDD…001
```

So these are the possible states of a slot:

| Occupied? | Valid? | Description                                                                       |
|-----------|--------|-----------------------------------------------------------------------------------|
| 1         | 1      | This slot is occupied and points to an object.                                    |
| 1         | 0      | This slot is occupied, but its object is expired, so it points to an `AppDomain`. |
| 0         | 0      | This slot is free and null.                                                       |

Now that we have our representation of slots, how do we grow the handle array when we run out of slots? Because the original implementation locked the handle array, it was safe to simply allocate a new array, copy the old contents into it, and store the pointer to the new array. But without a lock, this wouldn’t be thread-safe! For example:

* Thread 1 sees that the handle array needs to grow.
* Thread 1 allocates a new handle array and copies its current contents.
* Thread 2 changes the `Target` property of some weak reference.
* Thread 1 stores the pointer to the new handle array, **discarding Thread 2’s change.**

To solve this, instead of a single handle array, we use a handle *table* consisting of an array of *buckets*, each twice the size of the last:

```text
[0] → xxxxxxxx
[1] → xxxxxxxxxxxxxxxx
[2] → xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
[3] → NULL
…
```

Now we can grow the table in a thread-safe way:

* Thread 1 sees that the handle table needs to grow.
* Thread 1 optimistically allocates a new empty *bucket*.
* Thread 2 changes the `Target` property of some weak reference in an existing bucket.
* Thread 1 uses a compare-and-swap to store the new bucket, **leaving Thread 2’s change intact.**

If the CAS fails, then another thread has already allocated a new bucket, so we can just free the extra one we allocated, because it won’t contain any data yet. And this will only happen if the handle table is highly contended, which is rare.

## Performance Comparisons

`sgen-weakref-stress`, in the Mono runtime test suite, is a microbenchmark that allocates weak references from many threads.

Before this change was implemented, these were the average timings over 5 runs:

```bash
real    0m2.441s
user    0m1.591s
sys     0m0.959s
```

After the change:

```bash
real    0m0.358s
user    0m0.406s
sys     0m0.063s
```

Cool! We got about an 80% improvement.

Let’s look at `monitor-stress`, which stress-tests `Monitor` operations using the C♯ `lock` statement. Before the change, average of 5 runs:

```bash
real    0m2.714s
user    0m6.963s
sys     0m0.244s
```

Now, with the change:

```bash
real    0m2.681s
user    0m6.783s
sys     0m0.242s
```

It looks like these measurements are within error bounds, so we can’t claim any more than a modest improvement of 1–2%. The numbers are similar for our macrobenchmarks of `roslyn` and `fsharp`. On the bright side, we haven’t introduced any regressions.

## Conclusions

Converting the GC handle code to a lock-free implementation let us delete a sizable chunk of old code, save memory, and dramatically improve the performance of weak references by avoiding expensive locking.

This optimization didn’t improve the performance of `Monitor` much; in the future, we’ll talk about how another optimization, *thin locks*, gave us much greater improvements to locking performance.
