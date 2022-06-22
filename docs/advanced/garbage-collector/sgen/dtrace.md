---
title: SGen DTrace
redirect_from:
  - /SGen_DTrace/
---

On macOS Mono's [Generational GC](/docs/advanced/garbage-collector/sgen/) is instrumented with several [DTrace](/docs/debug+profile/profile/dtrace/) probes that give insight into the garbage collection process and can help in finding the causes for performance problems.

## The Probes

The DTrace provider name for all these probes is `monoPID`, where `PID` is the respective process's PID.

``` c
gc-begin (int generation)
gc-end (int generation)
```

These probes fire whenever a garbage collection starts or finishes. The value for generation can be `0` for the nursery or `1` for the old generation.

``` c
gc-locked ()
gc-unlocked ()
```

Fire whenever the global GC lock is taken or released. This happens around garbage collections and in other circumstances, but only during collections should the lock be held for an extended period of time.

``` c
gc-heap-alloc (uintptr_t addr, uintptr_t len)
gc-heap-free (uintptr_t addr, uintptr_t len)
```

These fire when the garbage collector allocates or frees a section of memory from the operating system for the purpose of storing managed objects. Memory allocated for metadata or internal garbage collector data is not reported via these probes.

``` c
gc-nursery-tlab-alloc (uintptr_t addr, uintptr_t len)
```

This probe fires when a thread local allocation buffer (TLAB) is allocated to a thread. At the point when the probe fires the TLAB is empty, i.e. it contains no objects.

``` c
gc-nursery-obj-alloc (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name)
```

Fires whenever an object is allocated in the nursery from unmanaged code. Most of the time objects in TLABs are allocated in the managed allocator which is not instrumented due to performance considerations. To disable the managed allocator use the `MONO_GC_DEBUG` environment variable option `no-managed-allocator`. That will make all nursery allocations trigger the probe.

``` c
gc-major-obj-alloc-large (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name)
gc-major-obj-alloc-pinned (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name)
gc-major-obj-alloc-degraded (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name)
gc-major-obj-alloc-mature (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name)
```

Fires when objects are allocated directly from the old generation. This happens in the following cases.

-   Large objects, meaning objects larger than 8000 bytes.

-   Objects that are specifically requested to be allocated pinned.

-   Degraded allocation. If the nursery is pinned to such an extent that it doesn't permit object allocation, SGen switches into degraded mode, allocating all objects directly from the major heap. If nontrivial amounts of degraded allocations occur, increase the nursery size.

-   Objects that are specifically requested to be allocated in the old

generation.

``` c
gc-obj-moved (uintptr_t dest, uintptr_t src, int dest_gen, int src_gen, uintptr_t size, char *ns_name, char *class_name)
```

Whenever an object is moved this probe fires. Moves can occur within and between generations, specifically:

-   Within the nursery, if the aging semi-spaces are used.

-   From the nursery to the major heap, for objects surviving the nursery and therefore being promoted.

-   Within the major heap, in case of defragmentation.

<!-- -->

``` c
gc-nursery-swept (uintptr_t addr, uintptr_t len)
gc-major-swept (uintptr_t addr, uintptr_t len)
```

These probes fire when parts of the nursery or major heap are swept clean of objects. Note that the swept regions can encompass more than one (dead) object.

``` c
gc-obj-pinned (uintptr_t addr, uintptr_t size, char *ns_name, char *class_name, int generation)
```

Fires whenever an object is pinned.

## Example scripts

### Garbage collection times

How long do garbage collections take for a specific workload?

    dtrace -q -c "mono-sgen foo.exe" -n 'mono$target:::gc-begin { self->ts = timestamp; } mono$target:::gc-end { @[arg0] = quantize ((timestamp - self->ts)/1000); }'

Example output:

         1
    value  ------------- Distribution ------------- count
       16 |                                         0
       32 |@@@@@@@@@@@@@                            1
       64 |                                         0
      128 |                                         0
      256 |                                         0
      512 |                                         0
     1024 |                                         0
     2048 |                                         0
     4096 |                                         0
     8192 |                                         0
    16384 |@@@@@@@@@@@@@@@@@@@@@@@@@@@              2
    32768 |                                         0

         0
    value  ------------- Distribution ------------- count
        4 |                                         0
        8 |                                         1
       16 |                                         0
       32 |                                         1
       64 |                                         1
      128 |                                         0
      256 |                                         0
      512 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    90
     1024 |                                         1
     2048 |                                         0
     4096 |                                         0
     8192 |@                                        3
    16384 |                                         1
    32768 |                                         0

The graph for `0` shows collection times for the nursery, the graph for `1` shows times for the major collections. We can see here that the majority of nursery collections took about half a millisecond, with 4 outliers taking around 10 ms. There were 3 major collections, two of which took around 16 ms and the third one barely took any time at all.

### GC lock

Not counting garbage collections, how often and for how long is the GC lock held?

    dtrace -q -c "mono-sgen ipy.exe pystone.py 500000" -n 'mono*:::gc-locked { self->ts = timestamp; } mono*:::gc-begin { @ = quantize ((timestamp - self->ts)/1000); } mono*:::gc-end { self->ts = timestamp; } mono*:::gc-unlocked { @ = quantize ((timestamp - self->ts)/1000); }'

Output:

    value  ------------- Distribution ------------- count
        0 |                                         0
        1 |@@@@@@@@@@@@@@@@@@@@@@@@@                5462
        2 |@@@@@@@@@@@@@                            2789
        4 |                                         97
        8 |                                         49
       16 |@                                        192
       32 |                                         12
       64 |                                         2
      128 |                                         0
      256 |                                         0
      512 |                                         0
     1024 |                                         1
     2048 |                                         0

SGen takes the lock quite often, but apart from one outlier at about 1 millisecond, it's released almost immediately. Further analysis (not presented here) shows that the outlier is a result of thread-pool initialization during startup, when a few objects are allocated pinned, requiring allocating some memory from the operating system.

### Objects pinned in the nursery

How many objects of which types are pinned during nursery collections?

    dtrace -q -c "mono-sgen ipy.exe pystone.py 500000" -n 'mono$target:::gc-obj-pinned /arg4==0/ { @[strjoin(copyinstr(arg2),strjoin(".",copyinstr(arg3)))] = count (); }' | tail -5

Output:

    Microsoft.Scripting.Actions.DynamicSiteTarget`3                  863
    IronPython.Runtime.Calls.CallTarget1                             864
    System.Object[]                                                 1271
    Microsoft.Scripting.Actions.CallSite`1                          1350
    System.String[]                                                 1440

Here we see the pin counts for the 5 most pinned classes during nursery collections. Combining all nursery collections, for example, 1440 string arrays were pinned.

What if we'd like to know how many bytes of memory are pinned in the nursery during each collection?

    dtrace -q -c "mono-sgen ipy.exe pystone.py 500000" -n 'mono$target:::gc-begin /arg0==0/ { bytes=0; } mono$target:::gc-obj-pinned /arg4==0/ { bytes += arg1; } mono$target:::gc-end /arg0==0/ { @ = quantize(bytes); }'

    value  ------------- Distribution ------------- count
       32 |                                         0
       64 |                                         1
      128 |@                                        2
      256 |                                         0
      512 |                                         0
     1024 |                                         0
     2048 |                                         0
     4096 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  95
     8192 |                                         0

This looks a bit suspicious. We had about 100 nursery collections, so according to the object counts above there were on average 13 object arrays and 14 string arrays pinned per nursery collection, in addition to lots of other objects. All of those supposedly amount to only about 4 kilobytes of memory. Are we counting something wrong or are these very short arrays? Let's see:

    dtrace -q -c "mono-sgen ipy.exe pystone.py 500000" -n 'mono$target:::gc-obj-pinned /arg4==0/ { @[strjoin(copyinstr(arg2),strjoin(".",copyinstr(arg3)))] = quantize (arg1); }'

These are the parts of the output giving the counts for the arrays we're interested in:

    System.String[]
             value  ------------- Distribution ------------- count
                 8 |                                         0
                16 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@    1344
                32 |@@@                                      96
                64 |                                         0

    System.Object[]
             value  ------------- Distribution ------------- count
                 8 |                                         0
                16 |@@@@@@@@@@@@@@@@@@@@@@@@@@@              870
                32 |@@@@@@@@@@@@@                            409
                64 |                                         0

Apparently those arrays really are very short. But maybe the probe is lying to us about the object size? If we know about Mono's internal object layout we can read out the array length directly from the heap:

    dtrace -q -c "mono-sgen ipy.exe pystone.py 500000" -n 'mono$target:::gc-obj-pinned /arg4==0 && copyinstr(arg3)=="Object[]"/ { this->l = *(int*)copyin(arg0+12,4); @[arg1] = lquantize(this->l, 0, 8); }'

On 32-bit Mono the length of an array is at offset 12, so we read 4 bytes from there and cast it to an `int`. We get a few graphs like these:

        16
    value  ------------- Distribution ------------- count
      < 0 |                                         0
        0 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 96
        1 |                                         0

        28
    value  ------------- Distribution ------------- count
        2 |                                         0
        3 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 2
        4 |                                         0

        20
    value  ------------- Distribution ------------- count
        0 |                                         0
        1 |@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 481
        2 |                                         0

Each of them gives us the distribution of the array lengths for array objects of specific sizes. If everything is correct then for each array object size there must only be one array length, which is exactly what we get. For example, all 481 array objects of size 20 bytes have a length of one.

In fact, the numbers show that the sizes we get are exactly what we should expect given Mono's object layout on 32-bits: A reference array with a given length has a size of 16+4n bytes.
