---
title: "Accessibility: Team Meetings 2008 Jul 23"
lastmodified: '2008-07-23'
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Jul_23/
---

Accessibility: Team Meetings 2008 Jul 23
========================================

-!- knocte changed the topic of \#mono-a11y to: Iteration meeting ( Accessibility )
07:05
**\<@knocte\> **
well I guess we can start
calvin told me to run the meeting, he was not going to be able to join
as usual we will be asking for the status report of everyone and plan for next iteration
07:06
anything that anybody want to arise before we start? everyone is ok with the usual order of people reporting?
**\<@Ray\> **
yep
07:07
**\<@knocte\> **
I guess it's ok so let's start with the first in the class :) ermmm, sandy?
how was your iteration?
**\<@sandy\> **
Alright, the main thing I worked on this iteration was getting our StructureChangedEvents in order
which involved some refactoring in UIAutomationWinforms and in the bridge, too
07:08
the bridge now at least notices when removals occur, but atk is not being notified properly yet (it seems to be...something must be getting lost)
anyway, I also got to my tests
but I haven't committed them yet
they will be committed today...I had some minor threading issues on the Form test
07:09
of course, still waiting to hear on the Olive patch
next iteration...
I really want to make our contributor guidelines more solid
we never documented that our coding standards are different than the rest of Mono
and this has caused some confusion
and I think it's important that we get this and the rest of our practices clearly documented
07:10
this will probably take me at least a day to do right
and then hopefully mario can advise me on what provider is best to work on
or if there is other architectural work I should focus on
done
07:11
**\<@knocte\> **
thanks sandy, about the olive's patch, my fault that I wasn't paying attention to it, still didn't subscribe to olive's list, so no replies on the thread at all?
**\<@sandy\> **
knocte: I pinged again the other day on the list
**\< kangaroo\> **
why are you guys patching olive?
**\<@sandy\> **
kangaroo: it's just a pc file
**\< kangaroo\> **
oh
**\<@sandy\> **
but miguel wanted to review it
**\< kangaroo\> **
monoport the change?
miguel is travelling this week
expect delays
**\<@sandy\> **
yeah, it's been a busy month
**\<@knocte\> **
kangaroo: I guess the change is on the mailing list
07:12
and about the contributor guidelines, sorry but I didn't look into them very deeply, but I guess our main differences are one glitch about the coding style and the .py files headers and... anymore?
**\<@sandy\> **
knocte: I don't know, I will have to review
07:13
**\<@knocte\> **
maybe it's worth resyncing ourselves again to Mono conventions
ok we'll talk about this later
let's switch to mario, thanks again sandy
**\<@sandy\> **
kangaroo: [http://monoport.com/36522](http://monoport.com/36522)
**\<@knocte\> **
mario: ready there?
07:14
**\<@mario\> **
this iteration: I finished the unitary tests for ListBox and ComboBox
I started working with the winform Components
such as ToolTip, HelpProvider, ErrorProvider
and some changes were committed to update the implementation
07:15
I'm still missing the Scrollbar navigation in ComboBox.
so, next iteration is: winfor components: "ToolTip, HelpProvider, ErrorProvider". Write CheckedListBox unitary tests. Update winform patches.
07:16
done :)
**\<@knocte\> **
fine, that seems to be a very complete iteration, thanks mario
let's see if we can keep on with neville
ngao: ready?
**\<@ngao\> **
yes
07:17
last iteration, i spent a little time on struggling with monodevelop...
read some Navigation docs and codes, and implemented Griditem that is for the items in status bar, and finished unit test
next iteration, since status bar has three leafs, i would like to implement progress bar provider,
i think that would be a part of status bar navigation
07:18
done
**\<@knocte\> **
thanks ngao, so finally using MD 1.0 right?
**\<@ngao\> **
yeah, but still some trivial problems
07:19
**\< kangaroo\> **
sandy: looks fine, but if miguel wanted to review thats up to him
**\<@knocte\> **
kangaroo: thanks for the follow-up
ok, I wanted to be the last one of the devs to give my status because I wanted to ask you how did you feel about a slight change on how we structure some things in the wiki (the project schedule)
07:20
**\<@mgorse\> **
knocte: I should go first?
**\<@knocte\> **
oh sorry mgorse, dumb of me!
mgorse: please
**\<@mgorse\> **
I've been working on mapping the StatusBar control type to atk
07:21
I have a bunch of code that I'm close to being ready to commit. I mailed the list, then made some changes to the tests per knocte's request
I've only tested simple status bars. Haven't tried testing StatusBarPanels, so the code may or may not need changes to support them. I plan on trying that when UI.Automation.WinForms supports them.
07:22
I also wrote a bunch of code for IGridProvider, and much of it should be reusable to implement tables, but it isn't really tested yet, either
and I fixed a couple of issues with the text implementor in the bridge that I found while testing the statusbar. Going to commit those later
07:23
Next iteration I plan on working on mapping the ScrollBar control type to atk
**\<@knocte\> **
maybe you'll reuse some Panel class stuff for StatusBarPanels?
**\<@mgorse\> **
I also talked to Mark Doffman about collections in atspi-dbus and realized that I should finish the work that I started on them, so I plan on doing that as well
07:24
done
**\<@knocte\> **
oh yeah please, tell us when you think the dbus side needs more attention
thanks mgorse
**\<@mgorse\> **
knocte: I consider myself to be in maintenance mode with that code
07:25
**\<@knocte\> **
ok perfect, I'll ask you some more questions about that later
**\<@mgorse\> **
ok
**\<@knocte\> **
ok so what I wanted to arise is 2 proposal for change: firstly try to figure out percentages of work done before having the meeting, in order to reflect them on the meeting log, and , regarding the project schedule:
first a question, how are you guys handling the case when there is a delay of what was \*originally\* planned in the first version of the project plan?
07:26
I guess you're just adding the elements to the next iteration right?
sandy: I noticed you were doing that?
**\<@sandy\> **
knocte: well, we aren't actually planned in advance
we randomly tossed things into future iterations
07:27
**\<@mario\> **
I'm moving to last iteration, then I move to current when the controls are alike, for example right now, the "component-controls" (tooltip, helpprovider, etc)
I did the same with the scrollbars
**\<@knocte\> **
I see, ok what I meant with this is, maybe you already noticed...
last week I added an extra "meta-iteration" on the page
called "elements delayed"
07:28
I think there are 2 types of delays
firstly a delay that you know before the iteration takes place, like my guadec travel
and secondly a delay because you have needed more time to finish more things or got stuck with something
07:29
so I was thinking about specifying this kind of stuff here
**\<@sandy\> **
knocte: if something is delayed, it shows in iteration X as "not done"
and there are notes to specify why
and it gets bumped to the next iteration
**\<@knocte\> **
yeah but what I noticed is that it's not easy to see all the delayed elements
07:30
**\<@sandy\> **
is that a problem?
**\<@knocte\> **
maybe for project planning, well, maybe we just have to agree on some keywords to distinguish between these types of delays I've talked about
07:31
we'll talk about this later.. and I'll give my status report now
it turns out I've had a delay, but not planned delay, in this iteration, because I started to have threading issues with the GailTester project
precisely when mgorse was joining development on this side, so I considered it pretty important
07:32
I discovered some bug in NUnit and tried to use a more recent version
that led me to more problems... until I figured out some command line options I should use...
it's all in some emails I exchanged with mkestner and a thread in the nunit-user list if you're curious
07:33
so I had only time to finish a bit more the combobox and entry classes, but without committing until I get more progress
so I hope that my next iteration means finishing those and also finishing my delayed Menu mapping
07:34
done
so let's switch to QA guys if no one has anything more to say?
bgmerrell: you ready? I'm glad you've started submitting bugs, I forgot to say I was going to dedicate time to them also
07:35
bgmerrell: ping?
07:36
we'll switch to Calen in 3, 2, 1... :)
**\<@Calen\> **
hehe..
**\<@knocte\> **
Calen: ready?
**\<@Calen\> **
i am ready
**\<@knocte\> **
ok go ahead
**\<@Calen\> **
in last Iteration i upgraded some winforms application to not use '&' in form's text, beauce it cause an error with accerciser can't get correct frame's name
07:37
**\<@decriptor\> **
knocte: weird he just emailed the list
**\<@Calen\> **
i also have scripted a strongwind test for winforms button control application.
but fased some problems, so i spent many times to search solution and log bug:
**\<@knocte\> **
decriptor: thanks for pointing out, we'll wait for him in the last slot :)
**\<@Calen\> **
first one is strongwind couldn't run cache.launchApplication(args=args), solved by add name='ipy'
07:38
second is strongwind couldn't find Frame beause program doesn't support 'showing' state for winforms app items, but strongwind base on 'x.showing' to run findFrame(), so if we want to run the test before it's be supported we need change 'x.showing' to 'not x.showing' in strongwind.
third is strongwind test for winforms button control run false beause accerciser can't get new label text that has been changed by click button.
07:39
another problem is strongwind can't find a new frame window that be rised by click a button (actually accerciser can find it). i have no idea about this problem now,
so in this Iteration i will look at it. and also will continue to script strongwind test for a new winforms control
done :)
07:40
**\<@knocte\> **
thanks Calen, where's strongwind bug tracking tool?
** **
-!- bgm [\~bean@c-76-27-10-135.hsd1.ut.comcast.ne t] has joined \#mono-a11y
**\<@knocte\> **
I mean, is there a bugzilla for strongwind?
**\< bgm\> **
yes
**\<@Calen\> **
knocte: strongwind have a bugzilla
**\<@knocte\> **
is it public? you have the URL?
07:41
bgm: hey
**\<@bgmerrell\> **
sorry my VPN got disconnected again, i just thought mgorse was taking a long time :)
** **
-!- bgm [\~bean@c-76-27-10-135.hsd1.ut.comcast.ne t] has quit [leaving]
**\<@Calen\> **
wait, let me see
**\<@knocte\> **
bgmerrell: doesn't matter, you'll go next to Calen now
BTW, in which language is strongwind tool developed?
07:42
**\<@bgmerrell\> **
python!
**\<@Calen\> **
python
**\<@bgmerrell\> **
 ;)
**\<@knocte\> **
ok :)
**\<@Calen\> **
haha..
**\* decriptor **
remains unsurprised :)
**\<@knocte\> **
well then if you've submitted bugs, I'd love to see their URLs! just for the sake of the log, as soon as you find them
07:43
bgmerrell: you can go ahead with your report
**\<@bgmerrell\> **
[http://bugzilla.gnome.org/browse.cgi?pro](http://bugzilla.gnome.org/browse.cgi?pro) duct=strongwind
**\<@knocte\> **
ohh it's a gnome module, I didn't know that, thanks guys
07:44
**\<@bgmerrell\> **
I have gotten patches accepted to Strongwind, so we should be able to tackle any problems on that end.
**\<@knocte\> **
fine fine
**\<@bgmerrell\> **
okay, my report..
07:45
i was kind of all over the place this iteration, i wanted to get the test harness and gtk examples polished up so we had some pristine examples to go by now that we have started the WinForms testing
07:46
So i did that.
Worked with decriptor quite a bit on making sure his packages were what QA needed
wrote a tiny script to download and updates all the appropriate RPMs to get our stuff running
07:47
thats checked in to uia2atk/test/drivers if anyone cares
(anyone outside of QA i mean)
07:48
I also continued my slow-but-sure work on getting a good Strongwind tutorial up on our wiki
Next iteration I hope to finish that
07:49
and continue to make sure we get any problems resolved for using Strongwind to test the WinForms apps
07:50
**\<@knocte\> **
that sounded as really fun hacking (except the wiki part :) ), so done?
**\<@bgmerrell\> **
and i still hope to get started on Orca testing (this has been planned for a while now)
done
07:51
**\<@knocte\> **
oh yes, orca sounds like a plan to start finding tons of bugs :) thanks bgmerrell
we'll get to the QA&build man, Ray?
**\<@Ray\> **
yeah, here i come.
**\<@knocte\> **
ok, QA first please (if you did any QA)
07:52
**\<@Ray\> **
this time, i have nearly all the sample scripts to be changed to suite the needs for testing except webbrowser.py
i'm stuck by WebBrowser control. and ask the question in mono-olive google groups. but no answer yet.
I would figure things out in this iteration.
I just have learnt some package, python, autotools knowledge for a little time.
07:53
but not touch building stuff yet.
so in the next iteration,
I should start to do some codes for the rest of controls.
and keep walking. :)
done
**\<@knocte\> **
ok, although WebBrowser seems to be a ton of work by just one widget, it's fine you start dealing with it early
thanks Ray
**\<@Ray\> **
you're welcome
**\<@knocte\> **
and before decriptor starts I wanted to ask you first
07:54
**\<@Ray\> **
sure
**\<@knocte\> **
(both of you)
if you could start, wrt packaging, looking at the CORBA-\>DBUS stuff
**\<@Ray\> **
where is the source code?
07:55
**\<@knocte\> **
I don't know if the location of the code is going to be definitive, well this stuff will need just to talk with mgorse
decriptor: are you very busy to start looking briefly at this?
**\<@decriptor\> **
knocte: I can start looking at it
**\<@Ray\> **
ok, so we have to package what mgorse code?
07:56
**\<@knocte\> **
yeah, mgorse will guide you about all that stuff
**\<@mgorse\> **
The code is currently at [git://git.codethink.co.uk/git/atspi-dbus](git://git.codethink.co.uk/git/atspi-dbus)
but it might eventually get moved to freedesktop.org
**\<@decriptor\> **
oh, I get to learn git :)
**\<@knocte\> **
mgorse: thanks for pointing out
**\<@Ray\> **
knocte, sure, i will . :)
**\<@knocte\> **
well then we can finish with decriptor report
**\* decriptor **
disappears for a week :)
**\<@mgorse\> **
decriptor: Yeah. You should jus tneed to clone the repository, though. We can talk about it later
07:57
**\<@Ray\> **
decriptor, so do i . :D
**\<@decriptor\> **
sorry, taking notes
now I'm ready
07:58
**\<@knocte\> **
perfect, go ahead
**\<@decriptor\> **
so as bgmerrell mentioned we worked on getting the rpms right as far as whats needed
they will be at [http://build1.sled.lan.novell.com/uia](http://build1.sled.lan.novell.com/uia)
I created a script that would dig through monobuild and collect out the packages of interest. I can post that script if anyone is interested
07:59
**\* Ray **
is interested in that.
**\<@decriptor\> **
they why that I've set it up is it cleans out the current stuff on build1 and uploads the new stuff
the old stuff remains on the build.mono.lab.novell.com
08:00
**\<@knocte\> **
yeah, maybe it's interesting to commit it, check it with mono packagers as well
**\<@decriptor\> **
ok
**\<@bgmerrell\> **
[http://build1.sled.lab.novell.com/uia](http://build1.sled.lab.novell.com/uia) btw
**\<@decriptor\> **
bgmerrell: thanks
08:01
 :)
**\<@knocte\> **
s/lan/lab, right, thanks
**\<@bgmerrell\> **
sandy will fix it in editing.. ;)
**\<@decriptor\> **
knocte: they might go a different way. the reason for the script is to handle mono packages that need patches
**\<@knocte\> **
oh I see
**\<@decriptor\> **
so as for the build stuff, we are going to go with a hybrid of monobuild and OBS
**\<@knocte\> **
nice to know
**\<@decriptor\> **
knocte: if we end up not patching over time, then we might change that up
08:02
but for now
**\<@knocte\> **
oh I thought monobuild was based on OBS, I should learn more about this stuff
**\<@decriptor\> **
both systems come with limitations :(
no
knocte: monobuild is completely written by wade solely for mono stuff
so I've taken the code and done a friendly branch of it and try to learn it
08:03
**\<@knocte\> **
I see
**\<@decriptor\> **
no one knew the code other than wade :(
**\<@knocte\> **
well, then, next thing is your plan for next it.?
**\<@decriptor\> **
its going to be an embrass and extend thing I think
**\<@knocte\> **
aha, sounds good
08:04
**\<@decriptor\> **
go over the code some more and see where we can improve it and take advantage of obs for the actual building (jails) which will give us multi-distro capabilities
**\* decriptor **
sidenote I got access to the provo build system (new obs stuff)
08:05
**\<@decriptor\> **
start looking into the corba-\>dbus stuff
**\<@knocte\> **
ok that sounds very good too
**\<@decriptor\> **
btw I created a google doc in hopes to keep ray and myself and [yet to be hired] :) in sync with the build stuff
(not sure if other want access to that)
08:06
I think that's it... done
**\<@knocte\> **
well, if anyone's interested, just ask decriptor!
thanks very much decriptor, and all
hugh, 1 hour meeting!
**\* decriptor **
oh and promote a11y stuff at the LWE :)
** **
-!- knocte changed the topic of \#mono-a11y to: Accessibility
08:07

