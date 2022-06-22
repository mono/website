---
title: "Accessibility: Team Meetings 2008 Aug 13"
lastmodified: '2008-08-13'
redirect_from:
  - /Accessibility%3A_Team_Meetings_2008_Aug_13/
---

Accessibility: Team Meetings 2008 Aug 13
========================================

    **<@knocte> **
    fine, let's start then, we'll follow the usual order, unless QA or build guys want to start earlier than the devs :)
    07:07
    ** **
    -!- suseROCKs [\~bryen@c-24-12-98-76.hsd1.il.comcast.ne t] has quit [Remote closed the connection]
    07:08
    **<@sandy> **
    ok, should I start then?
    ** **
    -!- knocte changed the topic of #mono-a11y to: Accessibility: Iteration switch meeting (weekly)
    **<@knocte> **
    yes, sandy, please, go ahead
    **<@sandy> **
    I've been spending a lot of time fixing up base provider unit tests this iteration (not yet committed). I've found some issues with my LabeledBy property implementation. I'm thinking now that I've just made some mistakes using the Navigation stuff, so I'll ask Mario for some help there today.
    I'm also working to add support for recursive property changes...for example when a control's BoundingRectangeProperty changes, this should also change for its children, etc.
    I also have a bridge patch to notify at-spi when IsOffscreenProperty and BoundingRectangleProperty change, but I need to genericize it a bit because right now it's only implemented for Button. This is related to bug #411345.
    I will have all of these bits wrapped up by the end of the week. Then I can move on to the next control. Also, decriptor has been working to see if we can get the UIA and WindowsBase assemblies moved from olive to mcs. I'm going to get him some details about how far along WindowsBase is, and I may also be helping him to finish filling out missing fields/classes/etc in olive's UIA assemblies. The discussion won't really start until Miguel
    is back in town next week.
    Oh, and I'm not sure that I'll be able to work Friday. I have to fast and take some nasty drugs in preparation for yet another doctor appointment (on Saturday), so that might affect my ability to work.
    07:09
    I'll update the wiki after the meeting; sorry for not getting to it earlier
    done
    ** **
    -!- jpallen [\~jpallen@137.65.132.9] has joined #mono-a11y
    **<@sandy> **
    jpallen: we just started; I just went
    you haven't missed much
    **< jpallen> **
    thanks
    **<@knocte> **
    ok, sandy thanks, hi jpallen
    07:10
    **< jpallen> **
    hello
    **<@knocte> **
    sandy: any delay in respect to what you planned in last meeting?
    just the uncommitted code?
    **<@sandy> **
    knocte: yes, I did not start a new control like I had planned
    **<@knocte> **
    ok
    **<@sandy> **
    I had PrintPreviewDialog in there as a placeholder for whatever control I was going to do
    07:11
    but I did not get to it
    so that will be my big priority this iteration
    **<@knocte> **
    ok fine
    mario: you ready?
    **<@mario> **
    yes!
    **<@knocte> **
    go ahead
    07:12
    **<@mario> **
    I updated Navigation, now you don't need to implement any Navigation-classes, all is \*automagically\*
    **<@sandy> **
    woo hoo!
    07:13
    **<@mario> **
    fixed some bugs, and I opened new bugs to track the patches in mcs MWF
    spent some time fixing bugs found by mgorse
    I'm missing the component-based providers, but I'm sure next iteration will finish them
    07:14
    done!
    **<@knocte> **
    fine, I hope mgorse has not get stuck too much about them
    so your plan for next iteration is finish component based providers delayed in this one?
    **<@mario> **
    yes
    **<@knocte> **
    fine
    let's switch to mgorse
    07:15
    **<@mgorse> **
    ok
    I started working on mapping ProgressBar in the bridge but haven't tested it yet
    Also started working on ListItem
    I haven't committed any of that yet, except for accidentally committing a ProgressBar test
    I've fixed a few bugs in the bridge
    I've been reworking the bridge unit tests to generate real widgets with a form as the parent, since I think that that will make it less likely that we'll run into strange problems with the tester, although I'm not sure yet
    I also tried to add in a PreviewKeyDown event listener on a form, in the hope that it would intercept keys and let me pass them on to the bridge, but it wasn't working. I'll ask about that on #mono-winforms
    07:16
    **<@knocte> **
    ok, your plan for next iteration? a new bridge class?
    07:17
    **<@mgorse> **
    Next iteration I plan on working on mapping GroupBox in the bridge (unless knocte has already taken it--haven't looked at the wiki) and trying to get the unit tests that are failing to pass
    done
    **<@knocte> **
    fine, thanks mike
    let's talk with neville
    **<@ngao> **
    ok
    07:18
    this iteration, is not productive, i was going to implement status bar panel, but puzzled with its type, it is maybe pane type or edit type, but not sure right now
    as FragmentRootControl can automatically add child provider, i deprecated edit provider and its behaviors
    next iteration, i will follow mario's comments on my patch, and make a new version. to implement other controls, i would like to talk about it with sandy and mario after meeting
    done
    **<@knocte> **
    ok, do you know which controls are they going to be? already chosen?
    07:19
    **<@ngao> **
    not yet
    i will finish navigation first
    **<@knocte> **
    ok, remember to update wiki status, on the schedule page and on the provider status
    07:20
    and thanks!
    **<@ngao> **
    ok
    **<@knocte> **
    now let's talk about my "dev" part
    I've been catching up with a lot of things after my FTO, and figuring out about all my new tasks for the new role, however also looked at some tests I was lacking
    07:21
    had a bad time figuring out a misleading/confusing implementation in gail about the difference between menuitem and menu (it turns out a submenuitem can take the "menu" role, which is weird) so
    I fixed some tests and now I was going to commit more
    07:22
    I hope to finish all these bits by the end of the week and have the Menu finally finished
    (BTW on Friday it's national holiday in Spain IIRC, just FYI)
    ok, let's switch to QA guys
    07:23
    bgmerrell: you there and ready?
    let's get back to calen that I'm sure is there :)
    **<@bgmerrell> **
    This iteration was just Monday and Tuesday for me. I added some code to one of our gtk examples to show how we can test the sorting order of certain controls. I created some QA architecture diagrams (showing how we are testing WinForms using Strongwind) to add to our QA docs and also to be used for our utosc presentation.
    07:24
    **<@knocte> **
    oh sorry brian
    go on
    **<@calen> **
    knocte:\^\^
    **<@bgmerrell> **
    I also came up with a plan for how to test the different "styles" of each control. Knocte suggested this because some controls have different
    styles/properties that will affect their implementation by the developers
    This week I'm going to start working with Orca like I mentioned last week.
    ray: i'll talk to you about your mailing list questions after this meeting if you have time
    07:25
    done
    **<@ray> **
    sure
    **<@knocte> **
    thanks brian, now calen :)
    **<@calen> **
    knocte: okay
    I adjusted my schedule and have finished strongwind code for label and form controls but not for groupbox, picturebox.
    07:26
    **<@knocte> **
    (btw, good job on the styles part)
    **<@calen> **
    added 'showing' state to our states list and modify some states with '-' to link two word in states.py, modify all of the old winforms test code because bug411345 has been fixed. verified some bugs
    read 'Testing Howto' and make a little bit correction, give some suggestions. discuss 'styles' issue.
    07:27
    I would like to keep on script strongwind test for listbox, checkedlistbox in the coming iteration.
    sandy: sorry i reopened [https://bugzilla.novell.com/show_bug.cgi](https://bugzilla.novell.com/show_bug.cgi) ?id=411328, i think you have noticed that :)
    knocte, decriptor: BTW, there is one crash when i run groupbox.py app today, the debug info in: [http://rafb.net/p/8tTUxc51.html](http://rafb.net/p/8tTUxc51.html)
    done
    **<@knocte> **
    fine, btw that reminds me about the scrollbar bugs, mgorse: you started to work on scrollbar already, right?
    thanks calen, mmm, groupbox was not started IIRC, at least there's no class with that name in the bridge
    07:28
    **<@mgorse> **
    knocte: yeah. Theoretically, anyway. What bugs are you referring to?
    **<@decriptor> **
    does that bug need to be marked as private?
    **<@knocte> **
    mgorse: you'll get emails in your inbox about them soon if you didn't already
    decriptor: why?
    07:29
    **<@sandy> **
    decriptor: all of our bugs are private
    **<@mgorse> **
    I've sort of got detoured with getting exceptions in the tester
    **<@sandy> **
    decriptor: needs to be fixed
    **<@knocte> **
    sandy: is that a requirement from anyone?
    **<@mario> **
    yes, why are bugs private?
    **<@decriptor> **
    knocte: marking them private kills community effort
    **<@knocte> **
    decriptor: I agree, that's why I'm asking sandy
    07:30
    **<@sandy> **
    jpallen: was there somebody we needed to ping to fix that?
    **<@mgorse> **
    bgmerrell: fyi, Orca isn't working right with our bridge right now because of the key-grab issue that I alluded to
    **<@sandy> **
    I'm on my other computer so I dont' have my IM logs handy, sorry
    **<@decriptor> **
    sandy: you can change it on the bug itself I think
    **<@knocte> **
    sandy: oh, then you mean by default?
    **<@sandy> **
    decriptor: no, our entire product/component/whatever is private
    **<@decriptor> **
    oh
    sandy: I guess that doesn't help :P
    07:31
    **<@knocte> **
    ok, I'll try to move the bugzilla private problem forward
    **<@bgmerrell> **
    mgorse: thanks for the tip, i guess i will set up some orca tests against our gtk samples for now, just to set things up
    **<@sandy> **
    anyway, I have more info in a IM log with jpallen, so I'll check that
    **<@knocte> **
    fine, ok, we deviated a bit, I think we were with Ray's turn now, right?
    **<@mgorse> **
    bgmerrell: okay. I'm hoping that someone on #mono-winforms might know what to do and I'll be able to make some progress on it
    **<@ray> **
    yes
    07:32
    should i start?
    **<@knocte> **
    mgorse: cool, ray: yes, first QA, then build
    **<@ray> **
    in the early days of the week, i implement two controls, but get stuck with two controls as well. it wastes me a lot of time.
    there are 8 controls left, and i left the complex controls and implement them at the end, so that i could be concentrated on them. :)
    and then, i have spent time to read new materials on the wiki.
    07:33
    didn't do much about building, packaging atspi-dbus drives me and decriptor crazy :)
    in the next iteration, i'll pursue to do what i am doing, and pay more attention to Strongwind test script.
    done
    **<@knocte> **
    when you get stuck with a control, maybe it's handy to use VS.NET's visual designer, I use it on my virtual machine sometimes
    07:34
    **<@ray> **
    yes, me too
    **<@knocte> **
    (easier to design sample controls that way, instead of coding them all by hand)
    oh fine then
    ok, thanks ray
    now, decriptor?
    07:35
    **<@decriptor> **
    can do
    **<@knocte> **
    your turn
    **<@decriptor> **
    I was at linux world expo last week and gave a presentation on UIA :)
    **<@knocte> **
    cool
    **<@decriptor> **
    but I've worked on figure out what's getting messed up in monobuild with the rpms, working on trying to get atspi-dbus build working
    07:36
    as ray mentioned
    also looking at possibly using cruise control .net as I have time to look at it
    it might be something that the mono team moves to as well once 2.0 is out the door
    07:37
    **<@knocte> **
    oh really, did you talk about it with any mono team member?
    **<@decriptor> **
    and in some free time, look at making our uia stuff api stable with some help from sandy
    knocte: with ajorg who seems to be the goto guy now since wade left
    **<@knocte> **
    the goto guy? heheh
    07:38
    **<@decriptor> **
    knocte: also I've been emailing on the mono-devel list about olive and mono/mcs and moving our stuff from olive to mono
    knocte: you are on the mono-devel list right?
    **<@knocte> **
    yeah, saw that, many thanks about your interest
    yep
    **<@decriptor> **
    no prob
    **<@knocte> **
    ok, if you're done then
    07:39
    did I miss anyone?
    **<@decriptor> **
    next iteration, I'm going to continue working on build stuff :) ...
    I'm thinking if we can get our stuff out of olive and into mono/mcs it might be easier to get our stuff built on other distributions as well
    hoping to get that atpsi-dbus stuff working too
    07:40
    done
    **<@knocte> **
    ok, I hope we can move it forward, however it seems there's a lot of code stubs there...mmm
    fine, dive into atspi-dbus if you can
    **<@decriptor> **
    knocte: its an rpmlint issue that we can't figure out
    07:41
    **<@knocte> **
    wiki alias suffix preferably)
    **<@decriptor> **
    I've started asking around and all the obvious things are there :(
    **<@knocte> **
    decriptor: rpmlint is an rpm "compiler" ?
    or verifier like gendarme?
    **<@decriptor> **
    tester of sorts
    I think
    verifier is probably more correct
    07:42
    **<@ray> **
    yes, i guess verifier
    **<@decriptor> **
    knocte: a question that has come up, maybe for mgorse is how do we go about checking/testing atspi-dbus
     ?
    uninstall the old and install the new?
    **<@knocte> **
    I guess it's about removing at-spi corba packages and replacing them, and then running QA tests for instance?
    07:43
    s/them/them with the new ones/
    **<@decriptor> **
    that's more up to bgmerrell I guess :)
    **<@knocte> **
    yes, maybe you can sync with him after you have the packages
    **<@decriptor> **
    can do, I'm really hoping to have those finished this iteration
    07:44
    **<@mgorse> **
    decriptor: Do you mean testing the package, or testing the functionality of the code?
    **<@decriptor> **
    both I guess
    **<@mgorse> **
    There is some stuff in the tests sub-directory, but it isn't complete
    07:46
    **<@sandy> **
    knocte, decriptor: Apparently Gary Ekker is the guy who can fix bugzilla for us; jpallen emailed him last month but we didn't hear anything back, so I just pinged him again about it.
    **< jpallen> **
    so, i'm not seeing how it is private
    07:47
    **<@decriptor> **
    sandy: he sits across the hall from me :)
    **<@knocte> **
    oh, thanks sandy
    **<@decriptor> **
    jpallen: you can't see them without a novell account
    **<@knocte> **
    I'll test with my brother's bugzilla account which is not a novell one
    **<@decriptor> **
    I have both a novell and non novell account that's how I found out its private
    **<@sandy> **
    or just log out and try to look at a bug url
    **< jpallen> **
    hmm
    07:48
    **<@knocte> **
    oh yeah, that's easier
    **<@sandy> **
    jpallen: you'll see toward the bottom that there is a checkbox "This bug is only open to Novell employees and contractors"
    **<@ray> **
    decriptor, you can see the top right of the page, it has a red novell icon
    **<@decriptor> **
    if you look at group visibility on the right you only see the red circle N and not a globe for global
    **<@sandy> **
    jpallen: and it cannot be unchecked
    ditto decriptor
    **<@bgmerrell> **
    mgorse: is anyone else testing the functionality of the at-spi over dbus code?
    07:49
    **< jpallen> **
    ah
    **<@knocte> **
    well, I think we can close the meeting? :) thanks all for coming
    07:51
