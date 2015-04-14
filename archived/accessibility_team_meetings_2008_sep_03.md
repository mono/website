---
title: "Accessibility: Team Meetings 2008 Sep 03"
lastmodified: '2008-09-04'
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Sep_03/
---

Accessibility: Team Meetings 2008 Sep 03
========================================

    -!- knocte changed the topic of #mono-a11y to: MonoUIA iteration meeting about to start.....
    06:54
    -!- ngao|wiki is now known as ngao
    06:59****
    <@sandy|away> oh shoot, forgot to fix my wiki
    07:00
    oh well
    ****
     -!- sandy|away is now known as sandy
    ****
    <@knocte> ok, let's wait for sandy as he's always the first to be interviewed :)
    07:01****
    <@sandy> knocte: it would take me a few minutes
    ****
    <@mario> ray: I wrote an example to fake "?" button, I have no idea about python, that's the reason I use C# instead of python: http://forge.novell.com/mailman/private/ mono-a11y/attachments/20080902/36e9ee7d/ helpprovider.bin
    ****
     -!- sandy is now known as sandy|wiki
    07:02****
    <@ray> mario, thanks mario , i have noticed that.mario, but i'm failed to implement in IronPython :P
    ****
    <@knocte> ok then let's start if you don't mind
    ****
    <@sandy|wiki> not at all
    ****
    <@ray> s/implement/&amp; HelpProvider control /
    ****
    <@sandy|wiki> I'll work on it during the meeting
    ****
     -!- knocte changed the topic of #mono-a11y to: MonoUIA Iteration switch meeting
    07:03****
    <@ray> will we wait Jared?
    ****
    <@knocte> well good morning/afternoon/evening all
    ****
    <@decriptor> morning
    ****
    <@ray> decriptor, hey guy, morning :)
    ****
    <@brad> ray: I haven't seen Jared in this morning... he could be in a meeting
    ****
    <@knocte> I guess it's not necessary for him to come, unless he wants to arise anything
    ****
    <@calen> evening
    ****
    <@bgmerrell> hello
    ****
    <@knocte> ok
    07:04****
    <@ray> bgmerrell, hello,brad, i see, thanks :)
    ****
    <@knocte> let's start then by our usual reports: what you've done, if you've delayed, and tell your plan for next, and then say donesandy|wiki: I give you voice :)
    ****
    <@sandy|wiki> knocte: thanks
    07:05
    okay, well I never updated the wiki last iteration :-/so what I had intended to do was to finish the Name and LabeledBy property implementation and testsand to work on recursive properties (ie, when a control moves, all child controls move)and to work with Brian on our presentationand finally to start on a new control after hack weekI forgot about the holiday, though
    07:06
    so yesterday was not enough time for me to get started on a new controlI did finish Name and LabeledBy implementations last weekand the tests finally got committed, tooI did more work on recursive properties but it is not complete (testing)so this iteration...I will continue work on recursive properties, but more importantly I will start on a new control
    07:07
    TODAYhehI'll just pick whatever's on top of the listdone
    ****
    <@knocte> heh thanks, I hope those recent commits fix some things I was also noticing as wellBTW can you pick ToolStripMenuItem, it could help on my side
    ****
    <@sandy|wiki> sure
    07:08****
    <@knocte> fine thanks, ok let's switch to mario
    ****
    <@mario> okin this iteration the SWF patches were commited, I've updated ErrorProvider &amp; ToolTip patch to latest MWF revision
    07:09****
    <@decriptor> woohoo!
    ****
    <@mario> I wrote an example to fake "?" button, this example is going to be used to develop our HelpProvider provider
    07:10
    I've updated ErrorProvider to generate ToolTipOpened event when showing tooltip and ToolTipClosed when hiding tooltipin next iteration I'm going to finish HelpProvider and open a bug in SWF to commit ErrorProvider,ToolTip &amp; HelpProvider
    07:11
    done
    ****
    <@knocte> thanks mario, there's one thing I don't understand about that example: is that intended to be used by QA?
    ****
    <@mario> knocte: yes
    ****
    <@knocte> but, as far as I understand it, a developer that is a MWF consumer, won't use never that thing
    07:12****
     -!- sandy|wiki is now known as sandy
    ****
    <@knocte> we should stick with what's normal to come up as an standard MWF development, right?I may be missing something though
    ****
    <@mario> I wrote it because (maybe) in the future the mono-team is going to implement the missing "?" button in the window-manager decorator
    07:13****
     -!- sandy is now known as sandy|wiki
    ****
    <@mario> so, we need to test our provider somehow
    ****
    <@knocte> and for now, if somebody uses it in VStudio, what does it happen when running the assembly in mono?
    ****
    <@mario> the "?" isn't shown
    07:14
    because isn't implemented in swfthe SWF.HelpProvider is
    ****
    <@knocte> then IMO we shouldn't invest time on that
    ****
    <@mario> but the drawing of that thing isn't
    ****
     -!- sandy|wiki is now known as sandy
    ****
    <@knocte> but we can discuss it with brad laterok, understood, thanks mariomgorse: you with us?
    ****
    <@mgorse> knocte: yeah, want me to go?
    07:15****
    <@brad> knocte, mario: yea, let's discuss that after this meeting
    ****
    <@knocte> surebrad: k, thx
    ****
    <@mgorse> okI implemented Spinner in the bridge, which didn't take longI've spent a lot of time working on getting the bridge to pass keys.  I have a bug filed for that.  I'm finally making progress, so it shouldn't take too much longer to get something working
    07:16
    This iteration I'm going to finish that and test my ProgressBar work now that Neville's code is committednot sure what else I'll do yet; I'll need to look for a new control that I can do
    07:17
    done
    ****
    <@knocte> thanks mgorse
    ****
    <@mgorse> oh, yeah; I fixed a couple of other bugs in the bridge
    07:18****
    <@knocte> cool, btw, I noticed some failing tests on UiaAtkBridgeTest wrt Spinner, did you see them?
    ****
    <@mgorse> knocte: no, I'll take a look.  I'll have to disable the ComboBox test since I get an exception on it that stops nunit
    ****
    <@knocte> (just fyi), ok
    07:19****
    <@mgorse> Thanks
    ****
    <@knocte> fine, let's talk with ngao
    ****
    <@ngao> oklast iteration, i finished progress bar &amp; test, and committed. i was working on status bar panel and almost finished. only one problem is how to get control instance, because status bar panel doesn't subclass from Control, the abstract method in BasicProviderTest is not suitable.i updated MWF status bar patch to enable panel added, removed and cleared event, so bug#419070 is resolved. with this patch.
    07:20
    i haven't decide what to do next iteration. i have some status bar navigation problems, would like to talk about it with mario after meeting, and then decide next iteration task.done
    ****
    <@knocte> ok, thanks ngaobrad: want to arise something as report? how are you settled on development for now?
    07:21****
    <@brad> sureI have what I think is working support for tooltipbut I can't test it in accerciser, because of an at-spi bugaside from that, I've been working with knocte on getting us a bit more organized
    07:22
    I'll be sending an email out later this week with some ideas, looking for feedbackand as usual, if you have any comments or questions, my electronic door is always openthat's all I havekeep up the good work, all
    ****
    <@knocte> oh bummer, is the at-spi bug filed? just to mention the number for the sake of the log
    ****
    <@brad> yes, let me find it while someone else gives their report
    07:23****
    <@knocte> fine, thanks brad
    ****
    <@brad> http://bugzilla.gnome.org/show_bug.cgi?i d=542873
    ****
    <@mgorse> I'll look for my key bug, too.  Can't remember the number
    ****
    <@knocte> oh cool, thanks guys﻿my report is AOT today :) , so I'll paste it :
    07:24
    I followed with my delayed developments&amp;tests (a bit stuck also because of recent regressions... oh now I see that some commit landed that may fix it...); I committed a patch for bug 411444; I faced a strange bug on MonoDevelop when updating from SVN patched MonoDevelop's 1.9 branch because I thought the bug was in MonoDevelop, the branch suffered the same so the bug was indeed on the JIT with 64bit arch and filed it (finally a duinvested some time on documentation: updated the page Accessibility:_Mapping_UIA_to_ATK which was outdated, prior to merging it with Accessibility:_Control_Status as I talked with brian; work on bugs 418909 and 418916 with brad; updated Accessibility:_Getting_Started_With_Development with some hints, and Accessibility:_Toh and final note is that after some conversations with jb and #mono-winforms guys, we'll likely to be dropping reflection on MWF in order to improve architecture by having better efficiency and less ugly/error-prone codefor next iteration I plan to dedicate time especially to the doc efforts for specs we need (aforementioned bugs), BTW wish me look tomorrow in the interview I have on the US embassy :) (hugh, still have to finish some paperwork...)done
    ****
     -!- sandy [~sandy@ip68-104-95-17.lv.lv.cox.net] has quit [Remote closed the connection]
    07:25****
    <@knocte> ok, we'll switch to QA if nobody asks me anything? bgmerrell, you there?
    ****
    <@bgmerrell> Okay, my focus this iteration was to figure out how we are going to perform Orca testing.  I created a couple of proof-of-concept tests, and everything looks good.  Orca has it's own test harness (with logging) that we can use by tweaking our QA framework a little, so I am planning on doing that.(yes) :)
    ****
    <@mario> knocte: so should I start replacing the old code to use the attribute?
    ****
    <@knocte> :)
    07:26****
     -!- sandy [~sandy@ip68-104-95-17.lv.lv.cox.net] has joined #mono-a11y-!- mode/#mono-a11y [+o sandy] by mario
    ****
    <@knocte> mario: you mean about reflection? I'll wait a bit, let's talk later ;)bgmerrell: go on
    ****
    <@sandy> (sorry, didn't realize I was disconnected until just now...thought we were waiting on somebody to talk)
    ****
    <@bgmerrell> i had a bunch of things on the side too.. i reviewed and fixed up our Form test that Calen wrote, it will be the first test we add to the regression tests sweet (hooray!)
    07:27****
    <@brad> sandy: actually, we were all waiting for you...sandy: (kidding)
    ****
    <@sandy> (somebody else will need to do the log for this meeting, preferably somebody using irssi)
    ****
    <@knocte> sandy: it's ok, you missed just 3 lines
    ****
    <@bgmerrell> worked with Sandy on the totally awesome presentation
    ****
    <@knocte> sandy: we'll work that out ;)
    07:28****
    <@bgmerrell> worked on our script that pulls down and updates rpms, logged some bugs, painted some e-pictures(for the utosc slides)this iteration i want to get some finished gtk orca tests in place for examples
    07:29
    and then help on strongwind tests if there's time left in the iteration
    07:30
    done
    ****
    <@knocte> thanks bgmerrell
    ****
    <@ray> (just a rude interruption, bgmerrell don't forget to take some pics. :)  )
    ****
    <@knocte> calen: you go?
    ****
    <@calen> okayin this iteration i have finished strongwind test code for CheckedListBox and ToolTip controls(we can't run it because accerciser can get tooltip in openSUSE11 http://bugzilla.gnome.org/show_bug.cgi?i d=542873), and verified some bugs.
    07:31
    I re-runed all strongwind tests which i have finished before, to check if they can work well after some bugs have been fixed,and filed 2 bugs for https://bugzilla.novell.com/show_bug.cgi ?id=421836, https://bugzilla.novell.com/show_bug.cgi ?id=421831, gived comment for https://bugzilla.novell.com/show_bug.cgi ?id=414937.luckly, two of them have been fixed now, i will verify them after i get new rpms asap :)
    ****
    <@knocte> good job calen thanks, let's go back to ray :)
    07:32****
    <@calen> checkbox_bsic_ops.py can be run completely now, bemerrell please help to review it when you have time. thanks :)in the coming iteration, i will keep on practice strongwind test code for ProgressBar, ErrorProvider, etc., and verify bugs.done
    ****
    <@knocte> thanks, ray: go ahead, qa first ;)
    ****
    <@ray>  knocte ok  my turnfor my QA part,  i tested the new mono RPMs and give a email to the team. but there were some bugs which Calen already filed.
    07:33
    except that,  i read some strongwind stuff, python stuff and have done with PageSetupDialog control.for my build part,after the happy hack week, I was back to work. and i started to build UiaAtkBridge and UIAutomation to deb package.yesterday, i have discussed a lot with decriptor about building, the UIAutomation needs mono-nunit package  which is a old internal use nunit, it's ok for openSUSE, but apparently blocked for Ubuntu/Debian,
    07:34
    so it would be great if developer would change "mono-nunit.pc" to "nunit.pc" in configure.ac in UIAutomation source tree.when building the lastest revision of UiaAtkBridge,  it finially needs "System.Runtime.Serialization.dll" and "System.ServiceModel.dll".
    ****
    <@brad> ugh, nunit is such a mess
    ****
    <@ray>  they resided in "mono-wcf" package, but not in Ubuntu/Debian.
    ****
    <@decriptor> ray: that's a new package to mono, I added it
    07:35****
    <@ray> so kangaroo said thos two files are in olive, check it later
    ****
    <@decriptor> so we'll have to add it to the deb list
    ****
    <@ray> oh, ok,decriptor, thanks
    ****
    <@knocte> yep, I faced that mess too: https://bugzilla.novell.com/show_bug.cgi ?id=410731
    ****
    <@decriptor> they have been moved, but mono is all kinds of a mess with this release :/
    ****
    <@sandy> ray: could you file a bug for that nunit thing?and assign to me?
    ****
    <@ray> sandy, not yetsandy, sure, will do
    07:36
    so for the next cycle, i'll keep on doing what i am doing.done
    ****
    <@knocte> thanks ray, you'll have to help me as well for deb packaging stuff because I didn't go that far with OBS on hackweek :)let's jump on decriptor now :)
    07:37****
    <@ray> knocte, OK, my pleasure :)
    ****
    <@decriptor> just having tons of fun with mono-core lately :)  I guess since it just branched everyone thinks they can merge/checkin/break trunk or something :)
    ****
    <@knocte> heh
    07:38****
    <@decriptor> had it working until just recently, so I'm back on that.  removed all of mario's patches from the rpms since they have been applied to mono/mcshelping ray a little with debs and getting those in order.
    07:39****
    <@ray> decriptor, great job
    ****
    <@decriptor> next...ray: thanks
    ****
    <@knocte> any news on the atspi-dbus field?
    07:40****
    <@decriptor> working on getting my svn access back :(  and then cleaning up our rpm_defs againknocte: not really the one to ask.
    ****
    <@knocte> why, is there a bug in it that affects packaging? I don't remember the last status on that sorry
    07:41****
    <@ray> knocte, at-spi-dbus was succeeded to build in openSUSE 11.0
    ****
    <@knocte> oh, it's ray, fine
    ****
    <@decriptor> knocte: it builds, but I don't now that its really in a ready to test/working state
    ****
    <@ray> knocte, that's decriptor's effort
    ****
    <@decriptor> I just did a git pull and there is some new stuff, so I'll see if the new stuff packages
    ****
    <@knocte> ok
    07:42****
    <@brad> I don't think it makes sense to work on at-spi-dbus until after this big push for Jan 1
    ****
    <@knocte> ﻿we'll see how we can organize to start testing that, thanks guys
    ****
    <@decriptor> knocte: for awhile there were no code changes/merged into masterlooks like pyatspi is being built out
    ****
    <@knocte> brad: I agree, but if the build guys had spare time, they could always look at it, we haven't pushed that side too much anywayok, thanks for the info decriptor
    07:43****
    <@decriptor> knocte: brad I'll keep working on it in the backgroundI'll add a refresh of it in obs to this next iteration :)
    ****
    <@brad> decriptor: that's fine, but replacing mono-build, and normal build tasks seem higher priority
    ****
    <@decriptor> brad: do we cut ties with the mono team as far as the build stuff goes?
    07:44****
    <@brad> decriptor: heh, let's talk about it after this meeting
    07:45****
    <@decriptor> ok
    ****
    <@knocte> ok, I have to dig more into that mono-build thing, I don't have enough background :) decriptor: sorry, were you done?
    ****
    <@decriptor> oh, doneknocte: I think so :P
    ****
    <@knocte> fine, thanks, I guess I didn't miss anybody?if someone wants to arise something before we close the meeting, it's the time :)
    07:46
    ok, silence means we're done, thanks all for coming, good evening to china team :)
    07:47
