---
title: "Accessibility: Team Meetings 2008 Sep 17"
lastmodified: '2008-09-18'
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Sep_17/
---

Accessibility: Team Meetings 2008 Sep 17
========================================

    ****
    <@brad> shall we get started?
    07:00****
    < knocte> sure, are we all here?
    ****
     -!- calen|wiki is now known as calen-!- mode/#mono-a11y [+oo knocte ray] by brad-!- knocte changed the topic of #mono-a11y to: Iteration switch meeting
    ****
    <@knocte> ok, today we'll review the work that we had planned in last iteration, remember: pending work and most priority bugs
    07:01****
    <@brad> knocte: mind if I say a few words before we begin?
    ****
    <@knocte> sure, go ahead
    ****
    <@brad> thanks
    ****
     -!- jpallen [~jpallen@ariadne.provo.novell.com] has joined #mono-a11y
    07:02****
    <@brad> so how does everyone feel about this scrum thing?are there any questions I can answer before we begin?
    ****
    <@sandy> well I think it's a good idea, good direction for usno questions though
    ****
    <@mario> I think we should try it and see if works. I think it would
    ****
    <@brad> sounds good
    ****
    <@ray> it's alright, no problem with me :)
    ****
    <@brad> so starting today, everyone send out your daily update over email
    07:03
    also, for developers, anything you'll work on for the next two weeksplease create a bugzilla enhancement for itand provide an estimatebefore you beginthanks!knocte: it's all yours!
    07:04****
    <@knocte> thanks brad, IMO one thing I like very much is the part in the daily reports that says "Is there anything preventing you from doing what you planned?", I guess this applies also to technical issues, right?
    ****
    <@brad> absolutely... the idea of a Scrum Master (me) is that it's my responsibility to help out with anything that blocks you from being productive
    ****
    <@knocte> fine
    ****
    <@sandy> oh, I have a question
    07:05
    will we keep using this, too? Accessibility:_Project_Schedule#Current_Iterations
    ****
    <@brad> I think we'll probably phase that out in favor of a more automated tool
    ****
    <@sandy> or just bugzilla?k
    ****
    <@brad> but I have to investigate how much bugzilla allows me/us to do over it's XML-RPC api
    ****
    <@knocte> another question: on the bridge spec side, we're not going finally to create a table and do the same, right? we're going to use the estimating feature of bugzilla, right? we should clarify it
    07:06****
    <@brad> knocte: well, I'm not entirely sure of the best approach therebasically, knocte, myself and others started writing functional specs for the bridge and the provider
    07:07
    the idea is that we'll take those bullet points and make estimatesand know how well we're doingthe bridge is a bit more complicated than the providerso once knocte and I come up with an approach, we'll let the team know
    07:08****
    <@knocte> fine, so let's start, as always with, sandy?
    ****
    <@mgorse> brad: Are the functional specs for the bridge on the wiki yet?
    ****
    <@brad> mgorse: yes... it's a very long document :)
    ****
    <@sandy> okay, well I have been doing a lot of catch-up
    ****
    <@brad> mgorse: Accessibility:_Bridge_Functional_Specification
    ****
    <@sandy> I did start (in the previous iteration) on MenuStrip, ToolStripMenuItem, etc
    07:09
    I haven't committed anything yet because it's not much good without navigation implementedand I spent a lot of time the past two days with non-coding tasks, like build environment issues, and again, just a lot of catch-up from being away
    07:10
    I've been doing a lot of testing in Vista to understand how they implemented stuff for ToolStrip/MenuStripand as usual, there are some contradictions with msdn
    07:11
    This iteration(which will be two weeks, right?)
    ****
    <@knocte> ok, I guess today we can bypass the "plan for next iteration", as we'll include it on the daily report to mono-a11y, right brad?
    ****
    <@sandy> ok
    ****
    <@brad> knocte: no, I think the plan for next iteration is important still
    ****
    <@knocte> brad: ok, but taking in account work for 2 weeks?
    ****
    <@brad> knocte: at least until we have a proper backlog (a group of bugzilla issues)
    07:12
    knocte: correct
    ****
    <@sandy> alrightfor this iteration, then...
    ****
    <@knocte> ok, so sandy go ahead, sorry for interrupting
    ****
    <@sandy> I intend to implement all of the provider-side code for all MenuStrip/ToolStrip controlsbecause after doing the main navigation it shouldn't be hard to handle the more complicated ToolStripMenuItems
    07:13
    actually, I'm not sure that's enough work
    ****
    <@brad> you can always add work later... until we have proper estimates, it's not easy to know how much work to assign yourself
    07:14****
    <@sandy> yeah, sorry
    ****
    <@knocte> heh, that's the problem for longer iterations :)
    ****
    <@brad> it should only be temporary until we have estimates on everything
    07:15****
    <@knocte> right
    ****
    <@sandy> well, then I suppose I'm done
    ****
    <@knocte> thanks sandybtw sandy: I would use the keyword LAMESPEC whenever you find MSDN contradiction, as well as the mono team do
    07:16
    (not sure if we already discussed this)in the unit tests I mean
    ****
    <@sandy> okay, I'm not familiar with that but will look into it
    ****
    <@mario> in the source code, as a comment? or how?(sorry for interrupting)
    ****
    <@knocte> yep, the same way you use FIXME for instance
    ****
    <@brad> mario: correct... like // LAMESPEC: comment goes here
    ****
    <@mario> ok.
    ****
    <@knocte> this way we can locate them easily for discussing upstream with MS
    07:17
    ok, then we'll talk to mario now, mario: ready?
    ****
    <@mario> ready!in this iteration I spent fixing bugs. I think all the P1 bugs are fixedwe don't need to patch anything in mcs, because everything is now in trunk
    07:18****
    <@brad> woohoo!
    ****
    <@mario> this includes tooltip-based providers: tooltip, errorprovider, helprpvoiderI realized we are missing almost all the automation events and automation property eventsso, I wrote a table showing the missing and already-implemented:Accessibility:_Implementation
    07:19
    I also committed a patch in mcs to complete scrollbar, so hscrollbar and vscrollbar are 100% completeyesterday sandy and I were talking to update the provider-project to use folders
    07:20
    to split the behaviors a and events by control, that way would be easy to track missing/implemented classesand the class names will be shorterIn next iteration I'll finish all the automation events and automation property events
    07:21
    I think half-iteration will be events and next will be to finish textproviderdone
    ****
    <@ray> mario, sorry for interrupt, we do not have to patch tooltip-errorprovider.patch into mono?
    07:22****
    <@knocte> hey, thanks mario, it seems a lot of work
    ****
    <@mario> ray: not anymore.
    ****
    <@ray> great
    ****
    <@mario> knocte: yes it is.
    ****
    <@knocte> so now the review processes are much faster, congrats
    ****
     -!- jpallen [~jpallen@ariadne.provo.novell.com] has quit [used jmIrc]
    ****
    <@knocte> ok, so we'll talk to neville now
    07:23****
    <@mario> yes, less than 1 day
    ****
    <@knocte> ngao?
    ****
     -!- jpallen [~jpallen@137.65.132.15] has joined #mono-a11y
    ****
    <@ngao> yes
    ****
    <@knocte> go ahead
    ****
    <@ngao> last iteration, i was still working on status bar navigationi'm sorry that i've worked on it for some time but haven't solve this problemi have no idea now why it doesn't work though i follow how ListBox worksfor the next iteration, i hope i could finish it and start new controls
    07:24
    done
    ****
    <@brad> could someone help out ngao this iteration?
    ****
    <@knocte> ok, don't forget to include that problem in today's scrum report
    ****
    <@sandy> I'll be learning navigation, tooso we can work together
    ****
    <@ngao> knocte: ok
    ****
    <@brad> great, thanks sandy
    ****
    <@ngao> sandy: great
    ****
    <@knocte> yeah, I guess mario is the navigation master, so you both can ask him, he helped me a lot with the combobox :)
    07:25
    ok, so now we'll talk with mgorse
    ****
    <@mario> we are following ngao problem here:https://bugzilla.novell.com/show_bug.cgi ?id=424401
    ****
    <@ngao> knocte: yes, i've worked with him
    ****
    <@knocte> mario: thanks for pointing out
    ****
    <@mgorse> I've mostly been working on ListItem in the bridge (bug 419019)I also fixed the ScrollBar test and disabled the ScrollBar buttons in the bridge
    07:26
    Next iteration I intend to get my key-related changes reviewed and committed (bug 418524).  Olive doesn't build currently (Miguel committed a change that makes it not crash, but I still get an error because some files that are seemingly needed were removed from the build), so I want to see if anyone can tell me what's going on with them
    07:27
    I also want to look into whether we're sending focus events (I don't think we are).  Maybe this is part of what Mario was talking about earlier
    07:28****
    <@mario> yes
    ****
    <@mgorse> I'm not sure other than that, although, once those issues are resolved, it should work better with Orca in theory, so I'd like to see how well it actually works and figure out what more needs to be donedone
    ****
    <@knocte> thanks mgorse, yes, the key-related changes are very important, as they block some P2 bugs (orca related) so thanks very much for the work
    07:29
    so brad: anything to summarize?for your iteration?
    ****
    <@brad> yesbasically, I'll be involved in more planning, creating the product backlog and investigating a work breakdown for the bridge
    07:30
    I will also commit my tooltip implementations once I can get a gail package that exports info about tooltipsdone
    ****
    <@knocte> thanks
    07:31
    I'll go now as the last devWorked on fixing some tests, fixed a P1 bug about the Checked state (425404), tested and couldn't reproduce another P1: 419023 which I closed, found the culprit of yet another P1 (415320) that I passed to Mario as the problem was in the provider side (it was a thread issue -> BeginInvoke usage to fix it), fixed an issue to avoid lazy initialization in the bridge tests (filed as 425111), and helped on filling the spec documentation w
    07:32
    today I've reorganized a bit the UiaAtkBridgeTest code, and I'm researching some poltergeist I've seen in GailTest, I'll talk about that in the scrum daily report...I plan on working on a lot of bugs I've received from QA :D , and maybe PictureBox widget in the bridge
    07:33
    donewe'll start now with QA people now that I mentioned them
    07:34
    bgmerrell: ready?
    ****
    <@bgmerrell> I mostly worked on smoke tests for most of the iterationthey should when decriptor pushes out new RPMsthen an e-mail with a summary and detailed logs will be sent to the list
    07:35****
    <@brad> that will be great... nice work, bgmerrell!
    ****
    <@ray> woohoo!!! :)
    ****
    <@bgmerrell> right now there are only a couple of basic smoke tests, so i want to keep enhancing that suite of course
    07:36
    if anyone doesn't like the e-mails going to the list we can maybe do something different, they shouldn't be going out any more than once a day, thoughthe last part of this iteration i've been reviewing some tests before I add them to the test suite(s)
    07:37
    i've got a lot more of that to do
    ****
    <@knocte> it's fine for me, it's very useful (maybe who disagrees is the MS guy that is subscribed to the mailing list :) )
    ****
    <@bgmerrell> hehe
    07:38****
    <@brad> oh, there's a MS guy on the list?  well, he's about to get a lot more mail with the scrum updates and the smoke test emails
    ****
    <@knocte> oh, the scrum reports, right
    ****
    <@bgmerrell> done
    07:39
    oh, wait
    ****
    <@sandy> we could have mono-a11y-dev, but I'm not sure what we'd discuss on mono-a11y :-P
    ****
    <@knocte> sandy: good point, I was thinking about that too :)  we'll talk about it later
    ****
    <@bgmerrell> nah, nm, done
    ****
    <@brad> I'm not really worried... if he has a problem he'll unsubscribe
    ****
    <@knocte> bgmerrell: yes?brad: well but he's the contact with us I believe, he met with us in Cambridge, I guess he won't get unsubscribed
    07:40
    bgmerrell: ok thanks
    ****
    <@brad> knocte: ah, we'll figure it out then
    ****
    <@knocte> fine, then let's go with calen now
    ****
    <@calen> okayin this iteration i have commited a new strongwind test code for NotifyIcon control. spent some time to verify bugs and give new comments
    07:41
    modified some old code with using getaddr() instead of exec(), but i will modify them again because today bgmerrell and I were discussing a better way to test states and actions of each controlcommited winforms example for DataGrid and DataGridBoolColumn controls
    07:42
    in next iteration i will modify all old stronwind test code with a better way to test states and actions, we need https://bugzilla.novell.com/show_bug.cgi ?id=418909 fixed asap. thanks :)BTW, ray, i noticed you commited two examples for combobox with different styles, i think it would be better to understand if give them an exactly name(example combobox_dropdown.py)done
    ****
    <@ray> calen, ok, do it later
    07:43****
    <@brad> calen: I'll work on filling in those states for you today
    ****
    <@calen> brad, ray: thanks ^^
    ****
    <@knocte> wasn't the specs work supposed to fill that gap?
    ****
    <@brad> knocte: yes, but not all of the default states have been filled in
    07:44****
    <@knocte> oh , I forgot about missing states, right, I'll see if I can help as well
    ****
    <@brad> cool
    ****
    <@knocte> ok, then we'll talk with ray now, QA first :)
    07:45****
    <@ray> ok, here i comedue to our Mid-Autumn day and technique intercommunication with intel, i just have done a little winforms samples and continue to familiar with orca test, file a bug  about winforms libraries (#426896), but it's fixed immediately.  very fast speed. :)and I also noticed that bgmerrell and decriptor were working on smoke test, so we can have it test automatically, great job. thank you, bgmerrell, decriptori think building deb packages of our stuff is probably postponed, because of the latest mono in ubuntu/debian are too old to build olive.
    ****
    <@bgmerrell> ray is happy because he doesn't have to do it manually anymore :)
    07:46****
    <@ray> mono packages have been changed a lot (e.g. some files were moved from olive to mcs), but the mono version is still 1.2.4 in ubuntu/debian.bgmerrell, exactly :)so i want to build them on ubuntu 8.10/ debian lenny within one  and half month.But if it's urgent, i'll do it right now. :)thanks, done
    07:47****
    <@knocte> ray: I have a question for you and decriptor, I believe there's a buildbot that shows status of unit tests in mono, could we do something similar with our unit tests?note that I'm not talking about smoke tests nor strongwind ones
    07:48****
    <@decriptor> knocte: rightI started looking into, but have been side tracked
    ****
    <@knocte> basically I'm interested in knowing, for instance, which rev caused a breakagedecriptor: ok, thanks for looking at it, I'll ping you later about it then :)
    07:49****
    <@decriptor> to really figure it out I think I need to work with the mono guys.  They have been really busy with mono 2.0 release
    ****
    <@knocte> decriptor: ok, then let's wait they release :)ok, so, now it's your turn for the report so go ahead ;)
    ****
    <@ray> yes, we all expect them :)
    ****
    <@decriptor> knocte: that whole system will be changing too :)
    07:50****
    <@knocte> ray: yep, oh forgot to tell you thanks, ray :)
    ****
    <@ray> knocte, you'er welcome :)
    ****
    <@knocte> decriptor: changing? in which way?
    ****
    <@decriptor> so this iteration has been a little of that and little of thisknocte: new build system.  monobuild needs to be retired :)
    ****
    <@knocte> decriptor: heh, ok, that sounds good
    07:51****
    <@decriptor> the wait on that is getting 2.0 out firstso a lot of stuff has been on hold as a resultso,this iteration I helped with getting smoke tests automation stuff going, getting the build working, started looking at build systems some more, and general build stuff
    07:52
    most of this I'll continue with over the next iterationI'm focusing on cruise control .net which seems to be really cool
    07:53
    its getting there, hopefully i'll have something to show off in the near future
    ****
    <@ray> :)
    ****
    <@decriptor> also I think I'm going to have ray be in charge of our weekly snaphots that'll be on OBS
    07:54
    i'll worry about the daily ones
    ****
    <@ray> right
    ****
    <@decriptor> mabye have ray mail the list when the weekly builds are ready
    07:55****
    <@ray> ok
    ****
    <@decriptor> the daily builds will appear with the smoke test emailsand I think that might be itdone
    07:56****
    <@knocte> ok, and have the discussions for the mono guys already been started to get uia for 2.2 in OBS then?s/for/with/
    ****
    <@decriptor> knocte: oh you weren't around the other daywe are going to put all of our stuff in the mono repository
    ****
    <@knocte> mmm, if it's about discarding mono:community, yes I was
    ****
    <@ray> uia for 2.2?
    ****
    <@knocte> so I'm talking about it :)
    07:57****
    <@decriptor> oh yeah :)guess I worked on that to this iterations :Phow is pushing our stuff out of olive and into mono/mcs coming?with olive as stable as it is
    07:58
    and reliably building :Pwhich its no longer a compiler bug, but a coding bug now
    ****
    <@knocte> we'll have to sort that out, but the mono-build guys will help us I guess, as well
    ****
    <@decriptor> the obs part?
    ****
    <@knocte> the olive->mcs
    07:59****
    <@decriptor> I don't know that that has much to do with the build guys
    ****
    <@sandy> more of a miguel decision
    ****
    <@knocte> in order for you and them to be aligned I mean
    08:00****
    <@decriptor> which is something that knocte and brad should probably take care of?
    ****
    <@brad> I think the idea is that we'd bring that up with Miguel after the 2.0 push
    ****
    <@knocte> yes we'll get involved as well
    ****
    <@decriptor> knocte: the way I noticed this work is, oh they moved stuff and broke the build, guess we need to fix that huh    :)
    ****
    <@knocte> decriptor: hah, that's what we should try to avoid :)
    08:01****
    <@decriptor> knocte: it would be great to be notified, but we catch it pretty quickly
    ****
    <@knocte> ok
    ****
    <@decriptor> in fact, the last move, I fixed mono/mcs and olive
    ****
    <@knocte> ok, but you won't be duplicating effort anymore when we're integrated with their builds, so let's go for it ;)
    08:02****
    <@decriptor> that's one of the cool things with the new build system (whatever it might be), reporting is going to be a key piece.
    ****
    <@knocte> fine, we're deviating
    ****
    <@decriptor> knocte: we are duplicating stuff anymore :)  that's why having those patches in mcs was so important to me
    08:03****
    <@knocte> decriptor: but I mean about those customised mono and mono-winforms packages you have on OBS.., well, let's keep on later :)let's finish the meeting if nobody wants to arise anything else
    ****
    <@bgmerrell> decriptor: did you add the -f option to your rpm push script?
    ****
    <@decriptor> bgmerrell: I will in 2 seconds :P
    08:04****
    <@bgmerrell> decriptor: roger
    ****
    <@decriptor> bgmerrell: do you want to come over and double check the command?
    08:05****
    <@ray> roger, roger where is the vector :P
    ****
    <@decriptor> lols/where/what/
    ****
    <@bgmerrell> decriptor: just copy and paste it from that e-mail because i won't remember what's correct
    ****
    <@brad> is everyone good to end the meeting?
    ****
    <@knocte> ok, did I miss anyone? we'll ask jpallen if he wants to say something, as we haven't given him even a  small greeting :), jpallen?he may be afk, so let's finish the meeting...
    08:06****
    < jpallen> hello
    ****
     -!- knocte is now known as Accessibility
    ****
    <@Accessibility> hey
    ****
    < jpallen> i don't have anything
    ****
    <@decriptor> knotce just became accessible
    ****
    < jpallen> just keep up the good work!
    08:07****
    <@ray> lol
    ****
     -!- Accessibility changed the topic of #mono-a11y to: Accessibility: Accessibility
    ****
    <@Accessibility> ok, thanks jpallen!
    ****
    < jpallen> i like the way things are headed and i think we're definitely getting a better handle on where we're at with thingsi'll be meeting with Jeff Jaffe next week to discuss statusso, having all estimates by the end of the week will be helpful
    ****
     -!- Accessibility is now known as knocte
    08:08****
    <@brad> cool, we'll have something for you soon
    ****
    < jpallen> thanks! :-)
