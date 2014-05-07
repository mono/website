---
layout: obsolete
title: "Accessibility: Team Meetings 2008 Nov 26"
permalink: /old_site/Accessibility:_Team_Meetings_2008_Nov_26/
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Nov_26/
---

Accessibility: Team Meetings 2008 Nov 26
========================================

``` nowiki
-!- sandy changed the topic of #mono-a11y to: Accessibility &amp; Mono | http://www.mono-project.com/Accessibilit y | Iteration meeting in progress
```

07:01

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
hey folks
```

``` nowiki
do we have our contingent from utah yet?
```

07:02

``` nowiki
bgmerrell, decriptor: ?
```

``` nowiki
alright, we'll get started anyway and they can catch up
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
maybe they forgot like me...
```

``` nowiki
:-)
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
they're probably getting some rest :)
```

``` nowiki
so the release went out last night
```

``` nowiki
woohoooo
```

``` nowiki
unfortunately it was delayed a day for 64-bit issues that came up at the last minute
```

07:03

``` nowiki
so I'll be planning a little catchup meeting with Brian and Stephen to make a list of things to remember in future release
```

``` nowiki
releases*
```

``` nowiki
so we can avoid this sort of delay in the future
```

``` nowiki
if anyone is interested, please blog about it
```

``` nowiki
so we can get some good press
```

07:04

``` nowiki
anyway, on to this iteration
```

``` nowiki
as before, we still need to prioritize p1 and p2 issues that QA discovers
```

``` nowiki
so that we can assist them with their testing
```

``` nowiki
after that, we need to finish up the remaining 0.9 bugs
```

``` nowiki
last I checked, there were 120.5 hours of that
```

``` nowiki
and finally, we need to begin on 1.0 features
```

07:05

``` nowiki
for this sprint, I've changed the velocity (estimated number of hours per day) from 6 to 5
```

``` nowiki
because our last sprint we did really well in that the graph was as we expected
```

``` nowiki
but I know that was mainly because people worked extra hours
```

``` nowiki
so if we allow for more "interruption time", maybe we'll hit our target better
```

07:06

``` nowiki
of course, the goal is to have 0 hours remaining at the end of the iteration
```

``` nowiki
but that almost never happens
```

``` nowiki
so that shouldn't be the goal
```

``` nowiki
if there arent any questions, I guess let's get started planning our sprints?
```

07:07

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
question
```

07:08

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
go ahead
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
should Mario and I focus on outstanding provider work, or outstanding 0.9 bridge work first?
```

``` nowiki
I assume none of it is going into 0.9.1
```

``` nowiki
(for enhancement bugs)
```

07:09

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
good question... let's have neville, mario, you and I go back to what we know best, provider work, until we get down to 0 remaining provider bugs
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
coolio
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
any other questions/comments?
```

``` nowiki
cool
```

07:10

``` nowiki
give me a minute, and I'll let you guys know how many hours you should plan
```

``` nowiki
8 days * 5 hours = 40 hours
```

``` nowiki
lets give that a shot
```

07:11

``` nowiki
sandy: check out #428718... aren't the Label providers done?
```

07:12

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
brad: I notice very few bugs are actually targeted for 1.0
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
I'll fix that... one moment
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
brad: looking...
```

``` nowiki
haha, yeah
```

****

``` nowiki
* sandy&nbsp;
```

``` nowiki
closes
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
oh, there are a couple more
```

07:13

``` nowiki
just need a unit testing saying "we don't support these patterns"
```

07:14

``` nowiki
I'll assign to myself
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sandy: what about the other Label ones... 428719-428722?
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
shouldn't berserk be blank again?
```

07:15

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
right, those I'm assigning to myself, and just need unit tests confirming that those patterns are unsupported
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: yeah, I just created the new iteration... I think the page is cached, one sec
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
oh ok
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
for right now, go to http://build0.sled.lab.novell.com/sprint s/3/
```

07:16

``` nowiki
there are some bugs that need to be ironed out, apparentl
```

``` nowiki
sandy: I'll take MaskedTextBox, MonthCalendar, TabPage and TabControl
```

07:17

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
oh, mario's not here
```

07:18

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
yeah, we'll just have to let him pick up what's left
```

****

``` nowiki
* ngao&nbsp;
```

``` nowiki
can't connect to vpn :(
```

07:19

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
woah did you milestone them all?
```

``` nowiki
already?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
yea
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
that was fast
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sandy: have you never used the batch feature of Bugzilla?
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
...
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
"Change multiple bugs at once"
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
tell me about it later
```

``` nowiki
you are going to blow my mind sir
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
:)
```

07:20

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
I will finish ToolBar and ToolStripSeperator first, then pick up new ones
```

07:25

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ngao: I'd prefer if you assign out 40 hours total... just pick things from the 1.0 pool
```

07:26

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
I'll take TreeView...
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
hey hey, bug in berserk
```

07:27

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
brad: ok
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
428605 is being contabilized as 3 hr instead of 0.5
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: where?
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
Are other people able to connect to Berserk?  I'm having trouble resolving
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- calen [~calen@61.149.60.75] has joined #mono-a11y
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
hmm, works fine here, but I'm on the N network
```

****

``` nowiki
* decriptor&nbsp;
```

``` nowiki
sneaks in and catches up
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
calen, you are in time :)
```

07:28

****

``` nowiki
&lt; calen&gt;&nbsp;
```

``` nowiki
brad, sorry i come back late,
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
I'll take Splitter
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
calen: no problem
```

****

``` nowiki
&lt; calen&gt;&nbsp;
```

``` nowiki
ray :D
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: I don't see it on the list
```

07:29

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
and will take SplitContainer
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
brad: TreeView is huge, apparently
```

07:30

``` nowiki
puts me at 48 total
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
apparently
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
should I remove an 8 hour bug or just leave it alone?
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
brad: well, I've removed it now, but if I add it, it sums 3 to the total hours
```

``` nowiki
do you want me to re-add it?
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
I just assigned every TreeView bug to myself :-P
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: yeah, add it so I can see
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
meh, I'll trash one
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
done
```

07:31

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
well, that won't work...
```

``` nowiki
okay, bam
```

07:32

``` nowiki
done
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: looks right to me... I think it is rounding on the view
```

``` nowiki
probably rounding down too
```

07:33

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ohhhh, but it's not happening now
```

``` nowiki
last time I added it, it was counting as 3, I promise :)
```

``` nowiki
now it's rounding to 0
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
heisenbug or pebkac?
```

07:34

``` nowiki
:)
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
haha, heisenbug
```

``` nowiki
that's a new one
```

``` nowiki
awesome
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
o rly?  I've used that forever
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
new to me
```

``` nowiki
cool, so any other meeting business?
```

07:36

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
brad: we will need to estimate bugs ourselves?
```

07:37

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ngao: if they don't have estimates, yes
```

``` nowiki
(or if you think the estimates are wrong)
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
brad: ok
```

07:38

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
mgorse: still having issues getting to berserk?
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
brad: Yes.  build0.sled.lab.novell.com won't resolve for me
```

07:39

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
mgorse, i guess you have to login Novell amercan's VPN
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
mgorse: weird... are you VPN'ed in?
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
brad: yes
```

07:40

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
strange... well, I guess you can try again later?
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
once i loged  in American's VPN, i could access berserk, so was ngao
```

07:41

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
weird
```

****

``` nowiki
&lt; calen&gt;&nbsp;
```

``` nowiki
sandy, I just add a new bug for StatusBarPanel https://bugzilla.novell.com/show_bug.cgi ?id=449317
```

07:42

``` nowiki
sandy, can you take a look?
```

07:43

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
calen: no problem
```

``` nowiki
did you see my comment about the Image thing?
```

****

``` nowiki
&lt; calen&gt;&nbsp;
```

``` nowiki
sandy, thanks :)
```

``` nowiki
sandy, oh, sorry i didn't, i will read them soon
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- You're now known as sandy|brb
```

07:45

****

``` nowiki
* bgmerrell&nbsp;
```

``` nowiki
is here
```

****

``` nowiki
&lt; calen&gt;&nbsp;
```

``` nowiki
bgmerrell, morning!
```

07:46

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
calen: hello!
```

``` nowiki
sorry i'm late
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
bgmerrell: we are making provo look bad :(
```

07:47

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
bgmerrell, morning, dude :)
```

``` nowiki
decriptor, and morning you :)
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
decriptor: yeah, sandy is schooling you guys
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
brad, sandy|brb: I assume we can close 428779 right?
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
decriptor: i'd like to see boston make 8am meetings *every* time ;)
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: yeah
```

07:48

``` nowiki
bgmerrell: heh, I'm up at 5:20, so it wouldn't be an issue for me
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
brad: yeesh!
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
bgmerrell: I don't... that means that we would have 6am meetins
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
no, sorry, i just totally forgot
```

07:49

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
bgmerrell: well, a man has to have quiet time to work on Blue Steel
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
brad: is that your new cologne?
```

``` nowiki
or *the look*
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
bgmerrell: sigh.  not a zoolander fan?
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
decriptor,  so what's the problems with 64-bit builds? could i give out the helping hand?
```

07:50

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
the look, of course
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
ray: they are fixed
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
brad: yeah, i love zoolander, it just took me a sec
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
brad: why does it say less load than 100% if I selected more than 40h? is the new velocity unset?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: berserk doesn't count the two holidays
```

07:51

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
oh
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
I need more power captain
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
calen: ray: we need to go through our deadlines and see what we got done.  i didn't finish much because of the release issues :(
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
decriptor, wow, where could i see the build logs of 64-bit builds?
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
obs
```

``` nowiki
on Mono:UIA
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
I got a lot of things *almost* finished though :)
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
decriptor, i just see 64-bit packages were disabled :)
```

07:52

``` nowiki
bgmerrell, it's ok , we will follow you up :)
```

****

``` nowiki
&lt; calen&gt;&nbsp;
```

``` nowiki
bgmerrell, okay
```

07:53

``` nowiki
bgmerrell, do you like opening a new channel or just in here?
```

07:54

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
ray: ?
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
i'll take ColumnHeader
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
ray: calen: let's go to mono-a11y-qa
```

07:55

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
brad: you saw that the tarballs are up and the release notes updated, right?
```

``` nowiki
ray: checking
```

``` nowiki
bgmerrell: you guys have your own channel?
```

07:56

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
decriptor: sometimes
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
decriptor, i mean i saw the packages were disabled on MonoPreviewOpenSUSE11.0 64-bit :)
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
decriptor: si, muchas gracias
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
ray: which project were you looking at?
```

07:57

****

``` nowiki
* ray&nbsp;
```

``` nowiki
is connecting to obs
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
ray: they are enabled for me
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
decriptor, the internet connection is too slow here, i cannot connect to it :(
```

07:58

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
mgorse: i just have bug428594 patch updated, could you have a look?
```

08:00

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
brad (et al): wow, just saw the new mono-a11y emails about the glib# issue and replied, let me insist: I knew the problem yesterday, not 2 weeks before now
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
so, i saw some questions about the P1 bugs QA is logging, is that all cleared up?
```

08:01

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: sorry I was mistaken about the timing... from your email it sounded like this was something others knew about that should have held up the release
```

08:02

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
brad: ok, thanks for your apologies; sorry for sounding as a severe issue
```

08:04

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
I only found the issue because I was working on active-descendant-changed, which I'm not planning to backport
```

08:05

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
ray: you can run osc prjresults [package] in your osc directory
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
ngao: looking
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
so in osc/Mono:UIA I run osc prjresults mono-core for example
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- You're now known as sandy
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
decriptor, oh, thanks you, you enlightened me !! :)
```

08:06

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
ray: I should really make up a cheat sheet or something for OBS :)
```

08:07

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
decriptor, :D
```

``` nowiki
decriptor, but my time is limited, i have to go offline, i'll check it out tomorrow, the StarBucks will be closed within 5 minutes
```

08:08

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
lol
```

08:10

``` nowiki
ray: later then
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
ngao: I don't think that NMimeTypes should return 1 if we don't have an implementation for GetStream.  I'd suggest setting it back to 0 and adding a TODO to change to 1 once GetStream is implemented
```

08:11

``` nowiki
since otherwise we're advertizing that GetStream should work when it doesn't
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- decriptor is now known as decriptor|brb
```

08:13

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
decriptor|brb: mind if I create an account for myself on build0?  I'm tired of logging in as root
```

08:15

****

``` nowiki
&nbsp;
```

``` nowiki
-!- ray [~ray@123.127.70.67] has quit [leave]
```

08:18

``` nowiki
-!- sandy changed the topic of #mono-a11y to: Accessibility &amp; Mono | http://www.mono-project.com/Accessibilit y | Latest release is 0.9.0
```

08:24

