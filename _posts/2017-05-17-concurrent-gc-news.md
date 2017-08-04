---
layout: blog
title: "Garbage Collector Update"
author: Rodrigo Kumpera, Miguel de Icaza
tags: [runtime]
---

# Concurrent GC

In Mono 5.0 we are shipping a new operation mode for our Garbage Collector: Concurrent Garbage Collection.

Traditionally, when Mono’s memory manager determined that it should perform a garbage collection, the collector had to pause all Mono running threads, perform the garbage collection, and once it was done, it resumed the execution of those threads.

With concurrent garbage collection, we are able to perform collections on the old generation (what we call major collections) mostly concurrently with your application - it happens at the same time as your program is running.    When the major collection is completed, the collector only needs to pause the Mono threads for a very brief period of time at the end.

This was an important feature for both our users of desktop workloads (like running Xamarin Studio, or Visual Studio for Mac) as well as game and mobile developers that did not want their application to exhibit large pauses when they had very large memory heaps to be collected.

The concurrent garbage collector is now enabled on Mono deployments by default, and we are making it available as an experimental option to all Xamarin platforms (Xamarin.Android, Xamarin.iOS, Xamarin.Mac, Xamarin.tvOS, Xamarin.watchOS).

We are rolling it out as the default on desktop first since it has more friendly hardware and it has received the most tuning.  We are interested in hearing your experiences with the collector with your mobile applications to help us further tune the heuristics in the collector.

To get a sense of how this affect real world applications, let us examine Xamarin Studio.

Long GC latency can cause typing delays that are noticeable and lead to a bad typing experience. Pauses over 100-150ms are noticeable by most of us [1].

To give you a taste of how the concurrent collector improves things, I used it with Xamarin Studio to open itself, and build itself.  This is one of the biggest solutions that I had around. As I open and build it, Xamarin Studio will be frantically allocating objects which, in turn, trigger the garbage collector - those GC pauses can be felt as hiccups when typing.

The experiment is to run this with and without the concurrent mode enabled. We measured the pause time of each GC run and grouped them in buckets by duration. For example, the 20ms bucket has all collections that paused between 10ms and 20ms. One thing to keep in mind is that the Y axis is in logarithmic scale, as the number of short pauses is significantly larger.

![GC Pause Times](/images/concurrent-gc-pause-times.png)

The result is that the long pauses, 200ms, 500ms and higher are now completely gone and even the worst case for concurrent GC shows that there are fewer 150ms pauses.

Even if those numbers are a significant quality of life improvement, there's plenty of work left for us to get to no visible delays due to the garbage collector. We have already a solid pipeline of improvements coming on our next releases.

The concurrent collector work opens the door for many more improvements.   This is just the beginning.   What we plan on doing next is provide some defaults that are suitable for different workloads.   On one end of the spectrum we have games that have very constrained timing budgets, and on the other hand we have applications that do not care about pauses, but would like to get more throughput.

Our focus for the next year is to leverage this work to satisfy the needs of both scenarios.

In the immediate roadmap, you can expect:

- Mono 5.2 will introduce an optional parallel major collection mode to speed up the finishing pause for large heaps. This will help with some of the outliers we saw above.

- Mono 5.4 will introduce and optional parallel minor collection mode that will help workloads with high activity on old objects. Roslyn falls into this category.

## Using the Concurrent GC

On the desktop you enable the concurrent GC using the MONO_GC_PARAMS env var. Set it to major=marksweep-conc. Starting with mono 5.0 the concurrent collector is the default on desktop environments so you don't need to use it.

On Xamarin.Android and Xamarin.iOS to enable it, go to project settings, under build options enable the “Use the experimental concurrent garbage collector” option.

## Tuning the Nursery Size

The graph above shows the defaults for Mono.

In Mono, the Nursery is the name that we give to the youngest heap generation.   When we talk about performing a minor collection, we talk about performing a collection that is limited to the nursery.

For games and other interactive applications that might create lots of small objects during their rendering cycle that are not long-lived, you might be able to take advantage of making the nursery size larger.

This reduces the chances that you will hit the limit that would trigger a major collection, and you can manually trigger a complete GC at a convenient time with `GC.Collect()` .

We hope to make this tuning a thing of the past when we introduce some of our new game and interactive features for this new mode.

[1] [Typing with Pleasure](https://pavelfatin.com/typing-with-pleasure/)
