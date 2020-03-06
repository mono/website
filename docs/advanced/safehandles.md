---
title: SafeHandles
redirect_from:
  - /SafeHandles/
---

This document describes the state of SafeHandles and CriticalFinalizerObject and their supporting requirements in the Mono Runtime.

Resources
=========

The following blog entries contain some important background on what SafeHandles are and what is their exposed behavior to programmers:

[Chris Brumme](https://devblogs.microsoft.com/cbrumme/finalization/)

[On implementing SafeHandles](https://docs.microsoft.com/en-us/archive/blogs/bclteam/safehandles-the-best-v2-0-feature-of-the-net-framework-ravi-krishnaswamy)

SafeHandle
==========

The runtime support currently has:

-   Support for passing SafeHandles on P/Invoke parameters (with AddRef/Release)
-   Support for passing SafeHandles on P/Invoke structures (no AddRef/Release yet).
-   Support for creating SafeHandles-derivatives on return values from P/Invoke.
-   Support for "ref SafeHandles" on P/Invoke parameters.
-   throwing ArgumentNullException if null SafeHandles are passed to unmanaged code.

Notice that "ref SafeHandles" pass a pointer to a slot containing zero to P/Invoked methods, and on return the a new SafeHandle is created with the returned value. "ref SafeHandles" do not actually get the original SafeHandle.handle value.

Current Limitations:

-   We need to ensure that a copy of the SafeHandle is always present before we P/Invoke, to ensure that the object is not collected.
-   None of the SafeHandle methods has been flagged with the proper ReliabilityContract attribute.
-   It currently does not throw a NotSupportedException if the handle is changed in a "ref structure" during P/Invoke. The change is ignored, but it should throw an exception.

Open Research Issues:

-   What happens is SafeHandle is null (parameters, fields)
-   SafeHandles in classes (not structures)

Notes on Limitations
--------------------

In one special case (SafeHandles in structures that are passed as parameters in P/Invoke functions) we are not calling AddRef/ReleaseRef because we would have to keep track of the original handle, but this data is currently not available in the release/cleanup code for marshalling.

What we would have to do is keep a local variable and pass the local variable around pointing to the original safehandle and during the destruction phase use this information (instead of the SafeHandle.Handle IntPtr that is in the marshalled structure, which is what the shutdown code has access to) to call Release.

A further complication is that the "ref release" argument that is typically used in the DangerousAddRef/Release pairs must also be passed around. An optimization could be to use a local variable that has a copy of the SafeHandle and set the slot to null if release is false (which currently in Mono is always false anyways).

If a ref struct contains a SafeHandle and the value of the handle is modified in a P/Invoke call, we should throw a NotSupportedException ("SafeHandles can not be created in unmanaged code").

The reason why we have to do this is that we need access to the original SafeHandle to compare the value (and this is the same reason that we currently do not AddRef/ReleaseRef on SafeHandles that are part of structs: we need to modify the marshal.c code to pass around the source handle to do these kind of operations).

A possible implementation strategy would be to use another pre-determined slot in marshal.c to keep track of all the SafeHandles that must be disposed, an ArrayList where we track all of the SafeHandles that must be validated or DangerousReleased.

CriticalFinalizerObject
=======================

Any classes derived from CriticalFinalizerObject must have their Finalizers handled specially. Two features are important: pre-JITing of all the methods in the derived class, and ensuring that the finalizers for all of the derived objects from CriticalFinalizerObject are executed even during AppDomain unloads.

Users of SafeHandles
====================

WaitHandle in the 2.0 profile uses SafeWaitHandles.

Currently WaitHandles are using a fairly heavy-weight synchronization object for the refcount (lock on an internal object). It might be useful to look into using the interlocked compare and exchange routines.

FileStream is still missing support for SafeFileHandle (decide whether to switch like WaitHandle did, or provide a simple wrapper).

