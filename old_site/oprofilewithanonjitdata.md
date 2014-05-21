---
layout: obsolete
title: "OprofileWithAnonJitData"
lastmodified: '2006-01-13'
permalink: /old_site/OprofileWithAnonJitData/
redirect_from:
  - /OprofileWithAnonJitData/
---

OprofileWithAnonJitData
=======================

In January 2005, over my semester break, I hacked on getting data from the JIT into oprofile so that it could give us information on where we are spending our time. Here's how it works right now:

-   oprofile is designed to read elf files. Putting stuff in spaces in memory breaks this assumption. So, what the oprofile guys want us to do is to generate a fake elf file with the correct offsets in ram. Then their processing tools can easily deal with it

-   I use as and ld in my patch right now to generate this. The oprofile folks really want the use of BFD. If they are willing to do the work on their generic jit logging agent (which would use BFD), we'll probably go that route.

Running the profiler
====================

I've made a mono profiling module that outputs a .s file and a linker script. It's in the mono-oprofile svn module. Once this is run, you just have to assemble the file.

To get data from anon mappings (needed for this to work), oprofile needs a patch that is only in the 2.6.13+ kernels. This probably means suse 10.1 or fc5.

Issues I have to deal with
==========================

-   Figure out where to put the elf file so that oprofile sees it. Need to work on this with the oprofile folks.


