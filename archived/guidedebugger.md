---
title: "Guide:Debugger"
lastmodified: '2014-03-12'
redirect_from:
  - /Guide:Debugger/
---

Guide:Debugger
==============

 DEPRECATED DEPRECATED DEPRECATED DEPRECATED DEPRECATED DEPRECATED DEPRECATED DEPRECATED DEPRECATED DEPRECATED DEPRECATED DEPRECATED DEPRECATED DEPRECATED DEPRECATED DEPRECATED DEPRECATED DEPRECATED DEPRECATED DEPRECATED DEPRECATED

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#deprecated">1 DEPRECATED</a></li>
<li><a href="#introduction">2 Introduction</a></li>
<li><a href="#using-the-hard-debugger-with-monodevelop">3 Using the Hard Debugger with MonoDevelop</a></li>
<li><a href="#using-the-command-line-debugger">4 Using the Command Line Debugger</a>
<ul>
<li><a href="#preparing-your-program">4.1 Preparing your Program</a></li>
<li><a href="#debugging-symbols">4.2 Debugging Symbols</a></li>
<li><a href="#starting-the-debugger">4.3 Starting the Debugger</a></li>
<li><a href="#command-line-arguments">4.4 Command line arguments</a></li>
</ul></li>
<li><a href="#commands">5 Commands</a>
<ul>
<li><a href="#quitting-and-restarting">5.1 Quitting and restarting</a></li>
<li><a href="#displaying-processes-and-threads">5.2 Displaying processes and threads</a></li>
<li><a href="#running-and-single-stepping">5.3 Running and single stepping</a></li>
<li><a href="#stack-frames-and-backtraces">5.4 Stack frames and backtraces</a></li>
<li><a href="#printing-expressions">5.5 Printing expressions</a></li>
<li><a href="#displaying-expressions">5.6 Displaying expressions</a></li>
<li><a href="#breakpoints">5.7 Breakpoints</a></li>
<li><a href="#catching-exceptions">5.8 Catching Exceptions</a></li>
<li><a href="#displaying-a-methods-source-code">5.9 Displaying a method's source code</a></li>
<li><a href="#disassembling">5.10 Disassembling</a></li>
<li><a href="#exploring-the-program-state">5.11 Exploring the Program State</a></li>
<li><a href="#examining-memory">5.12 Examining Memory</a></li>
</ul></li>
<li><a href="#expressions">6 Expressions</a>
<ul>
<li><a href="#simple-expressions">6.1 Simple expressions</a></li>
<li><a href="#pointer-expressions">6.2 Pointer expressions</a></li>
<li><a href="#invocation-expressions">6.3 Invocation expressions</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

DEPRECATED
==========

The Hard Debugger is no longer support in newer versions of Mono, it is only supported by older versions of Mono. This documentation is here for the sake of users that still use the old debugger.

Introduction
============

This is a guide to the Mono Hard Debugger. Most developers will want to use instead the [Soft Debugger](/Mono:Runtime:Documentation:SoftDebugger) support in Mono and MonoDevelop 2.2 as it supports debugging more kinds of applications and it is in general more reliable than the hard debugger.

The principal difference between the hard debugger (MDB) and the soft debugger is that the hard debugger can debug both managed and unmanaged applications, while the soft debugger is limited to pure managed applications. But the soft debugger is a more reliable debugger due to its architecture.

It provides a reusable library that can be used to add debugger functionality to different frontends. The debugger package includes a console debugger named "mdb", and [MonoDevelop](http://www.monodevelop.com) will also provide a GUI interface for it soon.

Using the Hard Debugger with MonoDevelop
========================================

To use the Debugger with MonoDevelop, you should get at least Mono 2.4, MonoDevelop 2.0, or preferably MonoDevelop 2.2 and the debugger packages.

Details about the integrated debugger can be found on the [MonoDevelop Release Notes](http://monodevelop.com/Download/MonoDevelop_2.0_Released#Integrated_Debugger).

Using the Command Line Debugger
===============================

Preparing your Program
----------------------

To use the debugging facilities in Mono, you should compile your program with debugging information. This is achieved by passing the `-debug` option to the command line compiler.

    gmcs -debug hello.cs

The debugger can debug both 1.x and 2.0 applications.

Debugging Symbols
-----------------

When using mcs -debug, the compiler generates a .mdb file which contains the debug symbols that the debugger uses to map a method to a position in a source file, and to get line numbers in stack traces.

If your program has been compiled inside Visual Studio or with csc, the debugging symbols are stored in a .pdb file. You can use the program pdb2mdb to convert the pdb to an mdb file that the debugger understands.

So if you have the files hello.exe and hello.pdb, you can use:

    pdb2mdb hello.exe

To generate hello.exe.mdb.

Starting the Debugger
---------------------

Start the command line version of the debugger like this:

    mdb Application.exe

to debug a managed application or

    mdb nativeapplication

to debug a native application.

Alternatively, you can set the executable after starting the debugger:

     $ mdb
     (mdb) file Application.exe
     Executable file: Application.exe.
     (mdb)

By default, the debugger will not start the application. You can either use the *run* or *start* command:

     $ mdb Application.exe
     (mdb) run

or you can also use the *-run* or *-start* argument on the command line:

     $ mdb -run Application.exe

The difference between these two commands is that *start* will start the application and run until the first line of the application's *main()* method while *run* won't stop in *main()*.

Command line arguments
----------------------

You can specify the command line arguments passed to the debuggee in three ways:

1. The "run" command:

     (mdb) run arg1 arg2 ...

2. The "set args" command

     (mdb) set args arg1 arg2 ...

3. On the command line when starting the debugger:

     $ mdb -run -args Application.exe arg1 arg2 ...

Commands
========

Quitting and restarting
-----------------------

To quit a debugging session, just type

    (mdb) quit

To kill a debugging session, type

    (mdb) kill

This will just kill program being debugged, but not the debugger. After that, you can use **run** to restart the target:

    (mdb) run

This'll restart your debugging session and stop at the applications's entry point. Breakpoints are preserved across sessions.

Displaying processes and threads
--------------------------------

At the moment, the debugger can only debug one application at once - but since we're following *fork()*'s, this application can have more than one process.

You can find out which processes are currently being debugged with the **show processes** (short: **show procs**) command:

    (mdb) show procs
    (*) Process #1 (13158:/work/rohan/INSTALL/lib/xsp/1.0/xsp.exe --root /work/rohan/INSTALL/lib ...)

Each process can have one or more threads:

    (mdb) show threads
    Process #1 (13158:/work/rohan/INSTALL/lib/xsp/1.0/xsp.exe --root /work/rohan/INSTALL/lib ...):
    (*) Thread @1 (13158:2aaaab718f60) Stopped
        Daemon thread @2 (13161:0) Running
        Daemon thread @3 (13162:40224960) Running
        Thread @4 (13220:40475960) Stopped

The (\*) marks the current process / thread - this is the thread on which all stepping commands operate (unless you override with the **-thread** argument, see below). You can view or change the current thread with the **thread** command:

    (mdb) thread
    Thread @1 (13158:2aaaab718f60) Stopped
    (mdb) frame
    #0: 0x40018b32 in Mono.XSP.Server.Main(System.String[])+0x13b2 at ./xsp/src/server.cs:476
     476                            if (!nonstop) {
    (mdb) thread 4
    Thread @4 (13220:40475960) Stopped
    (mdb) thread
    Thread @4 (13220:40475960) Stopped
    (mdb) frame
    #0: 0x40019830 in Mono.WebServer.ApplicationServer.RunServer()+0x18 at ./xsp/src/Mono.WebServer/ApplicationServer.cs:314
     314                    started = true;

All commands which access the target also take an optional **-thread** argument to specify on which thread they should operate:

    (mdb) frame
    #0: 0x40018b32 in Mono.XSP.Server.Main(System.String[])+0x13b2 at ./xsp/src/server.cs:476
     476                            if (!nonstop) {
    (mdb) frame -thread 4
    #0: 0x40019830 in Mono.WebServer.ApplicationServer.RunServer()+0x18 at ./xsp/src/Mono.WebServer/ApplicationServer.cs:314
     314                    started = true;

If you look at the example above, you'll notice that some threads are marked as *Deamon thread* - these are threads which are created and used internally by the Mono runtime. The debugger doesn't prevent you from debugging these, but you should know what you're doing.

Running and single stepping
---------------------------

The debugger has several commands to single step the target - unless you use the **-thread** argument, they all operate on the current thread (see [\#Displaying processes and threads](#displaying-processes-and-threads) for details):

**continue**, **c**

Resume execution of the selected thread until it exists, receives a signal or hits a breakpoint.

**background**, **bg**

Resume execution of the selected thread in the background, ie. immediately give control back to the user, without waiting until the target stops.

**stop**

Stop execution of the selected thread by sending it a stop signal.

**step**, **s**

Step one source line.

**next**, **n**

Step one source line, but step over method calls.

**finish**

Run until the end of the current method. This command has two modes of operation:

-   Without any arguments, step until the end of the current method. This only works if the current method has source code. Note that if the current method recursively calls itself, this will continue running until the last iteration has exited.
-   With the optional **-native** argument, continue stepping until the stack pointer reaches a value whic his higher than at the beginning of this operation. You can use this to finish out of a method without source code or to finish just the current iteration of a recursive method. Note that when called within a method (not at the start), this may stop several times.

**stepi**, **i**

Step one machine instruction.

    (mdb) frame
    #0: 0x401ba443 in X.Main()+0x3 at Foo.cs:218
    218         Simple ();
    (mdb) stepi
    Process @3 stopped at #0: 0x401ba5a0 in X.Simple() at Foo.cs:111.
    111     public static void Simple ()
    X.Simple():
    0x401ba5a0  push   %ebp

This command will not enter JIT trampolines unless the *-native* argument is given:

    (mdb) frame
    #0: 0x401ba443 in X.Main()+0x3 at Foo.cs:218
    218         Simple ();
    (mdb) stepi -native
    Process @3 stopped at #0: 0x0830f878.
    0x0830f878  push   $0x82b4398

**nexti**, **t**

Step one machine instruction, but step over method calls.

**return**

Make the current stack frame return. This command is *dangerous* since it just pops off the stack frame and doesn't care about return values, *out* parameters etc.

Note than when you're inside a method which has been called by mdb (via the **call** or **print** command, see below), **return** will abort this invocation - in this case, **return** is safe to use.

Of course, the debugger may stop earlier if the target receives a signal (or exists).

Stack frames and backtraces
---------------------------

When the target stopped, you normally want to see the current stack frame or get a backtrace:

**backtrace**, **bt**
Prints a backtrace.

    Process @3 stopped at #0: 0x401ba5cd in X.Simple()+0x2d at Foo.cs:113.
    113         int a = 5;
    (mdb) bt
    (*) #0: 0x401ba5cd in X.Simple()+0x2d at Foo.cs:113
    #1: 0x401ba448 in X.Main()+0x8 at Foo.cs:219

Takes an optional *-max* command specifying the maximum number of frames to print:

    (mdb) bt -max 8

**frame**, **f**
Show the current stack frame or the frame specified by the optional *-frame* argument:

    Process @3 stopped at #0: 0x401ba5cd in X.Simple()+0x2d at Foo.cs:113.
    113         int a = 5;
    (mdb) frame -frame 1
    #1: 0x401ba448 in X.Main()+0x8 at Foo.cs:219
    219         BoxedValueType ();

**up**, **down**
Walks one frame up or down in the current backtrace. Prints the new stack frame.

    Process @3 stopped at #0: 0x401ba5cd in X.Simple()+0x2d at Foo.cs:113.
    113         int a = 5;
    (mdb) up
    #1: 0x401ba448 in X.Main()+0x8 at Foo.cs:219
    219         BoxedValueType ();
    (mdb) frame
    #1: 0x401ba448 in X.Main()+0x8 at Foo.cs:219
    219         BoxedValueType ();

Printing expressions
--------------------

To print variables or evaluate arbitrary expressions, use the *print* command. You can also use the *ptype* command to print the type of an expression.

**print**, **p**
Evaluate and print an expression.

    (mdb) print a
    (System.Int32) a

**print /default**, **p /default**
Evaluate and print the context of an expression. Unlike print, this will not show the ToString() representation of the object, but will instead show the values in a class or struct.

    (mdb) print /default a

**ptype**
Print the type of an expression

    (mdb) ptype a
    System.Int32

See [\#Expressions](#expressions) for details.

Displaying expressions
----------------------

To display the value of an expressn every time the target stops (so that you can easily see how it changes during the execution), use the *display* command, which takes the expression as parameter.

Each display has an associated number, which can be used to refer to the display itself when it is removed with the *undisplay* command (which takes the display index as parameter).

It can happen that an expression cannot be evaluated in the current stack frame or thread (maybe the variables used are out of scope). In this case, the first time that mdb cannot evaluate the expression the debugger prints a warning, and then the display is implicitly disabled, so that the warning is no longer shown.

If, however, the expression becomes valid again, it is automatically shown. This way the user can keep several displays active, and not worry about the fact that they go out of scope, because the screen will not be cluttered with the invalid ones.

To see all the active displays, one can use the *show display* command. Note that this command shows *all* the displays, also the ones that have been internally disabled.

Breakpoints
-----------

Breakpoints are inserted with the *break* command. Without arguments, this command inserts a breakpoint at the current source line.

    Process @3 stopped at #0: 0x401b7443 in X.Main()+0x3 at Foo.cs:218.
    218         Simple ();
    (mdb) b
    Inserted breakpoint 1 at Foo.cs:218

After inserting the breakpoint, the debugger tells you the breakpoint number which can be used to enable, disable or remove the breakpoint:

    (mdb) show breakpoints
    Breakpoints:
     Id   Type  En  ThreadGroup  What
      1  break   y       global  /work/asgard/debugger/test/Foo.cs:218
    (mdb) disable 1
    (mdb) show breakpoints
    Breakpoints:
     Id   Type  En  ThreadGroup  What
      1  break   n       global  /work/asgard/debugger/test/Foo.cs:218
    (mdb) enable 2
    (mdb) show breakpoints
    Breakpoints:
     Id   Type  En  ThreadGroup  What
      1  break   y       global  /work/asgard/debugger/test/Foo.cs:218
    (mdb) delete 1
    (mdb) show breakpoints
    No breakpoints or catchpoints.

However, most of the time, you don't want to insert a breakpoint at the current location, but somewhere else. Let's have a look at the following example:

using System;

``` csharp
class X
{
    public static void Foo (int a)
    {
        Console.WriteLine ("Foo: {0}", a);
    }
 
    public static void Foo (string b)
    {
        Console.WriteLine ("Foo with a string: {0}", b);
    }
 
    public void Test (long a)
    {
        Console.WriteLine ("Test: {0}", a);
    }
 
    public static void Hello (int a)
    {
        Console.WriteLine ("Hello: {0}", a);
    }
 
    public static void Main ()
    {
        int a = 5;
        string hello = "Boston";
        X x = new X ();
 
        // You are stopped here.
        Foo (a);
        Foo (hello);
        Hello (a);
        x.Test (9);
    }
}
```

The syntax to insert a breakpoint is very similar to the one to invoke a method in the target:

    Process @3 stopped at #0: 0x401b749a in X.Main()+0x5a at /home/martin/work/Test.cs:32.
    32      Foo (a);
    (mdb) b Hello
    Inserted breakpoint 2 at X.Hello(System.Int32)
    (mdb) b X.Hello
    Inserted breakpoint 3 at X.Hello(System.Int32)
    (mdb) b x.Test
    Inserted breakpoint 4 at X.Test(System.Int64)

Note how similar it is to invoking a method; you cannot use the method name alone to insert a breakpoint on an instance method if you're in static context. You can, however, use a fully qualified name to insert the breakpoint:

    (mdb) b Test
    ERROR: Cannot use instance member `Test' or current class in static context.
    (mdb) b X.Test
    Breakpoint 1 at X.Test(System.Int64)

Of course, this only applies if you're in static context - just like you'd do things in C\#:

    Process @3 stopped at #0: 0x40bc082e in X.Test(System.Int64)+0xe at Test.cs:17.
    17      Console.WriteLine ("Test: {0}", a);
    (mdb) b Test
    Inserted breakpoint 2 at X.Test(System.Int64)

If the method is ambiguous, overload resolution is performed using types:

    Process @3 stopped at #0: 0x401b749a in X.Main()+0x5a at Test.cs:32.
    32      Foo (a);
    (mdb) b Foo(System.Int32)
    Inserted breakpoint 2 at X.Foo(System.Int32)
    (mdb) b Foo(System.String)
    Inserted breakpoint 3 at X.Foo(System.String)

If you just use a method name, the debugger presents you a list and you can just pick a method from that list:

    Process @3 stopped at #0: 0x401b749a in X.Main()+0x5a at Test.cs:32.
    32      Foo (a);
    (mdb) b Foo
    More than one method matches your query:
    1  X.Foo(System.Int32)
    2  X.Foo(System.String)

    (mdb) b -id 1
    Inserted breakpoint 2 at X.Foo(System.Int32)
    (mdb) b -id 2
    Inserted breakpoint 3 at X.Foo(System.String)

You can also specify a source file and line number to insert a breakpoint:

    Process @3 stopped at #0: 0x401b749a in X.Main()+0x5a at Test.cs:32.
    32      Foo (a);
    (mdb) list Hello
    18
    19  public static void Hello (int a)
    20  {
    21      Console.WriteLine ("Hello: {0}", a);
    22  }
    23
    24  public static void Main ()
    25  {
    26      int a = 5;
    27      string hello = "Boston";
    (mdb) b 21
    Inserted breakpoint 2 at /home/martin/work/Test.cs:21
    (mdb) b /home/martin/work/Test.cs:26
    Inserted breakpoint 3 at /home/martin/work/Test.cs:26

Catching Exceptions
-------------------

To have the debugger stop when a particular exception is raised, you can use the **catch** command.

The **catch** command takes an argument, the type of the exception to catch. This will catch exceptions of that type or any derived types.

For example you can use:

``` bash
(mdb) catch System.InvalidCastException
```

to catch exceptions of type InvalidCastException.

If you want to catch all exceptions, you can use **catch Exception**

Whenever the target stopped because of an exception, you may use **print catch** to display the exception:

     (mdb) run
     Unhandled Exception: TestException: Boston
       at X.Main () [0x00000] in /work/gondor/debugger/test/C.cs:18
     Thread @1 caught unhandled exception at #0: 0xb7845278 in X.Main()+0x38 at
     /work/gondor/debugger/test/C.cs:19.
       19    }
     (mdb) p catch
     (TestException) { "TestException: Boston
       at X.Main () [0x00000] in /work/gondor/debugger/test/C.cs:18 " }
     (mdb) ptype catch
     class TestException : System.Exception
     {
        string Hello;
        .ctor (string);
     }
     (mdb) p catch.Hello
     (string) "Boston"

Displaying a method's source code
---------------------------------

You can also view a method's source code by using the *list* command. The syntax is identical to *break*:

    Process @3 stopped at #0: 0x401b749a in X.Main()+0x5a at Test.cs:32.
    32      Foo (a);
    (mdb) list
    30      // You are stopped here.
    31      Foo (a);
    32      Foo (hello);
    33      Hello (a);
    34      x.Test (9);
    35  }
    36 }
    (mdb) list Hello
    18
    19  public static void Hello (int a)
    20  {
    21      Console.WriteLine ("Hello: {0}", a);
    22  }
    23
    24  public static void Main ()
    25  {
    26      int a = 5;
    27      string hello = "Boston";

This command takes an optional *-lines* argument to specify the number of source lines to display:

    Process @3 stopped at #0: 0x401b749a in X.Main()+0x5a at Test.cs:32.
    32      Foo (a);
    (mdb) list -lines 5
    30      // You are stopped here.
    31      Foo (a);
    32      Foo (hello);
    33      Hello (a);
    34      x.Test (9);

Disassembling
-------------

**dis[assemble] [-count N] [-method]**

Disassembles code at a given location

To disassembly the current instruction or the current method, use the *dis* command:

    (mdb) Process @3 stopped at #0: 0x401b7443 in X.Main()+0x3 at Foo.cs:218.
    218         Simple ();
    (mdb) dis
    0x401b7443  call   X.Simple()
    (mdb) dis -method
    X.Main():
    0x401b7440  push   %ebp
    0x401b7441  mov    %esp,%ebp
    0x401b7443  call   X.Simple()
    0x401b7448  call   X.BoxedValueType()
    0x401b744d  call   X.BoxedReferenceType()
    0x401b7452  call   X.SimpleArray()
    0x401b7457  call   X.MultiValueTypeArray()
    0x401b745c  call   X.StringArray()
    0x401b7461  call   X.MultiStringArray()
    0x401b7466  call   X.StructType()
    0x401b746b  call   X.ClassType()
    0x401b7470  call   X.InheritedClassType()
    0x401b7475  call   X.ComplexStructType()
    0x401b747a  call   X.FunctionStructType()
    0x401b747f  leave
    0x401b7480  ret

Like the **examine** command, **dis** takes an optional pointer expression as argument (see [\#Pointer expressions](#pointer-expressions) for details):

    (mdb) dis %rip
    0x400179d6      mov    %r15,%rdi
    (mdb) dis 0x400179d6
    0x400179d6      mov    %r15,%rdi
    (mdb)

Exploring the Program State
---------------------------

**show locals**

Shows the local variables active in the current scope

    (mdb) show locals
    ok = (System.Boolean) false
    (mdb)

**show params**

Shows the parameter to the current method

    (mdb) show params
    args = (System.String[]) [  ]
    (mdb)

**show location *variable***

Displays where the given local variable is stored

    (mdb) show location ok
    ok is a variable of type System.Boolean stored at %ebx

**show registers, show regs**

Shows the contents of the CPU registers

    (mdb) show registers
    EAX=412c6308  EBX=00000000  ECX=00000000  EDX=080523b8  ESI=00021f00    EDI=0002ad50
    EBP=412c6240  ESP=412c6220  EIP=40ebd7ed  EFLAGS=PF ZF IF ID
    (mdb)

The flags are decoded in EFLAGS

**show modules**

Shows all the loaded modules in the current program

    (mdb) show modules
      Id step?  sym? Name
       0    y     n  /lib/libdl.so.2
       1    y     n  /lib/tls/librt.so.1
       2    y     y  mscorlib, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089
       3    y     n  /opt/gnome/lib/libglib-2.0.so.0
       4    y     y  /mono/lib/libmono.so.0
       5    y     n  /lib/tls/libpthread.so.0
       6    y     n  /opt/gnome/lib/libgmodule-2.0.so.0
       7    y     n  /lib/libnsl.so.1
       8    y     n  /opt/gnome/lib/libgthread-2.0.so.0
       9    y     y  System, Version=1.0.5000.0, Culture=neutral, PublicKeyToken=b77a5c561934e089
      10    y     n  /lib/tls/libc.so.6
      11    y     y  /mono/lib/mono/1.0/mono-debugger-mini-wrapper
      12    y     n  /lib/ld-linux.so.2
      13    y     n  /lib/tls/libm.so.6
      14    y     y  mcs, Version=1.1.11.0, Culture=neutral, PublicKeyToken=0907d8af90186095
    (mdb)

**show sources *module\_id***

Shows the sources for a given module.

You can use this to get a list of the source files for a given module, for instance, with the above example, you could use:

    (mdb) show sources 14
    Sources for module mcs, Version=1.1.11.0, Culture=neutral,  PublicKeyToken=0907d8af90186095:
     142  /home/cvs/mcs/mcs/cs-parser.cs
     143  /home/cvs/mcs/mcs/AssemblyInfo.cs
     144  /home/cvs/mcs/mcs/anonymous.cs
     145  /home/cvs/mcs/mcs/assign.cs
     146  /home/cvs/mcs/mcs/attribute.cs
     147  /home/cvs/mcs/mcs/driver.cs
     148  /home/cvs/mcs/mcs/cs-tokenizer.cs
     149  /home/cvs/mcs/mcs/cfold.cs
     150  /home/cvs/mcs/mcs/class.cs
     ...
    (mdb)

Examining Memory
----------------

**examine**, **x** [/[items][format][size]] expression

Memory dump

The *examine* (short: *x*) command takes a pointer expression as argument (see [\#Pointer expressions](#pointer-expressions) for details). You can for instance use a processor register, an absolute address or the address of a variable:

    (mdb) p %ebp
    0x40bbe880
    (mdb) x %ebp
    0x40bbe880   88
    (mdb) x /16 %ebp
    0x40bbe880   88 e8 bb 40 48 74 1b 40 - b0 e8 bb 40 a3 74 1b 40
    (mdb) p %eip
    0x401b7619
    (mdb) x /16 0x401b7619
    0x401b7619   56 e8 b9 5c 16 c8 83 c4 - 04 ff 75 ec ff 75 e8 e8
    (mdb) x /16 &f
    0x40bbe864   6e db 36 3f 07 00 00 00 - 00 00 00 00 48 74 1b 40

When trying to take the address of a variable, keep in mind that some variables may be stored in a processor register, so they don't have an address:

    (mdb) p a
    5
    (mdb) ptype a
    System.Int32
    (mdb) x &a
    Cannot take address of expression `a'

By default, the *examine* command prints one byte of memory in hexadecimal.

This can be changed specifying various options in a single parameter that must precede the expression, in gdb style: "/[*items*][*format*][*size*]".

The *items* section is an integer specifying the number of items to print:

    (mdb) x /64 %esp
    0x40bbe888   b0 e8 bb 40 a3 74 1b 40 - b0 e8 bb 40 e0 d7 05 40
    0x40bbe898   48 db 2a 08 8b 6b 01 00 - e0 e8 bb 40 c8 d7 05 40
    0x40bbe8a8   d8 fe 16 08 f8 f3 19 40 - e0 e8 bb 40 84 d9 05 40
    0x40bbe8b8   00 00 00 00 30 e9 bb 40 - 00 00 00 00 40 74 1b 40

If you want to see more data, just hit return:

    (mdb) x /32 %esp
    0x40bbe888   b0 e8 bb 40 a3 74 1b 40 - b0 e8 bb 40 e0 d7 05 40
    0x40bbe898   48 db 2a 08 8b 6b 01 00 - e0 e8 bb 40 c8 d7 05 40
    (mdb)
    0x40bbe8a8   d8 fe 16 08 f8 f3 19 40 - e0 e8 bb 40 84 d9 05 40
    0x40bbe8b8   00 00 00 00 30 e9 bb 40 - 00 00 00 00 40 74 1b 40
    (mdb)
    0x40bbe8c8   20 32 13 42 98 48 30 08 - 40 74 1b 40 88 74 1b 40
    0x40bbe8d8   60 d6 2a 08 f8 f3 19 40 - 00 e9 bb 40 c8 97 0b 40
    (mdb)
    0x40bbe8e8   48 db 2a 08 00 00 00 00 - 30 e9 bb 40 00 00 00 00
    0x40bbe8f8   40 1e 1e 08 f8 f3 19 40 - 40 e9 bb 40 34 a7 0b 40

The *format* specifier is a single character (similar to gdb): o(octal), x(hex), d(decimal), u(unsigned decimal), t(binary), f(float), c(ASCII char).

Also the *size* specifier is a single character (again, similar to gdb): b(byte), h(halfword), w(word), g(giant, 8 bytes), a(address, 4 or 8 bytes).

So, to inspect a double, one would use "/fg", for a single "/fw", for an IntPtr "/a" (the 'x' is the default), and so on...

Expressions
===========

The debugger has a built-in expression evaluator which uses a C\#-like language. You can not only view simple expressions like examining a variable, but also do more complex things like accessing properties, indexers or even invoking methods in the target.

### Simple expressions

Literals work just like in C\#:

    (mdb) print 8
    8
    (mdb) print "Hello World"
    "Hello World"
    (mdb) print 512L
    512
    (mdb) print 3.14159
    3.14159
    (mdb) print 8.00F
    8.00

You can also access variables from the target:

    (mdb) print a
    (System.Int32) 8
    (mdb) print hello
    (System.String) "Hello World"
    (mdb) print y
    (Y) { }

If you're inside a non-static managed method, there's also a special variable called *this*:

    (mdb) print this
    (X) { a = 5 }

### Pointer expressions

Some of the commands require a pointer expression (for instance **disassemble**, **examine**).

The most common usage for pointers is taking the address of something, like a variable for instance. You do this with the *&* (address of) expression.

Note that unlike in C or C\#, this expression gives you the address of an object and not the address where a pointer to the object can be found.

Let's assume you have a variable called *x* which is stored on the stack at *%ebp-0x18*. If *x* is a reference type, *%ebp-0x18* just contains a pointer to the actual object while for value types, the object itself can be found at *%ebp-0x18*. However, when you type *print &x* in mdb, you don't need to care about these technical details - it'll always print the address where the first byte of *x*'s contents can be found.

This means that you can always just *examine &x* and mdb will show you the correct region of memory.

    (mdb) print &a
    Cannot take address of expression `a'
    (mdb) print &hello
    (void *) 0x401b7440
    (mdb) print *pointer_var
    (System.Int32) 5

Note that while debugging managed code, variables of type \`object' are also treated like pointers. Normally, you don't need to care about this since the user interface automatically dereferences the pointer for you, but this can become very useful if you encounter an \`object' which is somehow corrupted: even if the debugger can't display it as a normal managed \`object', you can still examine it as a pointer and so figure out what when wrong.

Processor registers are also treated as pointers:

    (mdb) print %eax
    0x401b7440
    (mdb) print %ebp
    0x40bbe888
    (mdb) print %esp
    0x40bbe888

Last, but not least, you can also use an address literal as a pointer:

    (mdb) x 0x40425010
    0x40425010   20 af 54 00 00 00 00 00 - 20 af 54 00 00 00 00 00

### Invocation expressions

The debugger can also invoke methods in the target. Let's have a look at the following example:

``` csharp
using System;
 
class X
{
    public static void Foo (int a)
    {
        Console.WriteLine ("Foo: {0}", a);
    }
 
    public static void Foo (string b)
    {
        Console.WriteLine ("Foo with a string: {0}", b);
    }
 
    public static void Hello (int a)
    {
        Console.WriteLine ("Hello: {0}", a);
    }
 
    public static void Main ()
    {
        int a = 5;
        string hello = "Boston";
 
        // You are stopped here.
        Foo (a);
        Foo (hello);
        Hello (a);
    }
}
```

Now you're stopped in *Main* and want to invoke methods.

    (mdb) print Foo (3)
    Foo: 3
    Method `Foo ()' doesn't return a value.
    (mdb) print Foo ("Hello World")
    Foo with a string: Hello World
    Method `Foo ()' doesn't return a value.
    (mdb) print Hello (9)
    Hello: 9
    Method `Hello ()' doesn't return a value.
    (mdb) print Hello (a)
    Hello: 9
    Method `Hello ()' doesn't return a value.
    (mdb) print Foo (hello)
    Foo with a string: Boston
    Method `Foo ()' doesn't return a value.

Note how the debugger automatically does overload resolution when calling *Foo*.

