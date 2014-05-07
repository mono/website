---
layout: obsolete
title: "Accessibility: Team Meetings 2008 Jun 25"
permalink: /old_site/Accessibility:_Team_Meetings_2008_Jun_25/
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Jun_25/
---

Accessibility: Team Meetings 2008 Jun 25
========================================

Meeting Log
-----------

**\<@knocte\> **

well guys, today I run the meeting again, as calvin told me he was going to be late

07:01

so we'll use the same technique as usual

first the devs, then build&QA

sandy: you want to start? you know, tell when you're done

07:02

**\<@sandy\> **

sure

** **

-!- bgmerrell [\~bean@snout.provo.novell.com] has joined \#mono-a11y

**\<@sandy\> **

I worked again on the olive infrastructure patch, but due to the boston meeting it has yet to be reviewed

hopefully we'll here about it early next week

07:03

**\< Ray\> **

sure

**\<@sandy\> **

I wrote up a little documentation on the wiki for setting up a parallel mono dev environment

and helped everybody get that set up

and then just spent a lot of time wrestling with makefiles

so I didn't actually get to any \*real\* development

which was disappointing

today I'll commit the makefiles I'm finishing

07:04

and then I'll finish the many testing tasks I have for some providers

and I think I may have work to do to adapt them to MarioC's new base classes, but I haven't looked yet

done

**\<@knocte\> **

ok, what was the provider(s) assigned for this iteration?

**\<@sandy\> **

knocte: nothing new

**\<@knocte\> **

ok

07:05

wiki , in order to do it without conflicting other's changes)

**\<@sandy\> **

Form, GroupBox, Button, RadioButton

just finishing testing on them

I'll pick up another provider if I have time

**\<@knocte\> **

ok

**\<@sandy\> **

done done

**\<@knocte\> **

MarioC: you go?

**\<@MarioC\> **

sure

this time, I decided to start implementing ComboBox to test both the bridge and the providers at the same time, and I did

07:06

however, to test navigation we need the ListBox provider

so, I decided to implement it as well, but.. in order to support navigation in ListBox we need to support Scrollbars, so now I'm missing ScrollBar provider

07:07

and also need TextBox,

the good news is that when finishing ComboBox, we'll also have the following providers done: TextBox, ListBox, Scrollbar and Button

07:08

I'm also adding new logic to support logic

s/support logic/support navigation

and the preview of the Winfors implementation is done: [http://www.mono-project.com/Accessibilit]({{site.github.url}}/Accessibilit) y:\_Winforms\_Implementation

07:09

**\<@sandy\> **

beautiful!

**\<@MarioC\> **

I'll be updating it as soon as I have more things to add

I'm sure sandy, will add more information

**\<@sandy\> **

 :-)

**\<@knocte\> **

ok, done?

07:10

**\<@MarioC\> **

not yet

next iteration I'm planning to finish Navigation for ComboBox, this includes the internal navigation for ListBox and ScrollBar

done

**\<@knocte\> **

thanks MarioC

**\<@MarioC\> **

 :)

**\<@knocte\> **

MarioC, sandy: do you guys know a brief summary of what ngao was planning for the following iteration ? any missing provider?

**\<@MarioC\> **

He needs to finish the tests first

07:11

**\<@knocte\> **

in case you have, just name it, for the sake of the meeting log

ok

**\<@MarioC\> **

and... his new provider: CheckedListBox

**\<@knocte\> **

ok, next would be calvin, who's not here

**\<@MarioC\> **

I t hink will be implemented as soon as the ListBox is already done

**\<@knocte\> **

cool, thanks MarioC

07:12

I'll paste here calvin's plans

[Calvin] I think we need to look at doing a lot more helper type classes to flush out the different providers. I noticed in your ComboBox, you have all of the SelectionProvider stuff stubbed in. Well, I just implemented all of that for the list class and it will be EXACTLY the same code. We'll also need to do some rework on the way the hierarchy is being built up in the bridge so I'm not going to add any more work to this ne

and now I'll go

07:13

**\<@sandy\> **

knocte: it was cut off

**\< bgmerrell\> **

I'm not going to add any more work to this ne[snip]

**\<@knocte\> **

oh

it finished "to this next iteration."

07:14

and that's it

**\<@sandy\> **

heh

**\<@knocte\> **

thanks for noticing bgmerrell and sandy

I'll tell my status now

I have completed the more important bits of RadioButton and ComboBox that were lacking, though still not passing the tests because of some mysterious behaviour I have to investigate

** **

-!- jpallen [\~jpallen@ariadne.provo.novell.com] has quit [used jmIrc]

**\<@knocte\> **

Window class is almost there, as we just need the events to be implemented. My new mono env is almost ready too. I've also spent some time in this iteration for creating the presentation to show at Guadec.

07:15

and, well, my plan is still not clear, maybe I'll just do refactoring of the bridge upon the info we got on the MS email

** **

-!- jpallen [\~jpallen@137.65.132.45] has joined \#mono-a11y

**\<@knocte\> **

and I'll finish the rest of things that are not complete in past iterations

07:16

now let's go with build guys

decriptor: you ready?

**\< mgorse\> **

Knocte: want me to go first? I haven't gone yet

**\<@knocte\> **

oohhh, sorry mgorse

**\<@decriptor\> **

knocte: yup

**\<@knocte\> **

yes, go ahead mike

**\< mgorse\> **

ok

07:17

**\<@knocte\> **

decriptor: wait a bit please :)

**\< mgorse\> **

Tested cspi registration and event passing some more.

Added action, editableText, hyperlink, hypertext, and table interfaces.

It now builds against gok for me, with a minor patch to gok to remove some \#includes.

I also set up a parallel Mono environment, with help from Sandy and others, and discovered that monodevelop from svn is inaccessible. Looks like I need to file a bug if one hasn't already been filed.

Next iteration I'm going to hopefully finish testing registration and event passing for now.

I'm also going to try to look at the test template developed by George Kraft's group at IBM, to see about testing cspi.

I'm unsure as to how much time I should take to create cspi tests, since the Open A11y group may seek a grant for someone to devise tests for the lsb.

done

**\<@knocte\> **

cool news mgorse

BTW, the MD issue seems strange to me, MD is visible for accerciser

07:18

(in my system)

**\< mgorse\> **

knocte: md from svn? Okay. I haven't tried with accerciser. Was trying with Orca. I'll see if Accerciser sees it

**\<@knocte\> **

ok

mgorse: where are you putting your code? any repository?

07:19

how do you coordinate with Mark?

**\< mgorse\> **

knocte: [git://git.codethink.co.uk/git/atspi-dbus](git://git.codethink.co.uk/git/atspi-dbus)

**\<@knocte\> **

oh, cool to know, thanks

**\< mgorse\> **

some of it is in the mgorse branch currently and not in master

**\<@knocte\> **

perfect, thanks for the info

now we'll let decriptor actually start :)

decriptor: \^\^

07:20

**\<@decriptor\> **

knocte: ok

ok I finally update the wiki page :) ok just barely

been working on getting autotools to work with our stuff, which seems to be mostly finished

07:21

huge thanks to sandy for helping on that

**\<@knocte\> **

perfect, maybe it's interesting for you to have a SVN account as well?

07:22

**\<@decriptor\> **

working on getting the rpms built now which I haven't completely figured out the best way to do that, but I'm hoping to have them very soon

knocte: :(

**\<@knocte\> **

ok, any bits you miss from the devs that could help on that?

**\<@decriptor\> **

knocte: I really really wish I did, but because of meetings and other things, my email I'm sure is at the bottom of the todo list

**\<@knocte\> **

I see

07:23

**\<@decriptor\> **

so hopefully this week or next, so far I've just been creating patches and sending them to sandy

**\<@knocte\> **

ok we'll talk after the meeting about all this

**\<@decriptor\> **

its more the 30 minute delay in syncing trunk that makes this take longer

07:24

so anyways,

**\* knocte **

nods

**\<@knocte\> **

ok, and any special plan apart from finishing the rpms?

**\<@decriptor\> **

plan is to get rpm soon and some sort of build system/methodology in place for building

**\<@knocte\> **

ok, you done?

07:25

**\<@decriptor\> **

I want to get that some what automated so that we can build on demand

done

**\<@knocte\> **

ok

let's go with Ray now

**\< Ray\> **

OK

**\<@knocte\> **

Ray: could you do build stuff first and then QA?

**\< Ray\> **

knocte: ok, this iteration, i didn't do much work on build stuff

07:26

**\<@knocte\> **

(just to keep us on subject ;) )

ok, just switch to QA then

**\< Ray\> **

and I'll spent some time in next iteration to handle UiaAtkBridge and UIAutomation te be package into rpms with decriptor

07:27

that's the building plan

as QA

I was continuing to implement the control test samples.

get the benifit from the practice in last iteration,

I'm more and more familiar with that, and have implemented 19 controls.

07:28

**\<@MarioC\> **

decriptor, you "broke" the next iteration table, you added a new column.

**\<@decriptor\> **

MarioC: :( sorry

**\< Ray\> **

all of them are very simple, i feeled a little worry about whether those samples could fulfill the need or not.

so i asked bgmerrell to have a look at them a bit in his spare time.

**\<@decriptor\> **

MarioC: my browser was small and didn't even notice that :(

**\< Ray\> **

in the up-coming iteration, i'll continue to implement the rest of them unless there is something interrupt

07:29

personally, I was starting to learn autotool for the preparation of future build work use.

over

**\<@knocte\> **

whatever methodology)

thanks Ray

**\< Ray\> **

knocte: :D

**\<@knocte\> **

ok, let's continue with QA then

07:30

Calen: you here?

**\< Calen\> **

yes

**\<@knocte\> **

can you go?

**\< Calen\> **

of course

after discuss with Brian, i have finished one strongwind test

07:31

**\< bgmerrell\> **

Hooray!

**\< Calen\> **

for treeview control(gtk) as practice to check the status when expand&contract the TableCell.

now i think i make sence what should and will be checked when we test a winforms control,thanks bgmerrell :) .

but i am also have some technology questions should ask Brian.

so in next iteration, i will discuss Brian for some technology problems and practice to test other controls.

BTW i have spent some time to update my laptop to openSUSE11 :)

07:32

Done

**\<@knocte\> **

cool

thanks Calen

bgmerrell: hi! you next?

**\< bgmerrell\> **

i think so!

07:33

**\< Calen\> **

 :)

**\< bgmerrell\> **

Last week I mostly spent upgrading all my work machines and dealing with bugs un

oh. nice.

Last week I mostly spent upgrading all my work machines and dealing with bugs unfortunately. This week I was able to upgrade our QA virtual machines to openSUSE11 and get the test environment setup and the tests running on them.

07:34

I also went over Strongwind testing with Calen and reviewed a little bit of Ray's code.

**\< Ray\> **

bgmerrell: GREAT! thanks :)

**\< bgmerrell\> **

This next iteration I play on consuming the packages decriptor is building assuming they are available. I also have a lot of tasks that involve documentation, HOWTOs for QA, updating the test plan, etc., that I would liek to get out of the way this iteration

And review Calen's Strongwind test and Ray's samples

07:35

of course :)

Last night I was chatting with Ray and Calen and my computer rebooted itself and now I can't get into X at all anymore--the screen just goes completely black and i can't do anything but ctrl+alt+del.

So that was weird and I'm sure I'll get to deal with that today.

done

07:36

**\<@knocte\> **

ok sounds good

did I miss anybody?

it doesn't seem so I'll upload the log to the wiki

