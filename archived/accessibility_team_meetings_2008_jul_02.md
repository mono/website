---
layout: obsolete
title: "Accessibility: Team Meetings 2008 Jul 02"
lastmodified: '2008-07-02'
permalink: /archived/Accessibility:_Team_Meetings_2008_Jul_02/
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Jul_02/
---

Accessibility: Team Meetings 2008 Jul 02
========================================

Meeting Log
-----------

**\<@calvin\> **

doctor is here, but doesn't look like it

07:00

**\< Ray\> **

calvin, i'll be Calen's representative, because she is going to the see doctor. and could not come back on time. but she send me her agenda, i'll post them here.

** **

-!- calvin changed the topic of \#mono-a11y to: --- Iteration 7 Planning Meeting - In progress ---

07:01

**\<@calvin\> **

ok, let's get started, everyone else can read the logs later and join as they come

**\* decriptor **

feels all along at the office

07:02

**\<@calvin\> **

I guess before we go through last iteration, does anyone have announcements we need to cover?

jpallen: anything?

knocte will be attending guadec this coming week and party the spanish guadec this week

07:03

**\< jpallen\> **

Neville is finished with school! :-)

**\<@sandy\> **

woo hoo!

**\< bgmerrell\> **

calvin: yeah, i'm here

**\<@calvin\> **

er... party? I meant partly

**\< Ray\> **

ngao, yes, congrats. guy

**\<@calvin\> **

ngao: awesome!

**\< ngao\> **

yes, i started working full-time from yesterday

07:04

thank you!

**\<@knocte\> **

cool ngao

**\<@calvin\> **

ok, I'll start working down the past iteration

Sandy, you always top the list, how about your report

**\<@sandy\> **

okay, I worked with decriptor to get the makefiles in a good state

07:05

there may still be some small cleanup to do, but I think they're fine for now (decriptor will correct me if I'm wrong)

then I took some unexpected FTO and didn't get my other tasks done

this iteration I'll work on finishing tests for my providers

I expect I may have to do some cleanup related to the changes MarioC has been making in our infrastructure

07:06

** **

-!- CIA-2 [\~CIA@208.69.182.149] has quit [Remote closed the connection]

**\* decriptor **

is very greatful for sandy's help :)

**\<@sandy\> **

if I finish early, I'll ask MarioC if there's a particular area he'd like me to work on

done

oh, one more thing

going to pester Miguel until I get that Olive patch committed

done

**\<@calvin\> **

ok, thanks... glad you are out of the hospital and I hope things are better for you now

07:07

**\<@sandy\> **

 :-)

**\<@calvin\> **

MarioC: go ahead

**\<@MarioC\> **

This time I worked updating the Providers to support the Fragment interface (to support navigation) instead of using the simple. ScrollBar is implemented, however more tests needed. ListBox and ComboBox were refactored, to use same base class and they are using the same ListItem.

** **

-!- jpallen [\~jpallen@ariadne.provo.novell.com] has quit [used jmIrc]

07:08

**\<@MarioC\> **

There's a preview of our Navigation implementation, however, I need to refactor it in order to update children according the StructureChanged event

** **

-!- jpallen [\~jpallen@137.65.133.128] has joined \#mono-a11y

**\<@MarioC\> **

I may need to change some providers to work without a WinformControl reference

07:09

Right now, ComboBox, ListBox, ScrollBar are working, and other Providers that doesn't have children are navigables

I'm planning to improve navigation and write more tests for next iteration.

07:10

done

**\<@calvin\> **

cool, hopefully we can now get the fragment support throughout the bridge done

07:11

For those that don't know, we (Novell) is a member of the AIA Accessibility Interoperability Alliance

07:12

sorry AIA = Accessibility Interoperability Alliance

That's the body that actually owns the UI Automation specification

It was created by Microsoft and has a number of members

well, anyway, they expanded their steering committee and held an election for the seats on the committee

07:13

you can find the nominated people here: [http://accessinteropalliance.org/](http://accessinteropalliance.org/)

Well, the election came to and yesterday, and although I was told it was a close race, I lost to Richard Schwerdtfeger

07:14

**\<@MarioC\> **

you are nominated.

**\<@sandy\> **

recount!

**\<@MarioC\> **

were then

**\< bgmerrell\> **

Mel Gibson was nominated?

**\<@calvin\> **

heh

**\<@sandy\> **

lol, bgmerrell

**\<@calvin\> **

bgmerrell: Doug Geoggray actually won too

**\< bgmerrell\> **

Women were voting, no doubt ;)

07:15

**\<@calvin\> **

I know both Doug and Rich and both work hard in this area of the industry (a11y)

Rich has a lot of influence over IAccessible2 at IBM and having him on the steering committee will go a long way to bring unity between the specifications

**\< mgorse\> **

Who is Richard Schwerdtfeger?

07:16

**\<@calvin\> **

well, unity in the long term

**\< mgorse\> **

ah ok

**\<@knocte\> **

that kind of effort sounds great

**\<@calvin\> **

Anyway, so I thought I would update everyone on that subject, I know some of you knew about it, but I thought I'd update everyone else here

I ended up having a very rough iteration... I got some work done on the List Control type but struggled to get the bridge code worked out

07:17

I'm hoping with the updates from MarioC that will go better now

The unfortunate thing in the schedule is I'll be out the rest of this week and all of the next week

07:18

We'll figure out something for next week's iteration meeting as knocte will also be out most of that time

I would like to see some thing happen though and for some reason I couldn't get them to happen

07:19

knocte, sandy, and MarioC: is there any reason why if we build everything right now and perform a make install, shouldn't we be able to run winforms code and have it be enabled with our code?

07:20

**\<@sandy\> **

that is correct

**\<@calvin\> **

well, not fully enabled, but at least show up?

**\<@sandy\> **

unless we did something wrong

**\<@knocte\> **

fully enabled for the controls that are already implemented afaik

**\<@calvin\> **

sandy: I cant' seem to make it happen

**\<@sandy\> **

I'll set up a VM

07:21

and look into it

**\<@calvin\> **

I was trying to get it working with decriptor yesterday

**\<@knocte\> **

or if we made a control just half of the work maybe we get NIE exceptions

**\<@sandy\> **

probably something small and simple

**\<@calvin\> **

sandy: well, shouldn't we be able to do it in our environment?

our parallel environment?

**\<@sandy\> **

I'm pretty sure it was working fine in my environment

anyway, I'll look into it :-)

**\<@MarioC\> **

I'm sitll running 10.3 and is working

**\<@decriptor\> **

sandy: here is the repo with the rpms [http://mono.ximian.com/monobuild/snapsho](http://mono.ximian.com/monobuild/snapsho) t/download-trunk/suse-110-i586/

07:22

or at least a link to the repo in that

**\<@sandy\> **

right

thanks

**\<@calvin\> **

sandy: ok, if you could look into that and work with decriptor, that's pretty critical for our testers to begin to run tests

and I've been blaming our lack of testability on decriptor long enough... it's no longer his fault

07:23

decriptor: you're blame free now!

**\* sandy **

is happy to take the blame

**\<@knocte\> **

well we're also depending on the olive patch right?

**\<@calvin\> **

heh

knocte: yeah, but that should make it into the build

**\<@decriptor\> **

calvin: woohoo!!!!

knocte: no

knocte: calvin well

07:24

all the patch does is add a pc file

**\<@sandy\> **

right, we actually made the makefiles work without the patch

**\<@calvin\> **

anyway, let's not try to solve the problem right here right now, I would just like some time dedicated to it this coming iteration

ok, knocte go ahead with your report

**\<@knocte\> **

ok

I will paste my status that I have just written some minutes ago (not yet updated the wiki, we'll do it asap):

07:25

Not had much time this iteration to hack, because I've been finishing my notes and ODP files for the Guadec talks (I can send you the presentations if you are curious).

Also finished stablishing my new mono parallel env and found some annoyances I had to debug&fix: 32bits/64bits issue about a shared object (posted in the mailing list) and TextImplementorHelper fixes needed because Mono SVN behaved differently.

Anyway I've started looking at the TextBoxProvider (ControlType: Edit, similar to Gtk.Entry widget) and already implemented some stubs and tests (not yet committed).

I've also noticed that the ComboBox widget has a mode where one of its children is a textbox, so this style will depend on this new class in the bridge to be implemented.

Pending things that I'll try to do in next iteration (in the free time I may have at Guadecs) is:

07:26

- To catch up with calvin about the parent/child problem (issue about using Simple/Fragment/FragmentRoot providers) because I've looked a bit into it and have some doubts (I guess we can figure this out better whenever we start to launch more structureChanged events because AFAIK we only launch them currently for the window(form) creation)

- To finish figuring out the best way to test events, and thus incorporate some in the unit tests (we will have to transform them in normal unit tests that don't do the at-spi roundtrip whenever we can test them properly)

- Debug a problem we have with the bridge tests as MD seems to lock and eat the memory (maybe I'm facing a Mono SVN unstability issue..., I've just experimented this, didn't have time to look into it) when I was going to test the new navigation support of ComboBoxProvider (thanks to MarioC!)

done

07:27

**\<@MarioC\> **

about the StructureChanged

is generated when Controls are added/removed from any container

**\<@calvin\> **

knocte: sounds like a busy week! I'd love to see the presentations, why don't you send them out to the team

**\<@MarioC\> **

s/is/is also

**\<@knocte\> **

ok, I'll send them to the mono-a11y mailing list

07:28

**\<@calvin\> **

good

ok, next in iteration 6 is bgmerrell, go ahead with your report

**\< bgmerrell\> **

Alright.

Most of the time was spent reviewing our Strongwind tests, fixing and suggests fixes to them, and learning more about Strongwind in general.

**\<@knocte\> **

(MarioC: yep, we can talk about it later)

07:29

** **

-!- bgm [\~bean@c-76-27-10-135.hsd1.ut.comcast.ne t] has joined \#mono-a11y

07:30

**\< bgm\> **

sorry, vpn connection died \_again\_

don't even know why i use it.

then i had several small tasks.. I updated some machines in my office, talked to WillieWalker about Orca testing, updated and added current information to the test plan (with new developments from the last month or so)...

07:31

I made sure our tests run on OS11, and submited a paper proposal for the UTOSC

07:32

this iteration hopefully we'll start testing against the more complete WinForms controls

I want to write a Strongwind HowTo and put it on our wiki and a blog

07:33

** **

-!- peteb [\~ptbrunet@user-0vvdbck.cable.mindspring .com] has joined \#mono-a11y

**\< bgm\> **

and write a simple Orca automated test.

done

**\<@calvin\> **

bgm at the UTOSC, woot! (UTOSC = Utah Open Source Conference)

**\* sandy **

missed the paper deadline

07:34

**\< bgm\> **

I heard i was submitted it on Sandy's behalf :D

**\<@calvin\> **

heh

**\< bgm\> **

s/was//

**\<@decriptor\> **

sandy: I might be able to sneak you in

**\<@calvin\> **

bgm.. on Tasque?

**\<@decriptor\> **

a11y

**\<@calvin\> **

ah, ok

**\<@sandy\> **

decriptor: no worries, I'll still come I think

**\< bgm\> **

calvin: Oh, I should have done one on Tasque too!

**\<@decriptor\> **

sandy: I think!?!?!?!

**\<@sandy\> **

heh

07:35

**\* decriptor **

will make sontek pick you up :P

**\<@calvin\> **

ok, Ray, you are going to do your report and Calen?

**\< Ray\> **

alright

calen:

i have finised strongwind test script for gtkButton. and discuss with Brian about how to let the test more flexible by use altF4 to close extra windows :) finally, we decided change messagedialog to dialog in application, because strongwind support altF4 for dialog but not for messagedialog.

in next itertion i will practice strongwind test script for some other controls(combobox,radiobutton,statusbar) against something gnome app which include such controls.

**\< bgm\> **

sandy: seriously though, we can split it in half, i just want to talk about our testing and automation efforts.

(sorry)

**\< Ray\> **

bgm, no worries, it's my turn, you are just in time. :)

07:36

me:

in this iteration, i seted up new opensuse on Thursday and spent nearly one day to wrestling with opensuse 11.0, i should apologize for it.

i have finished 7 samples which include 8 controls in this week, and might finish all of them in two iterations including polish them.

(it also depends on bgmerrell could have time to review my works)

so in the next iteration, i'll continue to implement the rest of controls. (57 done / 72 controls)

another important work is building stuff, i hope to pick up some time to work with decriptor to build UiaAtkBridge and UIAutomation.

07:37

and so on.

done

**\<@calvin\> **

ok, thanks Ray

Ray: I think we've all had our time "spent" on openSUSE 11

07:38

**\< Ray\> **

calvin, oh yeah. :)

**\< bgm\> **

Ray: I will review those sample applications today for sure. Sorry about the delays.

**\<@calvin\> **

mgorse: go ahead with your report

**\* decriptor **

still doesn't see anything wrong with opensuse11 :)

**\< mgorse\> **

ok

I've fixed several bugs with the dbus implementation of the atk adaptor, registry daemon, and cspi

and added a couple of the test programs from the cspi module into the git repository

07:39

I still need to tie up some loose ends with building it (installing a .pc, for instance), so I'll do that next

Oh, yeah. I tried the IBM atk tests and had some interesting results. I'm intending to blog about them

07:40

ie, my current design expects a glib-based main loop and for the idle function to be called, but that won't happen in a test, so I may need to rework some things

the atk adaptor currently defers sending an UpdateTree signal until glib becomes idle, but that might not be right for tests

07:41

anyway, I aught to figure out what to do about having more formal tests for cspi (although I'm not sure how much of this will be covered by a grant that the Open A11y group might write up)

and I'd like to understand the work that all of you have been doing--I feel like I don't right now--so let me know if anyone has any advice in particular

07:42

I might be moving and taking FTO Monday and at least part of tomorrow, but it depends how much of my large pieces of furniture I can get rid of tonight

done

**\<@calvin\> **

mgorse: how far out do you think things are before we might even attempt to run our bridge over DBUS?

07:43

**\< mgorse\> **

calvin: I'm guessing a couple of months, but I'm not sure. I need to talk to Mark about that. He has been working on pyatswpi, and I haven't, so I need to see where he is and if I can be helping with it. The code that he has isn't committed right now

07:44

**\<@calvin\> **

mmm, uncommitted code.... not good

**\< mgorse\> **

my cspi code is probably close to being ready to test, but it is really just gok that uses cspi. I'm not sure how that will work, since I'm not sure I'm able to test gok

**\<@knocte\> **

yeah I agree with calvin, specially if you're using git

07:45

**\< mgorse\> **

at least it isn't pushed

**\<@knocte\> **

oh ok

**\< mgorse\> **

but yeah, and I've been guilty of that before, too

**\<@calvin\> **

mgorse: ok, thanks

decriptor: go ahead with your report

07:46

**\<@decriptor\> **

ok

**\<@calvin\> **

decriptor: I thought you won some typing test?

07:47

sorry, I'll be quiet

**\< mgorse\> **

if only we all could think as fast as we can type

**\<@decriptor\> **

so this week the rpms were built/building... so I think the autotools stuff is more or less in place as well as the spec files. The spec files are now on the mono svn under release/packaging/rpm-defs

07:48

and the rpms are being built per svn update in the monobuild system [http://build.mono.lab.novell.com/](http://build.mono.lab.novell.com/) (internal only) and pushed out to the repository for os11 and sles10 I think

07:49

[http://mono.ximian.com/monobuild/snapsho](http://mono.ximian.com/monobuild/snapsho) t/download-trunk/

on that site there is a link for all mono svn stuff (I think its updated hourly) for anyone that wants very bleeding edge.

the rpms up there should work for redhat/fedora for right now

07:50

so for next week,

or iteration, I want to make sure all of the rpm stuff is work properly (hopefully working on machines :) ) and start digging into some deb packaging stuff

07:51

maybe some work on monobuild itself. Possibly also ironpython???

done

**\<@calvin\> **

decriptor: nice job, you and Ray deserve a big thanks for the push on that

**\<@decriptor\> **

thanks :)

07:52

calvin: and sandy!

**\< Ray\> **

thanks calvin

**\< bgm\> **

\*golf clap\*

**\* decriptor **

wonders if he gets an ice cream now :P

**\<@calvin\> **

ok, ngao, go ahead with your report

**\< ngao\> **

ok

in this iteration, I tried to set up parallel mono environment, but met many troubles. It still doesn't work now.

07:53

and i added IGridPattern test for StatusBarProvider.

As Marioc told me that CheckedListBox doesn't need to be implemented, I will update StatusBar to the changes navigation in the next iteration, and get parallel mono environment up. i will start another control provider if there is more time.

done

**\<@calvin\> **

ok, thanks, and welcome to full time work!

07:54

**\< ngao\> **

thanks!

**\<@calvin\> **

ngao: for iteration 7 and all future iterations, can you move your entries on the Wiki to be up with Sandy and Mario

It's strange to have you down at the bottom when you are working on the winforms providers with them

07:55

**\< ngao\> **

calvin: ok, i will

**\<@calvin\> **

good

thanks

**\* suseROCKs **

spots sandy

**\<@calvin\> **

ok, I don't have anything else for the meeting, does anyone else? jpallen any final thoughts?

07:56

**\< jpallen\> **

good work everyone

in the short term, we will be doing some work on the project plan

we need to have a better idea of where we're at in terms of meeting our date

07:57

i will have more info for you on this subject in the next few weeks

in the meantime, i need everyone to remain focused on working things through to completion

07:58

the team is doing a great job!

**\< mgorse\> **

I could possibly help with some of the mwf stuff, at least part-time, depending on what is needed, but I'd need to come up to speed on what's there

**\< jpallen\> **

it's great to have ngao on board fulltime and i look forward to his contributions on a full-time basis

i'm also glad to see sandy back in action :)

07:59

**\< mgorse\> **

yeah. Congrats, ngao

**\< jpallen\> **

i am still doing some hiring

**\< ngao\> **

thanks, i will do my best

**\<@calvin\> **

mgorse: you might be more valuable working in the bridge since you help us out there now whenever we're stuck on ATK problems

**\< jpallen\> **

doctor have anyone they could recommend for joining the beijing team?

08:00

we still have 2 dev slots to fill there

**\< mgorse\> **

calvin: oh, right--there's that part, too

**\< jpallen\> **

let me know if you have anyone you could recommend

**\< Ray\> **

jpallen, sure, we will post the positions for hunting people

**\< jpallen\> **

i need to jump on another meeting now. talk to you later!

**\< ngao\> **

jpallen: ok

**\<@calvin\> **

ok, thanks everyone

08:01

