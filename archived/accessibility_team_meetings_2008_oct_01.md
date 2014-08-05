---
title: "Accessibility: Team Meetings 2008 Oct 01"
lastmodified: '2008-10-15'
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Oct_01/
---

Accessibility: Team Meetings 2008 Oct 01
========================================

``` nowiki
-!- knocte changed the topic of #mono-a11y to: MonoUIA - Iteration meeting
```

07:00

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
ok, this iteration meeting will be a bit unusual because , taking advantage that the china people is not here (and so it's no late for them), we'll have the first 10 mins for everybody to figure out the work they will do on the iteration
```

07:01

``` nowiki
just make up a list of things, and if you want to discuss with anybody in order to avoid collision, go ahead
```

07:02

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
make sure to take around 60 hours (6 hrs per day, 2 week iteration)
```

``` nowiki
sorry for the flux... once we get good at this process and have some nice tools, we'll be much faster with these things
```

07:03

****

``` nowiki
* sandy&nbsp;
```

``` nowiki
just reassigned a ton of *Strip* bugs to himself
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sandy: are you going to unassign #428735?
```

07:04

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
knocte: i have Calen's report
```

07:05

****

``` nowiki
&nbsp;
```

``` nowiki
-!- jpallen [~jpallen@137.65.132.177] has joined #mono-a11y
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
brad: I guess I should do that
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
jpallen: morning!
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
bgmerrell: nice, thanks
```

****

``` nowiki
* sandy&nbsp;
```

``` nowiki
lets go, not without regret
```

****

``` nowiki
&lt; jpallen&gt;&nbsp;
```

``` nowiki
hello everyone
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
morning jpallen
```

07:06

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
morn'n
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
is anyone taking textbox and richtextbox?
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
jpallen: we've decided to dedicate the first 10-15 mins of the meeting to let people figure out the work they will do (thanks to the estimations)
```

``` nowiki
brad: me, textbox at least
```

****

``` nowiki
&lt; jpallen&gt;&nbsp;
```

``` nowiki
ah
```

07:07

``` nowiki
ok
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
brad: I'm
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: provider
```

``` nowiki
mario: ok
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
brad: oh, then no
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
mario: so you're taking combobox, listbox and textbox/richtextbox?
```

``` nowiki
mario: doesn't that seem like a bit much?
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
brad: actually, combobox and listbox are done, I'm missing the tests in scrollbar, and I was planning to finish textbox/richtextbox
```

07:08

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
mario: ah ok
```

``` nowiki
then I'll work on listview then
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
brad: I think there are some bugs in the bridge that were not filled with milestone
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
brad: what do you think if you take textbox/richtextbox and I work in listview?
```

07:09

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: I'm pretty sure I moved all the 0.9 ones over... I didn't recategorize the 1.0 ones yet though
```

``` nowiki
mario: fair enough
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
brad: a search for the bridge and 0.9 gives me 5 bugs
```

07:10

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
brad: we can talk later about the missing stuff in textbox/richtextbox, if you want to
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
mario: yeah, ;ets
```

``` nowiki
knocte: hrm
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
yeah, I noticed some ToolStripComboBox bugs weren't targetted
```

07:11

``` nowiki
but it's in the list
```

``` nowiki
brad: should I target them for 0.9?
```

``` nowiki
8 hours total
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
this is strange, it seems bugzilla is not searching well..
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sandy: hmm, I guess I missed those
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
(12 hours of ToolStripComboBox bugs already marked 0.9)
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: I see 73 bugs for the bridge in 0.9
```

07:12

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
brad: :-m
```

07:13

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
brad: retargetting those bugs for 0.9
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sandy: thanks
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
why is novell bugzilla so different from gnome?
```

07:14

****

``` nowiki
* sandy&nbsp;
```

``` nowiki
searches for option
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
brad: oh sorry I was filtering by version, not fixed version
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: https://bugzilla.novell.com/buglist.cgi? query_format=advanced&amp;short_desc_type=al lwordssubstr&amp;short_desc=&amp;long_desc_type= fulltext&amp;long_desc=&amp;classification=Mono&amp; product=UI+Automation&amp;component=ATK+Brid ge&amp;target_milestone=Release+0.9&amp;bug_file _loc_type=allwordssubstr&amp;bug_file_loc=&amp;s tatus_whiteboard_type=allwordssubstr&amp;sta tus_whiteboard=&amp;keywords_type=allwords&amp;k eywords=&amp;deadlinefrom=&amp;deadlineto=&amp;bug_s tatus=NEW&amp;bug_status=ASSIGNED&amp;b
```

``` nowiki
wow, that's an ugly url
```

****

``` nowiki
* bgmerrell&nbsp;
```

``` nowiki
gasps
```

07:15

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
"Fixed in Milestone" is a weird term
```

``` nowiki
threw me off
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
yeah, it's really Target Milestone
```

****

``` nowiki
* decriptor&nbsp;
```

``` nowiki
points knocte to tinyurl.com
```

****

``` nowiki
* bgmerrell&nbsp;
```

``` nowiki
points decriptor to brad
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
I see 181 for 0.9
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
mario: you're mixing provider and bridge I guess
```

07:16

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
http://tinyurl.com/UIABridge0-9Bugs
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
knocte: yes I think
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
ah
```

``` nowiki
knocte: sorry
```

``` nowiki
body is moving, brain isn't turned on yet
```

07:17

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
http://tinyurl.com/UIAProvider0-9Bugs
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
108 enhancements?  wow I feel featureless :)
```

07:21

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
so how is everyone doing?
```

07:22

``` nowiki
does everyone have their 60 hours figured out?
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
done
```

``` nowiki
I can give status while others finish?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
yeah, that sounds great
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
I'm done too
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
Okay, I'll just go
```

07:23

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
mgorse is with us?
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
I think I'm done.  I'll plan on working on Tab* and Toolstrip* stuff in the bridge unless someone else was planning to
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
Last iteration I intended to focus entirely on *Strip* controls, but after we did the estimates I thought the risk level on WebBrowser was too high
```

``` nowiki
So I spent a lot of time investigating how to implement a11y for WebBrowser
```

07:24

``` nowiki
worked with the excellent shana
```

``` nowiki
and now the WebBrowser control in mcs trunk has all necessary a11y API exposed for our needs
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sandy: very nice
```

07:25

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
unfortunately I let the task get away from me and spent a lot more time than I should have testing the provider&lt;-&gt;bridge&lt;-&gt;mozembed interaction
```

``` nowiki
I got the beginnings of the *Strip* providers I was working on committed, but they are not finished or tested
```

``` nowiki
this iteration I will completely implement ToolStrip, ToolStripMenuItem, ToolStripDropDownButton, ToolStripLabel, and ToolStripComboBox
```

07:26

``` nowiki
err, the providers for those controls
```

``` nowiki
this comes to 67 hours, but if i have time I'll take on additional *Strip* controls targetted for 0.9
```

``` nowiki
I am confident that WebBrowser can be finished in just a few days
```

``` nowiki
so it's no longer high risk in my estimation
```

07:27

``` nowiki
but I don't plan on working on it this iteration
```

``` nowiki
I think that's everything...so DONE
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sandy: excellent, thank you sandy
```

``` nowiki
I guess I'll go next
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
yeah go ahead
```

07:28

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
so I've been mostly hunkered down the past couple of weeks preparing a project plan with knocte, and getting our project more organized
```

``` nowiki
for this next release, I'll be focusing on the provider end of things
```

``` nowiki
as we need some help in that area right now
```

07:29

``` nowiki
so I'll be working with TextBox and RichTextBox
```

``` nowiki
I think this first iteration will be a good insight into how accurate our estimates are
```

``` nowiki
and I'm anxious to see us do well
```

07:30

``` nowiki
done
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
ok, thanks brad
```

``` nowiki
let's talk with mario if he's ready?
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
I'm ready!
```

``` nowiki
I've been working in implementing the missing events in previous providers, so ComboBox, ListBox and their internal controls are generating the events
```

07:31

``` nowiki
I was wrong lines ago about the missing scrollbar tests, because those tests are already there, I was confused, I meant the tooltip-based providers: tooltip, errorprovider and helpprovider
```

``` nowiki
however, I don't plan to work on those providers, (we are missing tests) I'm planning to implement ListView (72hrs)
```

07:32

``` nowiki
I don't think will spent *72hours* but I think is needed because the ListItem is going to be used in the DataGrid
```

``` nowiki
so basically for the next iteration: implement ListView
```

07:33

``` nowiki
this of course, includes the changes needed in ListItem
```

``` nowiki
done.
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
thanks mario
```

``` nowiki
mgorse: finished allocating time? :)
```

07:34

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
yeah
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- mode/#mono-a11y [+o knocte] by bgmerrell
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
mgorse: go ahead then
```

07:35

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
Last iteration I committed my keyboard patches and wrote sort of a stub implementation for GetRangeExtents and GetCharacterExtents, so Orca is starting to work with the bridge
```

``` nowiki
I worked some on LinkLabel and CheckedListBox and added some missing events in the bridge
```

``` nowiki
This iteration I'm going to finish LinkLabel, tie up some loose ends / bugs with ScrollBar and CheckedListBox, and work on Tab* and ToolStrip* in the bridge
```

07:36

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

07:37

``` nowiki
my turn then
```

``` nowiki
I worked mostly on project planning with brad, although also fixing bugs and repairing tests done in the past
```

07:38

``` nowiki
this iteration I'll be a little more specific than the rest:
```

``` nowiki
following the format "bug widget hours": 428644 ComboBox 5, 428532..428536 MenuItem 1+11+7+3+7, 428397..428398 Button 2+4, 428466 & 428468 CheckBox 2+4, 428592 TextBox 3+2, 428555..428557 RadioButton 3+8+1, hugh :)
```

``` nowiki
so, I'm mostly done
```

``` nowiki
let's now focus on QA
```

``` nowiki
bgmerrell: you or calen's report
```

07:39

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
okay, i'll do Calen's
```

``` nowiki
first
```

``` nowiki
it's large :)
```

``` nowiki
overall speaking, we (Brian and me) spent some time to investigate and discuss some ways to test the states of winforms each control with good coverage, after that i spent my times to modify the test codes with the new method but no time to commit something for one new winforms control.
```

07:40

``` nowiki
specifically speaking,(1) I updated button's test to assert the actions and states of all buttons, especially rising 'focused' state of sensitive button and un-rising 'focused' state of insensitive button by use mouseClick and keyCombo to move keyboard focus, added a test for button to assert if image has implemented.
```

``` nowiki
(2) added a test example for gtkcheckbutton to check the 'focused' state,
```

``` nowiki
(3) I also used the new method to modify checkbox, label, radiobutton, groupbox, vscrollbar, hscrollbar
```

``` nowiki
(4)I updated gtk and winforms form example with click button to rise an empty form to test the default states and test the 'active' state exchange between main form and extra form.
```

07:41

``` nowiki
(5) I separated checkbox example and radiobutton example stand alone from original samples/checkbox_radiobutton.py to avoid affect 'focused' state test.
```

``` nowiki
(6) filled some bugs for Form control and groupbox, the main issue is the incorrect state. i didn't filled bug that image isn't been implemented in winforms button example, because i am not sure if there are something that is not implemented or it's a bug, if someone think i should fill this bug please leave me message :)
```

``` nowiki
in the coming iteration, i will continue to update strongwind test with the new method and commit some codes for new controls(maybe MainMenu and MenuItem).
```

``` nowiki
end of Calen's report
```

``` nowiki
Here I go...
```

07:42

``` nowiki
I worked with Calen on figuring out how to best test the states of accessibles
```

``` nowiki
we added a generic statesCheck method to helpers.py that can be called from any test
```

07:43

``` nowiki
then i spent a couple of days polishing up the smoke test harness and making sure we test for applications that don't exit completely
```

07:44

``` nowiki
and that our harness doesn't barf when that happens
```

``` nowiki
filed a Strongwind bug and got a patch in that adds some better logging that will save us a lot of time
```

07:45

``` nowiki
and then worked on reviewing and polishing the Button test
```

``` nowiki
this iteration I am hoping to review/polish a lot of tests, my priorities are Label, Form, CheckBox, RadioButton, GroupBox, VScrollBar, and HScrollBar.  I am sure some other things will pop up too.  Need to verify some bugs, etc.
```

07:46

``` nowiki
done
```

``` nowiki
everyone's asleep :(
```

07:47

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
thanks bgmerrell, good job; any status on the work to test time used for tests in case there are performance regressions?
```

``` nowiki
heh
```

``` nowiki
bgmerrell: ?
```

07:48

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
I think he fell asleep... typing that much must be exhausting
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
haha
```

07:49

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
knocte: I am planning to either start a wiki and as I add tests to a test suite (smoke or regression) note how long it takes them to run on that wiki
```

``` nowiki
or, i can have the tests time themselves, and log it somewhere, then parse the logs and report it somewhere
```

****

``` nowiki
* brad&nbsp;
```

``` nowiki
likes the automated option
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
me too
```

``` nowiki
well, we'll talk with the build guys now
```

07:50

``` nowiki
which is only 1 because ray's not here
```

``` nowiki
decriptor: you with us?
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
knocte: yup
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
decriptor: go ahead
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
so I've been working on build systems a lot since monobuild just isn't cutting it
```

07:51

``` nowiki
worked with cruisecontrol .net and buildbot
```

``` nowiki
each have some really nice features, but it seems that I've found bugs in both :/
```

``` nowiki
I think the best path is to wait for mono 2.0 to ship and then work with the mono team some more on that
```

07:52

``` nowiki
day to day monitoring the builds and making sure they build
```

****

``` nowiki
&lt; jpallen&gt;&nbsp;
```

``` nowiki
decriptor: so, what is missing in our current build environment?  what do you have left to add to the build system?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
and I have a follow up question to that when you're done
```

07:53

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
jpallen: as far as our stuff goes, we are ok.  The current system is very ineffecient.  It almost regularly has a load of 3-5 all the way across (uptime)
```

07:54

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
decriptor: so what is holding us back from just continuing with whatever solution you choose (be it cc.net or buildbot)
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
one disadvantage is branching and tagging.  it doesn't handle it very well at all.  And when you are in release mode you have to more or less shutdown all building
```

****

``` nowiki
&lt; jpallen&gt;&nbsp;
```

``` nowiki
ah
```

07:55

``` nowiki
what does a load of 3-5 mean?
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
jpallen: work load on the machine
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
jpallen: http://en.wikipedia.org/wiki/Load_(compu ting)
```

``` nowiki
jpallen: bottom line, 3-5 is medium to high for a dual core dual proc box (and I think that's what you're running, right decriptor?)
```

07:56

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
brad: they were waiting for 2.0 to ship and that was the hold up there.  Since I think they are planning on final builds on Thursday I'm interested to see what they end up doing
```

``` nowiki
brad: the main build host is there's
```

07:57

``` nowiki
that can't move, just the jails
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
let's talk about this after the meeting... no sense in holding up for my questions
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
brad: works for me
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok, I had another question but is easy:  any updates on the breakage you told us about yesterday evening?
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
other than that, just fixing up specs and packaging other apps for a11y stuff
```

``` nowiki
knocte: I've been pm'ing with sandy to figure it out.   uiautomationwinforms is the only one left
```

07:58

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok, we'll sort that out after the meeting
```

****

``` nowiki
* decriptor&nbsp;
```

``` nowiki
is happier to see more green than red though :)
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
I don't think its too serious.  Just have to figure out what's causing it
```

07:59

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
which will finish now unless I missed anybody or somebody wants to comment anything else?
```

``` nowiki
ok, thanks decriptor
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
are we good?  anyone that was missed?
```

08:00

``` nowiki
alright, great, thanks guys
```

08:01

``` nowiki
have a nice day
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
I guess yes, so thanks all for coming
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- knocte changed the topic of #mono-a11y to: Accessibility: Accessibility
```

