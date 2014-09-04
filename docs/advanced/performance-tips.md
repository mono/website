---
title: Performance Tips
redirect_from:
  - /Performance_Tips/
---

**Writing better performing .NET and Mono applications**

The following document contains a few hints on how to improve the performance of your Mono/.NET applications. These are just guidelines, and you should still profile your code to find the actual performance problems in your application. It is never a smart idea to make a change with the hopes of improving the performance of your code without first measuring. In general, these guidelines should serve as ideas to help you figure out \`how can I make this method run faster'. It is up to you to figure out, \`Which method is running slowly.'

Profiling
=========

So, how does one measure what methods are running slowly? A profiler helps with this task. Mono includes a profiler that is built into the runtime system. You can invoke this profiler on your program by running with the --profile flag.

You can also use Instruments to get some information. In particular, you can use DTrace and Instruments to [monitor the SGen GC](/docs/advanced/garbage-collector/sgen/dtrace).

Using the Mono profiler
-----------------------

Mono has a built-in profiler to explore the common performance related programs in your application. This profile can do memory profiling, execution time profiling and also a statistical-based sampling for profiling. The default is to do memory and execution time.

The execution time profiling will instrument your code and record entry and leave times from a routine. This is useful in many cases, but large applications might suffer a big performance hit with this profiling mode as it is very intrusive. The statistical profiler is much less intrusive and uses statistical sampling that consumes little or no cpu time. To use the statistical profiler use:

``` bash
 $ mono --profile=default:stat program.exe
```

For other uses we have a better profiler in development that is documented [here](/docs/debug+profile/profile/profiler/).

Memory usage is a major driver in performance in managed applications: the more memory you use, the more work the GC has to do. Also it is a very noticeable to users when applications consume a lot of memory. To profile you application only with memory profilng (and skip the default that also does execution time) do:

``` bash
 $ mono --profile=default:alloc program.exe
```

When the program has finished executing, the profiler prints the data in human readable format. It looks like:

``` bash
Total time spent compiling 227 methods (sec): 0.07154 Slowest method to compile
 (sec): 0.01893: System.Console::.cctor() Time(ms) Count P/call(ms) Method name ########################
91.681 1 91.681 .DebugOne::Main() Callers (with count) that contribute at least
for 1%:
1 100 % .DebugOne::Main(object,intptr,intptr)
... Total number of calls: 3741 ... Allocation profiler Total mem Method ########################
406 KB .DebugOne::Main()
406 KB 1000 System.Int32[]
Callers (with count) that contribute at least for 1%:
1 100 % .DebugOne::Main(object,intptr,intptr)
Total memory allocated: 448 KB
```

At the top, it shows each method that is called. The data is sorted by the total time that the program spent within the method. Then it shows how many times the method was called, and the average time per call.

Below this, it shows the top callers of the method. This is very useful data. If you find, for example, that the method Data::Computate () takes a very long time to run, you can look to see if any of the calls can be avoided.

    Two warnings must be given about the method data.

First, the profiler has an overhead associated with it. As such, a high number of calls to a method may show up as consuming lots of time, when in reality they do not consume much time at all. If you see a method that has a very high number of calls, you may be able to ignore it. However, do consider removing calls if possible, as that will sometimes help performance. This problem is often seen with the use of built in collection types.
 Secondly, due to the nature of the profiler, recursive calls have extremely large times (because the profiler double counts when the method calls itself). One easy way to see this problem is that if a method is shown as taking more time than the Main method, it is very likely recursive, and causing this problem.
 Below the method data, allocation data is shown. This shows how much memory each method allocates. The number beside the method is the total amount of memory. Below that, it is broken down into types. Then, the caller data is given. This data is again useful when you want to figure out how to eliminate calls.
 You might want to keep a close eye on the memory consumption and on the method invocation counts. A lot of the performance gains in MCS for example came from reducing its memory usage, as opposed to changes in the execution path.

Heap Profiling
--------------

Performance in Mono-based applications often is linked to memory usage patterns. To better understand the memory allocation patterns of your application, you should use the [HeapShot](/docs/debug+profile/profile/heapshot/) memory profiler.

HeapShot includes both visual and command line tools to explore the memory allocation patterns and live objects in an application over time and helps developers pin point memory consumption and.

See the separate page on [HeapShot](/docs/debug+profile/profile/heapshot/) for details on using the HeapShot memory profiler for Mono.

### Other Mono profilers

Mono also has an interface to write your own profiling tools and explore different areas, see the next session for details.

``` bash
 $ mono --profile program.exe
```

The above will instruct Mono to instrument your application for profiling. The default Mono profiler will record the time spent on a routine, the number of times the routine is called, the memory consumed by each method broken down by invoker, and the total amount of memory consumed.

It does this by asking the JIT to insert a call to the profiler every time a method is entered or left. The profiler times the amount of time elapsed between the beginning and the end of the call. The profiler is also notified of allocations.

There are a few other profilers authored by different people to look into programs from other angles:

-   Lluis Sanchez [Heap Shot](/docs/debug+profile/profile/heapshot/) profiler, for exploring memory usage in an application.
-   Jon Trowbridge Heap Allocation profiler: [https://github.com/mono/heap-buddy](https://github.com/mono/heap-buddy)
-   Nemerle's profiler [here](https://github.com/rsdn/nemerle/tree/master/misc/profiler)
-   AOT profiler: mono-profiler-aot

These profilers can be used by passing the following command line option to Mono:

    mono --profile=profilername

See the manual page for further details.

Some profilers in Mono have problems with applications that unload the application domains (because some of the resources they use to report the data are unloaded).

Use the MONO_NO_UNLOAD=1 environment variable to make those work.

Profiling without JIT instrumentation
-------------------------------------

You might also be interested in using mono --aot to generate precompiled code, and then use a system like \`oprofile' to profile your programs. We are also working [OprofileWithAnonJitData](/archived/oprofilewithanonjitdata "OprofileWithAnonJitData")

Memory Management in the .NET/Mono world
========================================

Since Mono and .NET offer automatic garbage collection, the programmer is freed from having to track and dispose the objects it consumes (except for IDispose-like classes). This is a great productivity gain, but if you create thousands of objects, that will make the garbage collector do more work, and it might slow down your application.
 Remember, each time you allocate an object, the GC is forced to find space for the object. Each object has an 8 byte overhead (4 to tell what type it is, then 4 for a sync block). If the GC finds that it is running out of room, it will scan every object for pointers, looking for unreferenced objects. If you allocate extra objects, the GC then must take the effort to free the objects.
 Mono uses the Boehm GC, which is a conservative collector, and this might lead to some memory fragmentation and unlike generational GC systems, it has to scan the entire allocated memory pool.

Boxing
------

The .NET framework provides a rich hierarchy of object types. Each object not only has value information, but also type information associated with it. This type information makes many types of programs easier to write. It also has a cost associated with it. The type information takes up space.
 In order to reduce the cost of type information, almost every Object Oriented language has the concept of \`primitives'. They usually map to types such as integers and booleans. These types do not have any type information associated with them.
 However, the language also must be able to treat primitives as first class datums -- in the class with objects. Languages handle this issue in different ways. Some choose to make a special class for each primitive, and force the user to do an operation such as:

``` shell
 // This is Java list.add (new Integer (1)); System.out.println (list.get (1).intValue ());
```

 The C# design team was not satisfied with this type of construct. They added a notion of \`boxing' to the language.
 Boxing performs the same thing as Java's `new Integer (1)`. The user is not forced to write the extra code. However, behind the scenes the *same thing* is being done by the runtime. Each time a primitive is cast to an object, a new object is allocated.
 You must be careful when casting a primitive to an object. Note that because it is an implicit conversion, you will not see it in your code. For example, boxing is happening here:

``` shell
 ArrayList foo = new ArrayList (); foo.Add (1);
```

 In high performance code, this operation can be very costly.

Strings
-------

You should look out for code that does "string arithmetic" as this tends to create many intermediate strings. In most programs we have seen on the wild string arithmetic has been a major source of unnecessary memory allocations. Eliminating these has historically improved performance and reduced memory consumption significantly.

These are observed with the "--profile=default:alloc" profiler.

Although the compiler will try to reduce the number of strings created durng string "building" you might want to consider a few appproaches:

-   Use the [StringBuilder](http://docs.go-mono.com/index.aspx?link=T:System.Text.StringBuilder) class as this class will minimize the number of temporary strings created.
-   If you are writing data out, you might consider just calling Write multiple times, or if this is a bottleneck, use [String.Format](http://docs.go-mono.com/index.aspx?link=M:System.String.Format).

Also, try to move string arithmetic out of loops as the compiler and JIT engine might not be able to move this code out.

Assisting the Garbage Collector
-------------------------------

Although the Garbage Collector will do the right thing in terms of releasing and finalizing objects on time, you can assist the garbage collector by clearing the fields that points to objects. This means that some objects might be eligible for collection earlier than they would, this can help reduce the memory consumption and reduce the work that the GC has to do.

Understanding Memory Usage
--------------------------

Sizes are not what ps makes them look like.

(Taken from: [Understanding Memory Management in GNOME](http://mail.gnome.org/archives/gnome-list/1999-September/msg00036.html)):

People usually look at the memory sizes for the processes and misinterpret the information. This is a common mistake.

When talking about memory usage and the reports you get from the operating system, you need to keep in mind the following terms and what they mean:

**SIZE** This is the address space seen by the process. If the process maps 65 megs of memory, the address space of the process will be reported as 65 megs of memory.

Even if only 100k of memory are actually used.

This bit of information is not usually very useful and this is what most people believe is the actual memory usage of a program: it is not.

**RSS** This is the "Resident Set Size". This is the amount of memory actually resident on memory. This is a better computation of what is actually loaded in memory.

This does not include any piece of code that have been "swapped out".

So, for example, if you have a program that uses 100k of memory and the operating system discards or swaps 40k of memory, the RSS will be 60k.

The RSS includes both the memory which is unique to this process and the memory shared with other processes. In most modern Unix systems, a large part of this accounts for the memory used by shared libraries. So it usually includes the amount of memory that is used by other processes for the code that is shared: The libc is usually taken into account.

GNOME for example uses many shared libraries (this makes the applications share more memory).

**SHARE** This is the amount of memory from the RSS that is shared with other applications.

So, the actual memory used uniquely by an application is RSS - SHARE. If two programs use library "A", then the process would also be "responsible" for A/2 of the memory, but there are many variations (which pieces of the library each program uses) that make this computation hard.

A good approximation is thus "RSS - SHARE".

Other problems
==============

Common problems with `foreach`
------------------------------

The `foreach` C# statement handles various kinds of different constructs (about seven different code patterns are generated). Typically foreach generates more efficient code than loops constructed manually, and also ensures that objects which implement IDispose are properly released.

But foreach sometimes might generate code that under stress performs badly. Foreach performs badly when its used in tight loops, and its use leads to the creation of many enumerators. Although technically obtaining an enumerator for some objects like ArrayList is more efficient than using the ArrayList indexer, the pressure introduced due to the extra memory requirements and the demands on the garbage collector make it more inefficient.

There is no straight-forward rule on when to use foreach, and when to use a manual loop. The best thing to do is to always use foreach, and only when profile shows a problem, replace foreach with for loops.

