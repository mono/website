---
title: "Accessibility: Team Meetings 2008 Jun 04"
lastmodified: '2008-06-05'
redirect_from:
  - /Accessibility%3A_Team_Meetings_2008_Jun_04/
---

Accessibility: Team Meetings 2008 Jun 04
========================================

Meeting Summary
---------------

    Attendants: bgmerrell, calen, calvin, jpallen,  marioC, mgorse, ngao, raywang, sandy, decriptor

    Topic—Iteration 2 review:

    <sandy>I got hung up on issues with child control/provider navigation and was unable to complete Form/GroupBox

    <MarioC>(1) read all properties for the Text-controls: TextBox, Masked, Rich. (2)Partially implemented the TextRangeProvider. (3)Have doing some UIA client stuff to get the "valid behavior"

    <calvin> (1)did a bit more work on the Button class and Pane.

    <Calen> (1)have finished 34% winforms sample applications, and have imported them into mono test suite.  (2) changed the status of "Accessibility:_Test_Plan_WinForms_Controls" and to notify each control link to which sample app

    <bgmerrell> (1)got Mono SVN access. (2)got a fully functional automated test for strongwind tests. (3)document for running tests. (4)have a method to automate the testing on all the lab machine

    <Ray> (1)simplify the olive package on OBS. (2)have built and packaged Strongwind. (3)patched and packaged python-elememnttree, lastest Mono project

    <ngao>focused on StatusBar ControlType and finished to implement StatusBar

    <mgorse> (1)have been working on demarshalling cspi events in dbus. (2)have also implemented a few of the registry functions in cspi. (3)started working on the cache signal

    <knocte> (1)created and test the CheckBox class in the bridge and in the Atk.Component testing interface (2)have proposed  a patch for adding the lacking virtual method RefStateSet to Atk# and restructured the tests. (3)have started to create the glue library.

    <decriptor> (1)have been looking at the olive package. (2)have been looking at osc and seeing if maybe we can get the builds automated

    Remind: we all need update our status and notes of what we had planned in schedule page.


    Topic-- Iteration 3 plan:

    <sandy> will working on Form, GroupBox, Button and RadioButton

    <MarioC>  will working on IscrollProvider, and do more tests

    <calvin> (1)will finish up Button, Pane and going to start  the List Control Type. (2)continue work on the properties and events that span all Control Types

    <Calen> will still write winforms app sample

    <bgmerrell> (1)document for tests,(2) research more about setting up something similar for orca. (3)look into Ray's package.

    <Ray> (1)discuss some QA works. (2)look into QA work more and deeper.(3)pack those packages to deb format

    <ngao> will test StatusBar and chat with MarioC and sandy to decide which one i will continue to implement

    <mgorse>will work on the cache signal, work on the text and component interfaces and anything else the simple_at test program needs to compile

    <knocte> (1) get some more Atk.Component bits finished in the adapter. (2)Get the DoAction method on the checkbox really do the action mapped to the provider. Create the ComboBox class for the bridge and map it to the UIA. (3)Finish the bridge glue library and maybe advance a bit more in the patches to the Gtk#/Atk# binding fixes.

    <decriptor> starting to learn python.

RAW IRC Capture
---------------

    *   sandy has changed the topic to: Accessibility | Iteration 3 Planning Meeting @ 1400 UTC (nowish) | Accessibility:_Project_Schedule#Current_Iterations
    *   bgmerrell stumbles in
    <calvin>  sandy: thanks, and right on time!
    <Ray> yes, we are on time. :)
    <calvin>  The only person I know of that will not be here is knocte|tax but I have his status (I'll paste it in)
    <sandy>   calvin: should we normally expect Jared at these meetings?
    *   calvin updates his op status
    *   vinnie gives channel operator status to calvin
    <calvin>  ah, better
    *   jpallen (~jpallen@137.65.132.25) has joined #mono-a11y
    <calvin>  Jared is here (in the office) and will be in shortly
    <calvin>  ha!
    <calvin>  I'm feeling empowered!
    <jpallen> hello everyone
    <bgmerrell>   hellooo
    <mgorse>  Hi
    <Ray> jpallen: Hiii. :)
    <Calen>   jpallen: hi Jared
    <ngao>    hello
    <jpallen> anyone had any problems with their 200GB seagate hard drives?
    <jpallen> i lost my second one in a month yesterday :(
    <decriptor>   morning
    <jpallen> beware
    <sandy>   :-/
    <Ray> decriptor: hey, you are on time. :)
    <calvin>  jpallen: I have, my office mate keeps taking the spare ones I have
    <decriptor>   Ray: :) and bgmerrell as well
    <Ray> yeah!
    <jpallen> hehe
    <MarioC>  hi
    <calvin>  ok, let's get started
    <mgorse>  jpallen: That's good to know--I shouldn't keep important stuff on this computer without having a copy somewhere else (which I suppose is true regardless of whether my hd is likely to crash)
    <calvin>  We'll follow the same pattern we did last time
    <sandy>   which means I should start?
    <calvin>  ... and work down through last iteration by person
    <calvin>  sandy: yes, but wait
    <mgorse>  One go-round, or two?
    *   sandy folds his hands in his lap, waits patiently
    <calvin>  Accessibility:_Project_Schedule
    <calvin>  There is a link to the Schedule
    <calvin>  In the future, I would like everyone to update their current status in the at table BEFORE this meeting
    <calvin>  that way when you go through your status, you're just adding detail to the information already provided
    <calvin>  then after this meeting you can fill in the information about next iteration
    <bgmerrell>   hooray, i did something right this time
    <calvin>  heh
    <sandy>   :-P
    <calvin>  and just to review the protocol, when it's your turn, do a small review of the last iteration, then a summary of your plan for the next iteration, then report "I'm done" so we know when to move on
    <calvin>  ok, let's go
    <calvin>  Sandy
    <calvin>  er sandy
    <sandy>   There's basically no change in the Button and RadioButton tasks, as I prioritized Form/GroupBox over them.  I got hung up on issues with child control/provider navigation and was unable to complete Form/GroupBox
    <sandy>   though I think they should be working well enough that you can use them
    <sandy>   so next iteration looks much the same as this iteration
    <sandy>   done
    <calvin>  sandy, so can you bump your items down in the iterations
    <sandy>   yes, and I'll put in percentages, too
    <calvin>  ok, and then anything that is in next iteration already, just move to a new iteration at the bottom (well, one that doens't have anything in it for you)
    <calvin>  ok, MarioC, go
    <MarioC>  I read all properties for the Text-controls: TextBox, Masked, Rich
    <MarioC>  my idea is to use the same ITextProvider for all of them
    <MarioC>  so, in this iteration I partially implemented the TextRangeProvider
    <MarioC>  that is going to be used by this texprovider implementation
    <MarioC>  I'm missing IScrollProvider.
    <MarioC>  and I need to do more tests..
    <MarioC>  I think, that's all.
    <MarioC>  done
    <calvin>  thanks, don't we all need more tests?
    <calvin>  heh
    <MarioC>  btw
    <MarioC>  I've doing some UIA client stuff to get the "valid behavior" when using the providers
    <MarioC>  I'm telling this because IUSpy returns objects instead of "readable" information
    <MarioC>  so.. I don't know the "real" values
    <MarioC>  the client stuff is simple.. and for testing only
    <MarioC>  I'm done (again)
    <calvin>  MarioC: ok, just keep in mind that the UIA Core does some work, the information doesn't always come directly from the Providers
    <calvin>  but's it's a good check what you are doing
    <calvin>  ok, I did a bit more work on the Button class
    <calvin>  or the Button Control Type
    <calvin>  it's pretty much done but Andres and I ran into some issues with Atk.States
    <calvin>  those still need to be worked out and I'll finally have button wrapped up
    <calvin>  The estimate on Pane is wrong, I need to fix the Wiki
    <calvin>  It's mostly there and working but there are some provider interfaces I haven't done and forgot about ( MarioC reminded me of them with his status)
    <calvin>  I'll get that updated
    <calvin>  I'll be gone next week so I'll only have half an iteration
    <calvin>  I'm going to start into the List Control Type and probably spread it between the next two iterations
    <calvin>  plus continue work on the properties and events that span all Control Types
    <calvin>  done
    <calvin>  I think knocte|tax is out, but he sent me his status
    <calvin>  Let me post it here
    <calvin>  I've created the CheckBox class in the bridge. As it inherits from
    <calvin>  button, I've reforced the tests on this class and also in the
    <calvin>  Atk.Component testing interface. I've proposed a patch for adding the
    <calvin>  lacking virtual method RefStateSet to Atk#, which will hopefully allow
    <calvin>  us get the correct behaviour with Atk states. I've also restructured the
    <calvin>  tests in order to separate the Gail+Atk centric from the bridge-centric
    <calvin>  ones. I've also started to create the glue library for the bridge that
    <calvin>  will let us fix the workarounds that are currently laying in it (related
    <calvin>  to the AddEmissionHook binding, and the signals that don't behave well
    <calvin>  with it).
    <calvin>  For this week I plan to: get some more Atk.Component bits finished in
    <calvin>  the adapter. Get the DoAction method on the checkbox (and maybe in the
    <calvin>  button) really do the action mapped to the provider. Create the ComboBox
    <calvin>  (or whatever name we select) class for the bridge and map it to the UIA
    <calvin>  provider. Finish the bridge glue library and maybe advance a bit more in
    <calvin>  the patches to the Gtk#/Atk# binding fixes (bugs currently uploaded to BNC).
    <calvin>  phew, it worked!
    <calvin>  ok, done
    <calvin>  Calen, go
    <Calen>   i have finished 34% winforms sample applications, and have imported them into mono test suite.
    <Calen>   i also changed the status of "Accessibility:_Test_Plan_WinForms_Controls" and to notify each control link to which sample app
    <Calen>   beacuse something app include more controls.
    <Calen>   so in next iteration, i will continue to write winforms applications
    <Calen>   done
    <calvin>  Calen: nice, I might use some of those apps today (I have a demo of our stuff to give)
    <calvin>  ok thanks
    <calvin>  mgorse: go
    <Calen>   calvin: can it be worked?
    <calvin>  Calen: I'll look at what is there and see what I can use
    <mgorse>  I've been working on demarshalling cspi events in dbus
    <mgorse>  I've also implemented a few of the registry functions in cspi
    <Calen>   calvin: okey, please tall me if you find any problem when you use them
    <mgorse>  I started working on the cache signal last night and this morning but still have more work to do
    <mgorse>  I'll keep working on that, then work on the text and component interfaces and anything else the simple_at test program needs to compile
    <mgorse>  I need to fix my stuff on the iwki; I'll do that after the meeting
    <mgorse>  done
    <calvin>  thanks
    <calvin>  bgmerrell: go
    <bgmerrell>   OKay, I got Mono SVN access last week, so I was able to get all of Calen's sample applications and my test code into SVN (instead of storing it on our qa server)
    <bgmerrell>   I've also gotten a fully functional automated test harness written for strongwind tests.
    <bgmerrell>   Right now we're just testing gtk apps, but in the future we'll just need to write strongwind tests for our winforms apps and plug them in
    <bgmerrell>   i've been trying to document everything i've been doing, and it was enough for Calen to get in on her own and run some local tests
    <bgmerrell>   but i still need to document the remote testing
    <bgmerrell>   then research more about setting up something similar for orca
    <bgmerrell>   and polish things up and make the UI a little nicer
    <bgmerrell>   done
    <calvin>  bgmerrell: I can just imagine the Orca testing in NUnit
    <calvin>  Assert.DidHear("Done")
    <calvin>  thanks
    <calvin>  Ray: go
    <Ray> yes
    <Ray> In iteration 2, I did followings things.
    <Ray> 1. simplify the olive package on OBS, now I only pack UIA* and WindowsBase* files.
    <Ray> 2. I've built and packaged Strongwind on my home project of OBS, which is a GUI test automation framework, that Brian and Calen will use.
    <Ray> 3. python-elememnttree has been packaged which is a dependency of Strongwind
    <Ray> 4. the lastest mono have been patched and packaged
    <Ray> but I think, the Mono project also patched those mcs patches.
    <Ray> In iteration 3. I'll do the followings
    <Ray> 1. have a talk with Jared, Calen, Brian to discuss some QA works on Friday morning CST
    <Ray> 2. look into QA work more and deeper which depends on the talk.
    <Ray> 3. pack those packages to deb format.
    <Ray> I'm done
    <calvin>  Ray, very nice
    <calvin>  bgmerrell: have you started to look into these packages and seeing if you can deploy them?
    <calvin>  bgmerrell: maybe something to add on for this coming iteration
    <bgmerrell>   calvin: good idea
    <calvin>  thanks Ray
    <calvin>  ngao: go
    <Ray> thanks everyone
    <ngao>    ok
    <ngao>    i focused on StatusBar ControlType pages on msdn
    <ngao>    and started to implement StatusBar, almost finished and committed it to svn repo.
    <ngao>    i'm not sure if Event Handler is necessary.
    <ngao>    in the next iteration, i will test StatusBar
    <ngao>    and chat with MarioC and sandy to decide which one i will continue to implement
    <ngao>    done
    <calvin>  ngao: are you getting unit tests written at the same time?
    *   Calen sorry, i lost the link
    <ngao>    calvin: not yet
    <calvin>  sandy and MarioC can perhaps help out with how is best to write those for the providers
    <calvin>  ngao: thanks
    <MarioC>  sure
    <calvin>  ok, and finally (although not on last iteration's schedule)  we have decriptor
    <calvin>  decriptor: go
    <decriptor>   well just started monday, so getting my feet wet
    <decriptor>   I've been looking at the olive package that ray put together
    <decriptor>   also I've been looking at osc (OBS CLI client) and seeing if maybe we can get the builds automated
    <decriptor>   maybe something like polling the svn version and if its updated generating a new rpm
    <decriptor>   that way, hopefully for testing all they have to do is update the repo with the packages in it
    <decriptor>   oh and starting to learn python :)
    <decriptor>   ... I think that's it
    <decriptor>   so... done
    <calvin>  ok, sounds good
    <mgorse>  There are alsa packages for the latest hg trunk.  I wonder if those are built automatically
    *   peteb has quit (ChatZilla 0.9.82.1-rdmsoft [XULRunner 1.8.0.9/2006120508])
    <calvin>  ok, anything else we need to discuss?
    <calvin>  I'll have access to mail all next week but will be pretty sparse online
    <calvin>  I won't be here for next week's iteration meeting so I'll have someone else run it (TBA)
    <calvin>  Thanks everyone, there is a lot of good work being done
    <calvin>  you guys all rock!
    <calvin>  I think that is all I have
    <calvin>  to everyone in Beijing... Good Night!
    <calvin>  I'll of course post the log to the Wiki

