---
title: Working With SGen
redirect_from:
  - /Working_With_SGen/
---

SGen is a new and powerful garbage collector that we implemented for Mono. This new engine can be used for a wide range of applications from server workloads to desktop and mobile workloads and near-real time applications.

Different workloads will require different options in the garbage collector to be enabled. For example, server or high-performance computing applications can allocate as much memory from the operating system on startup in exchange for faster execution times. Meanwhile, mobile applications would rather only allocate as much memory as it is needed.

This document describes the options that you have available when it comes to tuning the garbage collector as well as a basic explanation of the inner workings of the garbage collector.

SGen Basics
===========

SGen is a generational collector, which is a popular technique used by garbage collectors to improve the performance of the garbage collector.

SGen uses three heaps to allocate your objects: the nursery, the major heap and the large object space.

[![SGenSpaces.png](/archived/images/1/15/SGenSpaces.png)](/archived/images/1/15/SGenSpaces.png)

For users familiar with the terminology used in other corners of the industry: The Nursery is the "Young Generation" while our "Major Heap" corresponds to the "Old Generation".

During the course of execution of your program, you will create some objects with long live spans and others that are short lived. Your objects are initially allocated in an area of memory called the nursery.

[![SgenNurseryAlloc.png](/archived/images/4/43/SgenNurseryAlloc.png)](/archived/images/4/43/SgenNurseryAlloc.png)

The size of the nursery is set to 4 megabytes. When you run of memory in the nursery, the garbage collector process starts a nursery collection.

It stops your threads and moves all of the live objects from the nursery into the major generation clearing the nursery in the process.

[![SgenEvacuation.png](/archived/images/5/58/SgenEvacuation.png)](/archived/images/5/58/SgenEvacuation.png)

As the objects are evacuated, they are moved into the major heap. If there is not enough memory in the major heap, then a major collection is triggered. If the major collection fails to free up enough memory, then SGen might request more memory from the operating system (this is the default).

SGen considers any objects using more than than 8,000 bytes to be large objects (`SGEN_MAX_SMALL_OBJ_SIZE`). Large objects are not actually allocated on the nursery, instead they are tracked by the Large Object Space (LOS) manager.

Major Heap Collector
====================

For collecting the major heap, SGen implements the mark and sweep/copying collector. The mark and sweep collector does not move the objects, but instead keeps the objects where they are. To avoid fragmentation, objects are distributed in buckets of different sizes and if these buckets reach a 66% of fragmentation then this automatically performs a copying evacuation. The mark and sweep collector basically provides the best of both worlds: fast execution and if the memory becomes fragmented, it automatically performs a copying collection.

The evacuation threshold for fragmented blocks is set to 66%, but you can change that by setting the `evacuation-threshold` option to a value between 0 and 100 (the default is 66).

You can also disable evacuation completely, even if the blocks become fragmented, by setting the value to zero.

Serial vs Concurrent Garbage Collection
=======================================

By default, the garbage collector will try to do most of the work concurrently with the mutator. Both the mark and the sweep phases can be run concurrently.

When concurrent mark is enabled, the GC will scan all the roots in the initial pause and it will kick off a worker to mark all the major heap. The mutator will resume execution and once the worker finishes scanning the heap, another pause will occur during which the collection is finished. The mode for the mark phase is controlled by setting the `major` variable in `MONO_GC_PARAMS` environment variable.

When concurrent sweep is enabled, once the marking phase is finished, the mutator will be resumed and the sweep phase will run concurrently with the user application. The GC will not be able to allocate from major blocks that are not swept, but this is not a problem since, following the collection, allocation will mostly happen inside the emptied nursery. This can explicitly configured using `concurrent-sweep` / `no-concurrent-sweep` option.

Single CPU vs Multiple CPU Garbage Collection
=============================================

Both the minor and major collector can make use of multiple worker threads to scan the heap.

For the major collector, parallel collection is only supported during the finishing pause of a concurrent collection. This mode can be enabled by setting `major=marskweep-conc-par`. This mode can be useful for application that have very large heaps.

The minor collector also supports a parallel mode. By default, minor collections are single threaded (`minor=simple`). Parallel collection can be enabled with `minor=simple-par`. Since minor collections are very short, the parallel mode is usually not necessary. Applications with large memory usage, with large nursery size or that trigger a lot of object reference writes in the major heap can particularly benefit from a parallel minor.

Low pause time
==============

SGen supports a few predefined modes which can be selected using the `mode` variable. These modes are `balanced`, `throughput` and `pause`. The low pause mode receives an argument, in milliseconds, which indicates the desired maximum duration for a minor collection. The GC will attempt to respect this constraint, by using a dynamic nursery size coupled with the parallel mode in order to reduce the likelihood of long minor collections. For example, in order to select a maximum pause time of 20ms the following environment configuration can be used `MONO_GC_PARAMS=mode=pause:20`

Controlling Collections
=======================

Some interactive, and near-real time applications want to minimize pause times caused by the GC running in the middle of their work (for example, video games. Game users do not really appreciate pauses in their gaming experience). The best mechanism to avoid these pauses is to not allocate memory during time sensitive operations and instead move the majority of the object allocations out of the sensitive code paths or your main game loop for example.

But it is not possible to avoid all allocations, specially with complicated applications. In those cases, developers can benefit from running controlled and limited collections of the nursery which are very fast instead of waiting for the GC heuristics to collect and triggering not only a nursery collection, but also a fairly time consuming major collection.

You can manually trigger a nursery collection by calling the `GC.Collect` method with the generation parameter set to zero, like this:

``` csharp
GC.Collect (0);
```

This instructs the garbage collector to process the nursery, which is a relatively quick process due to the limited size of the nursery.

If you call `GC.Collect` without a parameter or with any value higher than zero, Mono will perform a global garbage collection. This means that the garbage collector will look not only at the objects that live in the nursery, but also the objects that live in the mature object space.

Nursery Size
============

The default size of the nursery is four megabytes.

Since being in control of the nursery collection is important to some interactive/near-real-time applications, you might want to customize the nursery size.

You might want to make it smaller, to make nursery collections take place more often, or for the nursery collections to be done in a smaller amount of time, or you might want to make it larger, to allow a player for example to go through an entire game level without ever hitting the garbage collector.

To change the nursery size, set the `nursery-size` flag to the size in bytes that you want for the nursery. The nursery size must be a power of two and specified in bytes. Just like the major heap size configuration, you can use the “k”, “m” and “g” suffixes as shortcuts for kilobyte, megabyte and gigabyte respectively.

Configuring SGen
================

To set any of the variables discussed so far, you must set the environment variable `MONO_GC_PARAMS` and pass the options discussed in this article separated by commas.

In addition to the various options to configure SGen, you can learn more about the behavior of your application by using some of the SGen debugging flags. This is done by setting the `MONO_GC_DEBUG` environment variable when using SGen.

You can learn more about the debugging options for SGen from Mono's manual page: [mono(1)](http://docs.go-mono.com/?link=man%3amono(1)).

Profiling
=========

On systems that have DTrace (Solaris, macOS), Mono is able to report the SGen Garbage Collector events to Dtrace. See the [SGen_DTrace](/docs/advanced/garbage-collector/sgen/dtrace) page for details on how to use DTrace with Sgen to profile your application.

