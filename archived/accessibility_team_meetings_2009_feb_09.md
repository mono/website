---
title: "Accessibility: Team Meetings 2009 Feb 09"
lastmodified: '2009-02-09'
redirect_from:
  - /Accessibility:_Team_Meetings_2009_Feb_09/
---

Accessibility: Team Meetings 2009 Feb 09
========================================

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
alright folks, let's get started
```

07:04

****

``` nowiki
&lt;@sshaw&gt;&nbsp;
```

``` nowiki
time to party
```

****

``` nowiki
&lt; ray&gt;&nbsp;
```

``` nowiki
brad, yes, but those wiki pages are not _really_ correct , right?
```

``` nowiki
for some controls
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
first off, I really want to thank everyone for putting extra effort in for this rlease
```

``` nowiki
ray: they should be.  if they're not, you need to let us know
```

****

``` nowiki
&lt; ray&gt;&nbsp;
```

``` nowiki
sshaw, oh, never mind, dude :)
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
so I'd like to start off by going around the room and having everyone update us on their status
```

07:05

``` nowiki
namely, I'd like to know how many hours of work remain (estimated)
```

****

``` nowiki
&lt; ray&gt;&nbsp;
```

``` nowiki
brad, yeah, that's we will do, but i was wondering when you implement the code, what's your devs' reference? :)
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
and if they think anything needs to be addressed before we are feature complete
```

``` nowiki
ray: I'll explain after the meeting
```

07:06

****

``` nowiki
&lt; ray&gt;&nbsp;
```

``` nowiki
brad, yes, sorry :D
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
let's start reverse alphabetically by nick
```

``` nowiki
sandy: you're up
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
so you can go last?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
heh
```

``` nowiki
sandy why do I always have to go first? :)
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
so I've got about 6 hours of work left for my features, plus 8 hours to really finish all my unit tests
```

07:07

****

``` nowiki
&lt;@sshaw&gt;&nbsp;
```

``` nowiki
brad: because you are al capitano
```

``` nowiki
:)
```

``` nowiki
s/al/il/
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
I ran into some irritating problems with MenuItem
```

``` nowiki
it already has a couple of known issues for 1.0
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
are these issues in Mono Winforms?
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
but it looks like I may either be spending time hacking around bounding rectangle issues, or adding another one to the list
```

``` nowiki
brad: yes
```

``` nowiki
the winforms api doesn't support much
```

``` nowiki
and I didn't realize some flaws in what I get with internal stuff
```

07:08

``` nowiki
in short
```

``` nowiki
MS deprecated this API for a reason :-)
```

``` nowiki
anyway, that's my status
```

``` nowiki
should be done for tomorrow
```

``` nowiki
(except maybe some unit tests, we'll see)
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
alright.  of course, prioritize the feature work.  we can always do unit tests tomorrow
```

07:09

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
I do know how to fix this stuff for Mono 2.6
```

``` nowiki
but there is no way jpobst will let changes in now
```

``` nowiki
because he's not familiar with the code
```

``` nowiki
done
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
that's totally understandable
```

``` nowiki
alright, ngao ?
```

****

``` nowiki
&lt; ngao&gt;&nbsp;
```

``` nowiki
brad: yes
```

07:10

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ngao: can you give your update for us?
```

****

``` nowiki
&lt; ngao&gt;&nbsp;
```

``` nowiki
brad: sure
```

``` nowiki
brad: there's propertygrid left to implement and colordialog is missing unit test
```

07:11

``` nowiki
brad: I'm figuring out how to get BaseColorControl provider
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ngao: what's left to do on propertygrid?
```

07:12

****

``` nowiki
&lt; ngao&gt;&nbsp;
```

``` nowiki
brad: and about PropertyGrid, why it's inner control can't be added by itself
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
we may not be recieving events about it
```

``` nowiki
anyway, how many hours do you think you have outstanding on that?
```

07:13

****

``` nowiki
&lt; ngao&gt;&nbsp;
```

``` nowiki
brad: actually, i'm not sure about propertygrid, but I think i could talk about colordialog with you guys after meeting and finish it
```

07:14

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ngao: alright... maybe if you want to give propertygrid to me, I can finish it up
```

****

``` nowiki
&lt; ngao&gt;&nbsp;
```

``` nowiki
brad: oh, thank you, if it won't block your schedule?
```

07:15

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ngao: oh, it's no problem
```

``` nowiki
ngao: just send me the bug number
```

``` nowiki
ngao: is that it?  can we move on?
```

****

``` nowiki
&lt; ngao&gt;&nbsp;
```

``` nowiki
brad: alright
```

07:16

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
mgorse: your turn!
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
ok
```

``` nowiki
NotifyIcon is the only feature I have left, and I need to expose the bounding rectangle for the icon
```

``` nowiki
so I'm guessing about 3 hours, but I've been struggling to figure out how to do that, so it's hard for me to say
```

07:17

``` nowiki
The rest are unit tests, which might be another 3-4 hours
```

``` nowiki
Ie, I need to test that an accessible-value event is received when a ScrollBar's value is changed, but I vaguely remember trying to add a test for that the other day and the gail test failing, so I need to look into it again
```

07:18

``` nowiki
I've generally been having trouble testing events
```

``` nowiki
but that's all.  I have PropertyGrid on the bridge, and I don't think it should require any more bridge work in theory, but we need a unit test
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
cool
```

07:19

``` nowiki
alright, mario, you're up
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
hello
```

``` nowiki
I'm missing tests for DataGridXXXProvider s
```

``` nowiki
however, there's a ListView test that tests ListView when View.Details,
```

07:20

``` nowiki
honestly I've been having problems writting the tests, segfaults and that kind of problems
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
:-/
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
is driving me crazy, but I'm trying to find the issue.
```

``` nowiki
I'm talking about bridge tests, btw
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
yeah, I've been having the same kind of issues
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
provider side is complete
```

07:21

``` nowiki
so, I hope to finish writing all tests today.
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
I think next phase, we need to invest more time into making sure our tests are repeatable
```

``` nowiki
mario: how many hours do you think you have left?
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
I guess 8hrs, more or less
```

07:22

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
mario: and am I right in saying that none of that work is actually feature work, just unit tests?
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
yes, all unit tests
```

``` nowiki
bridge tests, actually
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ok, cool
```

07:23

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
oh I forgot, I'm missing to fix 2 bugs
```

``` nowiki
let's add 4 hours more
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
I probably should have specified that besides the bounding rectangle bug, all my work is bridge-side
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
those can easily be put off till tomorrow though
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
two QA reported bugs
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
alright, knocte, I think you're alphabetically next
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
I go
```

07:24

``` nowiki
so, thanks to sandy's work on the provider for contextmenu*, the bridge unit tests have been starting to yield some failures, and I've fixed some of them, but I still have to fix 4:
```

``` nowiki
a) GetExtents is failing to give positive coordinates
```

``` nowiki
b) the test is deadlocking on app termination (maybe because I'm not yet handling the MenuClosed event)
```

``` nowiki
c) the test affects other test in the suite if it's not run the last one
```

``` nowiki
d) still don't know if it passes Atk.Selection tests
```

``` nowiki
I guess I will need 4 hours for this
```

07:25

``` nowiki
and later I'll do a test for ContextMenu, which maybe it's working out of the box by just wrapping it under the same bridge class as ContextMenuStrip
```

``` nowiki
 (I guess I need 1 or 2 hours more for this)
```

``` nowiki
after that, if I have time, I'll refactor a bit more the menu stuff
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ok, sounds good
```

07:26

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
and with that, I would be feat complete
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
super.
```

``` nowiki
as for me, I'll be taking on Neville's PropertyGrid work
```

``` nowiki
but my last feature was ScrollableControl
```

``` nowiki
which I finished on Friday
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
(seems to have not broken anything)
```

07:27

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
for the most part, wherever it's used, it's worked out of the box on the Bridge
```

``` nowiki
yeah, surprisingly enough
```

``` nowiki
I've hit some odd cases though... UpDownBase subclasses ScrollableControl
```

``` nowiki
but Mono doesn't seem to implement it properly
```

``` nowiki
so I've got to file some bugs when I get a chance
```

07:28

``` nowiki
and that's really it
```

``` nowiki
I'll be sending out some policies about tomorrow
```

``` nowiki
basically, only bug fixes, no new features, likely some form of code review required
```

07:29

``` nowiki
and working with Sandy to split up some exploratory tasks when people get done with the bugs they assign tomorrow
```

``` nowiki
anything else anyone wants to bring up?
```

``` nowiki
ok, meeting adjourned
```

07:30

``` nowiki
thanks guys for joining
```

****

``` nowiki
&lt;@sshaw&gt;&nbsp;
```

``` nowiki
brad: no thank you
```

07:31

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
sandy: can you post the log? :)
```

07:33

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
knocte: yeah
```

``` nowiki
I noticed the other day that I missed a few...
```

``` nowiki
but yeah, I'll post this
```

07:34

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
cool thx
```

