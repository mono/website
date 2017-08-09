---
layout: blog
title: Upgrading Mono's HttpWebRequest
author: Miguel de Icaza
tags: [releases]
---

After almost 12 years, we are upgrading the guts of `HttpWebRequest`,
the engine that powers the basic HTTP client stack in Mono.

.NET offers two sets of HTTP client APIs, the original
`HttpWebRequest` that offers a comprehensive and configurable API that
can communicate with HTTP 1.x servers using the original .NET 1.0
programming model, and a modern, pluggable and more limited API in the
form of `HttpClient` which can also talk to HTTP 2.0 servers.

`HttpClient` is an interesting API as it has been designed to allow
for different providers to be used and was also designed with async
programming support in mind.

On each platform, `HttpClient` tries to use the best available transport:

| **Host/Runtime**            | **Backend**                                                                                 |
| --------------------------- | --------------------------------------------------------------------------------------------|
| Windows/.NET Framework      | `HttpWebRequest`                                                                            |
| Windows/Mono                | `HttpWebRequest`                                                                            |
| Windows/UWP                 | Windows native `WinHttpHandler` (HTTP 2.0 capable)                                          |
| Windows/.NET Core           | Windows native `WinHttpHandler` (HTTP 2.0 capable)                                          |
| Android/Xamarin             | Default to Android’s HTTP transport<br/>Can be configured to be `HttpWebRequest`.           |
| iOS, tvOS, watchOS/Xamarin  | Default to `NSUrlSession` (HTTP 2.0 capable)<br/>Can be configured to use `HttpWebRequest`. |
| macOS/Xamarin               | Default to `NSUrlSession` (HTTP 2.0 capable)<br/>Can be configured to use `HttpWebRequest`  |
| macOS/Mono                  | `HttpWebRequest`                                                                            |
| macOS/.NET Core             | `libcurl`-based HTTP transport (HTTP 2.0 capable)                                           |
| Linux/Mono                  | `HttpWebRequest`                                                                            |
| Linux/.NET Core             | `libcurl`-based HTTP transport (HTTP 2.0 capable)                                           |

As you can see, while `HttpWebRequest` is not the default across the
board and lacks HTTP 2.0 capabilities, it is still available in
various configurations in Mono-powered stacks (Mono and Xamarin).

Mono’s original `HttpWebRequest` stack was written in 2004 and was
built using the asynchronous APIs that were available in .NET 1.0,
that is the
[BeginInvoke](https://docs.microsoft.com/en-us/dotnet/standard/asynchronous-programming-patterns/calling-synchronous-methods-asynchronously) / [EndInvoke](https://docs.microsoft.com/en-us/dotnet/standard/asynchronous-programming-patterns/calling-synchronous-methods-asynchronously)
patterns, a pattern that was heavily based on queuing work, waiting
for a result and resuming execution at a later point.

While the code grew in capabilities, features and reliability over the
years, all of this was built on top of these 2004-era programming
idioms.  The code is difficult to read, to follow and understand.
Simple bugs can take a long time to fix, and subtle problems can burn
the most passionate developer.  It has been a source of frustration
for both us, and our users when a rare bug comes up in this stack.

At one point we tried to use the [.NET Reference Source
implementation](http://referencesource.microsoft.com/#System/net/System/Net/HttpWebRequest.cs,f2ab2d685cb26f13),
but that version was just too difficult to extract as it relies on
many internals that do not exist in Mono, and in turn relies on
Windows capabilities that we would have needed to support [1].  But
this code also used those old idioms and while it might have fewer
bugs and we might increase the compatibility of the stacks, the
extraction was too complicated.

Over the years we have embraced expedience in the form of band-aids
for this code, over the right fix, given just how complex the code had
gotten.  We are facing a couple of corner cases that are hard to fix
and we wanted to fix the code for good, not apply another band aid.

So we decided to refactor the code from the old idioms from 2004 into
2017 idioms, using everything that is available to us in C# 7.

Chief among those capabilities is the use of async programming that
removes both the complexity from the code and makes the code a
pleasure to read and understand.  It has taken us a few weeks to do
the port, and we are currently validating every known scenario and
test suite against it, but things are looking very promising.

You can track the state of this effort on Martin’s [GitHub pull
request](https://github.com/mono/mono/pull/5200).

[1] At one point we did write such a layer, the effort still lives
dormant on a branch, for anyone that might be interested in resuming
that work.
