---
layout: docpage
navgroup: docs
title: Responsive Applications
redirect_from:
  - /Responsive_Applications/
  - /Multi-threaded_GtkSharp_Programing_and_Keeping_your_Application_Responsive/
---

This article covers multi-threaded GTK\# programing as well as how to keep your GTK\# application responsive.

Background
==========

The Gtk\# toolkit is an event-based system. At the core of the Gtk.Application.Run method there is a loop like this:

``` csharp
    while (Gtk.Application.EventsPending ())
        Gtk.Application.RunIteration ();
```

The above loop basically consumes events until the method Gtk.Application.Quit() is invoked.

Events can come from a number of sources:

-   Keyboard (as the user types information).
-   Mouse (as the user moves the mouse or clicks on information).
-   Synthesized events (pressing the \`enter' key and mapping that to an "activated" event on the widget).
-   X events: redrawing, resizing, respoding to cut-and-paste.
-   Timers going off.
-   Notification of idle time.

The loop that processes and dispatches events is called the "event loop".

The thread that happens to run the event loop is said to "own" Gtk. This means that all Gtk operations should be perfomed from this thread and no other thread. **Failure to restrict the use of Gtk to this thread will result in unpredictable behavior, and most often will lead to a crash.**

Threads are useful if you need to perform long running computations or your application complexity would increase too much if it were event driven.

The most important thing to keep in mind is that the thread running the Gtk main loop (the one that calls Gtk.Application.Run()) is the only thread that should make calls into Gtk. This includes method calls and property access.

A typical scenario is that your thread will want to update the user interface with some status progress or notify the user when a task is completed. The solution is to turn the notification into an event that is then dispatched from the main thread.

A common problem faced by GUI application developers is keeping an application responsive while a long-running operation is running. There are a number of approaches that can be used depending on the situation and the complexity of the computation.

There are a number of reasons why an application might become unresponsive to a user: the application might be performing a long-running computation or it might be blocking on data to become available from the network, a file system or the operating system.

Threads are often used to overcome this problem, but as explained above you have to be careful when using them. In this document we explore the solutions available to Gtk\# developers to keep your GUI responsive by using multiple threads and other approaches.

Approaches
==========

There are a number of approaches that can be used to make your application responsive in the presence of blocking operations:

-   Event-based programming.
-   Explicitly threaded applications.
-   Asynchronous Mono Programming.

Event-based programming is the best option as it avoids the complexity that comes from writing multi-threaded applications. Event-based programming requires that you architect your software in a way in which it responds to events, but this is already the case for most GUI applications: callbacks are invoked in response to user actions or signals, so this is a natural model to use.

You should think twice before you start using threads. Not only because you have to be careful about the way you use Gtk\# but also because it will make your code hard to debug, the bugs might be extremely hard to reproduce and you will need to become intimately familiar with a whole family of thread synchronization primitives and you must design your software in a way in which you avoid deadlocks.

Idle Handlers
-------------

The Gtk main loop has support for invoking routines when the application is idle. When no events are left to process the main loop will invoke all of the idle handlers. This technique is useful if you can break up the work that your application does into small units that take a small amount of time to process and can resume execution at any point.

Another use of the Idle handler is to queue work to be done when the machine is idling and not doing anything interesting. You can use Idle handlers to perform background operations without the added complexity of having to write a multi-threaded applications

For example, simple animations or status updates could be hooked up into an Idle handler.

``` csharp
    void Start ()
    {
        GLib.Idle.Add (new IdleHandler (OnIdleCreateThumbnail));
    }
 
    bool OnIdleCreateThumbnail ()
    {
           Image img = GetNextImage ();
 
           // If no more images remain, stop the idle handler.
           if (img == null)
                 return false; 
 
           CreateThumbnail (img, img.ToString () + ".thumbnail");
 
           // There are more images, invoke this routine again on the next Idle moment.
           return true;           
    }
```

For more details about using Idle handlers, see the [GLib.Idle](http://docs.go-mono.com/index.aspx?link=T:GLib.Idle) class library documentation.

Timeouts
--------

You can use timeouts to invoke routines at specified intervals of time. This can be used to update status at specified times for example while a background thread runs or to notify the user of an action at a given interval.

Those of you who have done winforms development before will notice that GLib.Timeout is similar to System.Windows.Forms.Timer. The difference is that GLib.Timeouts are always invoked on the thread that owns the Gtk mainloop.

``` csharp
     void StartClock ()
     {
         // Every second call `update_status' (1000 milliseconds)
 
         GLib.Timeout.Add (1000, new GLib.TimeoutHandler (update_status));
     }
 
     bool update_status ()
     {
         time_label.Text = DateTime.Now.ToString ();
 
         // returning true means that the timeout routine should be invoked
         // again after the timeout period expires.   Returning false would
         // terminate the timeout.
 
         return true;
     }
```

As described on the example, the timeout routine has to return a true or false value. Returning true will reset the timeout and invoke the method again, and returning false will prevent further invocations of the timeout routine to be called.

Look at the documentation for [GLib.Timeout](http://docs.go-mono.com/index.aspx?link=T:GLib.Timeout) for more examples and to learn more about timeouts.

Gtk.Application.Invoke
----------------------

With Gtk\# 2 and C\# it is possible to use Gtk.Application.Invoke and anonymous methods to request from a thread that the GUI thread should wake up and execute some code in the context of the main loop.

You must use this if you have a thread that needs to perform or access some GUI components during its execution:

``` csharp
using Gtk;
 
class Demo {
  static Label label;
 
  static void Main ()
  {
    Application.Init ();
    Window w = new Window ("Cray on a Window");
    label = new Label ("Busy computing");
 
    Thread thr = new Thread (new ThreadStart (ThreadRoutine));
    thr.Start ();
    Application.Run ();
  }
 
  static void ThreadRoutine ()
  {
        LargeComputation ();
        Gtk.Application.Invoke (delegate {
              label.Text = "Done";
        });
  }
 
  static void LargeComputation ()
  {
    // lots of processing here
  }
}
```

Gtk.ThreadNotify
----------------

``` csharp
using Gtk;
 
class Demo {
 
  static ThreadNotify notify;
  static Label label;
 
  static void Main ()
  {
    Application.Init ();
    Window w = new Window ("Cray on a Window");
    label = new Label ("Busy computing");
 
    Thread thr = new Thread (new ThreadStart (ThreadRoutine));
    thr.Start ();
    notify = new ThreadNotify (new ReadyEvent (ready));
    Application.Run ();
  }
 
  static void ready ()
  {
      label.Text = "Done";
  }
 
  static void ThreadRoutine ()
  {
        LargeComputation ();
        notify.WakeupMain ();
  }
 
  static void LargeComputation ()
  {
    // lots of processing here
  }
}
```

Programming with Threads
------------------------

For certain kind of problems that are not easy to handle with event dispatching, timers or other simpler approaches, you can use threads.

Threads have a few downsides, for example, you need to worry about race conditions that happens when two threads need to share information.

Read our [Thread Beginners Guide]({{ site.github.url }}/archived/ThreadsBeginnersGuide "ThreadsBeginnersGuide") for an introduction to using threads with Mono.

Asynchronous Mono Programmning
------------------------------

Programmers that use threads have to create their own communications protocols between the thread and the main application. Sometimes the features offered by the threads are enough, but some other times it might be useful to take advantage of a built-in protocol in the ECMA CLI for asynchronous programming.

In the ECMA CLI every delegate declaration creates three methods in the delegate that you can use, for example consider the following C\# declaration for a BinaryOperator:

``` csharp
delegate int BinaryOperator (int op1, int op2);
```

The compiler generates something along these lines:

``` csharp
class BinaryOperator : MulticastDelegate {
   public virtual int          Invoke      (int op1, int op2) {..}
   public virtual IAsyncResult BeginInvoke (int op1, int op2, AsyncCallback cback, object data) {..}
   public virtual int          EndInvoke   (IAsyncResult r) {..}
}
```

There is actually no code generated for those methods, the virtual machine handles these specially. Notice that incoming parameters are added to BeginInvoke, and the return type for EndInvoke is the return type for the Invoke method. BeginInvoke/EndInvoke have split the operation in two: the startup, and the completion.

You would use the above code typically like this:

``` csharp
// C# 2.0 style of coding, using an anonymous method:
BinaryOperator adder = delegate(int op1, int op2) { return op1 + op2; };
 
// C# way of invoking it:
int sum = adder (4, 5);
 
// You can also call it like this:
int sum2 = adder.Invoke (4, 5);
```

But in addition to this invocation model, the BeginInvoke/EndInvoke pair allow you to run the method on a separate thread, notify an optional callback method when the code has executed and fetch the results when you are done.

For example, this is how you could invoke the previous sum in a separate thread:

``` csharp
Startup ()
{
    string ABC = "hello";
 
    adder.BeginInvoke (4, 5, new AysnCallback (finished_callback), ABC);
    ...
}
 
void finished_callback (IAsyncResult ar)
{
     Console.WriteLine ("Addition has completed");
     // You can fetch the variable that was passed as the last argument
     // to BeginInvoke by accessing ar.AsyncState, in this case "ABC"
     object state = ar.AsyncState;
}
```

If you want to fetch the actual result value, you need to call the "EndInvoke" method, and pass the IAsyncResult parameter:

``` csharp
    int result = adder.EndInvoke (ar);
```

Here is a full sample:

``` csharp
using System;
delegate int BinaryOperator (int a, int b);
 
class x {
    static void Main ()
    {
        BinaryOperator adder = Adder;
 
        adder.BeginInvoke (10, 20, Callback, adder);
        Console.ReadLine ();
    }
 
    static int Adder (int a, int b)
    {
        return a + b;
    }
 
    static void Callback (IAsyncResult r)
    {
                // 
                // We pass the "adder" object as the "data" argument to
                // BeginInvoke, here we retrieve it:
                //
        BinaryOperator adder = (BinaryOperator) r.AsyncState;
 
        Console.WriteLine ("  Addition completed");
        Console.WriteLine ("  Result was: {0}", adder.EndInvoke (r));
    }
}
```

Here is the same sample, but this time rewritten using anonymous methods from C\# 2.0 which make the code more compact, and does not require us to pass the adder as a parameter (we could pass other data if we wanted to):

``` csharp
using System;
delegate int BinaryOperator (int a, int b);
 
class x {
    static void Main ()
    {
        BinaryOperator adder = delegate(int a, int b) { return a + b; };
 
        adder.BeginInvoke (10, 20, delegate (IAsyncResult r) {
            Console.WriteLine ("Addition completed");
            Console.WriteLine ("Result was: {0}", adder.EndInvoke (r));
            }, null);
        Console.ReadLine ();
    }
}
```

The above example uses the anonymous method syntax to define both the adder method and used to define the callback method that is invoked when the process is complete.

As you can see, the operation result is fetched by invoking the delegate's EndInvoke method. In the above example we call EndInvoke in our callback, so EndInvoke will return immediately with the result because the method has completed its execution. But if you were to call EndInvoke in another place of your program and your async method had not finished, EndInvoke would block until the method completes (see below for more information on how to deal with this).

Both samples currently "wait" by calling ReadLine, a more advanced application would take advantage of the IAsyncResult value returned. This is the definition of IAsyncResult:

``` csharp
public interface IAsyncResult {
        // The "data" value passed at the end of BeginInvoke
        object AsyncState {
                get;
        }
 
        // A waithandle that can be used to monitor the async process
        System.Threading.WaitHandle AsyncWaitHandle {
                get;
        }
 
        // Determines whether the method completed synchronously.
        bool CompletedSynchronously {
                get;
        }
 
        // Whether the method has completed.
        bool IsCompleted {
                get;
        }
}
```

You can use the "IsCompleted" method if you are polling for example, you could check if the method has finished, and if so, you could invoke EndInvoke.

You can also use the WaitHandle that is returned by the AsyncWaitHandle to monitor async method. You can use the WaitOne method, WaitAll or WaitAny to get finer control, they are all essentially the same operation, but it applies to the three potential conditions: single wait, waiting for all the handles to complete, or wait for any handles to complete (WaitHandles are not limited to be used with async methods, you can obtain those from other parts of the framework, like network communications, or from your own thread synchronization operations).

In our sample, we can replace Console.ReadLine with:

``` csharp
      IAsyncResult r = adder.BeginInvoke (10, 20, delegate(int a, int b){
            return a+b;
      }, null);
 
      r.AsyncWaitHandle.WaitOne ();
```

In the above invocation of WaitOne() you would wait until the async thread completes. But you can use other method overloads for more control, like only waiting for some amount of time before returning.

Manual Event Processing
-----------------------

You can also take control of the event loop, and instead of partitioning the problem in callback routines, put the code inline and put your computation code in the middle.

This can be used for example for a file-copying operation, where the status is updated as the copy proceeds and the unit of work is discrete and easy to resume:

``` csharp
void LongComputation ()
{
     while (!done){
         ComputationChunk ();
 
         // Flush pending events to keep the GUI reponsive
         while (Gtk.Application.EventsPending ())
              Gtk.Application.RunIteration ();
     }
}
```

Alternatives
============

Application.Invoke
------------------

Gtk\# 2.0 includes a new mechanism to invoke code on the main thread, this is part of the Gtk.Application class, to do this, just call the Invoke method with a delegate or anonymous method:

``` csharp
void UpdatingThread ()
{
    DoSomething ();
    Gtk.Application.Invoke (delegate {
          label.Text = "Thread update";
    });
}
```

Other options
-------------

Other options of doing the same are available for Gtk\# but are now outdated:

### GuiDispatch

Monodevelop has a class called GuiDispatch that automatically wraps delegates so they will be invoked on the main thread. This provides an extremely easy way to safely use threads in your application.

Lots more information as well as many examples at [http://monodevelop.com/Thread\_Management](http://monodevelop.com/Thread_Management).

``` csharp
Runtime.DispatchService.GuiDispatch (new StatefulMessageHandler (UpdateGui), n);
```

``` csharp
counter.TimeChanged += (EventHandler) Runtime.DispatchService.GuiDispatch (new EventHandler (UpdateTime));
```

### RunOnMainThread

A simple wrapper around GLib.Idle.Add that lets you easily run any method with arguments on the main thread.

[http://eric.extremeboredom.net/2004/12/25/113/](http://eric.extremeboredom.net/2004/12/25/113/)

``` csharp
public class Example {
    public void Go() {
        /* Let's assume this method was called by another thread */
        RunOnMainThread.Run(this, "DoSomethingToGUI", new object[] { "some happy text!" });
    }
    private void DoSomethingToGUI(string someText) {
        /* Do something to the GUI here */
    }
}
```

