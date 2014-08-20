---
title: "ThreadsBeginnersGuide"
lastmodified: '2010-08-19'
redirect_from:
  - /ThreadsBeginnersGuide/
---

ThreadsBeginnersGuide
=====================

This guide shall give beginners in asynchronous programming an overview of when and how to use Threads. This guide contains only generic help which is independent from the GUI and other components being used and should work fine most of the time.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#the-big-picture">1 The Big Picture</a>
<ul>
<li><a href="#why-threading">1.1 Why Threading?</a></li>
<li><a href="#when-not-to-use-threading">1.2 When not to use Threading?</a></li>
</ul></li>
<li><a href="#threads-in-action">2 Threads in Action</a>
<ul>
<li><a href="#synchronizing-threads">2.1 Synchronizing Threads</a></li>
</ul></li>
<li><a href="#common-mistakes">3 Common Mistakes</a>
<ul>
<li><a href="#data-races">3.1 Data Races</a></li>
<li><a href="#deadlocks">3.2 Deadlocks</a></li>
</ul></li>
<li><a href="#a-little-more-advanced-threading">4 A little more advanced Threading</a>
<ul>
<li><a href="#passing-parameters-to-threads">4.1 Passing Parameters to Threads</a>
<ul>
<li><a href="#net-20">4.1.1 .NET 2.0</a></li>
<li><a href="#net-11">4.1.2 .NET 1.1</a></li>
</ul></li>
<li><a href="#accessing-the-main-thread-with-callback">4.2 Accessing the Main-Thread with Callback</a></li>
</ul></li>
<li><a href="#resources-and-further-reading">5 Resources and further reading</a></li>
</ul></td>
</tr>
</tbody>
</table>

The Big Picture
===============

As you probably know, when you start a program you're a starting a [process](http://en.wikipedia.org/wiki/Process_%28computing%29). By default, every application has one thread, which is called **main** or **primary** thread. In the .NET you have to specify the entry point of your application where your main-thread begins the excecution of your programm. By convention the main-thread can only start in class having a public static void method called `Main`. Everything within that `Main` method is being excecuted on your main-thread. Once if the method is completely excecuted the main-thread finishes and your application dies.

The following example shows a very small application. When you run that sample whatch your running processes, because a new Mono process will appear writing some lines on your console. After you press enter that main-thread will be completely excecuted and that process will die and disappear again.

``` csharp
using System;
 
namespace ThreadGuideSamples {
    public class MainClass {
        public static void Main () {
            Console.WriteLine ("Hello main-thread");
            Console.WriteLine ("Press Enter and my process dies.");
            Console.ReadLine ();
            Console.WriteLine ("After that line I'm dead :-(");
        }
    }
}
```

[![Process-AppDomain-Thread.png](/archived/images/d/d9/Process-AppDomain-Thread.png)](/archived/images/d/d9/Process-AppDomain-Thread.png)

That's it in general, however the .NET Framework does not simply create a thread within the mono-process. It creates the thread within a **[http:/monodoc/T:System.AppDomain Application Domain]** as the picture shows. Within this article the first Application Domain that has automatically been created by the runtime is called the "main-domain". A Application Domain (or short: AppDomain) is an isolated code excecution environment within your main process running your application. It can be regarded as a "process within a process" or "lightweight process" since the code and memory occupied by each AppDomain can not be directly accessed by other Application Domains.

If a new Application Domain is being created it contains one new thread by default but applications can consist of multiple Application Domains each of them can have multiple threads. While threads only control the excecution of code Application Domain can do a little more. [http:/monodoc/T:System.Assembly Assemblys] can be loaded into a Application Domain during runtime and even Culture and Security settings can be set for each Domain. If an exception is being thrown and not caught within one of the threads, the whole Domain owning the thread dies. In cases where the application is being run within only one Domain the application dies. On the other hand processes containing multiple Domains will continue to live as long as the main-domain is still alive.

Why Threading?
--------------

The use of several threads in an application domains has several advantages over applications that only use one thread and application domain. First of all, threading keeps applications responsive. Think of an GUI application which does a lot of computing once you open a certain window or click a button. If this computing is done on the main-thread the whole thread would freeze until that long running operation has finished. You wouldn't even have the chance to move the window or do some other work within your program while waiting for the results. By separating the application into threads, one thread could work on the UI keep it responsible, and allow to do other stuff on the UI while the second thread does all his computing in the background. Once the background-thread is finished it informs the UI-thread about the results which are then being displayed to the user.

To make this concept more bulletproof against uncaught exceptions, multiple AppDomains could be used. In applications where the functionality is being extended by adding modules to it this concept could prevent that an unstable module would crash the whole program, only the crashed domain would be unloaded.

When not to use Threading?
--------------------------

Rule of thumb: **Whenever possible try to avoid using multiple application domains and threads.** Threading means a lot more work for the development and debugging/testing of applications since developers have to become extremely familiar with concurring resource access and locking mechanisms. In addition it makes reproducing bugs very hard and often unpredictable. In fact some operations can even be slowed if processed in several threads since allocating rssources between multiple threads and domains costs processor power as well.

Threads in Action
=================

This small Application shows how an integer var is being incremented using two Threads.

``` csharp
using System;
using System.Threading;
 
namespace ThreadGuideSamples {
    public class FirstUnsyncThreads {
        private int i = 0;
 
        public static void Main (string[] args) {
            FirstUnsyncThreads myThreads = new FirstUnsyncThreads ();
        }
 
        public FirstUnsyncThreads () {
            // Creating our two threads. The ThreadStart delegate is points to
            // the method being run in a new thread.
            Thread firstRunner = new Thread (new ThreadStart (this.firstRun));
            Thread secondRunner = new Thread (new ThreadStart (this.secondRun));
 
            // Starting our two threads. Thread.Sleep(10) gives the first Thread
            // 10 miliseconds more time.
            firstRunner.Start ();
            Thread.Sleep (10);
            secondRunner.Start ();
        }
 
        // This method is being excecuted on the first thread.
        public void firstRun () {
            while(this.i < 10) {
                Console.WriteLine ("First runner incrementing i from " + this.i +
                                  " to " + ++this.i);
                // This avoids that the first runner does all the work before
                // the second one has even started. (Happens on high performance
                // machines sometimes.)
                Thread.Sleep (100);
            }
        }
 
        // This method is being excecuted on the second thread.
        public void secondRun () {
            while(this.i < 10) {
                Console.WriteLine ("Second runner incrementing i from " + this.i +
                                  " to " + ++this.i);
                Thread.Sleep (100);
            }
        }
    }
}
```

It's output may be something like this:

    First runner incrementing i from 0 to 1
    Second runner incrementing i from 1 to 2
    Second runner incrementing i from 3 to 4
    First runner incrementing i from 2 to 3
    Second runner incrementing i from 5 to 6
    First runner incrementing i from 4 to 5
    First runner incrementing i from 6 to 7
    Second runner incrementing i from 7 to 8
    Second runner incrementing i from 9 to 10
    First runner incrementing i from 8 to 9

It's very obvious that this is a mess. What should have happened is that each runner increments `i` by 1 and then sleeps for one round. But that is not going to happen since there is no guarantee that a thread will sleep the exact same time. Instead the runner and incrementing gets mixed up because the two threads access `i` at the same time. This behavior is also being called **[Data Races](#data-races)**.

Synchronizing Threads
---------------------

To avoid **Data Races** access to `i` must be limited to only one thread at a time. This can be done by using the `lock` statement. `lock` takes an object as an token or monitor, that monitor can only be used by one `lock` statement at a time. If a thread reaches a `lock` statement it tries to gain access to the monitor and execution of that thread will be stopped at the statement until the monitor could be acquired. If the monitor could be acquired successfully program execution will continue and at the end of the `lock` block the monitor will be released again.

The monitor can be any object but it is recommended to create a new [http:/monodoc/T:System.Object Object] for each code that is being protected by an `lock` statement and accesses the same resources. It is possible to use multiple locks in one instance of a class (for example a multi-threaded Que can have one lock for the input and one for the output) and to use static monitors for `lock` statements.

The next example shows the first program that has been extended to use `lock` statements to avoid **[Data Races](#data-races)**

``` csharp
using System;
using System.Threading;
 
namespace ThreadGuideSamples {
    public class SecondSyncThreads {
        private int i = 0;
        // This is the lock for i, it must be an instance of any class.
        // By convinience a new object is being used.
        private object lock_i = new object ();
 
        public static void Main (string[] args) {
            SecondSyncThreads myThreads = new SecondSyncThreads ();
        }
 
        public SecondSyncThreads () {
            // Creating our two threads. The ThreadStart delegate is points to
            // the method being run in a new thread.
            Thread firstRunner = new Thread (new ThreadStart (this.firstRun));
            Thread secondRunner = new Thread (new ThreadStart (this.secondRun));
 
            // Starting our two threads. Thread.Sleep(10) gives the first Thread
            // 10 miliseconds more time.
            firstRunner.Start ();
            Thread.Sleep (10);
            secondRunner.Start ();
        }
 
        // This method is being excecuted on the first thread.
        public void firstRun () {
            do {
                // Here we are getting the lock
                lock(this.lock_i) {
                    if(this.i >= 10)
                        return;
 
                    Console.WriteLine ("First runner incrementing i from " + this.i +
                                      " to " + ++this.i);
                    // And here is it being released.
                }
                // This avoids that the first runner does all the work before
                // the second one has even started. (Happens on high performance
                // machines sometimes.)
                Thread.Sleep (100);
            } while(true);
        }
 
        // This method is being excecuted on the second thread.
        public void secondRun () {
            do {
                lock(this.lock_i) {
                    if(this.i >= 10)
                        return;
 
                    Console.WriteLine ("Second runner incrementing i from " + this.i +
                                      " to " + ++this.i);
                }
                Thread.Sleep (100);
            } while(true);
        }
    }
}
```

This will result in the following output:

    First runner incrementing i from 0 to 1
    Second runner incrementing i from 1 to 2
    First runner incrementing i from 2 to 3
    Second runner incrementing i from 3 to 4
    First runner incrementing i from 4 to 5
    Second runner incrementing i from 5 to 6
    First runner incrementing i from 6 to 7
    Second runner incrementing i from 7 to 8
    First runner incrementing i from 8 to 9
    Second runner incrementing i from 9 to 10

However this could still be improved by using a thread safe property like the following:

``` csharp
public MyType Prop {
    get {
        lock(this.lock_prop) {
            return this.prop;
        }
    }
}
```

Common Mistakes
===============

Here is a small list of the most common mistakes when writing threaded applications and how to avoid them.

Data Races
----------

If multiple threads compete to access the same resource (e.g. a variable) that's called a *data race*. To avoid data races, threads must be [synchronized](#synchronizing-threads). The ["Threads in Action"](#threads-in-action) part in this article contains more information on that topic.

Deadlocks
---------

A deadlock is what is happening when thread 1 holds lock 1 and tries to get lock 2, while thread 2 holds lock 2 and tries to get lock 1. The following code illustrates this problem.

``` csharp
using System;
using System.Threading;
 
namespace ThreadGuideSamples {
    public class Deadlock {
        object lock_1 = new object();
        object lock_2 = new object();
 
        public static void Main (string[] args) {
            Deadlock myDeadlock = new Deadlock ();
        }
 
        public Deadlock () {
            Thread t1 = new Thread (new ThreadStart (this.method1));
            Thread t2 = new Thread (new ThreadStart (this.method2));
 
            t1.Start ();
            // Again, giving the thread t1 some time to get the lock.
            Thread.Sleep (100);
            t2.Start ();
        }
 
        private void method1 () {
            Console.WriteLine ("Thread 1 trying to get lock_1");
            lock(this.lock_1) {
                Console.WriteLine ("Thread 1 got lock_1");
                // Now sleep to ensure that t2 gets lock_2 before t1 finishes.
                Thread.Sleep(200);
                Console.WriteLine ("Thread 1 trying to get lock_2");
                lock(this.lock_2) {
                    Console.WriteLine ("Thread 1 got lock_2");
                }
            }
        }
 
        private void method2 () {
            Console.WriteLine ("Thread 2 trying to get lock_2");
            lock(this.lock_2) {
            Console.WriteLine ("Thread 2 got lock_2");
            Console.WriteLine ("Thread 2 trying to get lock_1");
                lock(this.lock_1) {
                    Console.WriteLine ("Thread 2 got lock_1");
                }
            }
        }
    }
}
```

The console will display this and the program will hang:

    Thread 1 trying to get lock_1
    Thread 1 got lock_1
    Thread 2 trying to get lock_2
    Thread 2 got lock_2
    Thread 2 trying to get lock_1
    Thread 1 trying to get lock_2

Unfortunately there is no role solution for avoiding deadlocks. However keeping track what locks are being used where will help finding the reason for deadlocks.

A little more advanced Threading
================================

As this article has been written with complete beginners in mind it does not cover any extremely complicated material however there are some little more advanced techniques which beginners should be aware of.

Passing Parameters to Threads
-----------------------------

In cases where a new thread is used to accomplish some background work it is useful to pass information to the method being executed on a new thread. Although this is possible in .Net it requires a different approach on how to achieve this in .Net 1.1 and 2.0.

As Mono now has complete support for 2.0, it is best to use this method.

### .NET 2.0

With new Thread constructors and language features, passing parameters to a thread has become very simple:

``` csharp
using System;
using System.Threading;
 
class ThreadCaller {
    static void Main ()
        {
        ThreadCaller myCaller = new ThreadCaller();
    }
 
    public ThreadCaller ()
        {
        Thread myThread = new Thread (delegate (object myValue){
                Thread.Sleep (1000);
            Console.WriteLine (String.Format ("The parameter have" +
                                            " a {0} in it's value",
                                            myValue));
            });
 
        // Passing the start-argument to the thread (10 in this case)
        myThread.Start (10);
        Console.ReadKey ();
    }
}
```

If you prefer to use a separate method, and not use anonymous methods, you would be writing something like this. The Start method now takes an object parameters that is passed:

``` csharp
using System;
using System.Threading;
 
namespace ThreadGuideSamples {
    class ThreadCaller {
        static void Main () {
            ThreadCaller myCaller = new ThreadCaller();
        }
 
        public ThreadCaller () {
            Thread myThread = new Thread (new
                                         ParameterizedThreadStart (
                                            this.SecondThread));
 
            // Passing the start-argument to the thread (10 in this case)
            myThread.Start (10);
            Console.ReadKey ();
        }
 
        public void SecondThread (object myValue) {
            Thread.Sleep (1000);
            Console.WriteLine (String.Format ("The parameter have" +
                                            " a {0} in it's value",
                                            myValue));
        }
    }
}
```

The console will display this:

    The parameter have 10 in it's value

### .NET 1.1

The ThreadStart delegate doesn't take any parameters, so the parameters must be stored somewhere else. A good way to do this, is to create a new object which should be executed on a different thread, and store the parameters in some of it properties.

``` csharp
using System;
using System.Threading;
 
namespace ThreadGuideSamples {
    class ThreadCaller {
        static void Main () {
            ThreadCaller myCaller = new ThreadCaller();
        }
 
        public ThreadCaller () {
            // Constructor gets the first parameter
            SecondThreadObject myThreadObject = new
                    SecondThreadObject ("Test Param");
 
            // Setting another property of the new Thread-Object
            myThreadObject.Parameter2 = 10;
            Thread myThread = new Thread (new ThreadStart (
                        myThreadObject.MyAsyncMethod));
            myThread.Start ();
        }
    }
 
    class SecondThreadObject {
        string my_param1;
        int my_param2;
 
        public SecondThreadObject (string parameter1) {
            this.my_param1 = parameter1;
        }
 
        public int Parameter2 {
            set {
                this.my_param2 = value;
            }
        }
 
        public void MyAsyncMethod () {
            Console.WriteLine ("The value passed in " +
                               "the Constructor is '{0}'",
                               this.my_param1);
            Console.WriteLine ("The value passed in " +
                               "the Property is '{0}'",
                               this.my_param2);
            for (int x = 0; x < 50; x++)
                Console.WriteLine (x);
            Console.ReadKey ();
        }
    }
}
```

The console will display this:

    The value passed in the Constructor is 'Test Param'
    The value passed in the Property is '10'
    0
    1
    .
    .
    .
    49

Accessing the Main-Thread with Callback
---------------------------------------

In some applications you need to access to the caller thread (the main thread). In this case you can use a callback delegate to access to it, like this:

``` csharp
using System;
using System.Threading;
 
namespace ThreadGuideSamples {
    public delegate void MyCallBack (int Response);
 
    class ThreadCaller {
        static void Main () {
            ThreadCaller myCaller = new ThreadCaller ();
        }
 
        public ThreadCaller () {
            // Passing an MyCallBack-Delegate to the object executed on the
            // different thread.
            SecondThreadObject myThreadObject = new
                    SecondThreadObject (new MyCallBack(this.OnResponse));
 
            // Starting the thread as usual
            Thread myThread = new Thread (new
                ThreadStart (myThreadObject.MyAsyncMethod));
            myThread.Start ();
        }
 
        // Target-Destination for messages from our thread
        protected void OnResponse (int response) {
            Console.WriteLine ("Value returned to " +
                              "main thread {0}", response);
        }
    }
 
    class SecondThreadObject {
        protected MyCallBack On_Response = null;
 
        public SecondThreadObject (MyCallBack callback) {
            this.On_Response = callback;
        }
 
        public void MyAsyncMethod () {
            for (int i = 0; i < 50; i++)
                if (this.On_Response != null)
                    // Invoke the call back delegate
                    this.On_Response (i);
            Console.ReadKey ();
        }
    }
}
```

The console will display this:

    Value returned to main thread 0
    Value returned to main thread 1
    Value returned to main thread .
    Value returned to main thread .
    Value returned to main thread 48
    Value returned to main thread 49

Resources and further reading
=============================

1.  Multi-threading in .NET: Introduction and suggestions ([http://www.yoda.arachsys.com/csharp/threads/](http://www.yoda.arachsys.com/csharp/threads/))
2.  Microsoft MSDN Library ([http://msdn2.microsoft.com/en-us/library/default.aspx](http://msdn2.microsoft.com/en-us/library/default.aspx))
3.  Threading in C\# by Joseph Albahari ([http://www.albahari.com/threading/index.html](http://www.albahari.com/threading/index.html))


