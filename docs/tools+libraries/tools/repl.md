---
title: C# REPL
redirect_from:
  - /CsharpRepl/
---

[![Xbyhja.png](/archived/images/9/9c/Xbyhja.png)](/archived/images/9/9c/Xbyhja.png)

C# GUI Shell

This documents the features available in the C# interactive shell that is part of Mono's C# compiler. An interactive shell is usually referred to as a read eval print loop or repl. The C# interactive shell is built on top of the [Mono.CSharp](http://docs.go-mono.com/index.aspx?link=N:Mono.CSharp) library, a library that provides a C# compiler service that can be used to evaluate expressions and statements on the flight as well as creating toplevel types (classes, structures, enumerations).

## Using it

To use the C# compiler in interactive mode, you need to start it with the the "csharp" command from the command line:

``` bash
$ csharp
Mono C# Shell, type "help;" for help
 
Enter statements below.
csharp>
```

Statements and expression can take multiple lines, for example, consider this LINQ query that displays all the files modified in the /etc directory in the last week. The prompt changes from "csharp" to " \>" to indicate that new input is expected:

``` bash
csharp> using System.IO;
csharp> from f in Directory.GetFiles ("/etc")
      >   let fi = new FileInfo (f)
      >   where fi.LastWriteTime > DateTime.Now-TimeSpan.FromDays(7) select f;
{ "/etc/adjtime", "/etc/asound.state", "/etc/mtab", "/etc/printcap", "/etc/resolv.conf" }
csharp>
```

A GUI version of this tool is called `gsharp` and is available when you install the `mono-tools` package:

[![test.png](/archived/images/9/9c/Xbyhja.png)](/archived/images/9/9c/Xbyhja.png)

## Details

#### Presets

When you startup the interactive shell, the System, System.Linq and System.Collections and System.Collections.Generic namespaces have already been imported for you.

#### Command line editing

The interactive shell supports an Emacs-like command line editor, just like the Bash shell or other Unix tools so it should integrate naturally into your shell experience.

In Mono 2.6 the csharp shell also includes auto-completion. This is triggered by using the tab key.

In Mono 4.4.0, completion is automatically triggered with the "." key as well, and if there are matches, a popup window will show up allowing users to select a value.

#### Using Declarations

Unlike compile mode when the using statement are only allowed before any declarations have been parsed, in interactive mode you can enter using statements as you go. The using statements only will have an effect for any future uses.

The using declarations must appear on their own and can not be mixed with regular statements in a single line, for example:

``` bash
csharp> using System;
csharp> Console.WriteLine ("hello");
hello
csharp>
```

Is a valid use of the using statement, but the following is invalid:

``` bash
csharp> using System; Console.WriteLine ("hello");
```

#### Local Variable Declarations

You can use the local variable declaration in the interactive shell, but the compiler will turn all top-level declarations into static class fields. This is necessary as every statement is actually hosted in an individual class and an individual method.

The semantics have been extended to allow `var` declarations, so it is possible to write:

``` bash
csharp> var a = "hello, world";
```

And have `a`'s type be resolved to string.

When using the interactive shell, it is possible to redeclare variables to have different meaning than the one they had previously on the session, the following for example is valid:

``` bash
csharp> var a = "hello world";
csharp> var a = 1;
```

The new declaration of a will override the older declaration.

#### Multi-line input

If your code does not fit in a single line, you can enter expressions in multiple lines. The shell will not execute the code until a valid expression has been entered or a syntax error is flagged.

A special prompt is shown to indicate that ics is waiting for input:

``` bash
csharp> var list = new int [] {1,2,3};
csharp> var b = from x in list
   >    where x > 1
   >    select x;
csharp> b;
```

#### Built-in Methods

A few static methods and public fields can be used from the shell, these are:

-   LoadAssembly (string): Loads the given assembly, equivalent to passing the -r:NAME to the compiler.
-   LoadPackage(string): Loads the given package, equivalent to passing the -pkg:NAME to the compiler.
-   ShowVars (): shows all the current variable declarations in scope.
-   ShowUsing (): show the current using statements in effect.
-   Describe (object o): Shows the type definition for an object.

<!-- -->

``` bash
csharp> var a = 1;
csharp> var b = "hello";
csharp> ShowVars ();
int a
string b
csharp>
```

The GUI version includes a handful of other methods:

-   Plot (DoubleFunc f1 \[,f2 \[,f3 \[,f4\]\]\]): Plots one or more functions in the buffer.

[![GSharpPlot.png](/archived/images/7/75/GSharpPlot.png)](/archived/images/7/75/GSharpPlot.png)

In the GUI it is also possible to register your own custom transformation objects for rendering the expression results. This allows you to render objects differently:

-   RegisterTransformHandler (RenderHandler rh): Use this to register a custom transformer for an object.
-   UnregisterTransformHandler (RenderHandler rh): Use this to unregister a trasformer handler.

The GUI version is able to embed Gtk.Widgets when a rendering handler has been registered. The shell will call all registered methods and pass the result of an operation, and if the operation returns a [Gtk.Widget](http://docs.go-mono.com/index.aspx?link=Gtk.Widget) that is used instead of the string representation.

This can be layered multiple times, the following example shows how to register a handler to render true and false:

[![GSharpRenderHandler.png](/archived/images/b/bf/GSharpRenderHandler.png)](/archived/images/b/bf/GSharpRenderHandler.png)

Notice that a simple call that returns a widget will not embed the widget itself:

``` csharp
   csharp> LoadPackage ("gtk-sharp-2.0");
   csharp> new Gtk.Window ("Click me");
   {  }
   csharp>
```

This is to avoid having your widgets automatically parented into the shell.

At least one transformation step must be applied before a [Gtk.Widget](http://docs.go-mono.com/index.aspx?link=T:Gtk.Widget) will be considered for embedding.

#### Built-in Properties

-   object quit {get;} terminates the program.
-   string help {get;} shows the help for available commands.
-   string Prompt {get;set} a variable that holds the current primary prompt.
-   string ContinuationPrompt {get;set} a variable that holds the current continuation prompt.

The GUI version introduces a few more:

-   bool Attached {get;} if the code is running attached to another process.
-   Gtk.Widget MainWindow {get;} the Gtk.Widget representing the toplevel GUI shell.

#### Grammar

The Interactive Shell allows valid C# statements as well as expressions to be entered interactively. Unlike the batch-compiled C#, plain expressions are allowed, for example, this is valid input in the interactive mode that is invalid on batch mode:

``` bash
csharp> 1 == 2;
false
csharp>
```

## Startup Files

On startup the csharp shell will load any C# script files (ending with .cs) and pre-compiled libraries (ending with .dll) that are located in the \~/.config/csharp directory (on Windows this is the value of Environment.GetFolderPath (Environment.SpecialFolder.ApplicationData)).

The assemblies are loaded first, and then the scripts are executed. This allows your scripts to depend on the code defined in the assemblies.

C# script files are merely files that contains statements and expressions, they can not contain full class definitions, those should be stored and precompiled in DLL files.
