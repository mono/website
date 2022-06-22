---
title: "Mailpost:earlystory"
lastmodified: '2005-11-03'
redirect_from:
  - /Mailpost%3Aearlystory/
---

Mailpost:earlystory
===================

Originally from:

[https://lists.dot.net/archives/public/mono-list/2003-October/016345.html](https://lists.dot.net/archives/public/mono-list/2003-October/016345.html)

    Miguel de Icaza miguel@ximian.com
    13 Oct 2003 12:48:58 -0400

    Hello,

    > Forgive the ignorance but did mono start their implementation before
    > dotGnu of .NET? I am only curious.

    Well, we started working on the system about the same time.

    On the Mono side, the events were approximately like this:

    As soon as the .NET documents came out in December 2000, I got really
    interested in the technology, and started where everyone starts: at the
    byte code interpreter, but I faced a problem: there was no
    specification for the metadata though.

    The last modification to the early VM sources was done on January 22
    2001, around that time I started posting to the .NET mailing lists
    asking for the missing information on the metadata file format.

    While I waited for this, I started developing the C# compiler as an
    exercise in C# first a tokenizer, then porting jay to write a parser.

    Rhys contacted me about this time, he had been reverse engineering the
    file format and had some early code to load the files.  It was an
    interesting effort, and there was some early cooperation between a group
    of three people: Rhys, Saurik and myself.

    About this time Sam Ruby was pushing at the ECMA committee to get the
    binary file format published, something that was not part of the
    original agenda.   I do not know how things developed, but by April 2001
    ECMA had published the file format.

    At this point the C# compiler was able to parse itself, and I demoed
    this at the Guadec conference to a few folks.   Also at this point we
    were able to do a feasibility study on the completeness of the
    documentation published to build an open source technology.

    Our feasibility study included building a metadata reader, which caused
    much pain: Saurik had already done one, and felt his code was not being
    used and Rhys had his own, which I did not personally like (for simple
    reasons: it did not follow the Linux/Gnumeric coding style I used).  At
    this early stage there was very little in all of these projects.

    Since December 2000, we had been amazed by the .NET Framework, and when
    we discussed internally at Ximian its benefits, what we initially did
    was to staff the "Labs" team to work on CORBA, SOAP and Perl teams to
    work on the Gnome binding infrastructure (remember: our motivation at
    this point was the vision of writing APIs once, and using them in every
    language).

    The Labsl team effort's eventually resulted in work in Bonobo-conf,
    ORBit2, bonobo-activation, Soup, and the Perl/Gtk bindings.  The
    intention was to build tools to improve our productivity: create more
    applications in less time, bring more abstractions and standards to the
    desktop and reduce our time and cost of development.

    The team products were positive, but still fell short from everything
    the .NET framework could do.

    But when we were done with our study, it was clear that it was possible
    to build this technology, which we consider key to the future of Gnome
    and Linux on the desktop.  Remember: we were developing the largest
    from-scratch desktop application at this point, Evolution (Mozilla and
    OpenOffice are open source, but were originally proprietary products,
    later open sourced).

    So we had some experience on building open source projects, and we had
    a relatively important source of pain that needed to be addressed.

    Nat Friedman was highly supportive at this point of moving our efforts
    into something that would have a larger impact, and once we got the new
    management at Ximian (David Patrick joined us as CEO), most of the the
    developers from Ximian Labs were turned into what became the Mono
    team.  The objective of the team, just like it was before was to build
    tools to increase programmer productivity.

    We remained quiet, as we moved the teams over from their existing
    projects to the Mono effort, they were winding down on their existing
    projects, and only a couple remained behind: Alex Graveley (building
    Soup) and Michael Meeks (working on Bonobo and ORBit).   The rest,
    Dietmar, Paolo, Dick and myself started work on Mono.

    Ravi will join us later to assist in the C# compiler development.

    It is obvious that a small team like this can not build a full .NET
    replacement, so we planned to launch this as an open source project,
    under the direction of Jon Perr in marketing that helped us get the news
    out that we were going to build this project.

    We planned the announcement to come by July 19th 2001, so we could
    announce this at the O'Reilly conference, as Tim O'Reilly had been very
    supportive of this effort, and had offered his help since the early
    stages, when it was still a very young idea.  When we announced the
    project launch we had our team in place, and we were shipping our
    metadata framework and our C# compiler as well as a few initial classes

    So officially the Mono project was launched on that date, but it had
    been brewing for a very long time.

    Who came first is not an important question to me, because Mono to me is
    a means to an end: a technology to help Linux succeed on the desktop.
    Of course, it has taken a life on its own, because Mono is not what
    Ximian/Novell chooses it to be, it is the result of the contributions
    and opinions of its contributors and users.  So Mono has grown larger
    and better thanks to that.

    Hope that answers your question,
    Miguel.
