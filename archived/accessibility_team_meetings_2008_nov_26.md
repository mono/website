---
title: "Accessibility: Team Meetings 2008 Nov 26"
lastmodified: '2008-11-26'
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Nov_26/
---

Accessibility: Team Meetings 2008 Nov 26
========================================

    -!- sandy changed the topic of #mono-a11y to: Accessibility &amp; Mono | Accessibility | Iteration meeting in progress
    07:01****
    <@brad> hey folksdo we have our contingent from utah yet?
    07:02
    bgmerrell, decriptor: ?alright, we'll get started anyway and they can catch up
    ****
    <@sandy> maybe they forgot like me...:-)
    ****
    <@brad> they're probably getting some rest :)so the release went out last nightwoohoooounfortunately it was delayed a day for 64-bit issues that came up at the last minute
    07:03
    so I'll be planning a little catchup meeting with Brian and Stephen to make a list of things to remember in future releasereleases*so we can avoid this sort of delay in the futureif anyone is interested, please blog about itso we can get some good press
    07:04
    anyway, on to this iterationas before, we still need to prioritize p1 and p2 issues that QA discoversso that we can assist them with their testingafter that, we need to finish up the remaining 0.9 bugslast I checked, there were 120.5 hours of thatand finally, we need to begin on 1.0 features
    07:05
    for this sprint, I've changed the velocity (estimated number of hours per day) from 6 to 5because our last sprint we did really well in that the graph was as we expectedbut I know that was mainly because people worked extra hoursso if we allow for more "interruption time", maybe we'll hit our target better
    07:06
    of course, the goal is to have 0 hours remaining at the end of the iterationbut that almost never happensso that shouldn't be the goalif there arent any questions, I guess let's get started planning our sprints?
    07:07****
    <@sandy> question
    07:08****
    <@brad> go ahead
    ****
    <@sandy> should Mario and I focus on outstanding provider work, or outstanding 0.9 bridge work first?I assume none of it is going into 0.9.1(for enhancement bugs)
    07:09****
    <@brad> good question... let's have neville, mario, you and I go back to what we know best, provider work, until we get down to 0 remaining provider bugs
    ****
    <@sandy> coolio
    ****
    <@brad> any other questions/comments?cool
    07:10
    give me a minute, and I'll let you guys know how many hours you should plan8 days * 5 hours = 40 hourslets give that a shot
    07:11
    sandy: check out #428718... aren't the Label providers done?
    07:12****
    <@sandy> brad: I notice very few bugs are actually targeted for 1.0
    ****
    <@brad> I'll fix that... one moment
    ****
    <@sandy> brad: looking...haha, yeah
    ****
    * sandy closes
    ****
    <@sandy> oh, there are a couple more
    07:13
    just need a unit testing saying "we don't support these patterns"
    07:14
    I'll assign to myself
    ****
    <@brad> sandy: what about the other Label ones... 428719-428722?
    ****
    <@knocte> shouldn't berserk be blank again?
    07:15****
    <@sandy> right, those I'm assigning to myself, and just need unit tests confirming that those patterns are unsupported
    ****
    <@brad> knocte: yeah, I just created the new iteration... I think the page is cached, one sec
    ****
    <@knocte> oh ok
    ****
    <@brad> for right now, go to http://build0.sled.lab.novell.com/sprint s/3/
    07:16
    there are some bugs that need to be ironed out, apparentlsandy: I'll take MaskedTextBox, MonthCalendar, TabPage and TabControl
    07:17****
    <@sandy> oh, mario's not here
    07:18****
    <@brad> yeah, we'll just have to let him pick up what's left
    ****
    * ngao can't connect to vpn :(
    07:19****
    <@sandy> woah did you milestone them all?already?
    ****
    <@brad> yea
    ****
    <@sandy> that was fast
    ****
    <@brad> sandy: have you never used the batch feature of Bugzilla?
    ****
    <@sandy> ...
    ****
    <@brad> "Change multiple bugs at once"
    ****
    <@sandy> tell me about it lateryou are going to blow my mind sir
    ****
    <@ray> :)
    07:20****
    <@ngao> I will finish ToolBar and ToolStripSeperator first, then pick up new ones
    07:25****
    <@brad> ngao: I'd prefer if you assign out 40 hours total... just pick things from the 1.0 pool
    07:26****
    <@sandy> I'll take TreeView...
    ****
    <@knocte> hey hey, bug in berserk
    07:27****
    <@ngao> brad: ok
    ****
    <@knocte> 428605 is being contabilized as 3 hr instead of 0.5
    ****
    <@brad> knocte: where?
    ****
    <@mgorse> Are other people able to connect to Berserk?  I'm having trouble resolving
    ****
     -!- calen [~calen@61.149.60.75] has joined #mono-a11y
    ****
    <@brad> hmm, works fine here, but I'm on the N network
    ****
    * decriptor sneaks in and catches up
    ****
    <@ray> calen, you are in time :)
    07:28****
    < calen> brad, sorry i come back late,
    ****
    <@ngao> I'll take Splitter
    ****
    <@brad> calen: no problem
    ****
    < calen> ray :D
    ****
    <@brad> knocte: I don't see it on the list
    07:29****
    <@ngao> and will take SplitContainer
    ****
    <@sandy> brad: TreeView is huge, apparently
    07:30
    puts me at 48 total
    ****
    <@brad> apparently
    ****
    <@sandy> should I remove an 8 hour bug or just leave it alone?
    ****
    <@knocte> brad: well, I've removed it now, but if I add it, it sums 3 to the total hoursdo you want me to re-add it?
    ****
    <@sandy> I just assigned every TreeView bug to myself :-P
    ****
    <@brad> knocte: yeah, add it so I can see
    ****
    <@sandy> meh, I'll trash one
    ****
    <@knocte> done
    07:31****
    <@sandy> well, that won't work...okay, bam
    07:32
    done
    ****
    <@brad> knocte: looks right to me... I think it is rounding on the viewprobably rounding down too
    07:33****
    <@knocte> ohhhh, but it's not happening nowlast time I added it, it was counting as 3, I promise :)now it's rounding to 0
    ****
    <@brad> heisenbug or pebkac?
    07:34
    :)
    ****
    <@sandy> haha, heisenbugthat's a new oneawesome
    ****
    <@brad> o rly?  I've used that forever
    ****
    <@sandy> new to mecool, so any other meeting business?
    07:36****
    <@ngao> brad: we will need to estimate bugs ourselves?
    07:37****
    <@brad> ngao: if they don't have estimates, yes(or if you think the estimates are wrong)
    ****
    <@ngao> brad: ok
    07:38****
    <@brad> mgorse: still having issues getting to berserk?
    ****
    <@mgorse> brad: Yes.  build0.sled.lab.novell.com won't resolve for me
    07:39****
    <@ray> mgorse, i guess you have to login Novell amercan's VPN
    ****
    <@brad> mgorse: weird... are you VPN'ed in?
    ****
    <@mgorse> brad: yes
    07:40****
    <@brad> strange... well, I guess you can try again later?
    ****
    <@ray> once i loged  in American's VPN, i could access berserk, so was ngao
    07:41****
    <@mgorse> weird
    ****
    < calen> sandy, I just add a new bug for StatusBarPanel https://bugzilla.novell.com/show_bug.cgi ?id=449317
    07:42
    sandy, can you take a look?
    07:43****
    <@sandy> calen: no problemdid you see my comment about the Image thing?
    ****
    < calen> sandy, thanks :)sandy, oh, sorry i didn't, i will read them soon
    ****
     -!- You're now known as sandy|brb
    07:45****
    * bgmerrell is here
    ****
    < calen> bgmerrell, morning!
    07:46****
    <@bgmerrell> calen: hello!sorry i'm late
    ****
    <@decriptor> bgmerrell: we are making provo look bad :(
    07:47****
    <@ray> bgmerrell, morning, dude :)decriptor, and morning you :)
    ****
    <@brad> decriptor: yeah, sandy is schooling you guys
    ****
    <@knocte> brad, sandy|brb: I assume we can close 428779 right?
    ****
    <@bgmerrell> decriptor: i'd like to see boston make 8am meetings *every* time ;)
    ****
    <@brad> knocte: yeah
    07:48
    bgmerrell: heh, I'm up at 5:20, so it wouldn't be an issue for me
    ****
    <@bgmerrell> brad: yeesh!
    ****
    <@decriptor> bgmerrell: I don't... that means that we would have 6am meetins
    ****
    <@bgmerrell> no, sorry, i just totally forgot
    07:49****
    <@brad> bgmerrell: well, a man has to have quiet time to work on Blue Steel
    ****
    <@bgmerrell> brad: is that your new cologne?or *the look*
    ****
    <@brad> bgmerrell: sigh.  not a zoolander fan?
    ****
    <@ray> decriptor,  so what's the problems with 64-bit builds? could i give out the helping hand?
    07:50****
    <@brad> the look, of course
    ****
    <@decriptor> ray: they are fixed
    ****
    <@bgmerrell> brad: yeah, i love zoolander, it just took me a sec
    ****
    <@knocte> brad: why does it say less load than 100% if I selected more than 40h? is the new velocity unset?
    ****
    <@brad> knocte: berserk doesn't count the two holidays
    07:51****
    <@knocte> oh
    ****
    <@decriptor> I need more power captain
    ****
    <@bgmerrell> calen: ray: we need to go through our deadlines and see what we got done.  i didn't finish much because of the release issues :(
    ****
    <@ray> decriptor, wow, where could i see the build logs of 64-bit builds?
    ****
    <@decriptor> obson Mono:UIA
    ****
    <@bgmerrell> I got a lot of things *almost* finished though :)
    ****
    <@ray> decriptor, i just see 64-bit packages were disabled :)
    07:52
    bgmerrell, it's ok , we will follow you up :)
    ****
    < calen> bgmerrell, okay
    07:53
    bgmerrell, do you like opening a new channel or just in here?
    07:54****
    <@decriptor> ray: ?
    ****
    <@ngao> i'll take ColumnHeader
    ****
    <@bgmerrell> ray: calen: let's go to mono-a11y-qa
    07:55****
    <@decriptor> brad: you saw that the tarballs are up and the release notes updated, right?ray: checkingbgmerrell: you guys have your own channel?
    07:56****
    <@bgmerrell> decriptor: sometimes
    ****
    <@ray> decriptor, i mean i saw the packages were disabled on MonoPreviewOpenSUSE11.0 64-bit :)
    ****
    <@brad> decriptor: si, muchas gracias
    ****
    <@decriptor> ray: which project were you looking at?
    07:57****
    * ray is connecting to obs
    ****
    <@decriptor> ray: they are enabled for me
    ****
    <@ray> decriptor, the internet connection is too slow here, i cannot connect to it :(
    07:58****
    <@ngao> mgorse: i just have bug428594 patch updated, could you have a look?
    08:00****
    <@knocte> brad (et al): wow, just saw the new mono-a11y emails about the glib# issue and replied, let me insist: I knew the problem yesterday, not 2 weeks before now
    ****
    <@bgmerrell> so, i saw some questions about the P1 bugs QA is logging, is that all cleared up?
    08:01****
    <@brad> knocte: sorry I was mistaken about the timing... from your email it sounded like this was something others knew about that should have held up the release
    08:02****
    <@knocte> brad: ok, thanks for your apologies; sorry for sounding as a severe issue
    08:04****
    <@mgorse> I only found the issue because I was working on active-descendant-changed, which I'm not planning to backport
    08:05****
    <@decriptor> ray: you can run osc prjresults [package] in your osc directory
    ****
    <@mgorse> ngao: looking
    ****
    <@decriptor> so in osc/Mono:UIA I run osc prjresults mono-core for example
    ****
     -!- You're now known as sandy
    ****
    <@ray> decriptor, oh, thanks you, you enlightened me !! :)
    08:06****
    <@decriptor> ray: I should really make up a cheat sheet or something for OBS :)
    08:07****
    <@ray> decriptor, :Ddecriptor, but my time is limited, i have to go offline, i'll check it out tomorrow, the StarBucks will be closed within 5 minutes
    08:08****
    <@decriptor> lol
    08:10
    ray: later then
    ****
    <@mgorse> ngao: I don't think that NMimeTypes should return 1 if we don't have an implementation for GetStream.  I'd suggest setting it back to 0 and adding a TODO to change to 1 once GetStream is implemented
    08:11
    since otherwise we're advertizing that GetStream should work when it doesn't
    ****
     -!- decriptor is now known as decriptor|brb
    08:13****
    <@brad> decriptor|brb: mind if I create an account for myself on build0?  I'm tired of logging in as root
    08:15****
     -!- ray [~ray@123.127.70.67] has quit [leave]
    08:18
    -!- sandy changed the topic of #mono-a11y to: Accessibility &amp; Mono |Accessibility | Latest release is 0.9.0
    08:24
