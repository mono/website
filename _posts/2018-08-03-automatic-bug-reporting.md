---
layout: blog
title: Automatic Bug Reporting
author: Alexander Kyte
tags: [logging]
---

## Automatic Bug Reporting ##

Software engineers often like to think of exceptional paths as being rarely taken. 
While this is hopefully the case on a customer’s machine, the engineer will see a 
program fail far more often than they will watch it succeed. Every engineer who has
had to suffer bad tooling of one form or another becomes aware of this fact like a 
person with a broken foot becomes aware of how far away things are. 

The modern software lifecycle does not end when you ship a piece of code. Defects in
shipped software are reported, studied, reproduced, and then debugged. A significant 
portion of the time it takes to fix a bug can be spent in discovering that it exists. 
Often this discovery includes finding the ways that the customer’s environment differs 
from the developer’s testing environment. A back-and-forth conversation can give a 
developer a lot of information, but it’s not something that every bug filer is 
motivated enough to keep returning and responding. 

### Trust and Privacy ###

A desire to automate the process of finding out what made a bit of code crash has lead 
to a lot of innovations in software engineering tooling. Unfortunately, many attempts to
address this problem have completely lost the trust of the customer base. As soon as a 
brand is associated with “tracking,” people stop affording the company the benefit of the
doubt. Telemetry mistakes seeming sinister (and sometimes correctly so) has lead to the
passing of the GDPR in Europe. 

With all of this in mind, a team attempting to solve the telemetry problem is faced with
sweaty palms. The addition of integrated telemetry support to the Mono runtime is something
that would have to balance a number of concerns. 

I believe that we did pretty well. Any constructive criticism through official channels is
appreciated. I will describe now the balance that we struck. 

### Domain Details ###

Any telemetry system can be separated into a number of components. 

1. That which collects information about runtime state during the crash
2. That which moves it from the customer machine to the developer machine
3. The manipulation and aggregation systems for the crashes. 

Now the concerns in the various parts are rather contradictory. Part 3 should be private,
as information about bugs may pose security risks. Making Part 3 private often means that making
Part 2 proprietary and close-source is important. I don’t think that many people disagree with
these two. The information being sent (and how it was collected in Part 1) is the part that is 
subject to the most scrutiny. 

All of the source code that creates the files that are created during a crash to control Part 2
are open source and completely audit-able. Folks can play along at home 
(source is [here](https://github.com/mono/mono/blob/5672eba58212345b8e9722587533c325a0c5825d/mono/utils/mono-state.c))
as they continue to read, if they would like to confirm what I am saying. 

### Implementation ###

Being privacy-preserving is more than just having our policies in open-source code; we must have
good policies. To abide by the GDPR we cannot collect any Personally Identifying Information. 
What is PII for a bug report? Most of the choices were very straightforward, but a few required
careful work to preserve our desired behavior. Beyond avoiding sending file paths from a user’s
machine or data from their code, we also cannot capture their code in our stack trace. If a 
Visual Studio For Mac extension contains code that is not ours, we should not collect information
about their crashes. It is simple enough to only report the UUID, token, and managed IL offset 
(CIL metadata about the class) that all work together like a unique hash. Without the C# assembly
file in question, you don’t know which hash goes to which file. It’s a primary key, but the
people who have the mapping already have the private data. 

We needed to balance that desire against the desire for a crash from two different versions of mono
to look very similar or identical to the backend (Part 3). Mono already has unique hashing functions
for metadata objects; we use it inside of the AOT compiler and runtime. We can then generate a 
hash that is identical for two identical stack traces, while uploading a version-dependent unique
reference with the main stack trace. What this means is that if two crashes have the same hash but 
different information otherwise, they are the same crash. This preserves privacy while letting you 
count how often each bug is hit. 

To make this concrete, this is what we send for each managed frame:

    {
    "is_managed" : "true",
    "guid" : "0845998F-6B70-4AA8-9214-6731378926A0",
    "token" : "0x6003817",
    "native_offset" : "0x1fd",
    "il_offset" : "0x00071"
    }

### Bigger Impacts ###

This crash dump creation also represented a change in our philosophy with respect to error reporting.
Rather than expecting the bug report submission to be the beginning of an ongoing conversation,
we are now expecting it to be an anonymous message. This motivates our embedding information into the 
dump that we would typically ask someone to collect for us by exporting an environment variable or
attaching with a debugger. The dump needs to contain enough system clues without describing the 
embedding application too closely and being creepy. 

It is a much harder problem for a runtime than for a web server because we expose a lot of the 
details of the underlying platform to a developer who chooses to poke and prod. The CPU model isn’t 
likely to cause problems with a web server, but leads to  
[impossible bugs](https://www.mono-project.com/news/2016/09/12/arm64-icache/) with mono.
We expose these abstract state machines in the API that only roughly correlate to the bits in the machine registers.
This train of thought with respect to state machines and logging lead to the flight recorders, which will be mentioned in a subsequent blog post. 

The best part of all of this is that it is all open source. Because mono is an embedded runtime, when you embed our telemetry engine you gain the ability to collect telemetry on your own code. Someone today can build mono in a way that allows them to get a beautiful runtime state dump on each crash. If they don’t change too much, it’ll even be GDPR-compliant. It can be hard to get really excited about logging, but it’s easy to get excited about spending less time teaching customers to debug. 



