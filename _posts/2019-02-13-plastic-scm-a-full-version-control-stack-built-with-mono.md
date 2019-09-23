---
layout: blog
title: "Plastic SCM: A Full Version Control Stack built with Mono"
author: Jordi Mon Companys
tags: [version control, semantic merge]
---

*Note: This is a guest post by Jordi Mon Companys from Códice Software, a long-time Mono user, about how they used Mono to develop their flagship product.*

[Plastic SCM](https://www.plasticscm.com?utm_source=Mono%20Blog&utm_medium=post&utm_campaign=Mono%20success%20story&utm_term=DotNet&utm_content=Open%20Source)
is a full version control stack. This means Plastic SCM
comprises a full repo management core, command line (until here it would
be the equivalent to bare Git), native GUIs on Linux, macOS and Windows,
web interfaces, diff and merge tools (the equivalent to Meld, WinMerge
or Kdiff3), and also a cloud hosting for repositories. Add Visual Studio
plugins, integrations with the major Continuous Integration systems,
IDEs and issue trackers.

Plastic SCM was first released in 2006 and didn\'t stop evolving in the
last 13+ years, with 2-3 new public versions every week for the last 2 years.

Overall Plastic SCM sums more than 1.5 million lines of code and 95% of
them written in C\#. This means we have extensively used Mono for everything
non-Windows since the very early days, now almost a decade and a half
ago.

And here goes the story.

Mono shone light down the cross-platform way
============================================

When the first lines of Plastic SCM were written back in September 2005,
the decision to go for C\# was already made. But we knew a new version
control system could only be considered as a serious alternative if it
was truly cross-platform. Windows-only was not a choice.

Why then, we decided to go for .NET/C\# instead of something more
portable like Java, or C/C++? The reason was clear: because Mono
existed. We had never decided to use C\# if Mono hadn\'t been there already.
It promised a way to have cross-platform .NET and we invested heavily on
it. How did it work out? Read along fellow monkeys!

Fun with cross-platform WinForms
--------------------------------

Code once, run everywhere. That\'s what we embraced when we started
doing our first tests with WinForms on Linux.

![Plastic 1 on Linux](/images/2019-02-13-plastic-scm-mono/plastic-1-on-linux.jpg)

With very minor changes, the full Windows version was able to run on
Linux and macOS (through X11). We later rewrote most of the controls we
were using on WinForms to give them a more consistent look and feel:

![Plastic 2 on Linux](/images/2019-02-13-plastic-scm-mono/plastic-2-on-linux.jpg)

![Plastic 2 on Linux](/images/2019-02-13-plastic-scm-mono/plastic-2-on-linux-2.jpg)

We also did this as a workaround to basically skip some well-known
issues with some standard controls. Obviously, desktop GUIs were not a
big thing in Mono, and we felt like pioneers finding our way through a
wild territory :-)

Mono on Solaris - a story from the good-old days
------------------------------------------------

Something many won\'t know is that for a couple of years we were the
unofficial maintainers of the [Mono port for
Solaris](http://blog.plasticscm.com/2010/10/welcome-crazy-monkeys-mono-on-solaris.html?utm_source=Mono%20Blog&utm_medium=post&utm_campaign=Mono%20success%20story&utm_term=DotNet&utm_content=Open%20Source).

We were lucky enough to hire a former Mono hacker, our friend Dick
Porter, who enrolled to help us porting Plastic SCM to exotic platforms
like Solaris and HP-UX.

By that time, we still relied on WinForms everywhere, which was a
challenge on its own.

You can see how Plastic SCM running on Solaris looked like:

![Plastic 2.7 on Solaris](/images/2019-02-13-plastic-scm-mono/plastic-2.7-on-solaris-cde.jpg)

And:

![Plastic on Solaris SPARC](/images/2019-02-13-plastic-scm-mono/plastic-on-solaris-sparc.png)

We were super excited about it because it allowed us to run Plastic SCM
on some old Sun workstations we had around. And they featured SPARC
CPUs, 64-bit big endian and everything. In fact, we found and protected
some edge cases caused by big endian :-).

From Boehm to sgen
------------------

We were hit by some of the limitations of Boehm GC, so we happily
provided the developers working on the new sgen collector with a memory
hungry Plastic SCM environment. We used to run some memory intensive
automated tests for them so we mutually benefit from the effort.

This was mostly before everyone moved to the cloud, so we ran most of
these tests in about 300 real machines controlled by our in-house PNUnit
test environment.

Native GUIs
-----------

Depending on X11 to run our GUI on macOS wasn\'t greatly perceived by
hardcore Apple users who prefer a smooth experience. So, we decided to
radically change our approach to GUI development. We committed to create
native GUIs for each of our platforms.

-   Windows would still benefit from the same original codebase. But,
    removing the common denominator requirements allowed us to introduce
    new controls and enrich the overall experience.

-   The macOS GUI would be rewritten taking advantage of MonoMac, which
    later became XamarinMac, the technology we still use. It was going
    to be an entirely new codebase that only shared the core operations
    with Windows, while the entire intermediate layer would be developed
    from scratch.

-   And finally, we decided to go for a native GTKSharp-based GUI for
    Linux. In fact, it would be a good exercise to see how much of the
    common layer could be actually shared between macOS and Linux. It
    worked quite well.

Some takeaways from this new approach:

-   We decided to entirely skip \"visual designer tools\". ResX on
    WinForms proved to be a nightmare when used cross-platform, and
    depending on locating controls by hand with a designer on a canvas
    wasn\'t good to keep consistent margins, spacing and so on. So, we
    went cowboy: every single GUI you see in Plastic SCM now (except the
    older ones in WinForms) is basically coded, not designed. Every
    button is created with \"new Button()\", and so on. It can sound
    like a slowdown, but it certainly pays off when maintaining code:
    you spend much [less time dealing with code than
    designers](http://blog.semanticmerge.com/2014/03/gui-development-design-or-code-imperative.html?utm_source=Mono%20Blog&utm_medium=post&utm_campaign=Mono%20success%20story&utm_term=DotNet&utm_content=Open%20Source).

-   We created our own [automated GUI test
    environment](http://blog.plasticscm.com/2019/01/guitestsharp-multiplatform-gui-testing-dotnet.html?utm_source=Mono%20Blog&utm_medium=post&utm_campaign=Mono%20success%20story&utm_term=DotNet&utm_content=Open%20Source)
    to test the Linux and macOS GUIs. There weren\'t any cross-platform
    solutions for Mono, so we decided to create our own.

-   We realized how much better GTK was and is than any other solution
    from a programmer's perspective. We love to code GTK. Yes, it is
    also possibly the ugliest in visual terms of them all, but you
    can\'t have it all :-)

This is how Plastic SCM looks now, enjoy:

![Mac Branch Explorer](/images/2019-02-13-plastic-scm-mono/macplastic-brex.png)

![Windows Diff Window](/images/2019-02-13-plastic-scm-mono/windows-diff-window.png)

![Windows Branch Explorer](/images/2019-02-13-plastic-scm-mono/windows-brex.png)

But wait! Wouldn't Mono affect performance?
-------------------------------------------

Many of you might think: how can a version control be written in
Mono/C\# and expect to compete against Git or Subversion or even
Perforce which are all written in C or a C/C++ combination?

Speed was an obsession for us since day one, and we found C\# to be
quite capable if used carefully. The only downside is that when you are
in a C\#/managed world you tend to think allocating memory is free and
you pay for it when that happens (something that radically changed with
the arrival of .NET Core and the entire Span\<T\> and their focus on
making the platform a real option for highly scalable and performant
solutions). But, over the years we learned a few lessons, started to be
much more aware of the importance of saving allocations, and the results
backed up that reasoning.

Below you can see how a 2019 version of Plastic SCM compares to Git and
a major commercial version control competitor performing quite common
operations:

![Performance Benchmark](/images/2019-02-13-plastic-scm-mono/performance-benchmark.png)

As you can see, Plastic SCM consistently beats Git, which we believe is
quite an achievement considering it is written in .NET/Mono/C\# instead
of system-level C.

Heavy loaded servers
--------------------

In terms of pure scalability, we also achieve quite good results
compared to commercial version controls:

![Scalability Benchmark](/images/2019-02-13-plastic-scm-mono/scalability-benchmark.png)

We don\'t compare to Git here since what we are running are pure
centralized operations (direct checkin or commit if you prefer)
something Git can\'t do. Plastic SCM can work in Git or SVN modes, local
repos or direct connection to a central server.

In fact, some of our highest loaded servers on production run on
Linux/Mono serving more than 3000 developers on a big enterprise setup.
A single server handles most of the load singlehandedly :-)

Mono is indeed for code monkeys
-------------------------------

If you've read the whole use case you already know that we have been
using Mono for the purpose of providing a full version control stack
since 2006! That is for almost 13 years, right after the company was
founded and the first product of our portfolio was delivered.

After all this time it has helped us build and distribute the same
product across the different environments: a full stack version control
system that is pioneering software configuration management in many
areas. The results are there and hey, we are demanding: versatility,
performance, scalability and resilience are not an option for our
clients, or us. Given the structural relevance of SCM tools to any
software project, it is paramount for Plastic SCM to deliver a solid
product across all platforms, and we do it. To us Mono = cross-platform
and that is a huge advantage since we can focus on functionality,
roadmap and support while Mono makes the product one same experience
everywhere. Mono is definitely a foundational part of toolkit.
