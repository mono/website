---
title: "Accessibility: Team Meetings 2008 Oct 15"
lastmodified: '2008-10-15'
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Oct_15/
---

Accessibility: Team Meetings 2008 Oct 15
========================================

    ****
    <@knocte> ok, thanks for coming (assuming ngao is here despite his tail ;) )
    07:02
    so firstly I would like to congratulate the team because it seems we have been working hard this iteration, and you have been promptly responsible with your scrum reports
    ****
    <@brad> knocte: ngao is signed on twice
    ****
    <@ngao> knocte: i'm here
    ****
    <@knocte> cool thankshowever, as brad will summarize, we have been lacking a bit of better hour reporting on Bugzilla (including me)
    07:03
    this is normal, it's the first iteration with this working style, but we will have to get used to utilize the time tracking facilities of bugzilla in order to measure better our timeso from now on, in order to prevent forgetting it, attached to the scrum reports we will give the time we impute to bugs, for instance: 3h spent on #498386, 2h spend on #488232 (but still couldn't fix it), 1h on #498823 (and closed it)brad: what do you think, you wanna add something?
    07:04****
    <@brad> yeah... as I expressed in my email, we need to be better about tracking our hours
    07:05
    but I think I covered it pretty well thereanother thing we need to rememberis to focus on the issues we've assigned ourselvesand not get derailed by other things(unless they're p1 issues)it's very easy to lose focus, and have difficulty tracking how we're doingso before you assign yourself issues that are enhancements, take a look at the open issues
    07:06
    and make sure the important ones are assigned outother than that, keep up the good work, and I think we can make this a success
    07:07****
    <@knocte> oksorry Brad, I just received your mono-a11y emailwe will leave some minutes, as the previous meeting, for allocating the 60 hours, just in case you didn't do it already, but please this time, *reassign* the bugs to yourselves please (I also made this mistake in the past iteration)and then we will go on with the reports and plans for the next iteration
    07:08****
    <@brad> also, be careful to not assign more than 60 hours
    ****
    <@sandy> oh?
    ****
    <@brad> yeah, there's no reason to assign a bunch of stuff to yourself, it only makes it harder to track
    ****
    * sandy just assigned too many hours
    07:09****
    <@brad> I'm going to start by looking at the open p1s and p2s
    ****
    <@knocte> so let's start the bug hunting... we'll be back in some minutes..
    ****
    <@brad> okay, #429425.  who wants that one?https://bugzilla.novell.com/show_bug.cgi ?id=429425mgorse: why don't you take that one
    07:10****
    <@sandy> hmm, I didn't think that would add up to 125 hours
    ****
    <@knocte> if you don't mind, I'll take it, because I "inherited" Window.cs work from Calvin iirc
    ****
    <@brad> sandy: yeah, I appreciate your enthusiasm, but that's too much
    ****
    <@sandy> indeed
    07:11****
    <@brad> knocte: okay, I'll assign that to you
    ****
    <@knocte> the other P1 one I already talked with mike and we'll fix it together
    ****
    <@brad> knocte: what about #428227, #429433, #430382, and #427481?
    07:12****
    <@knocte> so half of the time for each
    ****
    * knocte looks
    ****
    <@brad> knocte: (the open p2s assigned to you)
    ****
    <@calen> brad, knocte :BTW, I think bug429433 is fixed, i can't reproduce it.
    ****
    <@brad> calen: great, why don't you update it's statusI'll take #433984
    ****
    <@mgorse> brad: the missing transient/manages_descendants states?  That should be fairly straight-forward
    07:13****
    <@calen> brad: sorry, I just want to wait some version to check, i will update the status
    ****
    <@brad> calen: ok, no problemknocte: are there any ones assigned to you that you can give to mike?
    07:14****
    <@sandy> okay, I'm done assigning
    ****
    <@knocte> brad: I'm sure yes, I still have some issues assigned from the time I was the default assignee, I'll look
    ****
    <@brad> knocte: ok, sounds good
    07:15****
    <@knocte> sandy: wow, you're quick
    ****
    <@bgmerrell> i've been telling you guys that sandy is quick.
    07:16****
    <@knocte> mgorse: feel free to take 430382 (try to estimate it)
    ****
    <@sandy> knocte: it helps when you didn't get all of your stuff form last iteration done :-/
    07:17****
    <@knocte> sandy: yeah, same for mebrad: P3 bugs should wait, right?
    07:18****
    <@mgorse> knocte: okay; I've taken it
    ****
    <@brad> knocte: only if there's more pressing work
    ****
    <@knocte> k
    ****
    <@sandy> oh
    ****
    <@brad> knocte: bugs, of prio < 5, should come first
    ****
    * sandy assigned all Enh work, stupid
    07:19****
    <@brad> sandy: I think knocte, mgorse and I have take all the open bugssandy: so don't worry about it
    ****
    * sandy pats self on head
    ****
    <@brad> how is everyone doing?  does everyone have a full plate for this iteration?
    07:21****
    <@mgorse> I do
    ****
    <@sandy> yes
    ****
    <@brad> ngao: how about you?
    ****
    <@ngao> brad: I am working on FontDialog
    07:22****
    <@brad> ngao: do you have your 60 hours assigned yet?
    ****
    <@ngao> brad: i dont think so
    07:23****
    <@brad> ngao: ok, we'll wait for you to finish doing that
    ****
    <@ngao> brad: now 4 bugs assigned to me
    07:24****
    <@brad> we've been assigning ourselves issues from bugzilla that are marked Release 0.9so please find additional ones, and assign them to yourself so that you have enough ourshours*mario: how are you doing?
    07:25****
    <@ngao> brad: ok
    ****
    <@mario> brad: I'm doing ok, I've just assigned a new bug about ListView.ListItem
    ****
    <@brad> mario: let us know when you're done
    07:26****
    <@mario> brad: done
    ****
    <@brad> alright, let's get started, and we can call ngao last to give him some extra time
    07:27****
    <@ngao> brad: ok, thanks
    ****
    <@knocte> mgorse: want to take 427481? I've just realised I have more hours than I should
    07:28****
     -!- jpallen [~jpallen@ariadne.provo.novell.com] has quit [Ping timeout: 600 seconds]
    07:29
    -!- jpallen [~jpallen@137.65.132.28] has joined #mono-a11y
    ****
    <@knocte> mgorse: nevermind, I'll take it, I'll postpone another one
    ****
    <@mgorse> knocte: I do, too, but it should be prioritized over some other things that I have, so I could take it
    ****
    <@knocte> mgorse: heh, let's decide :)
    07:30****
    <@mgorse> I think I'll take it and unassign myself the ToolstripLabel stuff
    ****
    <@knocte> mgorse: ok
    ****
    <@brad> knocte: want to get this meeting started?
    07:32****
    <@knocte> how's everybody doing? is someone still finishing?yeah, let's go aheadwith the usual order? sandy: are you ready for talking to us?
    07:33****
    <@sandy> sureLast iteration was tough, I only got about half of what I wanted done.  I had to refactor some of our base provider classes and interfaces to support non-Control providers (like *Strip*), which just got committed and changed a ton of files (so svn up now).Turns out that ToolStripLabel can dynamically act as ControlType.Hyperlink, so there was work there that we hadn't accounted for.  There are still some open bugs on ToolStripLabel because I have to determine if it needs to support a few provider behavior patterns (I suspect not).(now it's real-time)I did not get to start on ToolStripComboBox or ToolStripDropDownButton, or implementing IDockProvider for MenuStripso, this iteration...I will finish the dock stuff for MenuStrip, and use all that code to support ToolStrip as well
    07:34
    and I will work on ToolStripTextBox (the hours worked out better doing that instaed of *DropDownButton and *ComboBox)I hope I will have extra time to address more *Strip* providers in this iteration, too
    07:35
    but that's all I have assigned (60 hours and all that)done
    ****
    <@knocte> thanks sandy, a shame you couldn't make it for the summit btw
    07:36****
    <@sandy> :-(
    ****
    <@knocte> let's go with mario
    ****
    <@mario> last iteration was about to implement client tests in Vista to verify our implementationI found some inconsistencies about the implementation and the documentation (Specification Notes includes the issues)
    07:37
    I didn't estimate those issues, so I ended "tunning" our implementation to match the features in MS implementation
    07:38
    I estimated to work in ListViewso, I've implemented 3 of 5 views in that providerI've refactored the Scroll Pattern logic and added a new class that handles this, ScrollBehaviorObserver, this will work for TextBoxProvider's Scroll Pattern
    07:39
    for next iteration I'll finish the missing ListView Views: Details and List.
    07:40
    done
    ****
    <@knocte> haha, tunning, good point, thanks mariomgorse: you ready?
    ****
    <@mgorse> yeahI didn't plan last iteration well (I assigned myself a lot of bridge work for controls that weren't done in the provider), so I couldn't get a lot of things done.I worked on unit tests for TabControl, then got bogged down trying to write a unit test for ListView.I made some atk-sharp changes for AtkObjectFactory and AtkRelation (the latter changes aren't committed yet).Next iteration I plan to work on bug 427857 (apps not exiting cleanly) with Andres and a couple of other bugs where things have extra states.Then I plan on working on ListView and PictureBox in the bridge.I expect this iteration to go better than the last (ie, I don't see anything blocking me from doing what I plan to do).done
    07:41****
    <@knocte> thanks mgorsebtw, didn't you say you were going to commit something about states testing that also tests states that shouldn't be there?
    07:42
    I was planning to do something related to that but didn't want to overlap
    ****
    <@mgorse> knocte: Oh.  Yeah, right; I also worked on that but haven't committed yet.  I'll do that today
    ****
    <@knocte> oh, cool thanksbrad: want to give yours?
    ****
    <@brad> knocte: sure
    07:43
    This iteration, I spent all my time working on TextRangeProvider, which ends up being something that isn't implemented by a control (so we didn't notice it when we broke down the work), but it's required by TextProvider, so it needed to get done. Unfortunately, I was derailed several times by lacking/non-existent/confusing/contradic tory documentation, so I had to reverse engineer most of the API.  I sent out an email to Jared which he forwarded to Microsoft with some questions.This iteration, I hope to finish up TextBox, and maybe even move on to another control.  I'm also hoping to work a bit on a burndown chart generator so that we can more easily track our progress.done
    ****
    <@knocte> thanks bradlet's talk with ngao now
    07:44****
    <@ngao> okStatusBarProvider supports navigation now, and StatusBarPanelProvider is an internal class in StatusBarProvider. I added GridItem control pattern which is not listed on MSDN to support status bar panel. StatusBar &amp; Panel provider are totally done.Now I'm working on FontDialogProvider. I searched the 0.9 release bug list just now, I would like to take RichTextBox next iteration.and I implemented AccessKey property, will commit asap.done
    ****
    <@knocte> ok, I'll go myself nowI lost a lot of time with issues that were related to bugs (enh) but wasn't very productive, because the big P1 bug about winforms not exiting cleaning was reopened by QA, and because the unit tests in the bridge were lacking care
    07:46
    but I think I finally fixed those in 2 sequels: unit testing for the events, in order not to regress anymore here, and specially, fixing the threading issues because our method RunInGuiThread was not being used properly
    07:47
    now I'm pretty confident this will boost the work on the bridge because it's much easier now test Atk and Gail, and figure out the behaviours of the widgets in this sideso I finished some button+img behaviours and checkbox+img tests, and started with textbox but didn't finish,
    07:48
    and couldn't get to the menuitem bugs yet, so I've planned:428227:6,427857:15,428644:5,428532..4285 36: 1+11+7+3+7,428592:3,429438:3that's it, let's go with QA nowbgmerrell: ready?
    07:49****
    <@bgmerrell> yessiri went through a handful of Strongwind tests and did some reviewing and polishing to they were ready to include into the regression test suiteso we have about 5 tests in there nowmore tests are ready to be reviewed and polished, i just need some time to do it
    07:50
    worked on the bug in our harness that was causing the strongwind actions and expected results to not get loggedthat's fixed now (for real this time)right now i'm working on a couple of tools that will parse the logs and build a little dashboard web page so everyone can see a really quick snapshot of what tests are passing or failing
    07:52
    it will also include the time it took for each test to run and the total timethen we all (calen, ray, me) did some work on estimation
    07:53
    Accessibility:_Test_Plan_WinForms_Controlsdone
    ****
    <@knocte> thanks bgmerrelllet's go with calen then
    ****
    <@calen> knocte: okayI have updated a series of test code for CheckBox, Form, RadioButton, GroupBox, HscrollBar, Vscrollbar, Scrollbar(which is under listbox as children), PictureBox, ListBox, CheckedListBox, NotifyIcon and NumericUpDown controls. (NumericUpDown isn't finished, i also should add test for Editable Text by enterText method from accerciser, but i need wait developer finish it first).
    07:54
    I hope can test all of the provides implementation and actions which are mentioned in Bridge_Functional_Specification. knocte just remind me i should add test for CheckBox with Image implementation, i will update it tomorrow.I have modified some examples with more property or make them matchable for test, for example: I updated numericupdown example with two numericupdown, one is editable and incretment value is 20, one isn't editable and incretment value is 1, then I can check editable with assertValue and assertText by doing typeText action to implement and edit Text Value, check increment value by press Up/Down to test key actions.  I Updated ListBox example with MultiColumn property for testing Table implementation. Extend list items for CheckedListBox example. I should say thanks to Ray who help us updated many examples.have Estimated how many hours and works leavings for each control
    07:55
    In the coming interation, I will keep on updating test code and commite some new test, verify some bugs. also work with Ray to modify some examplesdone
    ****
    <@knocte> thank calenray: ready?
    ****
    <@ray> yeah
    07:56
    what I have done in past two weeks is:did weekly builds on OBS, though I ran into some problems, but overall, it is on the way.for my QA partI fixed samples to meet the tests need on demand, learn something about dbus and python to understand orca more,wrote keystrokes scripts to test our programs are accessible or not by using orcaWhat conclusion I get is our tests might be focus on Strongwind, because Orca can not access WinForms samples yet
    07:57
    I don't think we should spend much time to get it worked, since our release season is coming to us.But, if someone has more words to say,  then we could discuss it later.or the next two weeks, i think i'll work on Strongwind test to lighten calen and bgmerrell's burden if there is no accident and keep on doing weekly builds.done
    ****
    <@knocte> thanks ray, now let's talk with decriptor
    07:58****
    <@decriptor> hi allbeen working on a few things.  working with the daily builds and all the fun things that come with that.  Learning some kiwi.  Spending more time on automating things some more.
    07:59
    writing a program that will hopefully kick off moving the rpms and testing them on every checkin
    08:00
    I'm hoping to have most of that in place by the end of today.over this next iteration I'm hoping to have that finished, in place and workingThe mono team just shipped mono 2.0 so I think they are going to start looking into a new build system.  We'll see how that affects us.
    08:01
    done
    ****
    <@knocte> thanks decriptor
    ****
    <@decriptor> yup
    08:02****
    <@knocte> now that we're talking about packaging, I would like to warn you Brad that we almost got final plans for the olive transition, after the meeting Brad&amp;me will explain to you
    ****
    <@brad> knocte: I'd like to firm up plans with Miguel and Joseph firstbut we're close
    ****
    <@knocte> oh ok, coolany questions before we close the meeting then?
    08:03
    ok, then to finish the meeting, I would like to thank all the people for coming, and for their hard work, it's difficult for me to find a day in which I don't learn a lot of things with this team. And a quick reminder:
    08:04
    please try to focus well on our roadmap ( Accessibility:_Roadmap ), I'm sure we will be on time for the releases with this hard workthanks!
    ****
     -!- knocte changed the topic of #mono-a11y to: Accessibility: Accessibility
    08:05
