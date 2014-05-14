---
layout: obsolete
title: "Mono Basics"
permalink: /old_site/Mono_Basics/
redirect_from:
  - /Mono_Basics/
---

Mono Basics
===========

After you get Mono installed, it's probably a good idea to run a quick Hello World program to make sure everything is set up properly. That way you'll know that your Mono is working before you try writing or running a more complex application.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#console-hello-world">1 Console Hello World</a></li>
<li><a href="#gtk-hello-world">2 Gtk# Hello World</a></li>
<li><a href="#winforms-hello-world">3 Winforms Hello World</a></li>
<li><a href="#aspnet-hello-world">4 ASP.Net Hello World</a></li>
</ul></td>
</tr>
</tbody>
</table>

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

    gmcs hello.cs

Either compiler will create "hello.exe", which you can run using:

    mono hello.exe

The program should run and output:

    Hello Mono World

Gtk\# Hello World
-----------------

The following program tests writing a Gtk\# application.

``` csharp
using Gtk;
using System;
 
class Hello {
 
        static void Main()
        {
                Application.Init ();
 
                Window window = new Window ("helloworld");
                window.Show();
 
                Application.Run ();
 
        }
}
```

To compile, use gmcs with the -pkg option to tell the compiler to pull in the Gtk\# libraries:

    gmcs hello.cs -pkg:gtk-sharp-2.0

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

    gmcs hello.cs -pkg:dotnet

Either compiler will create "hello.exe", which you can run using:

    mono hello.exe

ASP.Net Hello World
-------------------

Create a text file with the extension .aspx and put on it:

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
$ xsp2
```

Use a web browser to contact [http://localhost:8080/filename.aspx](http://localhost:8080/filename.aspx)

