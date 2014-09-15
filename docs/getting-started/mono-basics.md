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

To compile, use gmcs:

    mcs hello.cs

Either compiler will create "hello.exe", which you can run using:

    mono hello.exe

The program should run and output:

    Hello Mono World

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

To compile, use gmcs with the -pkg option to tell the compiler to pull in the Gtk# libraries:

    mcs hello.cs -pkg:gtk-sharp-2.0

The compiler will create "hello.exe", which you can run using:

    mono hello.exe

Winforms Hello World
--------------------

The following program tests writing a Winforms application.

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

To compile, use gmcs with the -pkg option to tell the compiler to pull in the Winforms libraries:

    mcs hello.cs -pkg:dotnet

Either compiler will create "hello.exe", which you can run using:

    mono hello.exe

NOTE: on mac osx you'll have to wait around a minute the very first time you run this command.

ASP.Net Hello World
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

Then run the xsp2 command from that directory:

``` bash
xsp2
```

Use a web browser to contact [http://localhost:8080/hello.aspx](http://localhost:8080/hello.aspx)

