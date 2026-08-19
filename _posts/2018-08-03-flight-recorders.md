---
layout: blog
title: Houston, We’ve Had a Problem Here
author: Alexander Kyte
tags: [logging]
---

## Houston, We’ve Had a Problem Here ##

### Bringing Flight Recorders to Mono ###

There are few things as rewarding as printf-debugging a difficult problem.
Sometimes though, they’re not an appropriate solution. A bug that only 
reproduces after hours of use can lead to tens of gigabytes of logging files in
the worst case. Or, even worse, you might have a Heisenbug. When you try to 
print the variables involved in your bug, the IO involved prevents the race 
from happening entirely. Left with no good way to debug the main problem, 
you’re forced to read the code really carefully and put checks outside of 
critical regions to check when the bug has happened. 

### Prototyping a Solution ###

This type of problem is very often complained about with respect to the mono
debugger. It can be hard to isolate whether a mono bug, a C# application bug,
or debugger misuse was the cause of a failure. People find themselves trying 
to understand what mono’s view of the world is, based on the output they see
in their debuggers. Submitting a bug is hard work, as is arguing that the
error is not between the keyboard and the chair. 

It was this that motivated the creation of the debugger flight recorder. 
A flight recorder, in software engineering, is a system that stores log messages
without added latency and can print out the last hundred retained messages
or so. The main use of it is to avoid filling up your disk, slowing down your
application, or paying other costs associated with logging incredibly 
verbosely around a problem. 

The debugger’s existing logging was extracted into a number of functions that 
created a global state machine for the debugger. These transitions were logged
into the ring buffer of the flight recorder. While being rather mundane, it 
proved useful for catching bugs that otherwise had to be debugged through speculation
and crash reports.

### Generalized Logging with the Flight Recorder ###

Shortly later, we decided to bring the flight recorder mechanism into the big
leagues. We were going to replace all of our logging with it, when it was 
enabled. This was not trivial. While taking a global lock every time you log is
very slow, lockless ring buffers were somehow slower. Something had to change.
I was inspired by research that suggested that a dedicated thread with a message 
inbox was more scalable than lockless compare-and-set data structures 
(ffwd by S. Roghanchi - 2017). 

Leveraging existing lockless message queues and threading primitives, and 
patterns from our profiler, I created a very simple message-passing system.
This message passing system was given some callbacks that would make a thread 
to serve as a global flight recorder. All other threads dump their logs in a 
wait-free manner into the queue, and the ring buffer drains the queue. 
In short, a thread now owns the responsibility of managing all the logs.
It scales incredibly well, and does not appear to interfere with race 
conditions reproducing. 

### Impact on You ###

To use the flight recorder in your application today, export 
`MONO_LOG_DEST=flight-recorder` and you will see the last few hundred 
logged messages on crash or on shutdown. It’s really rather exciting, 
to have an application-level view of all of the steps that one would 
usually have to mentally trace while debugging. It’s freeing to no
longer choose between logging and performance, between verbosity 
and bug reproduction.







