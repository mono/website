---
layout: obsolete
title: "Accessibility: Team Meetings 2008 Oct 29"
permalink: /old_site/Accessibility:_Team_Meetings_2008_Oct_29/
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Oct_29/
---

Accessibility: Team Meetings 2008 Oct 29
========================================

(No log for phone meeting, so this is short)

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
i'm sorry, but will the meeting be started soon, or it's over already? :)
```

08:58

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
I think its over :)
```

09:00

``` nowiki
sorry to keep you ray, calen and neville
```

``` nowiki
I know it's late
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
brad, never mind :)
```

``` nowiki
brad, so i'm afraid i have to offline now,  'cause the coffee shop (where i am in) will be closed soon.  :)
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
no problem, we'll talk to you later ray
```

09:01

``` nowiki
have a nice one!
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
brad, thanks, see ya
```

``` nowiki
bye all
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
ray, see you tomorrow
```

09:02

****

``` nowiki
&nbsp;
```

``` nowiki
-!- ray [~ray@123.118.65.12] has quit [leave]
```

``` nowiki
-!- You're now known as sandy|brb
```

``` nowiki
-!- knocte [~knocte@130.57.22.201] has joined #mono-a11y
```

09:04

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
hugh sorry guys, had to reboot, my screen wasn't working..
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
anyone still on berserk?  I'm gonna restart it to get some bug fixes up
```

09:06

``` nowiki
restarting
```

``` nowiki
so does everyone want to quickly talk about what they're going to work on?
```

09:09

****

``` nowiki
&nbsp;
```

``` nowiki
-!- You're now known as sandy
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
folks in china, don't worry about it, we've already kept you guys too long
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
yeah, maybe we should start with them in case they're still here
```

09:10

``` nowiki
calen? ray?
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
ray left
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
ngao?
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
&lt; knocte&gt;&nbsp;
```

``` nowiki
hey, so what's your plan
```

09:11

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
knocte: i have ray's report
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
cool
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
ok, ray first:
```

``` nowiki
I was continuing to maintain our weekly builds which took some hours at every friday,
```

09:12

``` nowiki
and everything is smooth.
```

``` nowiki
regards to ubuntu 8.10 will be released in near future.
```

``` nowiki
I would try to build deb packages when it is available on OBS
```

``` nowiki
econd, I was starting to write orca tests compares to strongwind tests.
```

``` nowiki
in order to QA or team lead to evaluate which one is much better,  or it is valuable or not.
```

``` nowiki
econd, I was starting to write orca tests compares to strongwind tests.
```

``` nowiki
in order to QA or team lead to evaluate which one is much better,  or it is valuable or not.
```

``` nowiki
oops, sorry
```

``` nowiki
and during the time, big thanks to Brian,
```

``` nowiki
he helps to review and give advices, so that i can continue to go for the next,
```

``` nowiki
till now, i have nearly finished checkbutton, radiobutton and start button control today,
```

09:13

``` nowiki
and i will continue to work on orca until someone asks me to stop.  :)
```

``` nowiki
done
```

``` nowiki
Mine:
```

``` nowiki
Last iteration, I worked on three providers, StatusBarPanel, UpDownBase and Panel. I added GridItem Pattern to StatusBarPanel and patched SWF to support TextChanged event. DomainUpDown and NumericUpDown have most same behaviors, so I use UpDownBase to support both of them. Panel in UISpy and ClientTest doesn't support any of patterns, I've added this lamespec on Wiki page. For FontDialog, it's children can be displayed in Accerciser already, after discuss
```

``` nowiki
ed with Calen and followed Mario's commnets, I think we don't need to implement it.
```

``` nowiki
Next iteration, I'd like to work on PictureBox and GroupBox
```

09:14

``` nowiki
done
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
ok thanks, calen is here?
```

``` nowiki
ok, let's move on
```

09:15

``` nowiki
mario: just briefly, explain what you plan to work
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
half iteration for me, I plan to write client tests for missing controls and fix every new bug
```

09:16

****

``` nowiki
&nbsp;
```

``` nowiki
-!- calen-2 [~calen@61.149.60.91] has joined #mono-a11y
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
:-)
```

``` nowiki
done!
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
ok, remember about the priority policies :)
```

``` nowiki
sandy?
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
stripstripstripstrip
```

09:17

``` nowiki
and refactor our fragment/root/navigation stuff, as I mentioned in my report
```

``` nowiki
done
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
lets remember, when on irc, please remain clothed
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
hah
```

``` nowiki
ok, mgorse?
```

****

``` nowiki
&lt; calen-2&gt;&nbsp;
```

``` nowiki
knocte: sorry, i lost link
```

09:18

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
calen-2: don't worry, we'll get back to you now
```

``` nowiki
mm, seems that mgorse lost link, k calen want to give your plan?
```

09:20

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
calen-2: go ahead, give your update
```

****

``` nowiki
&lt; calen-2&gt;&nbsp;
```

``` nowiki
knocte: okay, i would like to add some strongwind test for maybe ListView, ToolStrip
```

``` nowiki
maybe TextBox or some others, i am not sure now, it depend on developers process.
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
thanks calen.  sorry to keep you so long
```

09:21

****

``` nowiki
&lt; calen-2&gt;&nbsp;
```

``` nowiki
and i am trying to improve some winforms application examples.
```

``` nowiki
brad: never mind , np :)
```

``` nowiki
done
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
ok, brad you want to go now?
```

09:22

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sure
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- calen [~calen@61.149.60.91] has quit [Ping timeout: 600 seconds]
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
so I'll be working on ToolStripProgressBar, ToolStripComboBox and finishing up ToolTip
```

``` nowiki
done
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
ok, I'll go now
```

09:23

****

``` nowiki
&nbsp;
```

``` nowiki
-!- calen-2 is now known as calen
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
sorry; I was afk.  Didn't realize that the meeting was still going on
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
mgorse: np, your turn after me
```

``` nowiki
I'll work on P1/P2 bugs  429438 reopened -&gt; 3h, 427247 -&gt; 5h,  429425 -&gt; 3h
```

``` nowiki
also on Begin impl. of bridge classes to look ahead of needed patches(internal API), mainly combobox, richtextbox, some toolstrip*, maskedtextbox...
```

09:24

``` nowiki
and some leftover from last iteration
```

``` nowiki
mgorse: you go
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
Are we talking about last iteration? Or just this one?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
since we hear about what you did last iteration every evening, why don't you just fill us in on what you plan to do
```

09:25

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
okay.  I'm planning to investigate WebBrowser, StatusStrip, and some of the ToolStrip* items, panel, and group for any needed api changes
```

``` nowiki
then continue to work on ListView
```

09:26

``` nowiki
done
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
thanks
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- mode/#mono-a11y [+oo knocte calen] by mario
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
decriptor &amp; bgmerrell, you wanna add something to what you already said on the call?
```

09:27

``` nowiki
decriptor: ping
```

09:29

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
i don't :)
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
bgmerrell: ping :)
```

``` nowiki
ok
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
I'm good
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
fine, thanks guys, sorry for taking a so long it. meeting, it has been a mess
```

09:30

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
knocte: should I bother logging this one?
```

09:31

****

``` nowiki
&nbsp;
```

``` nowiki
-!- knocte changed the topic of #mono-a11y to: Accessibility - http://www.mono-project.com/Accessibilit y
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
not sure :)
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
and if so...do you want everything since it started?
```

``` nowiki
I think most of the content was on the phone...
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
yeah, well, if you can, just add the last half hour
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
ok
```

09:32

``` nowiki
will do
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
thanks!
```

09:35

