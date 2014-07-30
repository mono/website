---
title: "Talk:Cecil"
lastmodified: '2005-03-04'
permalink: /archived/Talk:Cecil/
redirect_from:
  - /Talk:Cecil/
---

Talk:Cecil
==========

Is it the intention that Cecil will be feature-complete and convenient enough to allow people to easily implement their own .NET languages? I have been exploring the possibilities with domain-specific languages, and would really like a simple platform that allows me to produce problem-optimised IL code for them.

Related to that I suppose, is the plan to have the Mono C\# compiler make use of Cecil at some point?

Cecil as a platform for languages.
----------------------------------

Cecil can certainly be used for that purpose (once write support is added), and hopefully we can start using it in various other tools.

One day, it might be nice to move the C\# compiler from Reflection.Emit to use Cecil (or something like Cecil), as Reflection.Emit has some limitations that have lead to some ugly hacks.

Architecture draft?
-------------------

Is there anything like an architecture draft document available for Cecil? Or is the only way to find out more about it by checking out the source?

PS: My main machine is a Windows platform... is there any reason that Cecil would not work under MS Framework 1.1?

