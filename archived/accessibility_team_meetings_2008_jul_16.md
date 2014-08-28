---
title: "Accessibility: Team Meetings 2008 Jul 16"
lastmodified: '2008-07-16'
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Jul_16/
---

Accessibility: Team Meetings 2008 Jul 16
========================================

-!- knocte changed the topic of #mono-a11y to: Accessibility team Iteration 9 meeting
06:03
**\< knocte\> **
ok, so
does anyone want to mention anything before running the usual scheme of the meeting, jpallen?
06:04
I guess not so, let's start with the usual order
06:05
devs first, sandy: you're used to be the first, right? :)
**\<@sandy\> **
ever since preschool
**\< knocte\> **
heh
**\<@sandy\> **
okay, well this iteration I actually spent a bit of time on putting together New Contributor Guidelines
I sent an email to the list about it last night
06:06
Also, I continued my testing tasks
but hit a roadblock that monocov, the code coverage tool I use to tell me how good my tests are, no longer works with mono from svn
so I patched monocov, and that got committed today actually
06:07
Miguel has been out of the country, so still waiting on that Olive patch :-)
**\< knocte\> **
mm great idea the monocov use
**\<@sandy\> **
so I'll have those tests done in a day or two and pick up some control work
06:08
I should probably talk to mario because he's the expert
done
**\< knocte\> **
I guess miguel is the only one who could argue about the patch? wade is no longer with us right?
**\<@sandy\> **
miguel was the only one who had issues with the patch
so I was waiting for him to approve the updated version
**\< knocte\> **
oh ok
I'll ping him today
06:09
fine, thanks sandy, mario can you go now?
**\<@mario\> **
I'm glad to announce that ListBox, ScrollBar and ComboBox support navigation.
however, I'm still missing some tests, and I need to read the StructureChanged documentation in order to generate the valid events
06:10
I've update the wiki Accessibility:_Winforms_Implementation
s/update/updated
I need to write the Navigation stuff in that page
06:11
so next iteration, I'm going to finish the wiki-page, more navigation tests and revamp TextBox
done
**\< knocte\> **
fine, remember me also to talk about the FirstChild navigation issue we talked previously
can you tell us what do you mean about the TextBox revamp?
06:12
**\<@mario\> **
sure
I need to upgrade TextBox provider in order to use the new logic defined, you know, using Behaviors instead of implementing explicitly the Pattern Interface
06:13
done
**\< knocte\> **
ok so, how many other providers need to be revamped?
**\<@mario\> **
I'm not sure, let me see.
06:14
**\< knocte\> **
I'm just a bit worried of being in a constant refactoring phase, because the plan is a bit delayed
**\<@sandy\> **
knocte: most of the ones that need to be revamped are trivial
**\<@mario\> **
knocte, three, but the changes are trivial as sandy said
**\< knocte\> **
ok, so, mario: select also another provider to work on in case you revamp TextBox in less than an iteration
06:15
**\<@mario\> **
knocte, actually TextBox isn't finished yet, my plan is to finish it before selecting another
**\< knocte\> **
fine then
ok now it's the turn of mgorse, who will spend this iteration getting up to speed in the bridge, because we're likely going to need him in some occassions
06:16
mgorse: ready to go?
**\< mgorse\> **
I didn't do much for the project last iteration. I took some ito to file/comment on a couple of a11y bugs that affect OpenSUSE, and took some fto to run errands related to moving
06:17
yesterday I continued figuring out how things work, got everything built, and fixed a bug in the bridge related to combo boxes
06:18
this iteration I'm going to implement StatusBar in the bridge, which will be my foray into working on it
done
**\< knocte\> **
fine, thanks mgorse, I hope you're now well settled in Austin!
I'll go now with my report
indeed, I've had only two real days in this iteration and haven't done too much, I also have to apologize because I haven't updated my row on the last iteration in the wiki
06:19
Guadec has been great and well, one lesson learned: you cannot expect many people in after hours talks! it wasn't really my first guadec but didn't know the differentiation between these type of "days ranges" because I only attended Vilanova's 2006 guadec for 1 day (other guadec's I've attended are just spanish guadecs)
06:21
and yesterday I spent it getting up to date, reading emails, all the commits done, and updating my repository (had a problem with MD, now solved)
still need to finish my uncommitted code about the Edit control type, will do this afternoon surely
06:22
done
ok, oh, let's go with ngao now
**\< ngao\> **
ok
in the last iteration, i followed the new contributor guidelines, and submitted a patch -- behaviors and events for status bar
it's a new work method for me :)
06:23
next iteration, i will read more navigation codes, and finish status bar navigation
done
** **
-!- peteb [\~ptbrunet@cpe-66-69-198-254.austin.res. rr.com] has joined #mono-a11y
**\< knocte\> **
ok, since mgorse will map the status bar in this iteration, it will be interesting for you to talk with him in case he has any issues
06:24
thanks ngao
**\< ngao\> **
sure
**\< knocte\> **
let's talk QA now
Calen, you with us? :)
**\< Calen\> **
knocte:yes
knocte: turn me?
06:25
**\< knocte\> **
yep please
**\< Calen\> **
okay
i only practiced openDialog and saveDialog in this Iteration and updated two gtk strongwind test script to remove some unnecessary lines.
i encountered a problem that tooltip cann't be accessibled in openSUSE11 and spent some times to reseach the reason and discuss the problem with bgmerrell and other people, finally bgmerrell make sure 'gail' cause it.  :)
today i have tried our monobuild in openSUSE11 VM, i notice the winforms app can be seen in accerciser now but the control's details(such as Label's states, Button's RoleName and actions) still not completely finished,
06:26
**\< knocte\> **
so is gail buggy?
**\< Calen\> **
and there are some difference between gtk app and what i have thought before, 'ipy' to be seen as application name in accerciser and Form's Text be seen as frame name.
knocte: it seems yes
**\< knocte\> **
Calen: ok, don't forget to file a bug report then, it's always interesting to have a true reference to the problem
06:27
even if it's not worth fixing it
**\< Calen\> **
when he return to old version, it can be work well
**\< bgmerrell\> **
knocte: it's reported
**\< Calen\> **
knocte: Brian have submited a but to gail :)
**\< knocte\> **
oh fine! can you guys then send the URL to our a11y mailing list?
06:28
**\< Calen\> **
[http://bugzilla.gnome.org/show_bug.cgi?i](http://bugzilla.gnome.org/show_bug.cgi?i) d=542873
**\< knocte\> **
perfect, now it's in the meeting log, thanks, so Calen, your plan for next iteration?
**\< Calen\> **
i will keep on reporting :)
06:29
sorry, again. today i have tried our monobuild in openSUSE11 VM, i notice the winforms app can be seen in accerciser now but the control's details(such as Label's states, Button's RoleName and actions) still not completely finished, and there are some difference between gtk app and what i have thought before, 'ipy' to be seen as application name in accerciser and Form's Text be seen as frame name. so i hope in next Iteration i can and will practice our s
06:30
trongwind test against some winforms controls
and in next Iteration i still need talk with bgmerrell some details about how to referance states.py and actions.py how to check them, because when i practice like that, it still confuse me :(
**\< knocte\> **
ok, also I hope that this iteration the olive patch will go in, so be prepared for a bunch of integration effort we will need to start to do for you to maybe start filing bugs to us the devs
**\<@sandy\> **
knocte: they are using patched olive already
06:31
**\< knocte\> **
oh well, I'm not up to date to the extent I thought!
**\< Calen\> **
BTW, does winforms control's states and actions is same as gtk's which i have seen in accerciser? for example button's action in gtk app is "click""press""release", does button's action in winforms app is the same?
**\< knocte\> **
so I'll get up to speed about the status of these things after the meeting, thanks sandy
06:32
**\<@decriptor\> **
sandy knocte are we talking about the .pc file. That's the only patch that I'm aware of?
**\<@sandy\> **
right
**\< knocte\> **
decriptor: yes
Calen: certainly there are some differences, I'll point to you a thing you could read to find out what should you check for this specific case
06:33
Calen: you done?
**\< Calen\> **
knocte: okay, thanks.
done
**\< knocte\> **
thanks Calen! bgmerrell: can you go on?
06:34
**\< bgmerrell\> **
Calen mentioned I worked on figuring out why tooltip wasn't accessible in openSUSE11. A bug is logged against gail.
I also got a patch accepted for Strongwind that adds a couple of features we might use ( [http://bugzilla.gnome.org/show_bug.cgi?i](http://bugzilla.gnome.org/show_bug.cgi?i) d=542458 )
In general I did a lot more experimenting with Strongwind and testing widgets I hadn't tried to test yet (that's what led to the patches)
06:35
I reviewed some of Calen's strongwind tests and we made some improvements. Same with Ray's WinForms samples.
I also started adding some constants for atk states and actions to our test framework, and we're going to reorganize a couple of things to make it nice and clean.
This includes the actions.py and states.py Calen referred to
The scuttlebutt is that the latest rpms (as of last night) will allow us (QA) to start writing some tests against winforms! So we're all happy about that, and Calen and I should be starting those tests this iteration.
I also keep pushing back the Strongwind tutorial(s) I've been wanting to write, so hopefully I can finish that up this iteration.
06:36
And then once Calen is comfortable with writing Strongwind tests for WinForms I really need to start looking at Orca automated tests.
done
**\< knocte\> **
ok, that sounds really great, because maybe in this iteration it's interesting to start creating a new column on the wiki page about the plan, where you put a percentage of testing to each item already developed (in theory) by us
06:37
so thanks bgmerrell, did Ray do QA work this iteration?
**\< Ray\> **
yes
in this cycle,
**\< knocte\> **
fine, then you can go on with QA part Ray
**\< Ray\> **
1. I have learnt some python and autotools stuff for testing and building
2. have some samples polished
06:38
3. updated all VMs, tune new test environments
but not to much work about buiding
in the next, hopefully I could have all samples done,
also start to write new samples; learn some new stuff about building.
over
** **
-!- calvin [\~calvin@fixe.dnsdhcp.provo.novell.com] has joined #mono-a11y
**\< knocte\> **
do you plan to write MWF samples as well? if yes be sure to sync with Calen and bgmerrell
06:39
hey calvin welcome, we're in the middle of the meeting
**\< Ray\> **
knocte, i will check it out when them asap
**\< knocte\> **
fine Ray, let's go on with decriptor then
thanks Ray
06:40
**\< Ray\> **
you're welcome. :)
**\< knocte\> **
decriptor, a11ybuild: anyone of you there? :)
**\<@decriptor\> **
yup
sorry
**\< knocte\> **
it's ok, go ahead
**\<@decriptor\> **
failed miserably at trying to tether a cell phone, sorry jpallen
06:41
had a meeting with the mono build guys and worked something out with them. We are going to try and take advantage of their build system with the advantages of OBS.
06:42
monobuild is pushing rpms almost per rev update of svn, qa has the url and we found 'our first bug' last night. sandy was awesome and got that resolved so now more than the main form shows up.
06:43
this iteration, I want to clean up the process and start running the unit tests on each rpm build.
06:44
it would be cool to have my fake bot push out notices when new rpms are available
done
**\< knocte\> **
thanks decriptor. OBS integrations sounds pretty good, who are the mono guys you talked with?
**\<@decriptor\> **
andrew/marc/rusty/thomas
06:45
kind of fell on them after wade left
since we depend on their stuff I've been trying to integrate into their stuff as well
**\< knocte\> **
fine fine, and do you plan to don't make rpms available if unit tests failed?
**\<@decriptor\> **
there are a couple issue with that, but I think that's where obs stuff will help
06:46
**\< knocte\> **
because there are some unit tests that fail currently I believe
ok, let me know you're progress, that sounds interesting
**\<@decriptor\> **
knocte: I try and just flag it in the web interface
[http://build.mono.lab.novell.com/](http://build.mono.lab.novell.com/)
**\< knocte\> **
cool
ok so we're kind of finished, except for calvin that seems now to be with us? anything that anybody wants to say before we pass to the post-meeting conversations? :)
06:47
**\<@decriptor\> **
I think it flags the failed tests but still provides rpms
**\<@sandy\> **
I did forget one thing
Friday I went to the GHOP thing at Google
**\< calvin\> **
knocte: hey, yes I'm here
**\< knocte\> **
decriptor: ok, but I'm now not able to connect :?
**\<@decriptor\> **
knocte: internal only
06:48
**\<@sandy\> **
and did a pretty good job of selling Novell to the grand prize winners :-)
**\< knocte\> **
oh right, sandy: yeah go on
**\<@sandy\> **
even with the allure of Google
they all seemed really excited that it was possible to work on free software all day
**\<@decriptor\> **
sandy and bgmerrell's presentation got accepted for this years Utah Open Source Conference :)
**\< knocte\> **
haha, fine, put that in the iteration wikipage :P
**\<@sandy\> **
anyway, I thought that was cool...they weren't just blinded by the light of Google
**\< knocte\> **
oh, the OSCON right?
**\<@sandy\> **
knocte: UTOS
06:49
**\< knocte\> **
oh, I thought they were they same thing :o
hehe, fine
**\<@decriptor\> **
knocte: subtract a few thousand and they are similar :P
**\< knocte\> **
x)
ok, anything else? did I miss anybody?
**\< Ray\> **
knocte, calvin is here. ;)
06:50
**\< knocte\> **
wiki" if you plan now on updating the wiki, other people in other timezones can go to bed :)
**\< calvin\> **
yeah, I'm not sure I have a lot go report, I just logged in for the first time in two weeks
I hope to review things with knocte on the status of the bridge and continue work there when I see where we are at
06:51
and dig through my mountain of email!
that's all
done
**\< knocte\> **
hehe, fine!
we'll change the topic then
** **
-!- knocte changed the topic of #mono-a11y to: Accessibility: Accessibility
06:52

