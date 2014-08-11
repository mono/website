---
title: Concerns about Mono
redirect_from:
  - /MonoConcerns/
---

Mono has attracted attention from those in the F/OSS community because of its origins as a Microsoft technology. While we believe Mono and .Net are useful tools, we respect the opinions of others that disagree and would rather use alternative languages and development frameworks. There are several common concerns, beyond that of personal choice, that we would like to answer.

If you have a concern that you would like us to consider addressing, please feel free to email chmorgan@gmail.com.

### Patents

#### Background

Patents are a lightning rod of attention in the area of software development. The fact that .NET is a Microsoft created technology has caused concern about Mono, given Microsoft's history of tough, and sometimes monopolistic business practices. [Mono's Licensing page](/Licensing#Patents) addresses some of the issues with how any potential patent infringement would be delt with, via rewriting infringing portions of the code, as well as the basic issue of whether replicating the .Net languages is infringement.

Microsoft has made some [claims of intellectual property violations by Linux companies](http://www.youtube.com/watch?v=5B0GTYfPoMo). Some have suggested that because .NET is Microsoft technology, that there are patents that Mono is infringing upon that will be brought out at an opportune time to take Mono and any Mono applications down.

#### Our position

Our position is one of measured concern about patents in .NET. In our opinion, nothing about Mono is different than other projects like Samba or Wine, that also substantially reproduce a Microsoft created technology or protocol. Let us consider several potential patent related scenarios.

Microsoft may have patents that cover .NET API and/or implementation. At this point we know of no patents that Mono infringes upon. Any knowledge of such patents would be welcome as it may allow us to modify Mono in a way that reduces or eliminates the concern over infringement.

Assuming that Microsoft does have patents for .NET API and/or implementation, the question becomes whether these patents are enforcable. Some of these patents may have prior art that would render them un-enforcable. In any case, without knowing about specific patents, we can't really know either way.

Assuming that there are enforcable patents that can be used against Mono, what happens if Microsoft attempts to do so? There are several costs to using patents against Mono, including accusations of Monopolistic practices and negative press coverage. On the flip side, people may be pressured to license their Mono usage. Microsoft has already [claimed intellectual property violations by Linux companies](http://www.youtube.com/watch?v=5B0GTYfPoMo).

Mono has routes to recover from patent infringement by altering specific implementation details that the patent covers. The FreeType project encountered [patent related issues](http://freetype.sourceforge.net/patents.html) after Apple's legal department contacted the FreeType project about use of proprietary hinting data in TrueType fonts. FreeType continues to exist today because they altered their implementation to avoid the specific method that Apple claimed was infringing. The change in implementation has likely resulted in a depredation of font quality for particular font faces at particular sizes but the FreeType auto-hinter [appears to do a reasonable job](http://freetype.sourceforge.net/autohinting/hinter.html#screenshots). We can't speculate about whether Mono's functionality will be negatively affected by working around a patent issue but its possible.

The layering of escape routes is extensive in Mono, especially Mono in Debian/Ubuntu. In the first instance, the contentious Microsoft-sourced non-ISO libraries such as System.Windows.Forms are not included by default, and are rarely used in Free applications anyway (because WinForms looks like ass, amongst other things). If a reason is found to remove these non-standardised libraries, then bam, they're gone - without harming Free apps. Secondly, if a more severe change is required, then the Mono packages can be patched to remove the infringement. If more drastic changes are required, as mentioned above, then the applications can also be patched to support any core changes. And, taking it one step further, if the whole of Mono needs to be pulled, then applications can be ported. The porting process would potentially be slow and painful, and cause great harm to an application's future rate of development (although no worse than if the app was written in the target language from day one), but nobody who has written an app they care about would simply throw their hands in the air and say "never mind, it was fun, but the Man says I have to stop now".

#### Calls for Microsoft patent protection

There have been some calls for Microsoft to issue patent protection to all Mono users. This is unlikely to happen, either because Microsoft would like to license .NET technologies to those that would pay for it, see the above YouTube video, and or to protect themselves against any potential patent suits brought by others. In any case, the absence of "patent protection" is not the same thing as "patent violation". If I offer to sell somebody a promise not to sue them using any of my patents, their taking me up on my offer is no guarantee that I even have anything valid to sell them - merely that they are willing to buy it. If Jim buys protection from any patents I hold, it does not mean that Jim is infringing on anything specific - nor that if Ted does the same thing, that Ted is violating anything either. If a house insurance policy includes flood protection, it does not mean that your house will be flooded - and not buying flood protection does not mean that you will be flooded either.

#### Mark Shuttleworth On Mono Patents

While Mark Shuttleworth can't protect the FOSS community from patents, his company could be directly affected by any patent issues in Mono. It is also likely that Canonical would want to distance themselves from any perceived patent risks, so it is notable that he has expressed his [lack](http://boycottnovell.com/2008/02/22/mark-shuttleworth-on-patents/) of [concern](http://d0od.blogspot.com/2009/04/mark-shuttleworth-qa-part1-gnome-3-new.html) over Mono's patent risk. While we don't ask that you defer to Mark Shuttleworth's opinion of Mono's patent risk, we do ask that you consider his opinion as someone who would be at risk from patent issues in Mono, the Linux kernel and other free software.

#### Our Conclusion

There are several FOSS projects that are in the same position as Mono with respect to patents held by Microsoft and other companies. Microsoft has been involved in operating systems development for approximately [25 years](http://en.wikipedia.org/wiki/Windows#Early_versions) and Microsoft is [known to file for thousands of patents per-year in recent years](http://www.itjungle.com/two/two011608-story02.html). It is likely that Microsoft holds dozens of patents in areas that that projects like the Linux kernel, Wine, and Samba are directly involved in. It is our argument that the concern about Mono and patents should be similar to that of the Linux kernel, Samba and Wine. Like these other projects, if Mono were presented with an infringing patent we would make the required changes and the project would continue.

### Frequent questions

**Q: Can't Microsoft change the .NET API in ways that will break Mono and Mono applications?**

A: Not without breaking existing .NET applications. Any changes to .NET that would break Mono or Mono applications would also alter behavior for hundreds or thousands of existing applications that rely on .NET behavior on Windows. Much like the Win32 API had to be carefully extended with new functions while the original ones remained unchanged, the same has to be done with .NET to avoid break existing applications. The cost of breaking backwards compatibility is high. Even if Microsoft was able to make such changes and break some or all .NET applications, Mono could still provide the older, deprecated API to users that were unable or unwilling to upgrade.

**Q: Even if Microsoft can't change the .NET API to break Mono and Mono applications, won't Mono always be playing catch-up in terms of re-implementing .NET?**

A: Mono is likely to remain behind .NET in terms of implementing new language features and API that are a part of MS's .NET (Note that Mono has implemented functionality beyond that of .NET, see [Mono.SIMD](http://tirania.org/blog/archive/2008/Nov-03.html) as an example). For some developers this may prevent or delay their use of Mono to port applications to Linux/Mac. The [MoMA](/MoMA) tool was developed to check for API coverage and report the results to the Mono developers to aid in pinpointing unimplemented parts of Mono that applications are using. Today, Mono implements a wide range of the .NET API including [WinForms](/WinForms). [Here](/Companies_Using_Mono) is a list of companies that currently find Mono useful.

**Q: What if Microsoft introduces patented interfaces to the .NET API?**

A: \*\*\* I'm not sure about this one but someone should feel free to add their thoughts \*\*\*

Notes: [Ubuntu Technical Board meeting minutes, 2009-06-16](https://lists.ubuntu.com/archives/ubuntu-devel/2009-June/028347.html)

