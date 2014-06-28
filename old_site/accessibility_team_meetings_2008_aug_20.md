---
layout: obsolete
title: "Accessibility: Team Meetings 2008 Aug 20"
lastmodified: '2008-08-20'
permalink: /old_site/Accessibility:_Team_Meetings_2008_Aug_20/
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Aug_20/
---

Accessibility: Team Meetings 2008 Aug 20
========================================

-!- knocte changed the topic of \#mono-a11y to: Mono-UIA Iteration meeting
07:02
**\<@knocte\> **
ok, now my clock tells me it's the time, everybody here?
firstly I would like to ask brad if he wants to say anything before the meeting, or any question he may have?
07:03
**\* decriptor **
yells speech
**\<@decriptor\> **
 :)
**\<@brad\> **
nope, I'm good... this week, I'm trying to focus on understanding the current process
and the code base, and get feedback
so I'll just be lurking around :)
**\<@knocte\> **
perfect, thanks, we usually start with sandy, so, sandy? go ahead
**\<@sandy\> **
hi
(nothing to copy/paste today, sorry)
07:04
**\<@bgmerrell\> **
hi sandy
**\<@sandy\> **
So I got the NumericUpDownProvider and its tests finally checked in
and the implementation of LabeledBy
I seem to recall that if a control had a non-null value for LabeledBy, it would affect the Name property
but my VM has been giving me problems so I need to test that and update the Name property impelmentation and associated tests if necessary
07:05
I did not get far enough with recursive property changes to commit it, unfortunately
I had forgotten that I needed to spend time this iteration on the talk Brian and I are giving at UTOSC next week
we've had a few discussions about it, and have developed our initial slides
we'll be continuing to polish it this week, and then rehearse at Hack week
07:06
yes we are so nerdy that we need to rehearse
(or is it so cool that you have to SEE IT TO BELIEVE IT?)
knocte: how are we doing next iteration?
is it a short iteration?
**\<@knocte\> **
oh good question
07:07
**\<@sandy\> **
or will it continue after hack week?
I haven't planned my tasks for next iteration, really
**\<@knocte\> **
I would say that we should count these two days of the week, and then join them with the next days of the week after hackweek
so it's an iteration with a break :)
**\<@sandy\> **
okay
well in that case
07:08
before hack week
I will work with Brian a bit
I will figure out the Name property issue
and I will work on recursive properties
after hack week
I will work on a whole new control
because I think we have a handle on bugs
especially with brad
07:09
done
**\<@knocte\> **
thanks sandy, there are no bugs filed yet that affect the providers, right?
**\<@sandy\> **
knocte: I will double-check
**\<@knocte\> **
do you mean unfiled bugs?
ok
**\<@sandy\> **
knocte: previously I had been helping with bridge bugs
**\<@knocte\> **
yes, I know, good job!
07:10
**\<@sandy\> **
that's what I was referring to
**\<@knocte\> **
fine, ok now let's talk with mario
**\<@mario\> **
hello!
ok, here I go
**\<@knocte\> **
go ahead
**\<@bgmerrell\> **
just to rudely interrupt.. "next iteration" will just be tomorrow and the next day for most of us, right?
or are we going to tie it together with next monday and tues?
**\<@sandy\> **
"I would say that we should count these two days of the week, and then join them with the next days of the week after hackweek"
07:11
**\<@knocte\> **
bgmerrell: we just commented about it, monday and tuesday of next week after hackweek will be part of the iteration as well
 ;)
**\<@bgmerrell\> **
oopsy
well mario should be about ready now...
**\<@sandy\> **
heh
**\<@knocte\> **
don't worry, mario?
**\<@mario\> **
ok, here I go..
in this iteration I finished ErrorProvider. ToolTip provider is working again, I disabled in previous iteration
07:12
I spent some time reviewing the patches in SWF, jpobst reviewed them and... I need to update and send them again
07:13
I'm missing ErrorProvider unitary tests
next iteration: I'll update the patches and finish unitary tests, and I'll start working in the HelpProvider provider
07:14
done!
**\<@knocte\> **
thanks mario! which providers are dependent on the SWF patches to work correctly in case at the bridge someone wants to query them?
are they likely be committed soon?
07:15
**\<@mario\> **
ListBox, ScrollBar (both V and H), ComboBox, ToolTip and ErrorProvider
**\<@knocte\> **
oh, sounds like a lot, we will worry about the patches more then
**\<@mario\> **
I think they are, I need to "beautify" the patches
**\<@bgmerrell\> **
mario: are you aware of [http://bugzilla.gnome.org/show\_bug.cgi?i](http://bugzilla.gnome.org/show_bug.cgi?i) d=542873 ? have you seen this?
**\<@knocte\> **
thanks
**\<@mario\> **
bgmerrell: yes, I installed that version, but I can't see the tooltips anyway
07:16
**\<@knocte\> **
that's gail related right? maybe mgorse knows more about it?
**\<@sandy\> **
oh I forgot to mention!
07:17
I have a dr appointment at 2 PM today
so I'll be gone for a bit
**\<@knocte\> **
sandy: it's ok, thanks for notifying
ok, let's rather switch to ngao now
**\<@ngao\> **
OK
07:18
last iteration, i implement statusBarPanel, subclass from TextBox
and i patched StatusBar control to support PanelAdded event, because StatusBarPanel is not added by Controls.Add, StatusBar couldn't navigate it. after i patched winforms and connected the event, statusBar still couldn't navigate children, i dont know what the problem is now
next iteration, i'd like to solve this problem and finish unit test for status bar panel
done
**\<@knocte\> **
ok,thanks ngao; mario: do you suggest ngao to work in a new control as well?
07:19
s/control/provider
**\<@mario\> **
I think he should send me the updated progressbar and statusbar as soon as he finished them to commit them, before choosing a new control
**\<@knocte\> **
ok, fine, thanks mario
07:20
we'll talk now with mgorse, you ready?
**\<@mgorse\> **
ok
I mapped a GroupBox to a Pane class in the automation bridge (which was trivial). This works except that it doesn't implement IExpandCollapseProvider, so I think that I should check for that before instantiating the Pane
07:21
I ported one of the cspi test programs to atspi-dbus and added a couple more interfaces to the dbus port of cspi
but I've had trouble running/debugging the test program
also worked on several bridge bugs
07:22
and spent a bit more time investigating intercepting keys (tried hooking up a PreviewKeyDown event listener to a Form, but tha tdidn't help). I mentioned that in the channel last night and filed a bug for it
07:23
**\<@knocte\> **
were there any bugs opened against new dbus at-spi? how's sync with the packagers?
**\<@mgorse\> **
I committed code in the bridge test to make it use real objects, which makes it work with the new navigation code, tests the code to map providers to adapters, and generally makes it act more like the real world (ie, widgets have a form as their parent)
**\<@knocte\> **
yeah I saw that patch for "real" objs, good job
07:24
**\<@mgorse\> **
knocte: We don't have a bugzilla or something set up for it yet. That reminds me that I should talk to Mark and/or Rob about that
Next iteration I plan to map NumericUpDownProvider in the bridge
07:25
and look more at passing keys
done
**\<@knocte\> **
yeah, that sounds good, I'll help you on that, but in the meantime, do we already have the "general" component in bugzilla? we could use that
**\<@mgorse\> **
you mean for our project? There is a general component for it
07:26
**\<@knocte\> **
yeah, then let's use that if QA start to try the dbus work
**\<@sandy\> **
knocte, brad: this reminds me, mgorse mentioned that we have all of these pointless versions for our bugzilla products...can we delete them and add "SVN", and then new versions as appropriate?
**\<@knocte\> **
ok, thanks mgorse
**\<@sandy\> **
(I have no idea who has admin rights to our bugzilla products)
07:27
**\<@brad\> **
sandy: I'd be happy to do that once I get admin rights on bugzilla
**\<@knocte\> **
sandy: yes, I'll add that to my todo list, thanks sandy
**\<@decriptor\> **
brad: I think you have to kill someone for that :P
**\<@knocte\> **
brad: I don't think we'll be able to get admin rights ;), I'll ask for it
**\<@brad\> **
knocte: thanks :)
**\<@knocte\> **
ok, next one should be... me
**\<@brad\> **
I would be surprised if they wouldn't give admin rights to the product... gnome does
**\<@sandy\> **
ha, gnome's not a company
07:28
**\<@brad\> **
fair
**\<@knocte\> **
so well, it would be my turn now, in theory I'm not a "dev" anymore but as you all know I'll continue with development as time permits and
**\<@bgmerrell\> **
gekker has rights to our product
07:29
knocte should be able to get it as a pm
**\<@knocte\> **
also I will be finishing the missing bits I had uncommitted and until I finally switch my role entirely to PjM
oh thanks bgmerrell, I'll talk with him
**\<@bgmerrell\> **
he'll at least know who to talk to
i don't think he can give you rights, though
07:30
**\<@knocte\> **
so in my dev part of the iteration I think I finished all the pending tests I wanted to commit and next iteration I'll commit: a) fixes to combobox, b) fixes to menu, c) the textbox bridge class
bgmerrell: fine thanks for the info; ok,so let's switch to QA now
and, btw, bgmerrell, your turn :)
07:31
BTW, could you move the test we talked earlier (from mario) to your test suite?
can it be moved without translating it to py code? just leaving it as is?
( [http://anonsvn.mono-project.com/source/t](http://anonsvn.mono-project.com/source/t) runk/uia2atk/src/UiaAtkBridge/UiaAtkBrid geTest/Bug416602.cs )
07:32
**\<@bgmerrell\> **
what test?
shouldn't we be running unit tests when we build?
07:33
**\<@knocte\> **
he's more a regression test than a unit test I believe, unless brad gives us another idea, well just add that to your plan for next iteration...
yes, why?
s/he's/it's/
**\<@brad\> **
well, we definitely need to establish some sort of unit/regression/whatever suite
07:34
**\<@knocte\> **
ok maybe we should talk about this after the iteration :) you can start with your summary
**\<@bgmerrell\> **
okay, here i go
**\<@brad\> **
and running that at build time, if not too time intensitve, is a good idea
**\<@bgmerrell\> **
I actually have working orca tests against gtk samples now, yipee! this is mostly what i worked on during this iteration.
i also worked on fixing a crashing problem with our winforms tests. evidently, our code and/or WinForms takes a little longer than Gtk for the application to launch and applications list to settle; this was causing the crashes.
07:35
**\<@knocte\> **
ok
**\<@bgmerrell\> **
i did spend some time preparing for utosc, but tried to to do most of that over the weekend
next iteration i need to come up with a good plan to test using orca.. i haven't decide what the best way to approach this will be...
07:36
because it's a lot more complicated to know exactly what Orca should read
i've thought about maybe writing an app in Gtk and WinForms and making them as similar as possible and making sure that Orca reads them about the same..
07:37
but that's just an idea
so any ideas are welcome :)
and like sandy said, utosc stuff
done
**\<@knocte\> **
ok I guess brad and/or mgorse will have good ideas for the orca testing as well!
thanks bgmerrell
we'll talk now with calen
07:38
**\<@bgmerrell\> **
the good news is that orca has it's own test harness that is pretty nice, so we can just use it.
**\<@calen\> **
okay
**\<@bgmerrell\> **
sorry
**\<@calen\> **
np :)
last iteration I have finished new strongwind test code for picturebox, statusbar, listbox, groupbox controls.
07:39
but I should mention when running GroupBox test that after bug411882 is been fixed we can't use 'button.click' do the action (but need change to 'button.\_doAction('click')). another problem is when the test do click action, we should move the mouse through the application window otherwise the label can't get the new info just like bug415320.
ListBox control]', and can't use 'click' action to select listitem.
**\<@brad\> **
(is that \#411882?)
07:40
**\<@calen\> **
i think developers haven't finish those controls, i will wait then to check them again.
brad: yeah
I have run form and RadioButton test again that form test can be run completely now. Brian would like to review it and then add it to our test harness.
**\<@brad\> **
calen: ok, thanks
07:41
**\<@calen\> **
I also have modified some old test code and gave comment info for bug411328.
in the coming iteration, i will code for checkedlistbox, tooltip, progressbar, and verify some bugs those will been fixed in new rpms.
done
**\<@sandy\> **
calen: Button should be finished, please file bugs against it
**\<@knocte\> **
ok, thanks calen, be sure to file all problems in bugzilla (and reopen old ones), and annotate all this info (if the bug arised since fixing another one, and this kind of stuff)
**\<@calen\> **
sandy: okay, i will
**\<@mario\> **
calen: same for listbox, open your bug.
**\<@knocte\> **
fine thanks, so, ray's turn!
**\<@ray\> **
here i am, can't wait :)
**\<@knocte\> **
QA first, packaging second ;)
07:42
**\<@calen\> **
mario: okay
**\<@ray\> **
sorry for this slack week, in this iteration. i have read lots of rpm stuffs, spend some time to read lots of strongwind stuffs, learnt some winforms sample "style"
from bgmerrell's opinion, when rpms being built, i was starting to do some "smoke test", and also thanks for decriptor's effort.(the rpms)
07:43
but, most of the time, i was struggling with winform controls. and i have many problems and errors with DataGrid\*, PageSetupDialog, HelpProvider and WebBrowser,
finially i asked some questions in mono-devel mailing list, and someone told me that there might be some issues with WebBrowser, will fix it later before Mono 2.0 is released.
07:44
**\<@knocte\> **
yeah, webbrowser seems the most unstable widget
**\<@ray\> **
so, in the next week, i will start to work on strongwind. we all will come back to the offfice, so i can chat with calen more about that.  :)
knocte, ok, thanks
**\<@sandy\> **
ray: if you write winforms code that runs fine in Windows and doesn't work in Mono, filing bugs is a good idea :-)
**\<@ray\> **
and done )
**\<@knocte\> **
sandy's right
07:45
**\<@ray\> **
sandy, sure, i will :)
thanks sandy
**\<@sandy\> **
I woudln't be surprised if there are a lot of bugs in datagrid\*, for example
**\<@decriptor\> **
ray: did you get a chance to look into deb stuff at all?
**\<@ray\> **
decriptor, oops, i nearly forgot, will see :)
decriptor, do you mean to build deb package on build1?
07:46
sandy, yes, datagrid\* seems more complex which i run into
**\<@decriptor\> **
ray: uia2atk for now
07:47
just on a weekly basis
**\<@ray\> **
decriptor, ok , will finish it within this week :)
**\<@knocte\> **
ok, let's switch to my (most likely) mentor in hackweek: decriptor :)
**\<@decriptor\> **
lol
**\<@ray\> **
 :)
**\<@decriptor\> **
knocte: then you're in trouble :P
**\* decriptor **
admits that he is a big fan of OBS
07:48
**\<@knocte\> **
x) go ahead
**\<@decriptor\> **
fixed the at-spi dbus rpms (can't remember if that was before this iteration or if it was this one)
**\<@knocte\> **
then, can QA start looking at them?
07:49
**\<@decriptor\> **
talked with jared about putting out rpms about the start of the work day for ray and calen since they are ahead of us
knocte: no
knocte: I'll explain
**\<@knocte\> **
sure
**\<@decriptor\> **
as well as starting to do weekly snapshots for the public
which will be in OBS
07:50
[https://build.opensuse.org/project/show](https://build.opensuse.org/project/show)? project=home%3Auia2atk
spent about a day getting that sorted out and building correctly
fixed up my script so that it sends out emails notify of new rpms (if you want on the list, let me know)
07:51
this iteration I'll work on automating that script so that it runs at a set hour and maybe scripting the weekly obs stuff
07:52
also if i get a chance, I'll look at getting the tests running after the build
still want to look at cruise control .NET as I heard some really good things about it from our friends over in germany
07:53
done
**\<@knocte\> **
cool, so the problem with at-spi dbus?
**\<@decriptor\> **
oh ooops
**\<@knocte\> **
 :)
07:54
**\<@decriptor\> **
from what I understand, its not quite there yet and it would, i think, be a waste of time at the moment. I'm going to continue to build it so that it stays in a buildable state
**\<@knocte\> **
yeah, well, if you think it's not there yet, file bugs to mgorse :)
07:55
**\<@ray\> **
right , when will at-spi-dbus would replace currently atspi ?
**\<@knocte\> **
ray: you mean on production?
**\<@ray\> **
knocte, emmm , might e
mighg be
**\<@decriptor\> **
ray: I think they are hoping for gnome 2.26 or 2.28
07:56
**\<@knocte\> **
it's a work that in theory has no deadline, but I guess not earlier than 2009
**\<@ray\> **
ok
**\<@mgorse\> **
We're going to need C\# bindings for next year's work, so I'm hoping that it will be somewhat usable by the end of the year
**\<@ray\> **
are they conflict ?
**\<@knocte\> **
but anyway it's good to move it forward, or else mgorse will forget the impl details :P
**\<@mgorse\> **
ray: atspi-dbus will eventually replace at-spi; you'd use one or the other but not both
07:57
**\<@sandy\> **
mgorse: would the C api be the same?
**\<@knocte\> **
mgorse: really? shouldn't we use dbus\# for at-spi and still atk (but with a new lib-atkbridge that uses dbus)?
**\<@sandy\> **
(just a binding to dbus?)
**\<@ray\> **
mgorse, ok, make sense
**\<@mgorse\> **
sandy: for cspi? It is an abstraction, so it's the same except that some headers are in different places
07:58
**\<@decriptor\> **
almost forgot, I got the new accerciser pushed into factory for 11.1 this iteration :)
**\<@ray\> **
decriptor, oh, really? good news!
decriptor, who did that?
07:59
**\<@knocte\> **
oh, good job decriptor, well thanks all for attending the meeting, I would like to offer brad again a chance to speak, if he wants
any questions or comments?
**\<@calen\> **
knocte: sorry, i need add something,
i mentioned there is one problem when running groupbox test by doing 'button.click', that is not button's issue but because frame can't get its parent ipy(bug \#411882). all of the winforms apps have this problem except form.py. so its a biggest one to block our test now.
done, thanks\^\^
08:00
**\<@knocte\> **
ok, thanks calen, do you think you should file a new bug or reopen anyone about the click action?
**\<@brad\> **
knocte: I'm good, thanks
08:01
**\<@calen\> **
knocte: i will file a new bug for listbox about lost click action
**\<@knocte\> **
calen: cool, thanks
well, did I miss anybody? any other comments?
if not, we'll consider the meeting finished for now, so good evening for some of you :)
08:02
** **
-!- knocte changed the topic of \#mono-a11y to: Accessibility: [http://www.mono-project.com/Accessibilit]({{ site.github.url }}/Accessibilit) y

