---
title: "Accessibility: Team Meetings 2008 Oct 29"
lastmodified: '2008-10-29'
redirect_from:
  - /Accessibility%3A_Team_Meetings_2008_Oct_29/
---

Accessibility: Team Meetings 2008 Oct 29
========================================

    (No log for phone meeting, so this is short)****
    <@ray> i'm sorry, but will the meeting be started soon, or it's over already? :)
    08:58****
    <@brad> I think its over :)
    09:00
    sorry to keep you ray, calen and nevilleI know it's late
    ****
    <@ray> brad, never mind :)brad, so i'm afraid i have to offline now,  'cause the coffee shop (where i am in) will be closed soon.  :)
    ****
    <@brad> no problem, we'll talk to you later ray
    09:01
    have a nice one!
    ****
    <@ray> brad, thanks, see yabye all
    ****
    <@calen> ray, see you tomorrow
    09:02****
     -!- ray [~ray@123.118.65.12] has quit [leave]-!- You're now known as sandy|brb-!- knocte [~knocte@130.57.22.201] has joined #mono-a11y
    09:04****
    < knocte> hugh sorry guys, had to reboot, my screen wasn't working..
    ****
    <@brad> anyone still on berserk?  I'm gonna restart it to get some bug fixes up
    09:06
    restartingso does everyone want to quickly talk about what they're going to work on?
    09:09****
     -!- You're now known as sandy
    ****
    <@brad> folks in china, don't worry about it, we've already kept you guys too long
    ****
    < knocte> yeah, maybe we should start with them in case they're still here
    09:10
    calen? ray?
    ****
    <@sandy> ray left
    ****
    < knocte> ngao?
    ****
    <@ngao> knocte: i'm here
    ****
    < knocte> hey, so what's your plan
    09:11****
    <@ngao> knocte: i have ray's report
    ****
    < knocte> cool
    ****
    <@ngao> ok, ray first:I was continuing to maintain our weekly builds which took some hours at every friday,
    09:12
    and everything is smooth.regards to ubuntu 8.10 will be released in near future.I would try to build deb packages when it is available on OBSecond, I was starting to write orca tests compares to strongwind tests.in order to QA or team lead to evaluate which one is much better,  or it is valuable or not.econd, I was starting to write orca tests compares to strongwind tests.in order to QA or team lead to evaluate which one is much better,  or it is valuable or not.oops, sorryand during the time, big thanks to Brian,he helps to review and give advices, so that i can continue to go for the next,till now, i have nearly finished checkbutton, radiobutton and start button control today,
    09:13
    and i will continue to work on orca until someone asks me to stop.  :)doneMine:Last iteration, I worked on three providers, StatusBarPanel, UpDownBase and Panel. I added GridItem Pattern to StatusBarPanel and patched SWF to support TextChanged event. DomainUpDown and NumericUpDown have most same behaviors, so I use UpDownBase to support both of them. Panel in UISpy and ClientTest doesn't support any of patterns, I've added this lamespec on Wiki page. For FontDialog, it's children can be displayed in Accerciser already, after discussed with Calen and followed Mario's commnets, I think we don't need to implement it.Next iteration, I'd like to work on PictureBox and GroupBox
    09:14
    done
    ****
    < knocte> ok thanks, calen is here?ok, let's move on
    09:15
    mario: just briefly, explain what you plan to work
    ****
    <@mario> half iteration for me, I plan to write client tests for missing controls and fix every new bug
    09:16****
     -!- calen-2 [~calen@61.149.60.91] has joined #mono-a11y
    ****
    <@mario> :-)done!
    ****
    < knocte> ok, remember about the priority policies :)sandy?
    ****
    <@sandy> stripstripstripstrip
    09:17
    and refactor our fragment/root/navigation stuff, as I mentioned in my reportdone
    ****
    <@brad> lets remember, when on irc, please remain clothed
    ****
    < knocte> hahok, mgorse?
    ****
    < calen-2> knocte: sorry, i lost link
    09:18****
    < knocte> calen-2: don't worry, we'll get back to you nowmm, seems that mgorse lost link, k calen want to give your plan?
    09:20****
    <@brad> calen-2: go ahead, give your update
    ****
    < calen-2> knocte: okay, i would like to add some strongwind test for maybe ListView, ToolStripmaybe TextBox or some others, i am not sure now, it depend on developers process.
    ****
    <@brad> thanks calen.  sorry to keep you so long
    09:21****
    < calen-2> and i am trying to improve some winforms application examples.brad: never mind , np :)done
    ****
    < knocte> ok, brad you want to go now?
    09:22****
    <@brad> sure
    ****
     -!- calen [~calen@61.149.60.91] has quit [Ping timeout: 600 seconds]
    ****
    <@brad> so I'll be working on ToolStripProgressBar, ToolStripComboBox and finishing up ToolTipdone
    ****
    < knocte> ok, I'll go now
    09:23****
     -!- calen-2 is now known as calen
    ****
    <@mgorse> sorry; I was afk.  Didn't realize that the meeting was still going on
    ****
    < knocte> mgorse: np, your turn after meI'll work on P1/P2 bugs  429438 reopened -> 3h, 427247 -> 5h,  429425 -> 3halso on Begin impl. of bridge classes to look ahead of needed patches(internal API), mainly combobox, richtextbox, some toolstrip*, maskedtextbox...
    09:24
    and some leftover from last iterationmgorse: you go
    ****
    <@mgorse> Are we talking about last iteration? Or just this one?
    ****
    <@brad> since we hear about what you did last iteration every evening, why don't you just fill us in on what you plan to do
    09:25****
    <@mgorse> okay.  I'm planning to investigate WebBrowser, StatusStrip, and some of the ToolStrip* items, panel, and group for any needed api changesthen continue to work on ListView
    09:26
    done
    ****
    < knocte> thanks
    ****
     -!- mode/#mono-a11y [+oo knocte calen] by mario
    ****
    <@knocte> decriptor &amp; bgmerrell, you wanna add something to what you already said on the call?
    09:27
    decriptor: ping
    09:29****
    <@bgmerrell> i don't :)
    ****
    <@knocte> bgmerrell: ping :)ok
    ****
    <@decriptor> I'm good
    ****
    <@knocte> fine, thanks guys, sorry for taking a so long it. meeting, it has been a mess
    09:30****
    <@sandy> knocte: should I bother logging this one?
    09:31****
     -!- knocte changed the topic of #mono-a11y to: Accessibility - Accessibility
    ****
    <@knocte> not sure :)
    ****
    <@sandy> and if so...do you want everything since it started?I think most of the content was on the phone...
    ****
    <@knocte> yeah, well, if you can, just add the last half hour
    ****
    <@sandy> ok
    09:32
    will do
    ****
    <@knocte> thanks!
    09:35
