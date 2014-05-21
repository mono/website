---
layout: obsolete
title: "Accessibility: Team Meetings 2008 Jul 30"
lastmodified: '2008-12-03'
permalink: /old_site/Accessibility:_Team_Meetings_2008_Jul_30/
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Jul_30/
---

Accessibility: Team Meetings 2008 Jul 30
========================================

**\<@calvin\> **
let's get started... I've missed several of these iteration meetings
07:04
it's good to be back in one!
Let's start with our top pupil (as Andres coined it) Sandy!
07:05
**\<@sandy\> **
ok
First off, our last outstanding patch to olive finally got the go-ahead, and it is now committed
a tiny thing but it took FOREVER :-)
I got my tests for Form, RadioButton, and GroupBox committed, as I said
Form could use a few more tests, I think, but the coverage is pretty good right now
07:06
I did update the new contributor guidelines
[http://mono-project.com/Accessibility:\_G]({{site.github.url}}/Accessibility:_G) etting\_Started\_With\_Development
there is now a little section about how our Coding Guidelines differ from the rest of Mono
and some other cleanups
like instructions for obtaining code coverage when you run unit tests
07:07
So I completed all of my tasks finally
I noticed that mario seems to have assigned me some work for next iteration...?
so I will be working on PrintPreviewControl and PrintPreviewDialog
mario: if I understand correctly?
**\<@mario\> **
did I ?
07:08
I mean.. did I do that?
**\<@sandy\> **
mmm, maybe it was just random happenstance how that played out
well, then I don't know what I'm doing next iteration
controls and stuff :-)
**\<@calvin\> **
haha!
'n stuff
07:09
**\<@sandy\> **
sorry, I guess I'll work out with Mario after the meeting...
my bad
done
**\<@calvin\> **
well, congrats sandy on finishing everything in the interation!
**\<@sandy\> **
lol, thanks
**\<@calvin\> **
very cool, and thanks for the guidelines work as well
Mario!
**\<@mario\> **
ok
07:10
in this iteration I changed the Providers base class to support Components and Controls
because my providers in this iteration are Component (ErrorProvider, HelpProvider and ToolTip)
07:11
however, I noticed that those Component are "shared", so, I need to add an extra effort to keep everything nice
I'm still wrestling with the Component-based providers, I couldn't finish all, I just finished ToolTip and.. ErrorProvider partially
07:12
next iteration is finish Component-based and send the patches tp SWF team for reviewing
07:13
done!
**\<@calvin\> **
great, thanks mario
hey, I like this new order.... ngao
go ahead
**\< ngao\> **
ok
07:14
last iteration, i implemented progress bar, and sent the patch
for unit test, I've almost finished it, but haven't committed yet
next iteration, i will implement another status bar child -- Image
oh another thing,
i change status bar provider from FragmentRootControlProvider to FragmentControlProvider
07:15
s/from/subclass from
done
**\<@calvin\> **
ngao: hmm, why the change from root?
07:16
**\< ngao\> **
because status bar has children
**\<@calvin\> **
ngao: oh, so was the change from FramgmentControl to FragementRootControl?
07:17
**\< ngao\> **
ah, yes, sorry
**\<@calvin\> **
ah, ok, I was confused there, thanks!
mgorse: go ahead
07:18
**\< mgorse\> **
ok
I worked more on collections in atspi-dbus. I've pretty much finished coding and have code that compiles, but it's untested
I worked on mapping the ScrollBar provider to atk but haven't finished
07:19
My test isn't working for it, and I need to add in a couple more things
I modified the gail tester to run the StatusBar test in a gui thread, since running GetExtents was causing deadlock
I sent a patch for that to the list but haven't committed anything yet
07:20
After the meeting I'm going to work on an a11y issue affecting openSUSE that Jared wants me to work on (I have a patch but it isn't working and I need to figure out why)
then I'll finish working on scroll bars, then figure out what to do next
done
**\< jpallen\> **
i'm not expecting the openSUSE bug to take long for mgorse to fix
07:21
**\<@calvin\> **
mgorse: that's awesome, and good to have you working in the bridge
jpallen: ok
Andres isn't here FTO (on an airplane) and I didn't get an update but his work with Mike getting issues in atk\# I know have continued along with bridge work.
07:22
He won't be here most or all of the iteration so we'll hear from him next time
07:23
**\< mgorse\> **
oh, yeah. I forgot to mention that I talked to Mike Kestner, and he made a change to the value interface last week, since what was there wasn't usable
**\<@calvin\> **
and I've been working around in the bridge but have a bunch of code that is not committed and not sure it should be... I've been trying different solutions
mgorse: oh, cool, Andres has been our main interface with Mike Kestner, so good to have you there too!
so I'll be continuing looking in to that and also getting on the to the next control type in my list
07:24
Ray: go ahead
**\< Ray\> **
yes
QA part
this week, I have some problems with HelpProvider and filed a bug with that, [https://bugzilla.novell.com/show\_bug.cgi](https://bugzilla.novell.com/show_bug.cgi) ?id=412849,
07:25
but unfortunately, the upstream(Mono?) does implement the helpbutton, so i might change code a bit, and check it out later.
and Build part
update accerciser to lastest version.
07:26
people could download it from [http://download.opensuse.org/repositorie](http://download.opensuse.org/repositorie) s/home://rawang/openSUSE\_11.0/i586/accer ciser-1.3.5-1.1.i586.rpm,
and decriptor suggested me that i might change my mind to put the updates to mainsteam (openSUSE:Factory) so that the lastest stuff to a11y could be adopted in the next release.
i have forked a accerciser branch from openSUSE:Factory, and built the newest version to this practice.
second, as knocte mentioned last time, i paid attention to atspi-dbus. so i grabbed the source, but can't make dist until update to HEAD version today.
07:27
So for the next, i would spend half of my time to build something and half to finish continuous test samples.
done
**\<@calvin\> **
thanks Ray
**\< Ray\> **
thank calvin
07:28
**\<@calvin\> **
bgmerrell: before you go, I must know... iPhone?
**\<@bgmerrell\> **
calvin: today by 3:00pm!
**\<@calvin\> **
nice!
**\* bgmerrell **
is excited
**\<@bgmerrell\> **
this iteration...
07:29
**\<@calvin\> **
I await the GroupWise notice "I have to leave early today for..."
sorry, go ahead
**\<@bgmerrell\> **
hah!
most of my time was spent writing some (hopefully) decent documentation for Strongwind that can be referred to by anyone who wants to work on QA
[http://mono-project.com/Accessibility:\_S]({{site.github.url}}/Accessibility:_S) trongwind\_Basics
07:30
Strongwind was very lacking in the documentation department, so this should help
and as a nice side-effect I can use it as a reference for our utosc presentation
**\< jpallen\> **
looks good bgmerrell !
**\<@sandy\> **
hot
07:31
**\<@bgmerrell\> **
Calen and the lead developer for strongwind both looked at it and we made some corrections and some patches to Strongwind
Other than that, we logged our first handful of UI Automation bugs
07:32
**\<@calvin\> **
bgmerrell: yes! bugs!
**\<@bgmerrell\> **
that are actually kind of blocking us for finishing any automated tests
**\<@calvin\> **
doh!
**\<@bgmerrell\> **
but, they aren't really blocker bugs because we can still poke around elsewhere
**\<@calvin\> **
yes!
**\< jpallen\> **
we need those fixed
**\<@sandy\> **
maybe I've found my tasks, then?
07:33
**\< jpallen\> **
i'd like to see some pass/fail status in [http://www.mono-project.com/Accessibilit]({{site.github.url}}/Accessibilit) y:\_Test\_Plan\_WinForms\_Controls
sandy: maybe
**\<@bgmerrell\> **
jpallen: yeah, we should have done that
jpallen also is going have a "General" component set up for us in bugzilla
07:34
**\< jpallen\> **
yes
now that gary is back from fto
**\<@bgmerrell\> **
right now some of the bugs might be filed against the wrong components because we aren't sure where they go yet
**\< jpallen\> **
i'll get that going today
so, moving forward
i'm going to be looking at [http://www.mono-project.com/Accessibilit]({{site.github.url}}/Accessibilit) y:\_Control\_Status
07:35
and
[http://www.mono-project.com/Accessibilit]({{site.github.url}}/Accessibilit) y:\_Mapping\_UIA\_to\_ATK
and
[http://www.mono-project.com/Accessibilit]({{site.github.url}}/Accessibilit) y:\_Test\_Plan\_WinForms\_Controls
to determine how we are tracking to finish phase 1
this means that everyone on the team should be doing the same :)
we need to meet our phase 1 deadline
07:36
**\< mgorse\> **
jpallen: thanks for the pointer; looks like I need to update the uia-to-atk page slightly
**\<@calvin\> **
Calen: hey, we never heard from you... go ahead
**\<@bgmerrell\> **
Calen is doing a great job with her test scripts, and I have been tweaking things slightly as those are checked in
**\* bgmerrell **
shuts up
07:37
**\< Calen\> **
calvin:okay
bgmerrell: thanks:)
in this iteration, i have finished button, checkbox, radiobutton control's strongwind test script.
07:38
i also have run button, checkbox test and log some bugs.
radiobutton doesn't been finished (accerciser can't show the item with radiobutton role) so i just script the test in advance but not run it yet.
and i spent some time to read and discussed strongwind\_basics tutorial that was wrote by Brian. he did a good job. very useful.
07:39
in coming iteration
07:40
i am going to script strongwind test for scrollbar, and run the test if it's ready to be run test.
and we also need update [http://www.mono-project.com/Accessibilit]({{site.github.url}}/Accessibilit) y:\_Test\_Plan\_WinForms\_Controls wiki page Promptly. :)
here i have a question:
07:41
how can i consider if developer have finished one control complelely (i asked it before),
because i noticed if one control's provider task status been marked 'done' in schedule wiki but it also can't work well in Accerciser such as ScrollBar(hscrollbar, vscrollbar), ListBox. can somebody give us(QA) a signal if one control is ready to be tested? by email or locate in Notes in schedule wiki would be Okay. thanks a lot :)
done
07:42
**\<@sandy\> **
Calen: if we do a good job of updating these wiki pages:
[http://www.mono-project.com/Accessibilit]({{site.github.url}}/Accessibilit) y:\_Control\_Status
[http://www.mono-project.com/Accessibilit]({{site.github.url}}/Accessibilit) y:\_Mapping\_UIA\_to\_ATK
the info should be there
**\<@calvin\> **
sandy: agreed
**\< jpallen\> **
yes
**\<@sandy\> **
Calen: then you can check if both sides have been done
**\< Calen\> **
sandy: okay, thanks,
**\< jpallen\> **
and if it is marked done and you have issues, that's when bugs should be filed
07:43
**\<@calvin\> **
so part of everyone's work this week should be to keep the wiki pages jpallen mentioned above up to date
**\< jpallen\> **
yes. thanks
**\< Calen\> **
thanks everyone:)
**\<@calvin\> **
ok, I don't have anything else, jpallen did you have anything else?
**\< Ray\> **
sure, we will do
**\< jpallen\> **
yes
07:44
a few things
**\<@sandy\> **
decriptor: ?
**\< jpallen\> **
we should be striving to complete individual controls
in other words
i'd rather see few controls at 100% completeness than many at 80%, for example
i realize that these controls share stuff underneath
07:45
but
we should be looking at getting as many at 100% asap
so QA can start cranking
sound good?
one other thing
07:46
does anyone know Alasdair King from Claro Software?
**\<@sandy\> **
no :-)
07:47
**\<@mario\> **
I don't
**\< jpallen\> **
well, he heard about our project through MS
i think Claro Software may be an MS a11y partner
07:48
**\< mgorse\> **
never heard of him
**\< jpallen\> **
anyway, he's interested in our project
**\<@sandy\> **
I'm afraid we won't be much use to them until we do the client-side stuff
**\< mgorse\> **
jpallen: What do you mean? Interested in using it? Working on it?
07:49
**\< jpallen\> **
he wants to make sure UIA works well with their product(s) on Linux
**\<@mario\> **
oh man.. I'm reading his work and he has screen-reader for accessing UML diagrams... that's sweet!
**\< mgorse\> **
nice
**\< jpallen\> **
I'm going to contact him
**\< Calen\> **
jpallen: so great!
**\< jpallen\> **
looks like he could be a great beta site :)
**\<@sandy\> **
that would rock
**\< jpallen\> **
so, if he jumps on irc or the mailing list please welcome him to the group
07:50
keep up the great work everyone
we're making good progress
**\<@bgmerrell\> **
jpallen: that reminds me, I forwarded you a resume last week.
**\< jpallen\> **
thank you everyone for all of your hard work and dedication
bgmerrell: ah, yes
bgmerrell: got it. need to do some reviewing of resumes this week
07:51
bgmerrell: thanks
that's all from me
**\<@calvin\> **
ok, thanks everyone! I think we're done!
**\< mgorse\> **
jpallen: I'm not getting it. Is Claro developing something for Linux? I'm looking at their web page, and it looks like they have a Windows product, unless they also have something for Linux
**\< Calen\> **
thanks calvin!
**\<@sandy\> **
mgorse: if they shift their windows product to UIA...
**\< jpallen\> **
mgorse: i'm not sure, but it sounded like they are looking at using UIA on Linux
07:52
mgorse: i'll find out more
**\<@decriptor\> **
should I go now :P
**\< mgorse\> **
ok. If he's writing the screen reader in uia, then, yeah, our work won't help him until after phase 2
**\<@calvin\> **
I know Claro was one of the only companies in the AIA that was looking to build new tools completely done on UIA
**\< mgorse\> **
but would make a great test for that work
07:53
**\<@calvin\> **
decriptor: oh man! I didn't see you in the iteration, are you adding yourself in there?
**\<@decriptor\> **
calvin: yeah, I just didn't get to the wiki in time
**\< Calen\> **
jpallen: it means we have a potential user now?
07:54
**\<@calvin\> **
I man for last week
decriptor: go ahead and I'll edit the log when I post it
**\< jpallen\> **
Calen: yep :)
**\<@decriptor\> **
then real fast,
**\< Calen\> **
jpallen: sounds good!
07:55
**\< Ray\> **
yes, it's a good thing :)
**\< jpallen\> **
calvin: did we get your update?
**\<@calvin\> **
yes
07:56
**\<@decriptor\> **
worked on getting at-spi-dbus buildable (thanks to Mike and Mark for that), Working on the .spec file for that, fixed my rpm push scripts (they are working now), working with ray to get accerciser up to date, submitted an updated at-spi to factory
next week continue working on that stuff
done
**\<@calvin\> **
decriptor: cool, sorry about that
decriptor: can you put yourself in the upcoming iteration? (11)
07:57
decriptor: and update iteration 10 with that information as well
**\<@bgmerrell\> **
Oh, Ray mentioned that he packaged Accerciser 1.35. Just wanted to let everyone know that this is awesome because 1.35 is a lot nicer/more stable than 1.0.1 that was the only thing we had packaged until now

