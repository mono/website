---
title: Java
redirect_from:
  - /Java/
---

Mono is able to run Java code side-by-side with .NET as well as having Java and .NET object interoperate with each other. This is done with [IKVM](http://www.ikvm.net) the Java VM implementation that runs on top of .NET and Mono. IKVM was developed by Jeroen Frijters for the .NET Framework. Zoltan Varga ported it to Mono and fixed the Mono runtime to support the features required by IKVM. The class library runtime for IKVM is the [GNU Classpath](http://www.gnu.org/software/classpath/classpath.html), which is rapidly advancing but not entirely complete. IKVM is fully supported by Mono and its part of the standard Mono package distribution. As it stands today, it is able to run popular applications like Eclipse and Derby.

There are two possible ways of using IKVM: one is to use it as a Just-in-Time compiler which translates the Java bytecodes into .NET Intermediate Language as it goes. But this means that at runtime you are compiling things twice: the Java-to-CIL JIT and the CIL-to-Native JIT.

We are going to build some samples using Gtk\#

Gtk\# is really a bad name. Because Gtk\# is not limited to C\#, any programming language in the .NET framework can use it today and because it covers more than only the Gtk API, it covers various other components of the GNOME Development Platform.

Exposing .NET Libraries to Java
===============================

Now, Gtk\# is a .NET assembly (this is the ECMA lingo for "library"), and Java does not know anything about this. It is necessary first to generate some stubs for these classes to let the Java compiler knows about the types defined in the C\# world. This is done using the `netexp.exe `program from IKVM, like this:

``` bash
$ ikvmstub /mono/lib/mscorlib.dll
$ ikvmstub /mono/lib/mono/gtk-sharp/gtk-sharp.dll
$ ikvmstub /mono/lib/mono/gtk-sharp/glib-sharp.dll
$ ikvmstub /mono/lib/mono/gtk-sharp/atk-sharp.dll
```

The above commands basically "imports" all of the types and their definitions into something suitable for Java to consume, the result is:

``` bash
$ ls *.jar
atk-sharp.jar  glib-sharp.jar  gtk-sharp.jar  mscorlib.jar
```

The `ikvmstub `program will import all of the types into the "cli" namespace. So if you had a class called "Gtk.Window", it will be exposed to Java as "cli.Gtk.Window".

Compiling Our Program
=====================

This is a very basic Java program that initializes Gtk\#:

``` csharp
import cli.Gtk.*;
public class Demo {
    public static void main(String[] args) {
        Application.Init ();
        Application.Run ();
    }
}
```

To compile the above program type:

``` bash
$ javac -classpath gtk-sharp.jar Demo.java
```

This produces a `Demo.class `file that contains the Java bytecodes. The -classpath file instructs the Java compiler to find the type definitions on the `gtk-sharp.jar `file that we had previously produced with `ikvmstub `.

Running Our Java Code in Mono
=============================

Now, it is not possible to run this directly in Java, since the jar files produced by netexp.exe are only stubs, so we will need to run this in the Mono world using IKVM in JIT mode:

    $ ikvm -classpath .:gtk-sharp.jar Demo

The above just sits there waiting for events, so feel free to kill that. We will now add some meat to the program, this is a slightly more interesting sample:

``` csharp
import cli.Gtk.*;
import cli.GLib.*;
 
public class Demo {
    public static void main(String[] args) {
        Application.Init ();
        Window w = new Window ("Hello Mono with Java#");
        Button b = new Button ("Click me");
        w.Add (b);
        w.ShowAll ();
        Application.Run ();
    }
}
```

To compile, you will need to reference the libraries we created before:

    $ javac -classpath 'gtk-sharp.jar:glib-sharp.jar:atk-sharp.jar:
    mscorlib.jar:.' Demo.java

This will produce `Demo.class`. Now run it:

    $ ikvm -classpath .:gtk-sharp.jar Demo

The result is shown here:

[![Java.png](/archived/images/2/26/Java.png)](/archived/images/2/26/Java.png)

The above is basically translating Demo.class from JVM bytecodes to ECMA CIL, then the Mono JIT translates that into native x86 code. The next step is to precompile the Java code directly into .NET code, which will skip the double JIT process:

    $ ikvmc -reference:`pwd`/classpath.dll Demo.class gtk-sharp.jar
    $ ls *exe
    Demo.exe

The above compiled the code directly into a a Mono/.NET executable. To run it, just do:

    $ mono Demo.exe

Compiling Java Code to x86 Code
===============================

But we can go one step further. We can avoid completely the JIT process by precompiling the .exe file which contains instructions in the ECMA Common Intermediate Language into native x86 code using Mono's Ahead-of-Time compiler, to do this, type:

    $ mono --aot Demo.exe
    $ ls Demo.*
    Demo.class  Demo.dll  Demo.exe  Demo.exe.so

The `Demo.exe.so `contains the native x86 code. Mono still requires the Demo.exe file to be around to extract metadata, but the Just-in-Time compiler will not be used in that case:

    $ mono Demo.exe

Mono detects the shared object file and resolves methods to those contained in the image file. You can see the native code generated by using the objdump command:

    $ objdump -d Demo.exe.so
       ...

How Complete is Mono/IKVM?
==========================

Mono and IKVM depend on the GNU Classpath, so it is as complete as open source Java, but you get the added advantage of accessing any Mono/.NET libraries as well.

Today Mono/IKVM can run large applications like Eclipse, Jython and JBoss. Screenshot of [Eclipse running on Mono](http://primates.ximian.com/~miguel/images/eclipse-mono.png) .

