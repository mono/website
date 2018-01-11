---
layout: blog
title: "Mono's New .NET Interpreter"
author: Miguel de Icaza
tags: [runtime]
---

Mono is complementing its Just-in-Time compiler and its static
compiler with a .NET interpreter allowing a few new ways of running
your code.

In 2001 when the Mono project started, we wrote an interpreter for the
.NET instruction set and we used this to bootstrap a self-hosted .NET
development environment on Linux.

At the time we considered the interpreter a temporary tool that we
could use while we built a Just-in-Time (JIT) compiler. The
interpreter (`mint`) and the JIT engine (`mono`) existed side-by-side
until we could port the JIT engine to all the platforms that we
supported.

When generics were introduced, the engineering cost of keeping both
the interpreter and the JIT engine was not worth it, and we did not
see much value in the extra work to keep it around, so we removed the
interpreter.

We later introduced full static compilation of .NET code. This is a
technology that we introduced to target platforms that do not allow
for dynamic code generation. iOS was the main driver for this, but it
opened the doors to allow Mono to run on gaming consoles like the
PlayStation and the Xbox.

The main downside of full static compilation is that a completely new
executable has to be recreated every time that you update your
code. This is a slow process and one that was not suitable for
interactive development that is practiced by some.

For example, some game developers like to adjust and tweak their game
code, without having to trigger a full recompilation. The static
compilation makes this scenario impractical, so they resort to
embedding a scripting language into their game code to quickly iterate
and tune their projects.

This lack of .NET dynamic capabilities also prevented many interesting
uses of .NET as a teaching or prototyping tool in these environments.
Things like Xamarin Workbooks, or simple scripting could not use .NET
languages and had to resort to other solutions on these platforms.

Frank Krueger, while building his [Continuous
IDE](http://continuous.codes/), needed such environment on iOS so much
that he wrote his own .NET interpreter using F# to bring his vision of
having a complete development environment for .NET on the iPad.

To address these issues, and to support some internal Microsoft
products, we brought Mono's interpreter back to life, and it is back
with a twist.

# New Mono Interpreter

We resuscitated Mono's old interpreter and upgraded its .NET support,
adding the support for generics and upgraded it to run .NET as it
exists in 2017.  Next is adding support for mixed-mode
execution.

It is one of the ways that Mono runs on WebAssembly today for example
(the other being the static compilation using LLVM)

The interpreter is now part of mainline Mono and it passes a large
part of our extensive test suites, you can use it today when building
Mono from source code, like this:

```bash
$ mono --interpreter yourassembly.exe
...
```

# Mixed Mode Execution

While the interpreter alone is now in great shape, we are currently
working on a configuration that will allow us to mix both interpreted
code with statically compiled code or Just-in-Time compiled code, we
call this mixed mode execution.

For platforms like iOS, PlayStation and Xbox, this means that you can
precompile your core libraries or core application, and still support
loading and executing code dynamically.  Gaining the benefits of
having all your core libraries optimized with LLVM, but still have the
flexibility of running some dynamic code.

This will allow game developers to prototype, experiment and tweak
their games using .NET languages on their system without having to
recompile their applications.

It will open the doors for scriptable applications on device using
.NET languages as well.

# Future work

We are extending the capabilities of the interpreter to handle various
interesting scenarios. These are some of the projects ahead of us:

## Improvements for Statically Compiled Mono

The full ahead-of-time compilation versions of Mono (iOS, Consoles) do
not ship with an implementation of `System.Reflection.Emit`. This made
sense as the capability could not be supported, but now that we have
an interpreter, we can.

There are several uses for this.

The `System.Linq.Expressions` API which is used extensively by many
advanced scenarios like Entity Framework or by users leveraging the C#
compiler to parse expressions into expression trees, you have probably
seen the code in scenarios like this:

```csharp
Expression sum = a + b;
var adder = sum.Compile ();
adder ();
```

In Full AOT scenarios, the way that we made Entity Framework and the
above work was to ship an interpreter for the above `Expression`
class. This expression interpreter has limitations, and is also a
large one.

By enabling `System.Reflection.Emit` powered by the interpreter we can
remove a lot of code.

This will also allow the scripting languages that have been built for
.NET to work on statically compiled environments, like IronPython,
IronRuby and IronScheme.

To allow this, we are completing the work for mixed-mode
execution. That means that the interpreted code complements existing
statically compiled .NET code.

## Better Isolation

Earlier on this post, I mentioned that one of the idioms that we
previously failed to address was the hot-reloading of code by
developers that deployed their app and tweaked their game code (or
their code for that matter) live.

We are completing our support for AppDomains to enable this scenario.

## Researching Mixed Mode Options

The interpreter is a lighter option to run some code. We found that
certain programs can run faster by being interpreted than being
executed with the JIT engine.

We intend to explore a mixed mode of execution, sometimes called
tiered compilation.

We could instruct the interpreter to execute code that is known to not
be performance sensitive - for example, static constructors or other
initialization code that only runs once to reduce both memory usage,
generated code usage and execution time.

Another consideration is to run code in interpreted mode, and if we
exceed some threshold switch to a JIT compiled implementation of the
method, or use attributes to annotate methods that are worth the
trouble and methods that are not worth the trouble optimizing.



