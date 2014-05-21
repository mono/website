---
layout: obsolete
title: "Accessibility: Team Meetings 2008 Sep 03"
lastmodified: '2008-09-04'
permalink: /old_site/Accessibility:_Team_Meetings_2008_Sep_03/
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Sep_03/
---

Accessibility: Team Meetings 2008 Sep 03
========================================

``` nowiki
-!- knocte changed the topic of #mono-a11y to: MonoUIA iteration meeting about to start.....
```

06:54

``` nowiki
-!- ngao|wiki is now known as ngao
```

06:59

****

``` nowiki
&lt;@sandy|away&gt;&nbsp;
```

``` nowiki
oh shoot, forgot to fix my wiki
```

07:00

``` nowiki
oh well
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- sandy|away is now known as sandy
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok, let's wait for sandy as he's always the first to be interviewed :)
```

07:01

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
knocte: it would take me a few minutes
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
ray: I wrote an example to fake "?" button, I have no idea about python, that's the reason I use C# instead of python: http://forge.novell.com/mailman/private/ mono-a11y/attachments/20080902/36e9ee7d/ helpprovider.bin
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- sandy is now known as sandy|wiki
```

07:02

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
mario, thanks mario , i have noticed that.
```

``` nowiki
mario, but i'm failed to implement in IronPython :P
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok then let's start if you don't mind
```

****

``` nowiki
&lt;@sandy|wiki&gt;&nbsp;
```

``` nowiki
not at all
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
s/implement/&amp; HelpProvider control /
```

****

``` nowiki
&lt;@sandy|wiki&gt;&nbsp;
```

``` nowiki
I'll work on it during the meeting
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- knocte changed the topic of #mono-a11y to: MonoUIA Iteration switch meeting
```

07:03

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
will we wait Jared?
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
well good morning/afternoon/evening all
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
morning
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
decriptor, hey guy, morning :)
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ray: I haven't seen Jared in this morning... he could be in a meeting
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
I guess it's not necessary for him to come, unless he wants to arise anything
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
evening
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
hello
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok
```

07:04

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
bgmerrell, hello,
```

``` nowiki
brad, i see, thanks :)
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
let's start then by our usual reports: what you've done, if you've delayed, and tell your plan for next, and then say done
```

``` nowiki
sandy|wiki: I give you voice :)
```

****

``` nowiki
&lt;@sandy|wiki&gt;&nbsp;
```

``` nowiki
knocte: thanks
```

07:05

``` nowiki
okay, well I never updated the wiki last iteration :-/
```

``` nowiki
so what I had intended to do was to finish the Name and LabeledBy property implementation and tests
```

``` nowiki
and to work on recursive properties (ie, when a control moves, all child controls move)
```

``` nowiki
and to work with Brian on our presentation
```

``` nowiki
and finally to start on a new control after hack week
```

``` nowiki
I forgot about the holiday, though
```

07:06

``` nowiki
so yesterday was not enough time for me to get started on a new control
```

``` nowiki
I did finish Name and LabeledBy implementations last week
```

``` nowiki
and the tests finally got committed, too
```

``` nowiki
I did more work on recursive properties but it is not complete (testing)
```

``` nowiki
so this iteration...
```

``` nowiki
I will continue work on recursive properties, but more importantly I will start on a new control
```

07:07

``` nowiki
TODAY
```

``` nowiki
heh
```

``` nowiki
I'll just pick whatever's on top of the list
```

``` nowiki
done
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
heh thanks, I hope those recent commits fix some things I was also noticing as well
```

``` nowiki
BTW can you pick ToolStripMenuItem, it could help on my side
```

****

``` nowiki
&lt;@sandy|wiki&gt;&nbsp;
```

``` nowiki
sure
```

07:08

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
fine thanks, ok let's switch to mario
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
ok
```

``` nowiki
in this iteration the SWF patches were commited, I've updated ErrorProvider &amp; ToolTip patch to latest MWF revision
```

07:09

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
woohoo!
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
I wrote an example to fake "?" button, this example is going to be used to develop our HelpProvider provider
```

07:10

``` nowiki
I've updated ErrorProvider to generate ToolTipOpened event when showing tooltip and ToolTipClosed when hiding tooltip
```

``` nowiki
in next iteration I'm going to finish HelpProvider and open a bug in SWF to commit ErrorProvider,ToolTip &amp; HelpProvider
```

07:11

``` nowiki
done
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
thanks mario, there's one thing I don't understand about that example: is that intended to be used by QA?
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
knocte: yes
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
but, as far as I understand it, a developer that is a MWF consumer, won't use never that thing
```

07:12

****

``` nowiki
&nbsp;
```

``` nowiki
-!- sandy|wiki is now known as sandy
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
we should stick with what's normal to come up as an standard MWF development, right?
```

``` nowiki
I may be missing something though
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
I wrote it because (maybe) in the future the mono-team is going to implement the missing "?" button in the window-manager decorator
```

07:13

****

``` nowiki
&nbsp;
```

``` nowiki
-!- sandy is now known as sandy|wiki
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
so, we need to test our provider somehow
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
and for now, if somebody uses it in VStudio, what does it happen when running the assembly in mono?
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
the "?" isn't shown
```

07:14

``` nowiki
because isn't implemented in swf
```

``` nowiki
the SWF.HelpProvider is
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
then IMO we shouldn't invest time on that
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
but the drawing of that thing isn't
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- sandy|wiki is now known as sandy
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
but we can discuss it with brad later
```

``` nowiki
ok, understood, thanks mario
```

``` nowiki
mgorse: you with us?
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
knocte: yeah, want me to go?
```

07:15

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte, mario: yea, let's discuss that after this meeting
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
sure
```

``` nowiki
brad: k, thx
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
ok
```

``` nowiki
I implemented Spinner in the bridge, which didn't take long
```

``` nowiki
I've spent a lot of time working on getting the bridge to pass keys.  I have a bug filed for that.  I'm finally making progress, so it shouldn't take too much longer to get something working
```

07:16

``` nowiki
This iteration I'm going to finish that and test my ProgressBar work now that Neville's code is committed
```

``` nowiki
not sure what else I'll do yet; I'll need to look for a new control that I can do
```

07:17

``` nowiki
done
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
thanks mgorse
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
oh, yeah; I fixed a couple of other bugs in the bridge
```

07:18

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
cool, btw, I noticed some failing tests on UiaAtkBridgeTest wrt Spinner, did you see them?
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
knocte: no, I'll take a look.  I'll have to disable the ComboBox test since I get an exception on it that stops nunit
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
(just fyi), ok
```

07:19

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
Thanks
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
fine, let's talk with ngao
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
ok
```

``` nowiki
last iteration, i finished progress bar &amp; test, and committed. i was working on status bar panel and almost finished. only one problem is how to get control instance, because status bar panel doesn't subclass from Control, the abstract method in BasicProviderTest is not suitable.
```

``` nowiki
i updated MWF status bar patch to enable panel added, removed and cleared event, so bug#419070 is resolved. with this patch.
```

07:20

``` nowiki
i haven't decide what to do next iteration. i have some status bar navigation problems, would like to talk about it with mario after meeting, and then decide next iteration task.
```

``` nowiki
done
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok, thanks ngao
```

``` nowiki
brad: want to arise something as report? how are you settled on development for now?
```

07:21

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sure
```

``` nowiki
I have what I think is working support for tooltip
```

``` nowiki
but I can't test it in accerciser, because of an at-spi bug
```

``` nowiki
aside from that, I've been working with knocte on getting us a bit more organized
```

07:22

``` nowiki
I'll be sending an email out later this week with some ideas, looking for feedback
```

``` nowiki
and as usual, if you have any comments or questions, my electronic door is always open
```

``` nowiki
that's all I have
```

``` nowiki
keep up the good work, all
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
oh bummer, is the at-spi bug filed? just to mention the number for the sake of the log
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
yes, let me find it while someone else gives their report
```

07:23

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
fine, thanks brad
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
http://bugzilla.gnome.org/show_bug.cgi?i d=542873
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
I'll look for my key bug, too.  Can't remember the number
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
oh cool, thanks guys
```

``` nowiki
﻿my report is AOT today :) , so I'll paste it :
```

07:24

``` nowiki
I followed with my delayed developments&amp;tests (a bit stuck also because of recent regressions... oh now I see that some commit landed that may fix it...); I committed a patch for bug 411444; I faced a strange bug on MonoDevelop when updating from SVN patched MonoDevelop's 1.9 branch because I thought the bug was in MonoDevelop, the branch suffered the same so the bug was indeed on the JIT with 64bit arch and filed it (finally a du
```

``` nowiki
invested some time on documentation: updated the page http://www.mono-project.com/Accessibilit y:_Mapping_UIA_to_ATK which was outdated, prior to merging it with http://www.mono-project.com/Accessibilit y:_Control_Status as I talked with brian; work on bugs 418909 and 418916 with brad; updated http://www.mono-project.com/Accessibilit y:_Getting_Started_With_Development with some hints, and http://www.mono-project.com/Accessibilit y:_T
```

``` nowiki
oh and final note is that after some conversations with jb and #mono-winforms guys, we'll likely to be dropping reflection on MWF in order to improve architecture by having better efficiency and less ugly/error-prone code
```

``` nowiki
for next iteration I plan to dedicate time especially to the doc efforts for specs we need (aforementioned bugs), BTW wish me look tomorrow in the interview I have on the US embassy :) (hugh, still have to finish some paperwork...)
```

``` nowiki
done
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- sandy [~sandy@ip68-104-95-17.lv.lv.cox.net] has quit [Remote closed the connection]
```

07:25

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok, we'll switch to QA if nobody asks me anything? bgmerrell, you there?
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
Okay, my focus this iteration was to figure out how we are going to perform Orca testing.  I created a couple of proof-of-concept tests, and everything looks good.  Orca has it's own test harness (with logging) that we can use by tweaking our QA framework a little, so I am planning on doing that.
```

``` nowiki
(yes) :)
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
knocte: so should I start replacing the old code to use the attribute?
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
:)
```

07:26

****

``` nowiki
&nbsp;
```

``` nowiki
-!- sandy [~sandy@ip68-104-95-17.lv.lv.cox.net] has joined #mono-a11y
```

``` nowiki
-!- mode/#mono-a11y [+o sandy] by mario
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
mario: you mean about reflection? I'll wait a bit, let's talk later ;)
```

``` nowiki
bgmerrell: go on
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
(sorry, didn't realize I was disconnected until just now...thought we were waiting on somebody to talk)
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
i had a bunch of things on the side too.. i reviewed and fixed up our Form test that Calen wrote, it will be the first test we add to the regression tests sweet (hooray!)
```

07:27

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sandy: actually, we were all waiting for you...
```

``` nowiki
sandy: (kidding)
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
(somebody else will need to do the log for this meeting, preferably somebody using irssi)
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
sandy: it's ok, you missed just 3 lines
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
worked with Sandy on the totally awesome presentation
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
sandy: we'll work that out ;)
```

07:28

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
worked on our script that pulls down and updates rpms, logged some bugs, painted some e-pictures
```

``` nowiki
(for the utosc slides)
```

``` nowiki
this iteration i want to get some finished gtk orca tests in place for examples
```

07:29

``` nowiki
and then help on strongwind tests if there's time left in the iteration
```

07:30

``` nowiki
done
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
thanks bgmerrell
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
(just a rude interruption, bgmerrell don't forget to take some pics. :)  )
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
calen: you go?
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
okay
```

``` nowiki
in this iteration i have finished strongwind test code for CheckedListBox and ToolTip controls(we can't run it because accerciser can get tooltip in openSUSE11 http://bugzilla.gnome.org/show_bug.cgi?i d=542873), and verified some bugs.
```

07:31

``` nowiki
I re-runed all strongwind tests which i have finished before, to check if they can work well after some bugs have been fixed,
```

``` nowiki
and filed 2 bugs for https://bugzilla.novell.com/show_bug.cgi ?id=421836, https://bugzilla.novell.com/show_bug.cgi ?id=421831, gived comment for https://bugzilla.novell.com/show_bug.cgi ?id=414937.
```

``` nowiki
luckly, two of them have been fixed now, i will verify them after i get new rpms asap :)
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
good job calen thanks, let's go back to ray :)
```

07:32

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
checkbox_bsic_ops.py can be run completely now, bemerrell please help to review it when you have time. thanks :)
```

``` nowiki
in the coming iteration, i will keep on practice strongwind test code for ProgressBar, ErrorProvider, etc., and verify bugs.
```

``` nowiki
done
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
thanks, ray: go ahead, qa first ;)
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
 knocte ok  my turn
```

``` nowiki
for my QA part,  i tested the new mono RPMs and give a email to the team. but there were some bugs which Calen already filed.
```

07:33

``` nowiki
except that,  i read some strongwind stuff, python stuff and have done with PageSetupDialog control.
```

``` nowiki
for my build part,
```

``` nowiki
after the happy hack week, I was back to work. and i started to build UiaAtkBridge and UIAutomation to deb package.
```

``` nowiki
yesterday, i have discussed a lot with decriptor about building, the UIAutomation needs mono-nunit package  which is a old internal use nunit, it's ok for openSUSE, but apparently blocked for Ubuntu/Debian,
```

07:34

``` nowiki
so it would be great if developer would change "mono-nunit.pc" to "nunit.pc" in configure.ac in UIAutomation source tree.
```

``` nowiki
when building the lastest revision of UiaAtkBridge,  it finially needs "System.Runtime.Serialization.dll" and "System.ServiceModel.dll".
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ugh, nunit is such a mess
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
 they resided in "mono-wcf" package, but not in Ubuntu/Debian.
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
ray: that's a new package to mono, I added it
```

07:35

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
so kangaroo said thos two files are in olive, check it later
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
so we'll have to add it to the deb list
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
oh, ok,
```

``` nowiki
decriptor, thanks
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
yep, I faced that mess too: https://bugzilla.novell.com/show_bug.cgi ?id=410731
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
they have been moved, but mono is all kinds of a mess with this release :/
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
ray: could you file a bug for that nunit thing?
```

``` nowiki
and assign to me?
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
sandy, not yet
```

``` nowiki
sandy, sure, will do
```

07:36

``` nowiki
so for the next cycle, i'll keep on doing what i am doing.
```

``` nowiki
done
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
thanks ray, you'll have to help me as well for deb packaging stuff because I didn't go that far with OBS on hackweek :)
```

``` nowiki
let's jump on decriptor now :)
```

07:37

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
knocte, OK, my pleasure :)
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
just having tons of fun with mono-core lately :)  I guess since it just branched everyone thinks they can merge/checkin/break trunk or something :)
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
heh
```

07:38

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
had it working until just recently, so I'm back on that.  removed all of mario's patches from the rpms since they have been applied to mono/mcs
```

``` nowiki
helping ray a little with debs and getting those in order.
```

07:39

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
decriptor, great job
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
next...
```

``` nowiki
ray: thanks
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
any news on the atspi-dbus field?
```

07:40

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
working on getting my svn access back :(  and then cleaning up our rpm_defs again
```

``` nowiki
knocte: not really the one to ask.
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
why, is there a bug in it that affects packaging? I don't remember the last status on that sorry
```

07:41

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
knocte, at-spi-dbus was succeeded to build in openSUSE 11.0
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
oh, it's ray, fine
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
knocte: it builds, but I don't now that its really in a ready to test/working state
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
knocte, that's decriptor's effort
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
I just did a git pull and there is some new stuff, so I'll see if the new stuff packages
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok
```

07:42

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
I don't think it makes sense to work on at-spi-dbus until after this big push for Jan 1
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
﻿we'll see how we can organize to start testing that, thanks guys
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
knocte: for awhile there were no code changes/merged into master
```

``` nowiki
looks like pyatspi is being built out
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
brad: I agree, but if the build guys had spare time, they could always look at it, we haven't pushed that side too much anyway
```

``` nowiki
ok, thanks for the info decriptor
```

07:43

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
knocte: brad I'll keep working on it in the background
```

``` nowiki
I'll add a refresh of it in obs to this next iteration :)
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
decriptor: that's fine, but replacing mono-build, and normal build tasks seem higher priority
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
brad: do we cut ties with the mono team as far as the build stuff goes?
```

07:44

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
decriptor: heh, let's talk about it after this meeting
```

07:45

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
ok
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok, I have to dig more into that mono-build thing, I don't have enough background :) decriptor: sorry, were you done?
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
oh, done
```

``` nowiki
knocte: I think so :P
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
fine, thanks, I guess I didn't miss anybody?
```

``` nowiki
if someone wants to arise something before we close the meeting, it's the time :)
```

07:46

``` nowiki
ok, silence means we're done, thanks all for coming, good evening to china team :)
```

07:47

