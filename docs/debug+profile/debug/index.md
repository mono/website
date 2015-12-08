---
title: Debugging
redirect_from:
  - /Debugging/
  - /Debuggers/
  - /GDB/
---

Debugging a problem in an application is like solving a puzzle. There are certain tools that can help you solve the puzzle. This page documents some of the strategies, tools and tricks that you can use in solving these puzzles.

You can find bugs by using a debugger: setting breakpoints, running the code line-by-line, examining variables, changing its state, exploring what other threads are doing, and see what the call stacks for each routines are. See the sections [Debugging with GDB](/docs/debug+profile/debug/#debugging-with-gdb) and [Debugging with LLDB](/docs/debug+profile/debug/#debugging-with-lldb) for more information on this.

You can also debug an application by looking at stack traces. These are typically the result of an exception being thrown, or are the result of the code containing explicit calls to `Console.WriteLine(Environment.StackTrace)`. This helps you understand what the call frames were at the point of the stack traces and you can use this to understand what could have lead to the particular state that you are exploring (the crash, the exception, the report).

Debuggers and stack traces are not enough, sometimes you want to see what is happening as the application runs, "trace" its execution and look at parameters and return values that are being passed around. See the [Tracing Programing Execution](/docs/debug+profile/debug/#tracing-program-execution) section for details on this technique.

Another diagnostics mechanism is exploring which exceptions are being thrown (you might be accidentally capturing exceptions that should be propagated, or your program might be performing suboptimally). See the section on [Exceptions](/docs/debug+profile/debug/#exceptions) to understand how to see these.

Debugging information
---------------------

To debug applications or obtain line number information in stack traces, it is necessary to compile your programs with debugging information. This is achieved using the -debug command line option to the C# compiler. In Mono 1.0.x this embeds the debugging information in the resulting assembly, in Mono 1.1.x a separate file with the extension .mdb is produced.

To get stack traces with line number information, you need to run your program like this:

    mono --debug program.exe

Notice that the program will need to be compiled with the -debug flag and that running with --debug will slow down the execution.

Debugging with GDB
------------------

Until the Mono Debugger is ready for production, GDB can be used to obtain some information about your application and debug some problems. This section covers the details on debugging your Mono application with GDB.

First and foremost, Mono support libraries use a couple of signals internally that confuse gdb, to work around this, put this in your .gdbinit file (in your \$HOME path):

    handle SIGXCPU SIG33 SIG35 SIGPWR nostop noprint

If you use GDB to debug your mono process, you can use the function `mono_print_method_from_ip` (which takes an address) to obtain the name of a method given an address. This is particularly useful when examining stack traces. The function was renamed to `mono_pmip` in the Mono 1.1.x serie s (For a while the function was called `mono_print_method_from_ip`).

For example, when faced with a stack trace, like this:

    (gdb) where
    #0  ves_icall_System_String_GetHashCode (me=0x80795d0) at string-icalls.c:861
    #1  0x0817f490 in ?? ()
    #2  0x0817f42a in ?? ()
    #3  0x0817f266 in ?? ()
    #4  0x0817f1a5 in ?? ()

You can find out what methods are at each address using the mono_print_method_from_ip function (or mono_pmip if you are using Mono 1.1.x):

    (gdb) p mono_pmip (0x0817f490)
    IP 0x817f490 at offset 0x28 of method (wrapper managed-to-native) System.String:GetHashCode () (0x817f468 0x817f4a4)
    $1 = void
    (gdb) p mono_pmip (0x0817f42a)
    IP 0x817f42a at offset 0x52 of method System.Collections.Hashtable:GetHash (object) (0x817f3d8 0x817f43b)
    $2 = void

Sometimes you will want to produce a complete dump of all the managed names from within gdb, this can be achived with a gdb macro, put this in your .gdbinit file in your HOME directory:

    define mono_backtrace
     select-frame 0
     set $i = 0
     while ($i < $arg0)
       set $foo = (char*) mono_pmip ($pc)
       if ($foo)
         printf "#%d %p in %s\n", $i, $pc, $foo
       else
         frame
       end
       up-silently
       set $i = $i + 1
     end
    end

Then you can issue the "mono_backtrace 15" from the gdb prompt to obtain a trace of the last 15 frames.

If you use P/Invoke often, it is often helpful to set a breakpoint in an unmanaged function and then print a managed stack trace. Starting with 1.1.13.4, you can add the following gdb macro to your .gdbinit file. (Note, this has only been tested on x86):

    define mono_stack
     set $mono_thread = mono_thread_current ()
     if ($mono_thread == 0x00)
       printf "No mono thread associated with this thread\n"
     else
       set $ucp = malloc (sizeof (ucontext_t))
       call (void) getcontext ($ucp)
       call (void) mono_print_thread_dump ($ucp)
       call (void) free ($ucp)
     end
    end

Using "mono_stack" from gdb will print a managed stack trace *to the program's stdout*. It will not print out in your gdb console! You can also use "thread apply all mono_stack" to print stacks for all threads.

Output will look something like this:

    Breakpoint 1, g_mime_init (flags=0) at gmime.c:49
    49              if (initialized++)
    (gdb) mono_stack

    "" tid=0x0xb7d1c6c0 this=0x0x21e40:
    in (wrapper managed-to-native) GMime.Global:g_mime_init (int) <0x4>
    in (wrapper managed-to-native) GMime.Global:g_mime_init (int) <0xffffffe9>
    in GMime.Global:Init () <0x9>
    in Beagle.Filters.FilterMail:DoOpen (System.IO.FileInfo) (at /home/joe/cvs/beagle/Filters/FilterMail.cs:60)
    [...]
    in ExtractContentTool:Display (Beagle.Indexable) (at /home/joe/cvs/beagle/beagled/ExtractContent.cs:76)
    in ExtractContentTool:Main (string[]) (at /home/joe/cvs/beagle/beagled/ExtractContent.cs:233)
    in (wrapper runtime-invoke) System.Object:runtime_invoke_int_string[] (object,intptr,intptr,intptr) <0x50730316>

In versions after Mono 1.1.18, a few new functions are available to assist in debugging applications from within GDB.

``` c
void mono_object_describe        (MonoObject *obj);
void mono_object_describe_fields (MonoObject *obj);
void mono_value_describe_fields  (MonoClass* klass, const char* addr);
void mono_class_describe_statics (MonoClass* klass);
void mono_debug_print_vars       (gpointer ip, gboolean only_arguments);
```

Use `mono_object_describe` to get a small description of the object obj.

Use `mono_object_describe_fields` to get a small description of all the fields on the given object.

Use `mono_value_describe_fields` to prints to stdout a small description of each field of the value type stored at @addr of type @klass.

Use `mono_class_describe_statics` to prints to stdout a small description of each static field of the type @klass in the current application domain.

Use `mono_debug_print_vars` to prints to stdout the information about the local variables in a method (if @only_arguments is false) or about the arguments.

The information includes the storage info (where the variable lives, in a register or in memory). The method is found by looking up what method has been emitted at the instruction address @ip.

Here is an example session:

    gdb mono
    [...]
    (gdb) run --debug --break 'System.Buffer:BlockCopy' tests/console.exe
    We can now write to the console
    Program received signal SIGTRAP, Trace/breakpoint trap.
    [Switching to Thread -1210435904 (LWP 634)]
    0xb7a2b97f in ?? ()
    (gdb) call mono_pmip ($eip)
    $1 = 0x8279750 " System.Buffer:BlockCopy (System.Array,int,System.Array,int,int) + 0x17 (0xb7a04968 0xb7a04b93) [0x21f00 - console.exe]"
    (gdb) call mono_debug_print_vars ($eip, 1)
    Arg src (0) in memory: base register %ebp + 8
    Arg srcOffset (1) in memory: base register %ebp + 12
    Arg dest (2) in register %ebx
    Arg destOffset (3) in register %esi
    Arg count (4) in register %edi
    (gdb) call mono_object_describe (*(char**)($ebp+8))
    System.Char[] at 0x43e58, rank: 1, length: 1
    (gdb) call mono_object_describe ($ebx)
    System.Char[] at 0x55000, rank: 1, length: 1024

Debugging with LLDB
-------------------

You can use the following LLDB python script to get backtraces in lldb: [monobt.py]( https://github.com/mono/mono/blob/master/data/lldb/monobt.py)

Assuming the above script is saved in `~/Library/lldb/monobt.py`, you can load it automatically in every lldb session by putting the following into .lldbinit (in your \$HOME directory):

    command script import ~/Library/lldb/monobt.py

Once the script is loaded, you can type `monobt` to get a backtrace of the currently selected thread with managed frames symbolicated.

Debugging With Visual Studio on Windows
---------------------------------------

Most of the techniques that you can use in GDB can also be used on Windows using the Visual Studio debugger. You can use the Immediate Window to enter your commands. if the gdb command is:

    p mono_pmip(0xdeadbeef)

the equivalent command for the immediate window is the same without the p, and explictely casting the argument to a void\*

    mono_pmip((void*)0xdeadbeef)

When mono was loaded from a dynamic library, and the above command doesn't work, you can tell visual studio more explicitely where to find the function. Assuming mono was loaded from "mono.dll", the somewhat cryptic command is:

    {,,mono}mono_pmip((void*)0xdeadbeef)

Debugging Managed Lock Deadlocks
--------------------------------

Managed locks (implemented in the Monitor class and usually invoked with the lock () construct in C#) are subject to the same incorrect uses of normal locks, though they can be safely taken recursively by the same thread.

One of the obviously incorrect way to use locks is to have multiple locks and acquire them in different orders in different codepaths. Here is an example:

``` csharp
using System;
using System.Threading;
 
class TestDeadlock {
 
    static object lockA = new object ();
    static object lockB = new object ();
 
 
    static void normal_order () {
        lock (lockA) {
             Console.WriteLine ("took lock A");
             // make the deadlock more likely
             Thread.Sleep (500);
             lock (lockB) {
                  Console.WriteLine ("took lock B");
             }
        }
    }
    static void reverse_order () {
        lock (lockB) {
             Console.WriteLine ("took lock B");
             // make the deadlock more likely
             Thread.Sleep (500);
             lock (lockA) {
                  Console.WriteLine ("took lock A");
             }
        }
    }
    static void Main () {
        TestDeadlock td = new TestDeadlock ();
        lock (td) {
            lock (td) { // twice for testing the nest level
                 Thread t1 = new Thread (
                       new ThreadStart (normal_order));
                 Thread t2 = new Thread (
                       new ThreadStart (reverse_order));
                 t1.Start ();
                 t2.Start ();
                 t1.Join ();
                 t2.Join ();
            }
       }
   }
}
```

There is an explicit Sleep () call to make the race condition happen almost every time you run such a program. The issue with such deadlocks is that usually the race time window is very small and it will go unnoticed during testing. The new feature in the mono runtime is designed to help find the issue when a process is stuck and we don't know why.

Now you can attach to the stuck process using gdb and issue the following command:

``` bash
(gdb) call mono_locks_dump (0)
```

which results in output like this:

``` bash
Lock 0x824f108 in object 0x2ffd8 held by thread 0xb7d496c0,
nest level: 2
Lock 0x824f150 in object 0x2ffe8 held by thread 0xb7356bb0,
nest level: 1
        Waiting on semaphore 0x40e: 1
Lock 0x824f1b0 in object 0x2ffe0 held by thread 0xb7255bb0,
nest level: 1
        Waiting on semaphore 0x40d: 1
Total locks (in 1 array(s)): 16, used: 8, on freelist: 8, to
recycle: 0
```

You can see that there are three locks currently held by three different threads. The first has been recursively acquired 2 times. The other two are more interesting because they each have a thread waiting on a semaphore associated with the lock structure: they must be the ones involved in the deadlock.

Once we know the threads that are deadlocking and the objects that hold the lock we might have a better idea of where exactly to look in the code for incorrect ordering of lock statements.

In this particular case it's pretty easy since the objects used for locking are static fields. The easy way to get the class is to notice that the object which is locked twice (0x2ffd8) is of the same class as the static fields:

``` bash
(gdb) call mono_object_describe (0x2ffd8)
TestDeadlock object at 0x2ffd8 (klass: 0x820922c)
```

Now we know the class (0x820922c) and we can get a list of the static fields and their values and correlate with the objects locked in the mono_locks_dump () list:

``` bash
(gdb) call mono_class_describe_statics (0x820922c)
At 0x26fd0 (ofs:  0) lockA: System.Object object at 0x2ffe8
(klass: 0x820beac)
At 0x26fd4 (ofs:  4) lockB: System.Object object at 0x2ffe0
(klass: 0x820beac)
```

Note that the lockA and lockB objects are the ones listed above as deadlocking.

Debugging Unmanaged Deadlocks
-----------------------------

If the deadlock you're experiencing is not caused by your code, it might be a Mono runtime issue. To find out, get some backtraces with these steps:

-   Get your application to deadlock.
-   Launch gdb from the command line.
-   Execute `attach <the-mono-process-id>` (to find the process, pursue `ps -A | grep mono`).
-   Execute `thread apply all bt`.

 The output you got with the last step is good to diagnose the problem or to attach to a bug.

Debugging Pinned Objects
------------------------

The Mono GC will conservatively scan part of the stacks of the threads to find if they reference objects that thus would need to be kept alive. Sometimes the stack, though, contains intergers or other data that look like a pointer to an object, but it isn't really used to hold a reference to managed memory. When using the SGen GC, to help debug those cases, you can call the function find_pinning_ref_from_thread(obj, obj_size) to check whether the object obj is being pinned from some thread locations. Make sure you have a mono debug build, as the linker could optimize away this function from production builds.

### Triggering the Debugger

From managed code, you can invoke the System.Diagnostics.Debugger.Break () method in your code to break execution and get to the GDB prompt.

From unmanaged code, you can use the G_BREAKPOINT() macro in your code.

Debugging with GDB in XDEBUG mode
---------------------------------

With mono 2.6 or later, it is now possible to ask the runtime to generate debugging information which can be used by gdb. This currently only works on amd64/x86/arm linux. To use it:

### For gdb 7.0

-   No setup is needed, gdb will automatically load the mono mode written in python, and the the runtime will register debugging information with gdb using the new JIT interface in gdb 7.0.

gdb is not designed to handle 1000s of symbol files (one per JITted method), so the runtime groups them into fewer symbol files. This can lead to debug info missing for recently JITted methods. Typing 'xdb' will flush the debug info collected by the runtime.

### For older gdb versions

-   Set the MONO_XDEBUG env variable to '1'.
-   Add the following to your .gdbinit:

<!-- -->

      define xdb
      shell rm -f xdb.so && as -o xdb.o xdb.s && ld -shared -o xdb.so xdb.o
      add-symbol-file xdb.so 0
      end

-   Run mono under gdb with --debug (if you want to run moon, just launch 'firefox -d gdb', or 'firefox -g -d gdb' in case you're using Firefox \> 3.5). Having .mdb files available helps a lot.
-   When the program is stopped, type 'xdb'. This will cause the runtime to generate the debugging info, and gdb to load it.

The output will now look like this:

    (gdb) bt
    #0  0x0000000040cd707e in Tests:pass_floats_doubles (a=100, b=101, c=102, d=103, e=104, f=105, g=106)
    #1  0x0000000040cd6fd8 in Tests:test_721_sparc_float_argument_passing ()
    #2  0x0000000040a6228a in (wrapper runtime-invoke) Tests:runtime_invoke_int (param0=0x0, param1=0x7fc05e5b0e00,
        param2=0x0, param3=0x40cd6f80)
    #3  0x00000000004219f7 in mono_jit_runtime_invoke (method=0x9daa70, obj=0x0, params=0x0, exc=0x0) at mini.c:4253
    #4  0x00000000005c1d2c in mono_runtime_invoke (method=0x9daa70, obj=0x0, params=0x0, exc=0x0) at object.c:2399
    #5  0x00000000005c39d7 in mono_runtime_invoke_array (method=0x9daa70, obj=0x0, params=0x0, exc=0x0) at object.c:3488
    #6  0x00000000005cdc31 in ves_icall_InternalInvoke (method=0x7fc05c371be0, this=0x0, params=0x0, exc=0x7fff66729368)
        at icall.c:3038
    #7  0x0000000040cd6bee in (wrapper managed-to-native) System.Reflection.MonoMethod:InternalInvoke (
        this=0x7fc05c371be0, param0=0x0, param1=0x0, param2=0x7fff66729368)
    #8  0x0000000040cd690c in System.Reflection.MonoMethod:Invoke (this=0x7fc05c371be0, obj=0x0, invokeAttr=0x0,
        binder=0x0, parameters=0x0, culture=0x0)
    #9  0x0000000040cd683b in System.Reflection.MethodBase:Invoke (this=0x7fc05c371be0, obj=0x0, parameters=0x0)
    #10 0x0000000040a6275c in TestDriver:RunTests (type=0x7fc05e5b6dc8, args=0x0)
    #11 0x0000000040a62380 in TestDriver:RunTests (type=0x7fc05e5b6dc8)
    #12 0x0000000040a62354 in Tests:Main ()
    #13 0x0000000040a6228a in (wrapper runtime-invoke) Tests:runtime_invoke_int (param0=0x0, param1=0x7fc05e5b0e00,
        param2=0x0, param3=0x40a62340)
    #14 0x00000000004219f7 in mono_jit_runtime_invoke (method=0x9576f0, obj=0x0, params=0x7fff66729600, exc=0x0)
        at mini.c:4253

The XDEBUG support in mono is modeled after the similar functionality in Kaffe.

Exceptions
----------

Sometimes try/catch sequences can hide underlying problems in your code, you might want to look at the exceptions produced by your program using Mono's trace facility, to use this, try:

``` bash
    mono --trace=N:nothing application.exe
```

That will display the exceptions that you program is throwing.

If you want to look into where those exceptions are being produced using gdb, you can use the following trick:

``` bash
(gdb) b mono_handle_exception_internal
```

This requires a Mono with symbols to be installed though. Then you can inspect various aspects of your program:

``` bash
#0  mono_handle_exception_internal (ctx=0xbfbc6d94, obj=0xac390, original_ip=0x454dcfc1, test_only=0, out_filter_idx=0x0)
(gdb) p mono_print_method_from_ip (0x454dcfc1)
IP 0x454dcfb5 at offset 0x75 of method Banshee.PlaylistView:RipCellInd (Gtk.TreeViewColumn,Gtk.CellRenderer,Gtk.TreeModel,Gtk.TreeIter) (0x454dcf40 0x454dd059)[domain 0x21f00 - banshee.exe]
(gdb)
```

Tracing Program Execution
-------------------------

Tracing allows developers to see when methods are entered/left as their application runs. This is enabled by passing the --trace command line argument to mono. The output can be quite verbose:

``` bash
 $ mono --trace program.exe
```

The default will output traces for all methods invoked in your application which can be a lot of data. It is possible to pass filter the routines that will be traced by passing options to the trace command line to limit its scope, for example:

``` bash
  $ mono --trace=N:MyApplication program.exe
```

The above example will limit the tracing to methods in the MyApplication namespace.

Or to trace multiple namespaces:

``` bash
  $ mono --trace=N:MyApplication,System.Math program.exe
```

The full options available are:

``` bash
Tracing options:
   --trace[=EXPR]        Trace every call, optional EXPR controls the scope
 
EXPR is composed of:
    all                  All assemblies
    none                 No assemblies
    program              Entry point assembly
    assembly             Specifies an assembly
    M:Type:Method        Specifies a method
    N:Namespace          Specifies a namespace
    T:Type               Specifies a type
    +EXPR                Includes expression
    -EXPR                Excludes expression
    disabled             Do not print any output until toggled via SIGUSR2
```

For example, to trace a namespace but ignore some types:

``` bash
   $ mono --trace=N:System,-T:System.Int32 program.exe
```

You can toggle the trace output by sending the SIGUSR2 signal to the mono process. And you might also want to start your application with the tracing output turned off until your application reaches the point that you are interested in debugging:

``` bash
  $ mono --trace=disabled program.exe
```

Then from another console, you can turn on the output:

``` bash
  $ kill -USR2 pid
```

Where \`pid' is the process ID of the Mono process that is being traced.

You can turn off the output by sending the USR2 signal again to the process.

Runtime Logging
---------------

You can ask the runtime to log various message to stdout using: MONO_LOG_LEVEL=debug

Using Valgrind on Mono
----------------------

Sometimes it might be useful to run Mono with Valgrind to track problems in the application. This is particularly helpful when debugging problems with P/Invoked libraries or bindings.

Historically Mono and Valgrind didn't always played well together. If this has discouraged you in the past then it's time to try it again!

Recent valgrind versions are able to deal with for self-modifying programs (which is what the mono JIT does) by using the --smc-check=all option.

As an extra bonus, Paolo (lupus) has shared his suppression file for Mono. This removes a lot, but not all, false positives (or unimportant) logs coming from the Mono runtime. This makes it easier and faster to find what you're looking for. The suppression file is available in Mono's git as /mono/data/mono.supp

Sample usage:

``` bash
sh$ valgrind --tool=memcheck -v --leak-check=full \
> --log-file=log --smc-check=all --suppressions=mono.supp \
>  mono app.exe
```

This will run the app.exe application using mono and create a log file named "log.####" (where #### is the process id). The log file will indicates what leaked (and from where), what was (badly) reused after being freed

### libgdiplus

[Cairo](http://www.cairographics.org/) supplies it's own suppression file that is useful to add if your application depends on System.Drawing (or System.Windows.Forms).

The file is located under `libgdiplus/cairo/test/.valgrind-suppressions` and can be used simultaneously with the one provided for Mono.

``` bash
sh$ valgrind --tool=memcheck -v --leak-check=full \
> --log-file=log --smc-check=all --suppressions=mono.supp \
> --suppressions=libgdiplus/cairo/test/.valgrind-suppressions \
>  mono app.exe
```

