---
layout: obsolete
title: "RuntimeHacking"
permalink: /old_site/RuntimeHacking/
redirect_from:
  - /RuntimeHacking/
---

RuntimeHacking
==============

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#Runtime_hacking_tips_and_tricks">1 Runtime hacking tips and tricks</a></li>
<li><a href="#Coding_style">2 Coding style</a></li>
<li><a href="#Testing_changes">3 Testing changes</a></li>
<li><a href="#Profiling_and_statistics">4 Profiling and statistics</a></li>
<li><a href="#Runtime_areas_and_their_maintainers">5 Runtime areas and their maintainers</a></li>
</ul></td>
</tr>
</tbody>
</table>

Runtime hacking tips and tricks
-------------------------------

Coding style
------------

Take the following examples as a reference of how the code should look like:

``` c
/*
 * Multiline comment documenting a function definition
 * Note that the return type is in its own line and braces
 * for the function are on their own line as well.
 * There must be a space after the function name and the opening parenthesis
 * both in the definition and when any function or macro is called.
 */
static MonoType*
get_mono_type_from_name (char *name)
{
        /* 
         * Always indent with TAB characters, never use spaces to indent code
         * Don't mix code and local declarations: older compilers don't support that.
         */
        MonoType *return_type;
 
        /*
         * Simple one-line conditional statements don't need braces
         */
        if (!name)
                g_assert_not_reached ();
 
        /*
         * More complex ones require braces even if only one of the cases
         * is complex. Note that else if and their condition must be on their
         * own line.
         */
        if (name [0] == 'a') {
                return handle_a_type (name);
        } else if (name [0] == 'b') {
                return handle_b_type (name);
        } else {
                if (strlen (name) > 1) {
                        /* case statements are not indented wrt switch */
                        switch (name [1]) {
                        case 'S':
                                return handle_s_name (name);
                        case 'C':
                        default:
                                return handle_long_name (name);
                        }
                } else {
                        return_type = handle_simple_name (name);
                }
        }
 
        /* 
         * never use parenthesis with return unless strictly necessary to
         * force precedence rules in complex expressions.
         */
        return return_type;
}
```

Testing changes
---------------

When you make a change to the runtime there are some basic tests that you should run before committing. These tests take just a couple of minutes so they should be run even after small changes.

     make rcheck in mono/mono/mini
     make test in mono/mono/tests
     make run-test in mcs/class/corlib

When doing more significant changes a full bootstrapping build must be completed (make clean;make in the toplevel mono directory) followed by a make check (which performs the above checks).

If possible do this in at least 2 architectures, especially in the cases that involve changing architecture-specific code or check that the buildbot doesn't report regressions after your changes (see [Mono buildbot](http://wrench.mono-project.com/builds)).

We should try to always add a test case for bugs we're fixing, either in the runtime tests or as a nunit test case.

Profiling and statistics
------------------------

While working on the runtime it's important to pay attention to performance issues and memory usage. There are a number of helper tools we can use to track data about this. For a number of important data structures used in the runtime we collect statistics: to get them simply execute your mono programs with:

     mono --stats program.exe

When working on the JIT, compile times are extremely important: we should try to improve the speed at which we compile code and never cause a slowdown. To be able to check compilation speed you can use a few sample assemblies like mscorlib.dll, System.dll, mcs.exe and JIT compile all the methods in them with:

     time mono --compile-all assembly.dll

checking the results of the time command.

When a performance issue becomes appaent given a benchmark or test program, the best tool to use is the mono internal statistical profiler. Use a high-frequency timer, like the Linux RTC at 1024 Hz and run your command as:

     echo 1024 > /proc/sys/dev/rtc/max-user-freq
     MONO_RTC=4096 mono --profiler=default:stat program.exe

Memory allocations in the runtime should be tracked too from time to time and special attention must be made to leaks and memory corruption issues. The best tool for this is to use valgrind with commands like:

     export G_DEBUG=gc-friendly
     export G_SLICE=always-malloc
     valgrind --show-reachable=yes --leak-check=full --leak-resolution=high \
       --error-limit=no --num-callers=8 --suppressions=~/svn/mono/data/mono.supp \
       mono program.exe

Runtime areas and their maintainers
-----------------------------------

Here is a list of each different chunk of code in the runtime with its respective maintainer or maintainers. Make sure you consult with the appropriate maintainer before making and especially committing changes to an area that you don't maintain directly (and try always to use the mailing list for communications, so we have a record of decisions and arguments and more people can partecipate and provide their feedback).

JIT:

-   Overall architecture and anything not explicitly listed: lupus, zoltan
-   x86/amd64 ports: lupus, zoltan
-   ppc/arm ports: lupus
-   sparc/itanium ports: zoltan
-   SSA framework and optimizations: massi
-   aliasing code: massi
-   trampolines: zoltan, lupus
-   local register allocator: zoltan, lupus
-   global register allocator: zoltan, lupus, massi
-   OSX support: lupus
-   solaris/windows support: zoltan
-   exception support: zoltan, lupus
-   genmdesc: lupus
-   security: lupus, sebastien
-   debug code: martin, lupus
-   instruction selector: lupus, zoltan
-   AOT support: zoltan, lupus
-   generics: lupus
-   profiling: lupus

Runtime:

-   Overall architecture and anything not explicitly listed: lupus, zoltan
-   Boehm GC: lupus, zoltan
-   GC interface: lupus
-   SGen GC: lupus
-   GC handles and finalizations: lupus, zoltan
-   Appdomain unload: zoltan, lupus
-   appdomain support: lupus, zoltan
-   metadata loader: lupus, zoltan
-   generics: harinath, lupus, martin
-   debug: martin, lupus
-   reflection: lupus, zoltan
-   reflection.emit: lupus, zoltan
-   dynamic methods: zoltan, lupus
-   verifier: rodrigo
-   marshal, p/invoke support: zoltan, lupus
-   COM support: jchambers
-   security: sebastien, lupus
-   locales: atsushi, lupus, jackson
-   file-io, socket, process: dick
-   console: jeff, dick
-   monitor/lock: lupus, dick
-   config file: lupus
-   profiler: lupus
-   profiler interface: lupus
-   threadpool: lupus
-   thread support: dick, lupus
-   JITInfo support: lupus, mark, zoltan
-   shared lib and module loading: lupus
-   virtual memory allocation: lupus
-   generated code memory handling: lupus, zoltan, mark
-   io-layer: dick


