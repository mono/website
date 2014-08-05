---
title: "Accessibility: Team Meetings 2008 Oct 15"
lastmodified: '2008-10-15'
permalink: /archived/Accessibility:_Team_Meetings_2008_Oct_15/
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Oct_15/
---

Accessibility: Team Meetings 2008 Oct 15
========================================

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok, thanks for coming (assuming ngao is here despite his tail ;) )
```

07:02

``` nowiki
so firstly I would like to congratulate the team because it seems we have been working hard this iteration, and you have been promptly responsible with your scrum reports
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: ngao is signed on twice
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
knocte: i'm here
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
cool thanks
```

``` nowiki
however, as brad will summarize, we have been lacking a bit of better hour reporting on Bugzilla (including me)
```

07:03

``` nowiki
this is normal, it's the first iteration with this working style, but we will have to get used to utilize the time tracking facilities of bugzilla in order to measure better our time
```

``` nowiki
so from now on, in order to prevent forgetting it, attached to the scrum reports we will give the time we impute to bugs, for instance: 3h spent on #498386, 2h spend on #488232 (but still couldn't fix it), 1h on #498823 (and closed it)
```

``` nowiki
brad: what do you think, you wanna add something?
```

07:04

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
yeah... as I expressed in my email, we need to be better about tracking our hours
```

07:05

``` nowiki
but I think I covered it pretty well there
```

``` nowiki
another thing we need to remember
```

``` nowiki
is to focus on the issues we've assigned ourselves
```

``` nowiki
and not get derailed by other things
```

``` nowiki
(unless they're p1 issues)
```

``` nowiki
it's very easy to lose focus, and have difficulty tracking how we're doing
```

``` nowiki
so before you assign yourself issues that are enhancements, take a look at the open issues
```

07:06

``` nowiki
and make sure the important ones are assigned out
```

``` nowiki
other than that, keep up the good work, and I think we can make this a success
```

07:07

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok
```

``` nowiki
sorry Brad, I just received your mono-a11y email
```

``` nowiki
we will leave some minutes, as the previous meeting, for allocating the 60 hours, just in case you didn't do it already, but please this time, *reassign* the bugs to yourselves please (I also made this mistake in the past iteration)
```

``` nowiki
and then we will go on with the reports and plans for the next iteration
```

07:08

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
also, be careful to not assign more than 60 hours
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
oh?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
yeah, there's no reason to assign a bunch of stuff to yourself, it only makes it harder to track
```

****

``` nowiki
* sandy&nbsp;
```

``` nowiki
just assigned too many hours
```

07:09

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
I'm going to start by looking at the open p1s and p2s
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
so let's start the bug hunting... we'll be back in some minutes..
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
okay, #429425.  who wants that one?
```

``` nowiki
https://bugzilla.novell.com/show_bug.cgi ?id=429425
```

``` nowiki
mgorse: why don't you take that one
```

07:10

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
hmm, I didn't think that would add up to 125 hours
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
if you don't mind, I'll take it, because I "inherited" Window.cs work from Calvin iirc
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sandy: yeah, I appreciate your enthusiasm, but that's too much
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
indeed
```

07:11

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: okay, I'll assign that to you
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
the other P1 one I already talked with mike and we'll fix it together
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: what about #428227, #429433, #430382, and #427481?
```

07:12

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
so half of the time for each
```

****

``` nowiki
* knocte&nbsp;
```

``` nowiki
looks
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: (the open p2s assigned to you)
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
brad, knocte :BTW, I think bug429433 is fixed, i can't reproduce it.
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
calen: great, why don't you update it's status
```

``` nowiki
I'll take #433984
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
brad: the missing transient/manages_descendants states?  That should be fairly straight-forward
```

07:13

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
brad: sorry, I just want to wait some version to check, i will update the status
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
calen: ok, no problem
```

``` nowiki
knocte: are there any ones assigned to you that you can give to mike?
```

07:14

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
okay, I'm done assigning
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
brad: I'm sure yes, I still have some issues assigned from the time I was the default assignee, I'll look
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: ok, sounds good
```

07:15

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
sandy: wow, you're quick
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
i've been telling you guys that sandy is quick.
```

07:16

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
mgorse: feel free to take 430382 (try to estimate it)
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
knocte: it helps when you didn't get all of your stuff form last iteration done :-/
```

07:17

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
sandy: yeah, same for me
```

``` nowiki
brad: P3 bugs should wait, right?
```

07:18

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
knocte: okay; I've taken it
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: only if there's more pressing work
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
k
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
oh
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: bugs, of prio &lt; 5, should come first
```

****

``` nowiki
* sandy&nbsp;
```

``` nowiki
assigned all Enh work, stupid
```

07:19

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sandy: I think knocte, mgorse and I have take all the open bugs
```

``` nowiki
sandy: so don't worry about it
```

****

``` nowiki
* sandy&nbsp;
```

``` nowiki
pats self on head
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
how is everyone doing?  does everyone have a full plate for this iteration?
```

07:21

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
I do
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
yes
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ngao: how about you?
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
brad: I am working on FontDialog
```

07:22

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ngao: do you have your 60 hours assigned yet?
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
brad: i dont think so
```

07:23

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ngao: ok, we'll wait for you to finish doing that
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
brad: now 4 bugs assigned to me
```

07:24

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
we've been assigning ourselves issues from bugzilla that are marked Release 0.9
```

``` nowiki
so please find additional ones, and assign them to yourself so that you have enough ours
```

``` nowiki
hours*
```

``` nowiki
mario: how are you doing?
```

07:25

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
brad: ok
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
brad: I'm doing ok, I've just assigned a new bug about ListView.ListItem
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
mario: let us know when you're done
```

07:26

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
brad: done
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
alright, let's get started, and we can call ngao last to give him some extra time
```

07:27

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
brad: ok, thanks
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
mgorse: want to take 427481? I've just realised I have more hours than I should
```

07:28

****

``` nowiki
&nbsp;
```

``` nowiki
-!- jpallen [~jpallen@ariadne.provo.novell.com] has quit [Ping timeout: 600 seconds]
```

07:29

``` nowiki
-!- jpallen [~jpallen@137.65.132.28] has joined #mono-a11y
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
mgorse: nevermind, I'll take it, I'll postpone another one
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
knocte: I do, too, but it should be prioritized over some other things that I have, so I could take it
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
mgorse: heh, let's decide :)
```

07:30

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
I think I'll take it and unassign myself the ToolstripLabel stuff
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
mgorse: ok
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: want to get this meeting started?
```

07:32

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
how's everybody doing? is someone still finishing?
```

``` nowiki
yeah, let's go ahead
```

``` nowiki
with the usual order? sandy: are you ready for talking to us?
```

07:33

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
sure
```

``` nowiki
Last iteration was tough, I only got about half of what I wanted done.  I had to refactor some of our base provider classes and interfaces to support non-Control providers (like *Strip*), which just got committed and changed a ton of files (so svn up now).
```

``` nowiki
Turns out that ToolStripLabel can dynamically act as ControlType.Hyperlink, so there was work there that we hadn't accounted for.  There are still some open bugs on ToolStripLabel because I have to determine if it needs to support a few provider behavior patterns (I suspect not).
```

``` nowiki
(now it's real-time)
```

``` nowiki
I did not get to start on ToolStripComboBox or ToolStripDropDownButton, or implementing IDockProvider for MenuStrip
```

``` nowiki
so, this iteration...
```

``` nowiki
I will finish the dock stuff for MenuStrip, and use all that code to support ToolStrip as well
```

07:34

``` nowiki
and I will work on ToolStripTextBox (the hours worked out better doing that instaed of *DropDownButton and *ComboBox)
```

``` nowiki
I hope I will have extra time to address more *Strip* providers in this iteration, too
```

07:35

``` nowiki
but that's all I have assigned (60 hours and all that)
```

``` nowiki
done
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
thanks sandy, a shame you couldn't make it for the summit btw
```

07:36

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
:-(
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
let's go with mario
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
last iteration was about to implement client tests in Vista to verify our implementation
```

``` nowiki
I found some inconsistencies about the implementation and the documentation (Specification Notes includes the issues)
```

07:37

``` nowiki
I didn't estimate those issues, so I ended "tunning" our implementation to match the features in MS implementation
```

07:38

``` nowiki
I estimated to work in ListView
```

``` nowiki
so, I've implemented 3 of 5 views in that provider
```

``` nowiki
I've refactored the Scroll Pattern logic and added a new class that handles this, ScrollBehaviorObserver, this will work for TextBoxProvider's Scroll Pattern
```

07:39

``` nowiki
for next iteration I'll finish the missing ListView Views: Details and List.
```

07:40

``` nowiki
done
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
haha, tunning, good point, thanks mario
```

``` nowiki
mgorse: you ready?
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
yeah
```

``` nowiki
I didn't plan last iteration well (I assigned myself a lot of bridge work for controls that weren't done in the provider), so I couldn't get a lot of things done.
```

``` nowiki
I worked on unit tests for TabControl, then got bogged down trying to write a unit test for ListView.
```

``` nowiki
I made some atk-sharp changes for AtkObjectFactory and AtkRelation (the latter changes aren't committed yet).
```

``` nowiki
Next iteration I plan to work on bug 427857 (apps not exiting cleanly) with Andres and a couple of other bugs where things have extra states.
```

``` nowiki
Then I plan on working on ListView and PictureBox in the bridge.
```

``` nowiki
I expect this iteration to go better than the last (ie, I don't see anything blocking me from doing what I plan to do).
```

``` nowiki
done
```

07:41

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
thanks mgorse
```

``` nowiki
btw, didn't you say you were going to commit something about states testing that also tests states that shouldn't be there?
```

07:42

``` nowiki
I was planning to do something related to that but didn't want to overlap
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
knocte: Oh.  Yeah, right; I also worked on that but haven't committed yet.  I'll do that today
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
oh, cool thanks
```

``` nowiki
brad: want to give yours?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: sure
```

07:43

``` nowiki
This iteration, I spent all my time working on TextRangeProvider, which ends up being something that isn't implemented by a control (so we didn't notice it when we broke down the work), but it's required by TextProvider, so it needed to get done.
```

``` nowiki
 Unfortunately, I was derailed several times by lacking/non-existent/confusing/contradic tory documentation, so I had to reverse engineer most of the API.  I sent out an email to Jared which he forwarded to Microsoft with some questions.
```

``` nowiki
This iteration, I hope to finish up TextBox, and maybe even move on to another control.  I'm also hoping to work a bit on a burndown chart generator so that we can more easily track our progress.
```

``` nowiki
done
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
thanks brad
```

``` nowiki
let's talk with ngao now
```

07:44

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
ok
```

``` nowiki
StatusBarProvider supports navigation now, and StatusBarPanelProvider is an internal class in StatusBarProvider. I added GridItem control pattern which is not listed on MSDN to support status bar panel. StatusBar &amp; Panel provider are totally done.
```

``` nowiki
Now I'm working on FontDialogProvider. I searched the 0.9 release bug list just now, I would like to take RichTextBox next iteration.
```

``` nowiki
and I implemented AccessKey property, will commit asap.
```

``` nowiki
done
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok, I'll go myself now
```

``` nowiki
I lost a lot of time with issues that were related to bugs (enh) but wasn't very productive, because the big P1 bug about winforms not exiting cleaning was reopened by QA, and because the unit tests in the bridge were lacking care
```

07:46

``` nowiki
but I think I finally fixed those in 2 sequels: unit testing for the events, in order not to regress anymore here, and specially, fixing the threading issues because our method RunInGuiThread was not being used properly
```

07:47

``` nowiki
now I'm pretty confident this will boost the work on the bridge because it's much easier now test Atk and Gail, and figure out the behaviours of the widgets in this side
```

``` nowiki
so I finished some button+img behaviours and checkbox+img tests, and started with textbox but didn't finish,
```

07:48

``` nowiki
and couldn't get to the menuitem bugs yet, so I've planned:
```

``` nowiki
428227:6,427857:15,428644:5,428532..4285 36: 1+11+7+3+7,428592:3,429438:3
```

``` nowiki
that's it, let's go with QA now
```

``` nowiki
bgmerrell: ready?
```

07:49

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
yessir
```

``` nowiki
i went through a handful of Strongwind tests and did some reviewing and polishing to they were ready to include into the regression test suite
```

``` nowiki
so we have about 5 tests in there now
```

``` nowiki
more tests are ready to be reviewed and polished, i just need some time to do it
```

07:50

``` nowiki
worked on the bug in our harness that was causing the strongwind actions and expected results to not get logged
```

``` nowiki
that's fixed now (for real this time)
```

``` nowiki
right now i'm working on a couple of tools that will parse the logs and build a little dashboard web page so everyone can see a really quick snapshot of what tests are passing or failing
```

07:52

``` nowiki
it will also include the time it took for each test to run and the total time
```

``` nowiki
then we all (calen, ray, me) did some work on estimation
```

07:53

``` nowiki
Accessibility:_Test_Plan_WinForms_Controls
```

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

``` nowiki
let's go with calen then
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
knocte: okay
```

``` nowiki
I have updated a series of test code for CheckBox, Form, RadioButton, GroupBox, HscrollBar, Vscrollbar, Scrollbar(which is under listbox as children), PictureBox, ListBox, CheckedListBox, NotifyIcon and NumericUpDown controls. (NumericUpDown isn't finished, i also should add test for Editable Text by enterText method from accerciser, but i need wait developer finish it first).
```

07:54

``` nowiki
I hope can test all of the provides implementation and actions which are mentioned in Bridge_Functional_Specification. knocte just remind me i should add test for CheckBox with Image implementation, i will update it tomorrow.
```

``` nowiki
I have modified some examples with more property or make them matchable for test, for example: I updated numericupdown example with two numericupdown, one is editable and incretment value is 20, one isn't editable and incretment value is 1, then I can check editable with assertValue and assertText by doing typeText action to implement and edit Text Value, check increment value by press Up/Down to test key actions.  I Updated ListBox example with MultiColumn
```

``` nowiki
 property for testing Table implementation. Extend list items for CheckedListBox example. I should say thanks to Ray who help us updated many examples.
```

``` nowiki
have Estimated how many hours and works leavings for each control
```

07:55

``` nowiki
In the coming interation, I will keep on updating test code and commite some new test, verify some bugs. also work with Ray to modify some examples
```

``` nowiki
done
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
thank calen
```

``` nowiki
ray: ready?
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
yeah
```

07:56

``` nowiki
what I have done in past two weeks is:
```

``` nowiki
did weekly builds on OBS, though I ran into some problems, but overall, it is on the way.
```

``` nowiki
for my QA part
```

``` nowiki
I fixed samples to meet the tests need on demand, learn something about dbus and python to understand orca more,
```

``` nowiki
wrote keystrokes scripts to test our programs are accessible or not by using orca
```

``` nowiki
What conclusion I get is our tests might be focus on Strongwind, because Orca can not access WinForms samples yet
```

07:57

``` nowiki
I don't think we should spend much time to get it worked, since our release season is coming to us.
```

``` nowiki
But, if someone has more words to say,  then we could discuss it later.
```

``` nowiki
or the next two weeks,
```

``` nowiki
 i think i'll work on Strongwind test to lighten calen and bgmerrell's burden if there is no accident and keep on doing weekly builds.
```

``` nowiki
done
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
thanks ray, now let's talk with decriptor
```

07:58

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
hi all
```

``` nowiki
been working on a few things.  working with the daily builds and all the fun things that come with that.  Learning some kiwi.  Spending more time on automating things some more.
```

07:59

``` nowiki
writing a program that will hopefully kick off moving the rpms and testing them on every checkin
```

08:00

``` nowiki
I'm hoping to have most of that in place by the end of today.
```

``` nowiki
over this next iteration I'm hoping to have that finished, in place and working
```

``` nowiki
The mono team just shipped mono 2.0 so I think they are going to start looking into a new build system.  We'll see how that affects us.
```

08:01

``` nowiki
done
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
thanks decriptor
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
yup
```

08:02

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
now that we're talking about packaging, I would like to warn you Brad that we almost got final plans for the olive transition, after the meeting Brad&amp;me will explain to you
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: I'd like to firm up plans with Miguel and Joseph first
```

``` nowiki
but we're close
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
oh ok, cool
```

``` nowiki
any questions before we close the meeting then?
```

08:03

``` nowiki
ok, then to finish the meeting, I would like to thank all the people for coming, and for their hard work, it's difficult for me to find a day in which I don't learn a lot of things with this team. And a quick reminder:
```

08:04

``` nowiki
please try to focus well on our roadmap ( Accessibility:_Roadmap ), I'm sure we will be on time for the releases with this hard work
```

``` nowiki
thanks!
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- knocte changed the topic of #mono-a11y to: Accessibility: Accessibility
```

08:05

