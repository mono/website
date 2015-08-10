# Runtime Cooperative Suspend

## Intro

The runtime needs to be able to suspend threads to perform all sorts of tasks, the main one been garbage collection.
Those threads need to be suspended from another and historically mono used signals (or similar APIs) to do it.

The problem of using signals is that threads are suspended at arbitrary points in time, which requires the suspender
thread to run in the equivalent of signal context - a very very restrictive setup. Not only that, but the fact that
threads could be suspended while holding runtime and libc locks meant that not even basic things like printf were available.

The technical challenge of dealign with signal context makes this model unsustainable, plus the fact that it's not
easy to port.

The alternative is to use cooperative suspend, where threads suspend themselves when the runtime request it. To make
this possible, frequent polling and checkpointing are required. This is a well understood model that goes along what
the industry does.

## How cooperative suspend works

Cooperative suspend limits what a suspender thread can do to simply request that the target thread suspends itself.
The target thread can serve a suspend in two manners, by frequently polling its state and checkpointing its state
at points the runtime loses control of the thread (pinvoke, blocking syscall).

We can split code in 3 categories: managed, runtime native code and foreigh native code. This tells how coop suspend happens. 

### Managed code

Managed code will check for suspend requests on function prologue, catch handlers and the back-edge of loops. This ensures that
a suspend will be served in a bounded amount of time. Those suspend checks are done at what's refered as safepoints.

This is implemented in mini.c:mono_insert_safepoints. It will add OP_GC_SAFE_POINT ops around the method.
Then each backend will emit machine code for those new ops.

### foreigh native code

This includes pinvokes and arbitrary native code when the runtime is embedded. Foreigh code doesn't touch managed objects
so it's safe for the GC to ignore both the stack and the code been executed by those.

Before executing a pinvoke, we save the current thread registers and transition it to the equivalent of the suspended state.
It means the GC can take the saved state as is and ignore that the thread keeps running.

### runtime native code

This encompass all runtime code, metatada, utils and mini. Special care must be taken to icalls.
Runtime code is different as it operates on raw object pointers, meaning that the GC must be aware of them.
To do so we handle runtime code just as managed code, except we don't get safepoints automatically inserted for us.

Manual insertion of polling code and checkpointing must be done in the runtime. In addition to that, we must be careful
of how we access managed memory once we save the thread state.

## Current Implementation

The current implementation is a state machine that tells what's the current status of a thread. Those are the
states:

* Starting: Initial state of a thread, nothing interesting should happens while in this state
* Running: Running managed or runtime code
* Detached: Thread is shuting down, it won't touch managed memory or do any runtime work
* AsyncSuspended: Thread was async suspended, so it's on a signal handler or thread_suspend was called on it. (This state never happens on coop)
* SelfSuspended: Thread suspended by itself
* AsyncSuspendRequested: Another thread requested that the current thread be suspended
* SelfSuspendRequested: The current thread requested itself to self suspend (this exists due to race conditions and deadlocks in threads.c)
* Blocking: The current thread is executing code that won't touch managed memory, so it can be assumed to be suspended
* Blocking and Suspended: The current thread finished executing blocking code but there was a pending suspend against it, it's waiting to be resumed

In addition to those states, there are a number of transitions, that are used to move a thread from one state to another.

## mono-threads.c, mono-threads-coop.c, mono-threads-state-machine.c

Thread suspension is modeled with a state machine, which means there are a bunch o transitions. Those
are implemented in mono-threads-state-machine.c. One function per transition. All manipulation of the thread_state variable happens
here. New functions must follow the same template of the existing ones and must include every state either on the switch or on the comments.

mono-threads.c is the portable implementation of the threading infrastructure. For it then there are multiple backends that implement target
specific functionality. The amount of ifdefs here should be kept at a minimum.

mono-threads-coop.c is the cooperative backend. It doesn't use any async APIs provided by the OS.

## Adding coop to the runtime

The best way to understand how to enable coop in the runtime is by spliting it in 2 mode. Cooperative and Preemptive.

In cooperative mode, the thread is usually in the runnable state and code must explicitly take action to left it suspend.
Poking at managed state is ok. Calling into unknown code or doing blocking syscalls is a no-no-no.

In preeptive mode, the thread is usually in the blocking state and code doesn't need to do anything to help the GC.
Modifying the managed heap is mostly forbidden, as is learning new pointers. Calling into unknonwn code or blocking is ok.

The runtime itself consumes the macros in mono-threads-coop.h.
Those macros define a series of transitions that happens in the runtime. They are:

### MONO_SUSPEND_CHECK

This polls the current GC state and possibly suspend the thread.
Ok only under cooperative mode.

Use it when a huge computation is happening with no explicit blocking happening.

### MONO_PREPARE_BLOCKING / MONO_FINISH_BLOCKING

Creates a C lexical scope. It causes a transition from cooperative to preemptive mode.
Ok only under cooperative mode.

Great around a syscall that can block for a while (sockets, io).
Managed pointers can leak into the preemptive region. For example:
```c
MonoArray *x;
int res;
MONO_PREPARE_BLOCKING
res = read (1, mono_array_addr (x, char, 0), mono_array_length (x), 0);
MONO_FINISH_BLOCKING
```

### MONO_PREPARE_RESET_BLOCKING / MONO_FINISH_RESET_BLOCKING

Creates a C lexical scope. It causes a transition to cooperative mode. Resets to the previous mode on exit.
Ok under both modes.

This covers the case where code was expected to be in preeptive mode but it now needs to be under cooperative.

For example, the first call to a pinvoke will hit a trampoline that needs to move the runtime back into cooperative
mode before going around resolving it. Once the pinvoke is resolved, the previous mode must be restored.

### MONO_TRY_BLOCKING / MONO_FINISH_TRY_BLOCKING

Creates a C lexical scope. It tries to transition the runtime to preeptive mode. Resets to the previous mode on exit.
Ok under both modes.

This coves the case where code must enter preemptive mode but it doesn't know if it is already under it. 
Great to use around locks, that might be used both modes.


## Debugging

There are two debug helpers in place. The first is the thread state dump when we fail to suspend in time.
It dumps the thread state of each thread plus a cue card on the beginning to help us parse it.

The second one are the toggles in mono-threads.h for specific logging of threading events. Those are VERY verbose
but do help figure out what's going on.


## Known issues

### Can't handle the embedding API
The current system doesn't take into account the runtime been used embedded. This boils down to a couple of issues.
First, if a native thread calls into managed then keep doing its thing. We might not be leaving the thread in the
appropriate state.
Second, the embedding API allows for raw object access, which is incompatible with coop. We need to figure out how to expose
coop to embedders.

### Thread start/finish still shit
There are a lot of hacks around how we handle threads starting and finishing. If a suspend hits a thread while it's
starting/finishing we fail every now and them.

### Non nested blocking state
An early decision that I made was to disallow nested blocking states. It was forbidden because it's more complicated and
could hide bugs in between the nesting. The downside is that it's hard to cover large blocks of code under a single blocking region.

### Thread attach/detach
This aspect of the runtime is due to some revision. I don't think it goes well with what we need now.

