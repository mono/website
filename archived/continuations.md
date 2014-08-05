---
title: "Continuations"
lastmodified: '2009-04-16'
redirect_from:
  - /Continuations/
---

Continuations
=============

Starting with Mono 2.6 the Mono runtime supports a continuation framework that allows for a number of high-level abstractions like co-routines and cooperative multi-threading to be implemented on top of it.

The API is contained in the Mono.Tasklets assemblies, and it is the Mono-team supported mechanism for doing continuations, microthreading and coroutines in the ISO CLI. It is based on [Tomi Valkeinen's excellent work on co-routines](http://www.bat.org/~tomba/) for Mono.

Unlike the work that we typically do in Mono which is pure C\# and will work out of the box in .NET (even our Mono.SIMD code will work on .NET, it will just run a lot slower) Mono.Tasklets requires changes to the VM that are not portable to other ISO CLI implementations.

An introduction that describes various frameworks and the evolution of the Mono.Tasklet.Continuation framework is available in the [announcement post](http://tirania.org/blog/archive/2009/Apr-09.html) in Miguel's blog. That post also discusses some scenarios where continuations and co-routines are useful.

The API
=======

The Mono.Tasklet.Continuation is based on Tomi's Microthreading library, but it only provides the core primitive: the continuation. None of the high-level features from Tomi's library are included.

This is the API:

``` csharp
     public class Continuation {
          public Continuation ();
          public void Mark ();
          public int Store (int state);
          public void Restore (int state);
     }
```

When you call Store the current state of execution is recorded and it is possible to go back to this state by invoking Restore. The caller to Store tells whether it is the initial store or a restore point based on the result from Store:

``` csharp
     var c = new Continuation ();
     ...
 
     switch (c.Store (0)){
     case 0:
          // First invocation
     case 1:
          // Restored from the point ahead.
     }
     ...
     // Jump back to the switch statement.
     c.Restore (1);
```

Tomi implemented a Microthreading library on top of this abstraction, this library has been [ported to Mono.Tasklets.Continuation](http://tirania.org/tmp/monoco-tasklets.tar.gz).

