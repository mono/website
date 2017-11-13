---
layout: blog
title: Hello WebAssembly
author: Miguel de Icaza
tags: [runtime]
---

We have been experimenting with a couple of approaches to bring Mono to the
web using WebAssembly - a technology that can efficiently and safely
execute code in web browsers without being limited to Javascript.
Running code written in C or C++ inside the browser has been a big
motivator, but most major programming languages have plans to target
WebAssembly as a platform.

WebAssembly has been out for a few months on desktop computers and
Android, and with the introduction of iOS 11 it will become nearly
universal.

We have done some exploratory work to identify what needs to be done
to run Mono on the browser.  The early experiments are promising, let
me talk about those.

Mono supports various execution modes, it ranges from the traditional
fully just-in-time compiled, to fully statically compiled with a
couple of hybrid modes in between (statically compiled with JIT, and
statically compiled with an interpreter).

Today we have two prototypes running in WebAssembly.

The first one uses the traditional full static compilation mode of
Mono, this compiled both the Mono C runtime and the Mono class
libraries along with the user code into WebAssembly code.  It produces
one large statically compiled application.  You can try this fully
statically compiled Hello World
[here](http://www.hipbyte.com/~lrz/mono-wasm-hello/).  The full static
compilation [currently lives here](https://github.com/lrz/mono-wasm).

The second prototype compiles the Mono C runtime into web assembly,
and then uses Mono’s IL interpreter to run managed code.  This one is
a smaller download, but comes at the expense of performance.  The
mixed mode execution prototype ~~currently [lives
here](https://github.com/kumpera/mono/tree/wasm-port)~~
was merged to Mono master in November 2017.

You can see [C# Hello World](http://www.kumpera.com/wasm/driver.html),
or this F# code [in action](http://www.kumpera.com/wasm/fsharp.html):

    open System
    type Shape = | Circle of float | Square of float * float
    [EntryPoint]
    let main argv =
      let s = Circle 10.
      Console.WriteLine (s)
      0

Currently neither approach has been optimized for size, they are using
the full Mono Desktop profiles.  The size should come down
significantly once we use a custom profile based on the mobile profile
and remove many of the unnecessary features.

There are both interesting technical challenges to solve in the
WebAssembly space, some hard (stack walks) and some straightforward
(single threaded).

The development experience is another component that will be
interesting to study.  Clearly we want to have our cake and eat it
too, so we desire the high performance that comes from doing full
linking and statically compiling everything to WebAssembly.  But for
quick iterative development, clearly something like an interpreter or
a JIT compiler in the browser with cached versions of `libmono` and
the core managed libraries is desirable.



