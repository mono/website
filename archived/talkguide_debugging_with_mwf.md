---
title: "Talk:Guide: Debugging With MWF"
lastmodified: '2007-05-30'
redirect_from:
  - /Talk:Guide:_Debugging_With_MWF/
---

Talk:Guide: Debugging With MWF
==============================

Consts.cs and MonoTODOAttribute.cs dependencies
-----------------------------------------------

Objective: allow someone to build the mwf assembly without building all of mono, on windows.

Problem: the mwf build depends on Consts.cs and MonoTODOAttribute.cs.

1.  Consts.cs is only created when building mono
2.  both Consts.cs and MonoTODOAttribute.cs are outside the mwf folder

What I'd like to see happening is someone checkout the MWF folder, load up the project, and build the assembly, but to do that, we have to decide what to do with these two dependencies.

1.  Do we add them to a "common" folder inside MWF?
2.  If we do, do we change the version on Consts.cs?
3.  What about people that are building MWF on visual studio but who have the mono tree (and have the files in their proper place)? Might it be a problem for them that now the files are referenced from somewhere else? Will they notice at all? :)

--Shana 06:55, 30 May 2007 (EDT)

I think placing static versions in the MWF directory should be fine for this purpose. We can update these when they change (which is rare), just like we update the SWF2K project.

The consts file is used in MWF mainly for the Designer attribute. We don't have designing yet, so I don't see this ever screwing anything up should it be temporarily out of sync.

The MonoTODO file simply allows the project to build in this context. I highly doubt anyone will be running the class status pages or moma extractor on their built MWF dll, which are the only things that currently use MonoTODO. (Which should still work regardless.)

From personal experience, I have never created my own consts.cs file. I found a static version elsewhere in the full tree: trunk/mcs/build/common/Consts.cs.in, which I renamed Consts.cs. Same for MonoTODO. Neither have been updated in at least 5 months and I don't believe it has ever caused any issues.

And of course "real" Mono is built from the .sources file, so we aren't screwing up the build or anything by doing this.

--[jpobst](/User:Jpobst "User:Jpobst") 10:07, 30 May 2007 (EDT)

For the sake of argument: None of the other libraries are able to be dropped into Visual Studio and built standalone, why should MWF be special? Without the rest of the build tree, would people be able to run the unit tests? If not, should we be making it easier for people to develop on MWF without writing and running tests?

Jackson 11:44, 30 May 2007 (EDT)

MWF is slightly special in that its target users are probably hardcore VS users. (Think winforms designer.) I think the issue here isn't to really help them "develop on MWF" as is it to help them debug their applications on MWF. I would agree with you if we really had to jump through hoops to make this happen, but it seems like these changes are small and harmless.

I have a VS project of the tests that I use to build the tests quickly after I add new ones. I can add that to the tree, however, as I said, I don't know that hacking on MWF is really the intended goal here. (Although it might be a nice side effect.)

[jpobst](/User:Jpobst "User:Jpobst") 1:38, 30 May 2007 (EDT)

