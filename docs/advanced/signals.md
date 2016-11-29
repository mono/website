---
title: Signals and third-party crash reporters
---

The Problem
===========

Mono uses signals on certain platforms to handle NullReferenceExceptions.

It's also becoming more and more common to add third-party libraries that
detect and report crashes.

The problem is when those third-party libraries install their own signal
handlers, overwriting Mono's signal handlers. When this happens, any
NullReferenceException would be detected by such libraries as a fatal SIGSEGV,
and the libraries would report it as a crash and terminate the process.

Incomplete solution
===================

The usual way to fix this problem has been to store/restore Mono's signal
handlers, using the following pattern:

``` csharp
IntPtr sigbus = Marshal.AllocHGlobal (512);
IntPtr sigsegv = Marshal.AllocHGlobal (512);

// Store Mono's SIGSEGV and SIGBUS handlers
sigaction (Signal.SIGBUS, IntPtr.Zero, sigbus);
sigaction (Signal.SIGSEGV, IntPtr.Zero, sigsegv);

// Enable crash reporting libraries
EnableCrashReporting ();

// Restore Mono SIGSEGV and SIGBUS handlers
sigaction (Signal.SIGBUS, sigbus, IntPtr.Zero);
sigaction (Signal.SIGSEGV, sigsegv, IntPtr.Zero);

Marshal.FreeHGlobal (sigbus);
Marshal.FreeHGlobal (sigsegv);
```

And now NullReferenceExceptions are correctly handled first by Mono.

But this approach does not let these third-party libraries handle _any_ crash,
because Mono will chain to the previous handler if it detects that a SIGSEGV
occurred in native code, and the existing signal handlers _when Mono installed
its signal handlers_ would be the default signal handlers for the platform.

Complete solution
=================

Starting with Mono 4.8 there are two methods that can be used to remove and
reinstall Mono's signal handlers:

``` csharp
Mono.Runtime.RemoveSignalHandlers ();
Mono.Runtime.InstallSignalHandlers ();
```

which are to be used like this:

``` csharp
try {
} finally {
    Mono.Runtime.RemoveSignalHandlers ();
    try {
        EnableCrashReporting ();
    } finally {
        Mono.Runtime.InstallSignalHandlers ();
    }
}
```

Since Mono's signal handlers are _reinstalled_ and not _restored_, Mono will
now chain to the signal handlers installed by `EnableCrashReporting`.

The code is executed in a `finally` block, so that the Mono runtime will never
abort it under any circumstance.

It's recommended to do this as early as possible when launching the process,
in particular before starting any secondary threads. If any signals are raised
between removing and reinstalling Mono's signal handlers (this includes
NullReferenceExceptions), the app will crash.
