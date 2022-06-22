---
title: "Article:ThreadPool Deadlocks"
lastmodified: '2010-12-11'
redirect_from:
  - /Article%3AThreadPool_Deadlocks/
  - /ThreadPool_DeadLocks/
---

Article:ThreadPool Deadlocks
============================

 **This information only applies to Mono \<=2.6.x**

Mono \>=2.8.x has a new threadpool that is much, much harder to deadlock. If you get a threadpool deadlock chances are that your program is trying to be deadlocked.

The Problem
===========

A common problem in .NET applications that is exacerbated in Mono is a deadlock in the [http:/monodoc/T:System.Threading.ThreadPool ThreadPool]. This deadlock in the threadpool is usually manifested by requests timing out (in particular Http requests, but this might happen pretty much anywhere).

The source of the problem is the [http:/monodoc/T:System.Threading.ThreadPool ThreadPool]. The ThreadPool is a mechanism in the .NET Framework to minimize thrashing due to excesive number of concurrent threads. This is done by exposing an API that allows programmers to queue tasks on the ThreadPool that has a cap on the number of running threads. The tasks are dispatched to the threads until the cap is reached, any remaining tasks are placed on a queue and they wait for a thread from the pool to become available.

The [http:/monodoc/T:System.Threading.ThreadPool ThreadPool] is used today by:

-   Automatically by any asynchronous delegate invocation (The BeginInvoke/EndInvoke pattern on a delegate).

-   Internally by the class libraries ([http:/monodoc/T:System.Net.HttpWebRequest HttpWebRequest] being one of its major users).

-   Support programs (for example XSP uses the [http:/monodoc/T:System.Threading.ThreadPool ThreadPool] to dispatch incoming requests).

-   The end-user.

A thread does not necessarily have to be executing. The thread can be blocking waiting for I/O to complete, it could be pausing or waiting for a lock to be released. And although it is not actively running, the slot in the threadpool has been taken.

The above conditions can lead to a scenario when one of the four users listed above fills up the ThreadPool and is trying to use other services that also require the [http:/monodoc/T:System.Threading.ThreadPool ThreadPool], a few scenarios could be:

-   The end user queues all of his work items on the [http:/monodoc/T:System.Threading.ThreadPool ThreadPool], but the worker code calls into a piece of the class libraries that requires the use of the ThreadPool.

-   [XSP](/ASP.NET) uses the [http:/monodoc/T:System.Threading.ThreadPool ThreadPool] to queue requests to handle ASP.NET web requests, and the underlying code internally uses HttpWebRequest, or needs to use the [http:/monodoc/T:System.Threading.ThreadPool ThreadPool].

In the above scenarios the [http:/monodoc/T:System.Threading.ThreadPool ThreadPool] could be be filled up and when one of the workers attempts to get some work done that requires the ThreadPool the system will deadlock.

Typically users of [http:/monodoc/T:System.Net.HttpWebRequest HttpWebRequest] will get a timeout as [http:/monodoc/T:System.Net.HttpWebRequest HttpWebRequest] eventually will timeout on the socket connection, so the behavior observed is that requests start to fail with misterious timeouts happening.

The Solution
============

Currently the Mono team is working on various long-term solutions to the problem, but in the meantime a quick solution is to increase the number of active threads in the ThreadPool, effectively defeating part of the reason for the ThreadPool's own existance, you can do this by using the MONO_THREADS_PER_CPU environment variable, the default being 1:

``` bash
export MONO_THREADS_PER_CPU=50
```

If you are using Mono from [Apache](http://www.apache.org/) to run ASP.NET, you can use the MonoSetEnv configuration option in Apache:

    MonoSetEnv MONO_THREADS_PER_CPU=2000

For ASP.NET applications it's also a good idea to tweak the default values found in machine.config, inside \<system.web\> section:

``` xml
    <httpRuntime executionTimeout="90"
           maxRequestLength="4096"
           useFullyQualifiedRedirectUrl="false"
               minFreeThreads="8"
           minLocalRequestFreeThreads="4"
           appRequestQueueLimit="100" />
```

Consider changing *minFreeThreads* which is the amount of threads from the threadpool that ASP.NET will not use.

Long Term Solutions
===================

We are currently working on various fronts to avoid these scenarios and allow developers to use the [http:/monodoc/T:System.Threading.ThreadPool ThreadPool] completely for themselves.

These include:

-   Using a separate [http:/monodoc/T:System.Threading.ThreadPool ThreadPool] for the largest consumers of the [http:/monodoc/T:System.Threading.ThreadPool ThreadPool] in our class libraries.**UPDATE:** Implemented as of 2005-04-15.

-   Having [XSP](/ASP.NET) use its own thread pool management to benefit ASP.NET-based applications.

-   Using a single thread to process most of the asynchronous I/O. **UPDATE:** Implemented as of 2005-04-15.

-   Use the aio\* interfaces whenever available (not always easy or possible). **UPDATE:** Implemented as of 2005-04-15.
