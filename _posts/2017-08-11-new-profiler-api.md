---
layout: blog
title: "Mono's New Profiler API"
author: Alex Rønne Petersen
tags: [profiler, runtime]
---

As part of our on-going efforts to improve Mono's profiling infrastructure, in
Mono 5.6, we will be shipping an overhaul of Mono's profiler API. This is the
part of Mono's embedding API that deals with instrumenting managed programs for
the purpose of collecting data regarding allocations, CPU usage, code coverage,
and so on.

The old API had many limitations that were very hard, and in some cases
impossible, to work around. 

The biggest problem we faced was that we wanted the ability to reconfigure
profiling features at runtime. This was impossible in the old API because none
of the API functions took an argument representing the profiler whose options
should be changed. So you could only change options of the most recently
installed profiler, which wasn't guaranteed to be the one you wanted, and even
ignoring that problem, changing profiler options wasn't thread safe.

Why would we want to change profiling options at runtime, you might wonder?
Let's suppose you know that only a particular area of your program has
performance issues and you're only interested in data gathered while your
program is executing that code. You could turn off profiling features such as
allocations and statistical sampling until you get to that point, and then turn
them on programmatically. This can significantly reduce the noise caused by
unneeded data in a profiling session.

The new API has also paved the way for another new feature: Call context
introspection. This is a feature that allows a profiler to instrument the
prologue and/or epilogue of any method and gain access to arguments (including
the `this` reference), local variables, and the return value. This opens up
countless possibilities for instrumenting framework methods to learn how a
program is utilizing facilities like the thread pool, networking, reflection,
etc. It can also be useful for debugging, especially if dealing with assemblies
for which the source code is not available.

Another improvement we were able to make thanks to the redesigned API was to
use instrumented managed allocators when profiling. In the past, we would
disable managed allocators entirely when profiling. This would slow down
allocation-heavy programs significantly. Now, we insert a call back to the
profiler API at the end of managed allocators if profiling is enabled.

On top of these major features, the new API is also simply more pleasant to
use. In particular, you no longer have to worry about setting event flags; you
simply install a callback and you will get events. Also, you no longer have to
use callback installation functions which take multiple callback arguments.
Every kind of callback now has exactly one function to install it. This means
you will no longer have code such as
`mono_profiler_install_assembly (NULL, NULL, load_asm, NULL);` where it can be
unclear which argument corresponds to which callback. Finally, several unused,
deprecated, or superseded features and callbacks have been removed.

The new API completely replaces the old one, so this is a breaking change. We
try very hard to not break API/ABI compatibility in Mono's embedding API, but
after much consideration and evaluation of the alternatives, a breaking change
was deemed to be the most sensible way forward. To aid with the transition to
the new API, Mono will detect and refuse to load profiler modules still using
the old API. Developers who wish to support both the old and new APIs by
compiling separate versions of their profiler module may find the new
`MONO_PROFILER_API_VERSION` macro useful.

A presentation with more details is available in
[PowerPoint](https://dl.xamarin.com/uploads/rpi4dr14sjp/Mono_New_Profiler_API.pptx)
and
[PDF](https://dl.xamarin.com/uploads/jvbvew1yo5e/Mono's%20New%20Profiler%20API.pdf)
formats.
