---
title: "Accessibility: Team Meetings 2008 Sep 17"
lastmodified: '2008-09-18'
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Sep_17/
---

Accessibility: Team Meetings 2008 Sep 17
========================================

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
shall we get started?
```

07:00

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
sure, are we all here?
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- calen|wiki is now known as calen
```

``` nowiki
-!- mode/#mono-a11y [+oo knocte ray] by brad
```

``` nowiki
-!- knocte changed the topic of #mono-a11y to: Iteration switch meeting
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok, today we'll review the work that we had planned in last iteration, remember: pending work and most priority bugs
```

07:01

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: mind if I say a few words before we begin?
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
sure, go ahead
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
thanks
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- jpallen [~jpallen@ariadne.provo.novell.com] has joined #mono-a11y
```

07:02

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
so how does everyone feel about this scrum thing?
```

``` nowiki
are there any questions I can answer before we begin?
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
well I think it's a good idea, good direction for us
```

``` nowiki
no questions though
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
I think we should try it and see if works. I think it would
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sounds good
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
it's alright, no problem with me :)
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
so starting today, everyone send out your daily update over email
```

07:03

``` nowiki
also, for developers, anything you'll work on for the next two weeks
```

``` nowiki
please create a bugzilla enhancement for it
```

``` nowiki
and provide an estimate
```

``` nowiki
before you begin
```

``` nowiki
thanks!
```

``` nowiki
knocte: it's all yours!
```

07:04

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
thanks brad, IMO one thing I like very much is the part in the daily reports that says "Is there anything preventing you from doing what you planned?", I guess this applies also to technical issues, right?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
absolutely... the idea of a Scrum Master (me) is that it's my responsibility to help out with anything that blocks you from being productive
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
fine
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
oh, I have a question
```

07:05

``` nowiki
will we keep using this, too? Accessibility:_Project_Schedule#Current_Iterations
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
I think we'll probably phase that out in favor of a more automated tool
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
or just bugzilla?
```

``` nowiki
k
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
but I have to investigate how much bugzilla allows me/us to do over it's XML-RPC api
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
another question: on the bridge spec side, we're not going finally to create a table and do the same, right? we're going to use the estimating feature of bugzilla, right? we should clarify it
```

07:06

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: well, I'm not entirely sure of the best approach there
```

``` nowiki
basically, knocte, myself and others started writing functional specs for the bridge and the provider
```

07:07

``` nowiki
the idea is that we'll take those bullet points and make estimates
```

``` nowiki
and know how well we're doing
```

``` nowiki
the bridge is a bit more complicated than the provider
```

``` nowiki
so once knocte and I come up with an approach, we'll let the team know
```

07:08

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
fine, so let's start, as always with, sandy?
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
brad: Are the functional specs for the bridge on the wiki yet?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
mgorse: yes... it's a very long document :)
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
okay, well I have been doing a lot of catch-up
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
mgorse: Accessibility:_Bridge_Functional_Specification
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
I did start (in the previous iteration) on MenuStrip, ToolStripMenuItem, etc
```

07:09

``` nowiki
I haven't committed anything yet because it's not much good without navigation implemented
```

``` nowiki
and I spent a lot of time the past two days with non-coding tasks, like build environment issues, and again, just a lot of catch-up from being away
```

07:10

``` nowiki
I've been doing a lot of testing in Vista to understand how they implemented stuff for ToolStrip/MenuStrip
```

``` nowiki
and as usual, there are some contradictions with msdn
```

07:11

``` nowiki
This iteration
```

``` nowiki
(which will be two weeks, right?)
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok, I guess today we can bypass the "plan for next iteration", as we'll include it on the daily report to mono-a11y, right brad?
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
ok
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: no, I think the plan for next iteration is important still
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
brad: ok, but taking in account work for 2 weeks?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: at least until we have a proper backlog (a group of bugzilla issues)
```

07:12

``` nowiki
knocte: correct
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
alright
```

``` nowiki
for this iteration, then...
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok, so sandy go ahead, sorry for interrupting
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
I intend to implement all of the provider-side code for all MenuStrip/ToolStrip controls
```

``` nowiki
because after doing the main navigation it shouldn't be hard to handle the more complicated ToolStripMenuItems
```

07:13

``` nowiki
actually, I'm not sure that's enough work
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
you can always add work later... until we have proper estimates, it's not easy to know how much work to assign yourself
```

07:14

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
yeah, sorry
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
heh, that's the problem for longer iterations :)
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
it should only be temporary until we have estimates on everything
```

07:15

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
right
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
well, then I suppose I'm done
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
thanks sandy
```

``` nowiki
btw sandy: I would use the keyword LAMESPEC whenever you find MSDN contradiction, as well as the mono team do
```

07:16

``` nowiki
(not sure if we already discussed this)
```

``` nowiki
in the unit tests I mean
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
okay, I'm not familiar with that but will look into it
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
in the source code, as a comment? or how?
```

``` nowiki
(sorry for interrupting)
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
yep, the same way you use FIXME for instance
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
mario: correct... like // LAMESPEC: comment goes here
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
ok.
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
this way we can locate them easily for discussing upstream with MS
```

07:17

``` nowiki
ok, then we'll talk to mario now, mario: ready?
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
ready!
```

``` nowiki
in this iteration I spent fixing bugs. I think all the P1 bugs are fixed
```

``` nowiki
we don't need to patch anything in mcs, because everything is now in trunk
```

07:18

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
woohoo!
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
this includes tooltip-based providers: tooltip, errorprovider, helprpvoider
```

``` nowiki
I realized we are missing almost all the automation events and automation property events
```

``` nowiki
so, I wrote a table showing the missing and already-implemented:
```

``` nowiki
Accessibility:_Implementation
```

07:19

``` nowiki
I also committed a patch in mcs to complete scrollbar, so hscrollbar and vscrollbar are 100% complete
```

``` nowiki
yesterday sandy and I were talking to update the provider-project to use folders
```

07:20

``` nowiki
to split the behaviors a and events by control, that way would be easy to track missing/implemented classes
```

``` nowiki
and the class names will be shorter
```

``` nowiki
In next iteration I'll finish all the automation events and automation property events
```

07:21

``` nowiki
I think half-iteration will be events and next will be to finish textprovider
```

``` nowiki
done
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
mario, sorry for interrupt, we do not have to patch tooltip-errorprovider.patch into mono?
```

07:22

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
hey, thanks mario, it seems a lot of work
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
ray: not anymore.
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
great
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
knocte: yes it is.
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
so now the review processes are much faster, congrats
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- jpallen [~jpallen@ariadne.provo.novell.com] has quit [used jmIrc]
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok, so we'll talk to neville now
```

07:23

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
yes, less than 1 day
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ngao?
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- jpallen [~jpallen@137.65.132.15] has joined #mono-a11y
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
yes
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
go ahead
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
last iteration, i was still working on status bar navigation
```

``` nowiki
i'm sorry that i've worked on it for some time but haven't solve this problem
```

``` nowiki
i have no idea now why it doesn't work though i follow how ListBox works
```

``` nowiki
for the next iteration, i hope i could finish it and start new controls
```

07:24

``` nowiki
done
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
could someone help out ngao this iteration?
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok, don't forget to include that problem in today's scrum report
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
I'll be learning navigation, too
```

``` nowiki
so we can work together
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
knocte: ok
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
great, thanks sandy
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
sandy: great
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
yeah, I guess mario is the navigation master, so you both can ask him, he helped me a lot with the combobox :)
```

07:25

``` nowiki
ok, so now we'll talk with mgorse
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
we are following ngao problem here:
```

``` nowiki
https://bugzilla.novell.com/show_bug.cgi ?id=424401
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
knocte: yes, i've worked with him
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
mario: thanks for pointing out
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
I've mostly been working on ListItem in the bridge (bug 419019)
```

``` nowiki
I also fixed the ScrollBar test and disabled the ScrollBar buttons in the bridge
```

07:26

``` nowiki
Next iteration I intend to get my key-related changes reviewed and committed (bug 418524).  Olive doesn't build currently (Miguel committed a change that makes it not crash, but I still get an error because some files that are seemingly needed were removed from the build), so I want to see if anyone can tell me what's going on with them
```

07:27

``` nowiki
I also want to look into whether we're sending focus events (I don't think we are).  Maybe this is part of what Mario was talking about earlier
```

07:28

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
yes
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
I'm not sure other than that, although, once those issues are resolved, it should work better with Orca in theory, so I'd like to see how well it actually works and figure out what more needs to be done
```

``` nowiki
done
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
thanks mgorse, yes, the key-related changes are very important, as they block some P2 bugs (orca related) so thanks very much for the work
```

07:29

``` nowiki
so brad: anything to summarize?
```

``` nowiki
for your iteration?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
yes
```

``` nowiki
basically, I'll be involved in more planning, creating the product backlog and investigating a work breakdown for the bridge
```

07:30

``` nowiki
I will also commit my tooltip implementations once I can get a gail package that exports info about tooltips
```

``` nowiki
done
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
thanks
```

07:31

``` nowiki
I'll go now as the last dev
```

``` nowiki
Worked on fixing some tests, fixed a P1 bug about the Checked state (425404), tested and couldn't reproduce another P1: 419023 which I closed, found the culprit of yet another P1 (415320) that I passed to Mario as the problem was in the provider side (it was a thread issue -&gt; BeginInvoke usage to fix it), fixed an issue to avoid lazy initialization in the bridge tests (filed as 425111), and helped on filling the spec documentation w
```

07:32

``` nowiki
today I've reorganized a bit the UiaAtkBridgeTest code, and I'm researching some poltergeist I've seen in GailTest, I'll talk about that in the scrum daily report...
```

``` nowiki
I plan on working on a lot of bugs I've received from QA :D , and maybe PictureBox widget in the bridge
```

07:33

``` nowiki
done
```

``` nowiki
we'll start now with QA people now that I mentioned them
```

07:34

``` nowiki
bgmerrell: ready?
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
I mostly worked on smoke tests for most of the iteration
```

``` nowiki
they should when decriptor pushes out new RPMs
```

``` nowiki
then an e-mail with a summary and detailed logs will be sent to the list
```

07:35

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
that will be great... nice work, bgmerrell!
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
woohoo!!! :)
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
right now there are only a couple of basic smoke tests, so i want to keep enhancing that suite of course
```

07:36

``` nowiki
if anyone doesn't like the e-mails going to the list we can maybe do something different, they shouldn't be going out any more than once a day, though
```

``` nowiki
the last part of this iteration i've been reviewing some tests before I add them to the test suite(s)
```

07:37

``` nowiki
i've got a lot more of that to do
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
it's fine for me, it's very useful (maybe who disagrees is the MS guy that is subscribed to the mailing list :) )
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
hehe
```

07:38

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
oh, there's a MS guy on the list?  well, he's about to get a lot more mail with the scrum updates and the smoke test emails
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
oh, the scrum reports, right
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
done
```

07:39

``` nowiki
oh, wait
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
we could have mono-a11y-dev, but I'm not sure what we'd discuss on mono-a11y :-P
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
sandy: good point, I was thinking about that too :)  we'll talk about it later
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
nah, nm, done
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
I'm not really worried... if he has a problem he'll unsubscribe
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
bgmerrell: yes?
```

``` nowiki
brad: well but he's the contact with us I believe, he met with us in Cambridge, I guess he won't get unsubscribed
```

07:40

``` nowiki
bgmerrell: ok thanks
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: ah, we'll figure it out then
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
fine, then let's go with calen now
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
okay
```

``` nowiki
in this iteration i have commited a new strongwind test code for NotifyIcon control. spent some time to verify bugs and give new comments
```

07:41

``` nowiki
modified some old code with using getaddr() instead of exec(), but i will modify them again because today bgmerrell and I were discussing a better way to test states and actions of each control
```

``` nowiki
commited winforms example for DataGrid and DataGridBoolColumn controls
```

07:42

``` nowiki
in next iteration i will modify all old stronwind test code with a better way to test states and actions, we need https://bugzilla.novell.com/show_bug.cgi ?id=418909 fixed asap. thanks :)
```

``` nowiki
BTW, ray, i noticed you commited two examples for combobox with different styles, i think it would be better to understand if give them an exactly name(example combobox_dropdown.py)
```

``` nowiki
done
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
calen, ok, do it later
```

07:43

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
calen: I'll work on filling in those states for you today
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
brad, ray: thanks ^^
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
wasn't the specs work supposed to fill that gap?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: yes, but not all of the default states have been filled in
```

07:44

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
oh , I forgot about missing states, right, I'll see if I can help as well
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
cool
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok, then we'll talk with ray now, QA first :)
```

07:45

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
ok, here i come
```

``` nowiki
due to our Mid-Autumn day and technique intercommunication with intel, i just have done a little winforms samples and continue to familiar with orca test, file a bug  about winforms libraries (#426896), but it's fixed immediately.  very fast speed. :)
```

``` nowiki
and I also noticed that bgmerrell and decriptor were working on smoke test, so we can have it test automatically, great job. thank you, bgmerrell, decriptor
```

``` nowiki
i think building deb packages of our stuff is probably postponed, because of the latest mono in ubuntu/debian are too old to build olive.
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
ray is happy because he doesn't have to do it manually anymore :)
```

07:46

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
mono packages have been changed a lot (e.g. some files were moved from olive to mcs), but the mono version is still 1.2.4 in ubuntu/debian.
```

``` nowiki
bgmerrell, exactly :)
```

``` nowiki
so i want to build them on ubuntu 8.10/ debian lenny within one  and half month.
```

``` nowiki
But if it's urgent, i'll do it right now. :)
```

``` nowiki
thanks, done
```

07:47

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ray: I have a question for you and decriptor, I believe there's a buildbot that shows status of unit tests in mono, could we do something similar with our unit tests?
```

``` nowiki
note that I'm not talking about smoke tests nor strongwind ones
```

07:48

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
knocte: right
```

``` nowiki
I started looking into, but have been side tracked
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
basically I'm interested in knowing, for instance, which rev caused a breakage
```

``` nowiki
decriptor: ok, thanks for looking at it, I'll ping you later about it then :)
```

07:49

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
to really figure it out I think I need to work with the mono guys.  They have been really busy with mono 2.0 release
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
decriptor: ok, then let's wait they release :)
```

``` nowiki
ok, so, now it's your turn for the report so go ahead ;)
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
yes, we all expect them :)
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
knocte: that whole system will be changing too :)
```

07:50

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ray: yep, oh forgot to tell you thanks, ray :)
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
knocte, you'er welcome :)
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
decriptor: changing? in which way?
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
so this iteration has been a little of that and little of this
```

``` nowiki
knocte: new build system.  monobuild needs to be retired :)
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
decriptor: heh, ok, that sounds good
```

07:51

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
the wait on that is getting 2.0 out first
```

``` nowiki
so a lot of stuff has been on hold as a result
```

``` nowiki
so,
```

``` nowiki
this iteration I helped with getting smoke tests automation stuff going, getting the build working, started looking at build systems some more, and general build stuff
```

07:52

``` nowiki
most of this I'll continue with over the next iteration
```

``` nowiki
I'm focusing on cruise control .net which seems to be really cool
```

07:53

``` nowiki
its getting there, hopefully i'll have something to show off in the near future
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
:)
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
also I think I'm going to have ray be in charge of our weekly snaphots that'll be on OBS
```

07:54

``` nowiki
i'll worry about the daily ones
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
right
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
mabye have ray mail the list when the weekly builds are ready
```

07:55

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
ok
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
the daily builds will appear with the smoke test emails
```

``` nowiki
and I think that might be it
```

``` nowiki
done
```

07:56

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok, and have the discussions for the mono guys already been started to get uia for 2.2 in OBS then?
```

``` nowiki
s/for/with/
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
knocte: oh you weren't around the other day
```

``` nowiki
we are going to put all of our stuff in the mono repository
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
mmm, if it's about discarding mono:community, yes I was
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
uia for 2.2?
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
so I'm talking about it :)
```

07:57

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
oh yeah :)
```

``` nowiki
guess I worked on that to this iterations :P
```

``` nowiki
how is pushing our stuff out of olive and into mono/mcs coming?
```

``` nowiki
with olive as stable as it is
```

07:58

``` nowiki
and reliably building :P
```

``` nowiki
which its no longer a compiler bug, but a coding bug now
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
we'll have to sort that out, but the mono-build guys will help us I guess, as well
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
the obs part
```

``` nowiki
?
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
the olive-&gt;mcs
```

07:59

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
I don't know that that has much to do with the build guys
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
more of a miguel decision
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
in order for you and them to be aligned I mean
```

08:00

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
which is something that knocte and brad should probably take care of?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
I think the idea is that we'd bring that up with Miguel after the 2.0 push
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
yes we'll get involved as well
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
knocte: the way I noticed this work is, oh they moved stuff and broke the build, guess we need to fix that huh    :)
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
decriptor: hah, that's what we should try to avoid :)
```

08:01

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
knocte: it would be great to be notified, but we catch it pretty quickly
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
in fact, the last move, I fixed mono/mcs and olive
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok, but you won't be duplicating effort anymore when we're integrated with their builds, so let's go for it ;)
```

08:02

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
that's one of the cool things with the new build system (whatever it might be), reporting is going to be a key piece.
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
fine, we're deviating
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
knocte: we are duplicating stuff anymore :)  that's why having those patches in mcs was so important to me
```

08:03

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
decriptor: but I mean about those customised mono and mono-winforms packages you have on OBS.., well, let's keep on later :)
```

``` nowiki
let's finish the meeting if nobody wants to arise anything else
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
decriptor: did you add the -f option to your rpm push script?
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
bgmerrell: I will in 2 seconds :P
```

08:04

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
decriptor: roger
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
bgmerrell: do you want to come over and double check the command?
```

08:05

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
roger, roger where is the vector :P
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
lol
```

``` nowiki
s/where/what/
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
decriptor: just copy and paste it from that e-mail because i won't remember what's correct
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
is everyone good to end the meeting?
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok, did I miss anyone? we'll ask jpallen if he wants to say something, as we haven't given him even a  small greeting :), jpallen?
```

``` nowiki
he may be afk, so let's finish the meeting...
```

08:06

****

``` nowiki
&lt; jpallen&gt;&nbsp;
```

``` nowiki
hello
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- knocte is now known as Accessibility
```

****

``` nowiki
&lt;@Accessibility&gt;&nbsp;
```

``` nowiki
hey
```

****

``` nowiki
&lt; jpallen&gt;&nbsp;
```

``` nowiki
i don't have anything
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
knotce just became accessible
```

****

``` nowiki
&lt; jpallen&gt;&nbsp;
```

``` nowiki
just keep up the good work!
```

08:07

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
lol
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- Accessibility changed the topic of #mono-a11y to: Accessibility: Accessibility
```

****

``` nowiki
&lt;@Accessibility&gt;&nbsp;
```

``` nowiki
ok, thanks jpallen!
```

****

``` nowiki
&lt; jpallen&gt;&nbsp;
```

``` nowiki
i like the way things are headed and i think we're definitely getting a better handle on where we're at with things
```

``` nowiki
i'll be meeting with Jeff Jaffe next week to discuss status
```

``` nowiki
so, having all estimates by the end of the week will be helpful
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- Accessibility is now known as knocte
```

08:08

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
cool, we'll have something for you soon
```

****

``` nowiki
&lt; jpallen&gt;&nbsp;
```

``` nowiki
thanks! :-)
```

