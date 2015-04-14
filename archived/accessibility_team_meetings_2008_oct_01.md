---
title: "Accessibility: Team Meetings 2008 Oct 01"
lastmodified: '2008-10-15'
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Oct_01/
---

Accessibility: Team Meetings 2008 Oct 01
========================================

    -!- knocte changed the topic of #mono-a11y to: MonoUIA - Iteration meeting
    07:00
    ****
    < knocte> ok, this iteration meeting will be a bit unusual because , taking advantage that the china people is not here (and so it's no late for them), we'll have the first 10 mins for everybody to figure out the work they will do on the iteration
    07:01
    just make up a list of things, and if you want to discuss with anybody in order to avoid collision, go ahead
    07:02****
    <@brad> make sure to take around 60 hours (6 hrs per day, 2 week iteration)sorry for the flux... once we get good at this process and have some nice tools, we'll be much faster with these things
    07:03****
    * sandy just reassigned a ton of *Strip* bugs to himself
    ****
    <@brad> sandy: are you going to unassign #428735?
    07:04****
    <@bgmerrell> knocte: i have Calen's report
    07:05****
     -!- jpallen [~jpallen@137.65.132.177] has joined #mono-a11y
    ****
    <@sandy> brad: I guess I should do that
    ****
    <@brad> jpallen: morning!
    ****
    < knocte> bgmerrell: nice, thanks
    ****
    * sandy lets go, not without regret
    ****
    < jpallen> hello everyone
    ****
    <@sandy> morning jpallen
    07:06****
    <@bgmerrell> morn'n
    ****
    <@brad> is anyone taking textbox and richtextbox?
    ****
    < knocte> jpallen: we've decided to dedicate the first 10-15 mins of the meeting to let people figure out the work they will do (thanks to the estimations)brad: me, textbox at least
    ****
    < jpallen> ah
    07:07
    ok
    ****
    <@mario> brad: I'm
    ****
    <@brad> knocte: providermario: ok
    ****
    < knocte> brad: oh, then no
    ****
    <@brad> mario: so you're taking combobox, listbox and textbox/richtextbox?mario: doesn't that seem like a bit much?
    ****
    <@mario> brad: actually, combobox and listbox are done, I'm missing the tests in scrollbar, and I was planning to finish textbox/richtextbox
    07:08****
    <@brad> mario: ah okthen I'll work on listview then
    ****
    < knocte> brad: I think there are some bugs in the bridge that were not filled with milestone
    ****
    <@mario> brad: what do you think if you take textbox/richtextbox and I work in listview?
    07:09****
    <@brad> knocte: I'm pretty sure I moved all the 0.9 ones over... I didn't recategorize the 1.0 ones yet thoughmario: fair enough
    ****
    < knocte> brad: a search for the bridge and 0.9 gives me 5 bugs
    07:10****
    <@mario> brad: we can talk later about the missing stuff in textbox/richtextbox, if you want to
    ****
    <@brad> mario: yeah, ;etsknocte: hrm
    ****
    <@sandy> yeah, I noticed some ToolStripComboBox bugs weren't targetted
    07:11
    but it's in the listbrad: should I target them for 0.9?8 hours total
    ****
    < knocte> this is strange, it seems bugzilla is not searching well..
    ****
    <@brad> sandy: hmm, I guess I missed those
    ****
    <@sandy> (12 hours of ToolStripComboBox bugs already marked 0.9)
    ****
    <@brad> knocte: I see 73 bugs for the bridge in 0.9
    07:12****
    < knocte> brad: :-m
    07:13****
    <@sandy> brad: retargetting those bugs for 0.9
    ****
    <@brad> sandy: thanks
    ****
    <@sandy> why is novell bugzilla so different from gnome?
    07:14****
    * sandy searches for option
    ****
    < knocte> brad: oh sorry I was filtering by version, not fixed version
    ****
    <@brad> knocte: https://bugzilla.novell.com/buglist.cgi? query_format=advanced&amp;short_desc_type=al lwordssubstr&amp;short_desc=&amp;long_desc_type= fulltext&amp;long_desc=&amp;classification=Mono&amp; product=UI+Automation&amp;component=ATK+Brid ge&amp;target_milestone=Release+0.9&amp;bug_file _loc_type=allwordssubstr&amp;bug_file_loc=&amp;s tatus_whiteboard_type=allwordssubstr&amp;sta tus_whiteboard=&amp;keywords_type=allwords&amp;k eywords=&amp;deadlinefrom=&amp;deadlineto=&amp;bug_s tatus=NEW&amp;bug_status=ASSIGNED&amp;bwow, that's an ugly url
    ****
    * bgmerrell gasps
    07:15****
    <@sandy> "Fixed in Milestone" is a weird termthrew me off
    ****
    <@brad> yeah, it's really Target Milestone
    ****
    * decriptor points knocte to tinyurl.com
    ****
    * bgmerrell points decriptor to brad
    ****
    <@mario> I see 181 for 0.9
    ****
    < knocte> mario: you're mixing provider and bridge I guess
    07:16****
    <@brad> http://tinyurl.com/UIABridge0-9Bugs
    ****
    <@mario> knocte: yes I think
    ****
    <@decriptor> ahknocte: sorrybody is moving, brain isn't turned on yet
    07:17****
    <@brad> http://tinyurl.com/UIAProvider0-9Bugs
    ****
    <@decriptor> 108 enhancements?  wow I feel featureless :)
    07:21****
    <@brad> so how is everyone doing?
    07:22
    does everyone have their 60 hours figured out?
    ****
    <@sandy> doneI can give status while others finish?
    ****
    <@brad> yeah, that sounds great
    ****
    < knocte> I'm done too
    ****
    <@sandy> Okay, I'll just go
    07:23****
    < knocte> mgorse is with us?
    ****
    <@mgorse> I think I'm done.  I'll plan on working on Tab* and Toolstrip* stuff in the bridge unless someone else was planning to
    ****
    <@sandy> Last iteration I intended to focus entirely on *Strip* controls, but after we did the estimates I thought the risk level on WebBrowser was too highSo I spent a lot of time investigating how to implement a11y for WebBrowser
    07:24
    worked with the excellent shanaand now the WebBrowser control in mcs trunk has all necessary a11y API exposed for our needs
    ****
    <@brad> sandy: very nice
    07:25****
    <@sandy> unfortunately I let the task get away from me and spent a lot more time than I should have testing the provider<->bridge<->mozembed interactionI got the beginnings of the *Strip* providers I was working on committed, but they are not finished or testedthis iteration I will completely implement ToolStrip, ToolStripMenuItem, ToolStripDropDownButton, ToolStripLabel, and ToolStripComboBox
    07:26
    err, the providers for those controlsthis comes to 67 hours, but if i have time I'll take on additional *Strip* controls targetted for 0.9I am confident that WebBrowser can be finished in just a few daysso it's no longer high risk in my estimation
    07:27
    but I don't plan on working on it this iterationI think that's everything...so DONE
    ****
    <@brad> sandy: excellent, thank you sandyI guess I'll go next
    ****
    < knocte> yeah go ahead
    07:28****
    <@brad> so I've been mostly hunkered down the past couple of weeks preparing a project plan with knocte, and getting our project more organizedfor this next release, I'll be focusing on the provider end of thingsas we need some help in that area right now
    07:29
    so I'll be working with TextBox and RichTextBoxI think this first iteration will be a good insight into how accurate our estimates areand I'm anxious to see us do well
    07:30
    done
    ****
    < knocte> ok, thanks bradlet's talk with mario if he's ready?
    ****
    <@mario> I'm ready!I've been working in implementing the missing events in previous providers, so ComboBox, ListBox and their internal controls are generating the events
    07:31
    I was wrong lines ago about the missing scrollbar tests, because those tests are already there, I was confused, I meant the tooltip-based providers: tooltip, errorprovider and helpproviderhowever, I don't plan to work on those providers, (we are missing tests) I'm planning to implement ListView (72hrs)
    07:32
    I don't think will spent *72hours* but I think is needed because the ListItem is going to be used in the DataGridso basically for the next iteration: implement ListView
    07:33
    this of course, includes the changes needed in ListItemdone.
    ****
    < knocte> thanks mariomgorse: finished allocating time? :)
    07:34****
    <@mgorse> yeah
    ****
     -!- mode/#mono-a11y [+o knocte] by bgmerrell
    ****
    <@knocte> mgorse: go ahead then
    07:35****
    <@mgorse> Last iteration I committed my keyboard patches and wrote sort of a stub implementation for GetRangeExtents and GetCharacterExtents, so Orca is starting to work with the bridgeI worked some on LinkLabel and CheckedListBox and added some missing events in the bridgeThis iteration I'm going to finish LinkLabel, tie up some loose ends / bugs with ScrollBar and CheckedListBox, and work on Tab* and ToolStrip* in the bridge
    07:36
    done
    ****
    <@knocte> thanks mgorse
    07:37
    my turn thenI worked mostly on project planning with brad, although also fixing bugs and repairing tests done in the past
    07:38
    this iteration I'll be a little more specific than the rest:following the format "bug widget hours": 428644 ComboBox 5, 428532..428536 MenuItem 1+11+7+3+7, 428397..428398 Button 2+4, 428466 & 428468 CheckBox 2+4, 428592 TextBox 3+2, 428555..428557 RadioButton 3+8+1, hugh :)so, I'm mostly donelet's now focus on QAbgmerrell: you or calen's report
    07:39****
    <@bgmerrell> okay, i'll do Calen'sfirstit's large :)overall speaking, we (Brian and me) spent some time to investigate and discuss some ways to test the states of winforms each control with good coverage, after that i spent my times to modify the test codes with the new method but no time to commit something for one new winforms control.
    07:40
    specifically speaking,(1) I updated button's test to assert the actions and states of all buttons, especially rising 'focused' state of sensitive button and un-rising 'focused' state of insensitive button by use mouseClick and keyCombo to move keyboard focus, added a test for button to assert if image has implemented.(2) added a test example for gtkcheckbutton to check the 'focused' state,(3) I also used the new method to modify checkbox, label, radiobutton, groupbox, vscrollbar, hscrollbar(4)I updated gtk and winforms form example with click button to rise an empty form to test the default states and test the 'active' state exchange between main form and extra form.
    07:41
    (5) I separated checkbox example and radiobutton example stand alone from original samples/checkbox_radiobutton.py to avoid affect 'focused' state test.(6) filled some bugs for Form control and groupbox, the main issue is the incorrect state. i didn't filled bug that image isn't been implemented in winforms button example, because i am not sure if there are something that is not implemented or it's a bug, if someone think i should fill this bug please leave me message :)in the coming iteration, i will continue to update strongwind test with the new method and commit some codes for new controls(maybe MainMenu and MenuItem).end of Calen's reportHere I go...
    07:42
    I worked with Calen on figuring out how to best test the states of accessibleswe added a generic statesCheck method to helpers.py that can be called from any test
    07:43
    then i spent a couple of days polishing up the smoke test harness and making sure we test for applications that don't exit completely
    07:44
    and that our harness doesn't barf when that happensfiled a Strongwind bug and got a patch in that adds some better logging that will save us a lot of time
    07:45
    and then worked on reviewing and polishing the Button testthis iteration I am hoping to review/polish a lot of tests, my priorities are Label, Form, CheckBox, RadioButton, GroupBox, VScrollBar, and HScrollBar.  I am sure some other things will pop up too.  Need to verify some bugs, etc.
    07:46
    doneeveryone's asleep :(
    07:47****
    <@knocte> thanks bgmerrell, good job; any status on the work to test time used for tests in case there are performance regressions?hehbgmerrell: ?
    07:48****
    <@brad> I think he fell asleep... typing that much must be exhausting
    ****
    <@knocte> haha
    07:49****
    <@bgmerrell> knocte: I am planning to either start a wiki and as I add tests to a test suite (smoke or regression) note how long it takes them to run on that wikior, i can have the tests time themselves, and log it somewhere, then parse the logs and report it somewhere
    ****
    * brad likes the automated option
    ****
    <@knocte> me toowell, we'll talk with the build guys now
    07:50
    which is only 1 because ray's not heredecriptor: you with us?
    ****
    <@decriptor> knocte: yup
    ****
    <@knocte> decriptor: go ahead
    ****
    <@decriptor> so I've been working on build systems a lot since monobuild just isn't cutting it
    07:51
    worked with cruisecontrol .net and buildboteach have some really nice features, but it seems that I've found bugs in both :/I think the best path is to wait for mono 2.0 to ship and then work with the mono team some more on that
    07:52
    day to day monitoring the builds and making sure they build
    ****
    < jpallen> decriptor: so, what is missing in our current build environment?  what do you have left to add to the build system?
    ****
    <@brad> and I have a follow up question to that when you're done
    07:53****
    <@decriptor> jpallen: as far as our stuff goes, we are ok.  The current system is very ineffecient.  It almost regularly has a load of 3-5 all the way across (uptime)
    07:54****
    <@brad> decriptor: so what is holding us back from just continuing with whatever solution you choose (be it cc.net or buildbot)
    ****
    <@decriptor> one disadvantage is branching and tagging.  it doesn't handle it very well at all.  And when you are in release mode you have to more or less shutdown all building
    ****
    < jpallen> ah
    07:55
    what does a load of 3-5 mean?
    ****
    <@decriptor> jpallen: work load on the machine
    ****
    <@brad> jpallen: http://en.wikipedia.org/wiki/Load_(compu ting)jpallen: bottom line, 3-5 is medium to high for a dual core dual proc box (and I think that's what you're running, right decriptor?)
    07:56****
    <@decriptor> brad: they were waiting for 2.0 to ship and that was the hold up there.  Since I think they are planning on final builds on Thursday I'm interested to see what they end up doingbrad: the main build host is there's
    07:57
    that can't move, just the jails
    ****
    <@brad> let's talk about this after the meeting... no sense in holding up for my questions
    ****
    <@decriptor> brad: works for me
    ****
    <@knocte> ok, I had another question but is easy:  any updates on the breakage you told us about yesterday evening?
    ****
    <@decriptor> other than that, just fixing up specs and packaging other apps for a11y stuffknocte: I've been pm'ing with sandy to figure it out.   uiautomationwinforms is the only one left
    07:58****
    <@knocte> ok, we'll sort that out after the meeting
    ****
    * decriptor is happier to see more green than red though :)
    ****
    <@decriptor> I don't think its too serious.  Just have to figure out what's causing it
    07:59****
    <@knocte> which will finish now unless I missed anybody or somebody wants to comment anything else?ok, thanks decriptor
    ****
    <@brad> are we good?  anyone that was missed?
    08:00
    alright, great, thanks guys
    08:01
    have a nice day
    ****
    <@knocte> I guess yes, so thanks all for coming
    ****
     -!- knocte changed the topic of #mono-a11y to: Accessibility: Accessibility
