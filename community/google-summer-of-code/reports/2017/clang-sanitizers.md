---
title: "Clang Sanitizers (Armin Hasitzka)"
---

Author: Armin Hasitzka

When I joined the Mono voyage in June, I had my mind set on evaluating Clang's [ThreadSanitizer](https://clang.llvm.org/docs/ThreadSanitizer.html) ("TSan") and, optionally, Clang's [AddressSanitizer](https://clang.llvm.org/docs/AddressSanitizer.html) ("ASan") &ndash; and what thrilling undertakings they were!

Most of my adventures can be tracked via pull requests as well as on the website. Therefore, as there is a lot of material out there already, I will only list the major cornerstones. The observant and interested reader can find a great amount of links that will lead them to a world full of fascinating stories.

# My Journey

Main Quests "Playing with TSan and ASan":
* Find out how to work with [TSan](/docs/debug+profile/clang/threadsanitizer/) and [ASan](/docs/debug+profile/clang/addresssanitizer/) in combination with Mono
* [Add a CI lane for TSan](https://github.com/mono/mono/pull/5254)

Main Quests "Permanently Blacklisting Races":
* [Get that macro approved](https://github.com/mono/mono/pull/5191)
* [Atomic operations are not welcome everywhere](https://github.com/mono/mono/pull/5255)
* [The `Unlocked* ()` collection](https://github.com/mono/mono/pull/5310)

Side Quests "Dealing with Data Races":
* [Racing with `next_generic_inst_id`](https://github.com/mono/mono/pull/5299)
* [Interlock and unlock, part I &ndash; Spread unlocked](https://github.com/mono/mono/pull/5381)
* [Interlock and unlock, part II &ndash; Making peace with the past](https://github.com/mono/mono/pull/5387)
* [Interlock and unlock, part III &ndash; Performance counters](https://github.com/mono/mono/pull/5413)
* [Interlock and unlock, part IV &ndash; MonoJitStats](https://github.com/mono/mono/pull/5437)

Side Quests "Fixing Thread Leaks":
* [Leaking Finalizer and SGen Worker threads](https://github.com/mono/mono/pull/5284)

Side Quests "Fixing Address Violations":
* [`memset` meets C strings](https://github.com/mono/mono/pull/5285)

Side Quests "Improving Mono":
* [Hello world! ... or ... fix compiler warnings :)](https://github.com/mono/mono/pull/5064)
* [`(monoeg_)g_strerr ()`](https://github.com/mono/mono/pull/5323)
* [The little `void`](https://github.com/mono/mono/pull/5438)

# Bottom Line

## What I Learned

Like many GSoC students before me, I learned how to work properly with git and GitHub. Even though I used git before joining Mono, I never went further than `checkout`, `commit` and `merge`. Working with GitHub and pull requests introduced me to `rebase -i`, which opened up a colourful new universe full of unexpected possibilities.

Apart from git(Hub), I also learned that obviously, I have a thing for fixing and validating code. When I joined in June, I already liked the idea of static analysers that help me find and fix hidden issues in my code. However, working with TSan this summer raised my interest in these things up to a point at which I can undoubtedly proclaim my passion for code validation. I will focus on (automated) validation of code during the rest of my studies.

## What Comes Next

When talking about introducing TSan to Mono, I want to stress that my work should be seen as one first step of many more to come. After taming about 200 races, there is still a large amount of wild races out there. Until the majority of these wild races are taken care of, meaningful investigations with TSan will be difficult.

What makes the matter even more complicated is the fact that TSan, Mono and `make` lock up at the moment, which might be connected to signal handling. A [bug report](https://bugzilla.xamarin.com/show_bug.cgi?id=58819) is filed and will eventually bring light into this dark corner.

Lastly, I would like to introduce the [enhancitizer](https://github.com/cherusker/enhancitizer). This tool is the result of my ongoing analysis of Mono with Clang's sanitizers and helps with automated processing of Clang's reports. It is still under construction; however, one can get an idea of it by browsing through the [snapshot of the output](/files/gsoc-2017-clang-sanitizers-enhancitizer.zip) that resulted from analysing [`9a634c1`](https://github.com/mono/mono/commit/9a634c1810aad46d30a674f3a97ab263dcd4272e).

## Thank You

All that is left to say is thank you for this amazing summer! We will surely meet again, completing more quests shoulder to shoulder, and I cannot wait!
