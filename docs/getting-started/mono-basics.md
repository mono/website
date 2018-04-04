---
title: Mono Basics
redirect_from:
  - /Mono_Basics/
---

After you get Mono installed, it's probably a good idea to run a quick Hello World program to make sure everything is set up properly. That way you'll know that your Mono is working before you try writing or running a more complex application.

Console Hello World
-------------------

To test the most basic functionality available, copy the following code into a file called hello.cs.

``` csharp
using System;
 
public class HelloWorld
{
    static public void Main ()
    {
        Console.WriteLine ("Hello Mono World");
    }
}
```

To compile, use mcs:

    csc hello.cs

The compiler will create "hello.exe", which you can run using:

    mono hello.exe

The program should run and output:

``` bash
Hello Mono World
```

HTTPS connections
-----------------

To make sure HTTPS connections work, download and run the [tlstest](https://raw.github.com/mono/mono/master/mcs/class/Mono.Security/Test/tools/tlstest/tlstest.cs) tool (needs Mono >= 3.4.0).

``` bash
csc tlstest.cs -r:System.dll
mono tlstest.exe https://www.nuget.org
```

The program prints an error if something is wrong.

WinForms Hello World
--------------------

The following program tests writing a System.Windows.Forms application.

``` csharp
using System;
using System.Windows.Forms;

public class HelloWorld : Form
{
    static public void Main ()
    {
        Application.Run (new HelloWorld ());
    }

    public HelloWorld ()
    {
        Text = "Hello Mono World";
    }
}
```

To compile, use csc with the -r option to tell the compiler to pull in the WinForms libraries:

    csc hello.cs -r:System.Windows.Forms.dll

The compiler will create "hello.exe", which you can run using:

    mono hello.exe

NOTE: on Mac OS X you'll have to wait around a minute the very first time you run this command. You also need to use `mono32` since WinForms isn't supported on 64bit yet.

ASP.NET Hello World
-------------------

Create a text file with the name hello.aspx and the content:

``` csharp
<%@ Page Language="C#" %>
<html>
<head>
   <title>Sample Calendar</title>
</head>
<asp:calendar showtitle="true" runat="server">
</asp:calendar>
```

Then run the xsp4 command from that directory:

``` bash
xsp4 --port 9000
```

Use a web browser to contact [http://localhost:9000/hello.aspx](http://localhost:9000/hello.aspx)

Gtk# Hello World
-----------------

The following program tests writing a Gtk# application.

``` csharp
using Gtk;
using System;

class Hello
{
    static void Main ()
    {
        Application.Init ();

        Window window = new Window ("Hello Mono World");
        window.Show ();

        Application.Run ();
    }
}
```

To compile, use mcs with the -pkg option to tell the compiler to pull in the Gtk# libraries (note that Gtk# must be installed on your system for this to work):

    mcs hello.cs -pkg:gtk-sharp-2.0

The compiler will create "hello.exe", which you can run using:

    mono hello.exe
