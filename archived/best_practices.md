---
title: "Best Practices"
lastmodified: '2007-01-27'
redirect_from:
  - /Best_Practices/
---

Best Practices
==============

*Currently, this page is being used as a scratch pad for collecting a list of some best practices for developing with mono/gtk-sharp. Append the list to contribute... the list will be turned into a friendlier page at a later date.*

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#c-20">1 C# 2.0</a></li>
<li><a href="#threading">2 Threading</a>
<ul>
<li><a href="#gtk-and-threading">2.1 Gtk# and Threading</a>
<ul>
<li><a href="#running-code-on-the-gtk-main-loop-thread">2.1.1 Running code on the Gtk main loop thread</a></li>
<li><a href="#avoid-gdk-locking">2.1.2 Avoid Gdk locking</a></li>
</ul></li>
</ul></li>
<li><a href="#platform-invoke">3 Platform Invoke</a></li>
<li><a href="#execution">4 Execution</a>
<ul>
<li><a href="#mono-path">4.1 MONO_PATH</a></li>
</ul></li>
<li><a href="#cryptography">5 Cryptography</a>
<ul>
<li><a href="#creating-instances-of-cryptographic-classes">5.1 Creating instances of cryptographic classes</a>
<ul>
<li><a href="#example">5.1.1 Example</a></li>
</ul></li>
<li><a href="#development-tools">5.2 Development Tools</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

C\# 2.0
=======

Some features of C\# 2.0 are available on our C\# 1.0 compiler that will generate code that still runs on the 1.x profile or .NET 1.1.

Essentially all features of C\# 2.0 except generics and nullable types are supported by our C\# 1.0 compiler.

-   You can actually use anonymous methods without using the gmcs compiler, so what are you waiting for? Just be smart about it.

**BEWARE**: As stated these sources will only be compilable as an 1.X assembly using **mcs**. In .NET you'll need **csc 2.0** to compile such sources and then it will generate a **2.0-only** assembly.

Threading
=========

Gtk\# and Threading
-------------------

Gtk\# is not a thread-safe toolkit, which means that only one thread at a time can safely invoke methods on Gtk\#. This thread is typically the thread executing the main loop (which is when control has been explicitly transfered to Gtk).

When application developers need to have threads update some element of the graphical user interface they have to either acquire a lock that allows them to issue Gtk\# toolkit invocations or they can make their code execute on the same thread as the one thread that executes the main loop.

The first method, obtaining the GTK thread context is often error-prone. It is strongly recommended that application developers stay away from locking and instead they use a mechanism that makes their code run on the main loop thread.

Sometimes people use threads because they want to write [responsive applications]({{ site.github.url }}/Responsive_Applications "Responsive Applications"). There are many other ways to write these applications, see our page [Responsive Applications]({{ site.github.url }}/Responsive_Applications "Responsive Applications") for more details.

### Running code on the Gtk main loop thread

To invoke a method on the GTK+ main loop thread and avoid any threading problems with GTK, you can use the Gtk.Application.Invoke() method (if you are targetting Gtk\# 1.0 you can use Gtk.ThreadNotify).

> ``` csharp
> public void ThreadedMethod()
> {
>     Gtk.Application.Invoke(delegate {
>         do_stuff_in_main_thread();
>     });
> }
> ```

Using Application.Invoke is particularly useful because you can use anonymous methods, which automatically provide capturing of the parent method's variables:

> ``` csharp
> public void CountingThread ()
> {
>     for (int i = 0; i < 100; i++){
>           SlowComputation ();
>           Gtk.Application.Invoke (delegate {
>              status_label.Text = String.Format ("Iteration {0}", i)
>           });
>     }
> }
> ```

### Avoid Gdk locking

The use of Gdk.Threads.Enter() and Gdk.Threads.Leave() might lead to code that leaves GTK+ in an inconsistent state, for example:

``` csharp
void UpdateDisplay ()
{
        Gdk.Threads.Enter ();
        DoUpdate ();
        Gdk.Threads.Leave ();
}
```

If "DoUpdate()" produces an exception it would keep the lock for Gdk held. Sometimes the exceptions are not even visible if the exception happens from a thread in the threadpool (this is the behavior on the 1.x profile). A better, but still discouraged practice would be:

``` csharp
void BetterDisplay ()
{
        Gdk.Threads.Enter ();
        try {
              DoUpdate ();
        } finally {
              Gdk.Threads.Leave ();
        }
}
```

We still recommend against using this technique as it is easy to make the above code fail or fail to catch a return path or close Gdk.Thread.Leave too early.

It is always best to explicitly run any Gtk\# code on the main thread by using the ThreadNotify pattern or using Application.Invoke()

Platform Invoke
===============

-   If you want to debug a particular problem with DllImport see our [DllNotFoundException]({{ site.github.url }}/DllNotFoundException "DllNotFoundException") page.

-   Describe dllmap issues/solutions/etc... don't map to unversioned/symlinked libraries... maybe talk about building internal shared libraries with -module -avoid-version
    -   See also the `mono-shlib-cop` program.

-   The P/Invoke guide, [Interop with Native Libraries]({{ site.github.url }}/Interop_with_Native_Libraries "Interop with Native Libraries").

Execution
=========

-   Avoid using the --config mono option in wrapper scripts, instead use properly-named config files for assemblies

-   Don't touch MONO\_PATH or MONO\_GAC\_PATH.

-   Don't pass --debug to mono in production scripts, it increases memory usage.

-   Avoid Thread.Abort

-   Do not use the System.Threading Mutex/\*Event methods. You want the Monitor methods. The runtime is free to do better optimizations on them.

MONO\_PATH
----------

The MONO\_PATH environment variable was added to assist developers debug applications but it tends to be used in production deployments which break the semantics of assembly loading in subtle ways. In ways that might break your application.

MONO\_PATH overwrites the assembly loading process and will ignore assemblies that should be pulled from the [Global Assembly Cache]({{ site.github.url }}/Assemblies_and_the_GAC "Assemblies and the GAC"), it is merely a debugging tool and you should avoid its use.

If you are using MONO\_PATH to point to a directory where your program should load libraries from, we recommend that instead you make your application follow the [Application Deployment Guidelines]({{ site.github.url }}/Guidelines:Application_Deployment "Guidelines:Application Deployment") which will solve most of those issues.

Cryptography
============

Creating instances of cryptographic classes
-------------------------------------------

There are many ways to create instances of cryptographic algorithms provided in the .NET framework. The most common and natural way is by using the `new` operator. E.g.

``` csharp
SHA1CryptoServiceProvider sha1 = new SHA1CryptoServiceProvider ();
```

However this create a specific implementation that cannot be changed without recompiling your application. This is problematic because it limit scalability and adaptability of your application. A more general, but confusing, method is to use the `CryptoConfig` class to create every instances. This allows the runtime to select the default implementation for each algorithm (e.g. choosing between `SHA1CryptoServiceProvider` and `SHA1Managed`) based on the configuration present in the **machine.config** file.

Another option is to use the `Create` method helpers present in the abstract base classes of each algorithm (e.g. `SHA1`) or type of algorithm (e.g. `HashAlgorithm`). Those `Create` methods use `CryptoConfig` so adaptability is preserved and are much easier/nicer to use. E.g.

``` csharp
// first level parent - use if you need a SHA1 digest
SHA1 sha1 = SHA1.Create ();
 
// second level parent - use if you need (or plan) to change hash algorithm
// or if you want to be algorithm-independant
HashAlgorithm hash = (HashAlgorithm) SHA1.Create ();
 
// top level - not much useful but possible
object o = CryptoConfig.CreateFromName ("SHA1");
```

Why should you bother ? Well every application that has hardcoded the use of a specific cryptographic implementation, e.g. `SHA1CryptoServiceProvider`, cannot benefit from a re-map (in machine.config). This primarily affects:

-   Scalability: Your application may be required to perform much higher performance than possible on the current PC architecture. Such applications normally use a HSM (hardware security module) to perform high speed cryptographic operation (e.g. SSL acceleration). By using a specific implementation directly you cannot benefit from hardware (or even native) optimization without recompiling your application(s).
-   Adaptability: Sometime things goes wrong. A cryptographic implementation can show bad behavior (like using badly-generated keys), be buggy or unstable. E.g.
    -   Microsoft added those lines in the WSE.config (Web Service Enchancement) to document why they switched the default SHA1 implementation from `SHA1CryptoServiceProvider` to `SHA1Managed`: **For the V1 version of the Microsoft .NET Framework, it is necessary to re-map the SHA1 algorithm implementation to the managed code version to allow for greater stability under stress conditions.**. This change could be done because `SHA1.Create ()`, and not `new SHA1CryptoServiceProvider ()` was always used to create instances of SHA-1.
    -   Using a base class makes it much easier to support several cryptographic algorithms within your application because they all share the same methods and properties.

### Example

Consider an application that returns the hash of a file (i.e. similar to md5sum):

``` csharp
static void Main(string[] args)
{
        HashAlgorithm hash = HashAlgorithm.Create (args[0]);
        FileStream fs = new File.OpenRead (args[1]);
        byte[] digest = hash.ComputeHash (fs);
        fs.Close ();
        Console.Write ("Hash: {0}", BitConverter.ToString (digest));
}
```

This application would work with every hash algorithm supported by the framework (i.e. MD5, SHA1, SHA-256, SHA-384 and SHA-512). In fact it would work with newer hash algorithm if some are added to a future version of the .NET framework (e.g. RIPEMD-160 support was added in 2.0) or with implementations residing outside the framework (e.g. Mono.Security.dll also provides implementations of MD2, MD4 and SHA-224). Another similar example could be a file encryption utility.

 Using the `Create` methods isn't much harder and offer an easy way to get your code independent from a specific implementation - including all it's potential defaults. However every rule has it's exceptions. In this case some crypto implementations (like RSA and DSA) add properties and methods that aren't accessible using their abstract base class (like the `PersistKeyInCsp` property) - so **if** you need those **extras** then you must use the specific implementations.

Development Tools
-----------------

You can use [Gendarme]({{ site.github.url }}/Gendarme "Gendarme") and [bugfinder](http://forge.novell.com/modules/xfmod/project/?bugfinder) to look into your assemblies for common programming mistakes.

