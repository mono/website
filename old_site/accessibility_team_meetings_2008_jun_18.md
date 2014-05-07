---
layout: obsolete
title: "Accessibility: Team Meetings 2008 Jun 18"
permalink: /old_site/Accessibility:_Team_Meetings_2008_Jun_18/
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Jun_18/
---

Accessibility: Team Meetings 2008 Jun 18
========================================

Meeting Log
-----------

**\<@calvin\> **

T minus 1 minute

06:59

** **

-!- mgorse [\~mgorse@130.57.22.201] has joined \#mono-a11y

07:00

-!- mode/\#mono-a11y [+o mgorse] by sandy

**\<@calvin\> **

alrighty, let's get started

same plan as normal, but before we get started, does anyone have anything that needs to be brought up?

07:01

I guess not, I'll ask again at the end of the review, so bring it up then if you do

07:02

Let's work down through iteration five in the order that people are listed

sandy: that puts you first

**\<@sandy\> **

okay

well, I ended up making very little progress on my planned tasks

instead I did other things :-)

07:03

I spent a lot of time with the winforms guys getting our patch accepted into the mcs project

so that's done

I set up a parallel mono environment and changed our MD solutions/projects to have all GAC references

so anybody builing the Uia2Atk stuff is going to need to have parallel mono set up

07:04

which I guess I'll talk about later

Also, I am working on changes to how our assemblies in Olive are deployed, based on a conversation I had with miguel the other day

finally, I've been working on makefiles to help decriptor et al get started on packages

UIAutomationWinforms has makefiles that I think are in good shape, with good integration to the MD projects

07:05

however, I had to turn off reference synchronization, so if you're working in that project and need to modify references, you'll have to do it in the MD project and also in the makefiles (bummer, but it's due to a known MD bug)

I still need to finish the makefiles

next iteration...

I plan to get all of this infrastructure stuff done and also finish the testing and new providers I was supposed to do this iteration

07:06

I'm not adding any new tasks, just carrying everything over that I didn't finish

done

**\<@calvin\> **

sandy: great, I'll have you cover the parallel mono and our assembly deployment after we go through all of the status

MarioC: go

07:07

**\<@MarioC\> **

ok.

In this iteration I decided to start implementing ComboBox provider, so, basically this implementation took the three different patterns used with this provider

this involved changes in our winforms architecture to support items in Root controls

07:08

anyway, the implementation is almost finished, I need to test MS behavior with our implementation and write a lot of tests.

TextBox provider isn't yet finished. I'm missing the Scroll pattern.

07:09

now, next iteration

Finish Combobox, Finish TexBbox and write a wiki-page about the winforms-architecture implementation.

07:10

s/TexBbox/TextBox

done

**\<@calvin\> **

MarioC: sounds good, and I still have an outstanding issue with Microsoft about building and maintaining our hierarchy, but my main contact is out of the office

07:11

Hopefully I can get a response on that soon

ok, i'm up

I was on FTO last week and had a lot of catch up to do earlier this week so I didn't make much progress on the List control

07:12

I plan on carrying that over for this next iteration and really hound Microsoft to get some answers with the UIA spec and how they've implemented their stuff

done

knocte: go

**\<@knocte\> **

ok

07:13

I've finished tests on the combobox and created gail tests for radio button which pass there but still not pass in the bridge because I have the implementation in progress,

but it seems to be easier thanks to the class hierarchy rearchitecture I recently committed about this (checkbox and radiobutton inherit from an abstract class togglebutton that inherits from non-abstract class button, which is a hierarchy a very similar structure as gail)

07:14

(BTW I also rearchitected the class hierarchy on inheritance of the Component interface in order not to implement it in the toplevel item and to make all items implement it correctly; thanks also to sandy, we can now see the region coordinates of each widget when clicking on them on accerciser)

07:15

**\<@calvin\> **

nice! I saw that

**\<@knocte\> **

I got stuck also on the combobox implementation because I had doubts about how to query the children but MarioC told me recently that it was now possible in the provider so I guess implementing it now will be really straightforward

I also came out with an idea for unit-testing the events (which seem to be a field we haven't almost explored in the bridge, even in past iterations), so bgmerrell has helped providing me with a python app which monitors AT-SPI events received on a particular AT-enabled program

07:16

so what I plan for the next iteration is:

a) Finish implementation of ComboBox and RadioButton, making tests pass

b) Start looking at how to integrate the brian's atspimon.py (and maybe tweak it a bit to show the output in a certain way)

07:17

c) Set up my parallel mono env

and

d) start looking at the next item in my iteration: spinner, to do tests and implementation (although maybe I'm replacing it with the Window class, as it's already started and maybe this way I can finish all things I've planned for this iteration)

07:18

done

(sorry, maybe I was too long) :)

**\<@calvin\> **

knocte: do you think the only way we'll be able to unit test the events is all the way through at-spi?

07:19

**\<@knocte\> **

calvin: I'm not sure, but I haven't come out with any other idea, as the events are implemented in the backend as signals

** **

-!- jpallen [\~jpallen@ariadne.provo.novell.com] has quit [used jmIrc]

**\<@knocte\> **

maybe I can come out with a signal catcher in C\# from the ATK side, I didn't think about that

**\<@calvin\> **

this might be subject we can discuss after the meeting, but I'd like to see us not involve at-spi.. it just feels like it's outside the scope of a unit test

**\<@knocte\> **

ok

07:20

**\<@calvin\> **

knocte: thanks, and no, that was not too long

ok, bgmerrell: go

** **

-!- jpallen [\~jpallen@137.65.132.2] has joined \#mono-a11y

**\<@bgmerrell\> **

This iteration: I spent most of my time working on the test harness. Most of the work was related to creating useful logs and cleaning up tests.

07:21

I also reviewed some style guidelines that Calen created for us, then changed some code and files around to match those guidelines.

Then I spent yesterday writing the app that monitors and logs atspi events

Next iteration: I think will mostly be spent learning more about Strongwind with Calen.

07:22

I do have some other tasks if I get time: looking into orca tests (which keeps getting pushed as we're working on the Strongwind stuff more right now), writing more documentation for testers, updating the non-opensuse vms that i've been neglecting, and updating the test plan to reflect the new stuff we've done

done

07:23

**\<@calvin\> **

bgmerrell: have you started to look at any of the packaging? rolling anything out, or is the stuff still not quite there for you to use?

**\<@bgmerrell\> **

calvin: afaik it's not ready yet

07:24

decriptor is keeping me well informed though

**\<@calvin\> **

ok

Ray: go

**\<@Ray\> **

ok

last iteration, I was starting to learn IronPython,

it consumes me a few days,

07:25

till now, I have implemented three samples (form, fontdialog, progressbar) for cutting my teeth.

and commit them into uia2atk/test/samples/

I'm not sure if someone could review my QA works.

decriptor has created an account on OBS for us to build our stuff.

07:26

so we could talk about more on that.

in the next iteration, I'll continue to implement the control samples.

done. :)

**\<@calvin\> **

Ray: sounds good, is there no current build/packaging work to be done in the next iteration?

07:27

**\<@Ray\> **

not sure, the one thing I want to ask,

shall we upgrade the main 3 distros have upgraded already, do we need to upgrade these 3 platforms we based on? Fedora 8 to 9, openSUSE 10.3 to 11.0, Ubuntu 7.10 to 8.04 ?

**\<@calvin\> **

Yes, we'll need to do that, but I would wait until they are released

07:28

**\<@decriptor\> **

calvin: wait a couple hours and I think they'll all be released :P

**\<@calvin\> **

We don't need to switch to any beta or pre-releases

heh

**\<@Ray\> **

ok, sure

done

07:29

**\<@decriptor\> **

and depending on how you look at it they are all in reality released (mostly meaning 11)

**\<@calvin\> **

ngao: hmm, I don't see you listed in the iteration at all

**\<@Ray\> **

decriptor: yep :)

07:30

**\<@ngao\> **

calvin: actually i'm in front of Ray :)

**\<@bgmerrell\> **

Ray: fyi, the Ubuntu and Fedora test VMs in the lab have been updated

**\<@calvin\> **

ngao: Are you looking at Iteration 5? I don't see you in there

**\<@Ray\> **

bgmerrell: thank you very much for your big efforts. :)

**\<@bgmerrell\> **

Ray: i will probably update openSUSE this iteration

**\<@calvin\> **

ngao: oh, sorry, I'm looking at the current iteration

07:31

ngao: ok, I found you... why don't you go now

**\<@ngao\> **

ok

I determined the value of IDs, ran nunit on Vista in the last iteration

07:32

i've finished GridPatternIdentifiers

and Test

i need to finish StatusBar Test

07:33

and start to implement CheckedListBox

done

**\<@calvin\> **

ngao: nice, so CheckedListBox is planned for this iteration?

**\<@ngao\> **

yes

07:34

**\<@calvin\> **

alright!

ok, mgorse, sorry, it looks like I skipped you too, let's have you go now

**\<@MarioC\> **

ngao, don't forget to revamp your classes to our latest changes in the winforms-implementation

**\<@mgorse\> **

ok

I've been testing and debugging my cspi work

It now passes events on (although I'm not sure about keyboard/mouse events)

and it can find an app through the registry and load in a tree of objects from it

Next iteration I'm going to continue testing/debugging and work on the hypertext, editableText, and table interfaces

done

**\<@calvin\> **

mgorse: very nice indeed!

07:35

Calen: go

**\< Calen\> **

okay, turn me

i have finished "test coding standard" wiki page.

have updated winforms application samples base on coding standard and also have updated Test\_Plan\_WinForms\_Controls wiki page.

i have been writing and learning a Strongwind test against gtk application(treeview control) as practice. it can be run but still have some problems & questions should be solved by discuss with Brian.

07:36

so i will have worked with Brian to discuss some details about Strongwind test tomorrow.

and i will continue to practice strongwind test against gtk application

done

**\<@calvin\> **

Calen: thanks

decriptor: ok, now I'm pretty sure I don't see you on the iteration, am I just not seeing it again?

07:37

**\<@decriptor\> **

nope not there yet

I'll try and make sure I'm on the iteration list for this next round

**\<@calvin\> **

decriptor: ok, you want to cover what you did and have planned?

**\<@decriptor\> **

OBS link: \<A HREF="[https://build.opensuse.org/project/show?project=home%3Auia2atk](https://build.opensuse.org/project/show?project=home%3Auia2atk)"\>[https://build.opensuse.org/project/show](https://build.opensuse.org/project/show)? project=home%3Auia2atk\</A\>

07:38

I created that 'user' on OBS for joint build stuff, so if anyone needs access let me know (all built stuff should show up on the software.opensuse.com/search page

some of it is still broken, so... working on that

07:39

I've been talking on and off with the mono build guys and looking at monobuild to see if we want to use their system as well. They have some test stuff built into their build system

07:40

someone just gave me a suse packagers manual, so I'm making my way through that as well.

for this next time around, hoping to be able to have UIAutomationWinforms and UiaAtkBridge building

07:41

I'm also hoping to have a script in place to automate this stuff.... Work with ray and packaging for different distros namely deb based stuff

07:42

done

**\<@calvin\> **

That sounds really good, hopefull we can start using the builds to roll things out to the test machines

ok, did I skip or miss anyone?

**\<@decriptor\> **

calvin: hopefully

once the uia stuff is in a buildable state, that shouldn't be too hard

07:43

**\<@calvin\> **

sandy: do you want to briefly cover the parallel mono environment stuff and then the plan for how the assemblies are going to be deployed?

**\<@sandy\> **

sure thing

okay, so I've updated this wiki page: \<A HREF="[http://mono-project.com/Accessibility]({{site.github.url}}/Accessibility)"\>[http://mono-project.com/Accessibility]({{site.github.url}}/Accessibility)\</A\>:\_B uildingProviderSide

I plan to keep instructions there

Basically, anybody who is actually going to build our code needs to have some mono stuff from svn installed

07:44

and the safest way to do that is by installing Mono into a completely separate area, and having a completely different environment that you run whenever you want to use that mono installation

the instructions for doing that are here: \<A HREF="[http://mono-project.com/index.php?title=Parallel\_Mono\_Environments.&action=edit]({{site.github.url}}/index.php?title=Parallel_Mono_Environments.&action=edit)"\>[http://mono-project.com/index.php?title=]({{site.github.url}}/index.php?title=) Parallel\_Mono\_Environments.&action=edit\</A\>

07:45

whoops

anyway, I'll fix that link later

**\<@knocte\> **

heh

07:46

**\<@sandy\> **

once we have packages for the UIA stuff, Olive, and Winforms, people will be able to run our stuff using those packages instead of building it all in a parallel enviornment

but developers will probably want to keep doing everything in the parallel env

**\<@knocte\> **

I wonder if it would be possible to have a parallel env in which you could use our uia stuff, the bleeding edge gtk-sharp,... but \*current stable\* mono rpms

maybe using symlinks?

07:47

**\<@sandy\> **

knocte: could be

I don't know

**\* decriptor **

its fixed

**\<@sandy\> **

setting up a complete parallel mono environment only takes about 30 minutes

plus time spent reading instructions

if you have any questions, I'd be happy to help out

**\<@knocte\> **

that would make things become easier (for example, solving the issue about MD and MonoAddins)

**\<@MarioC\> **

knocte, you can... you don't need to install mono/mcs, only your development releases

07:48

**\<@sandy\> **

the only problem is that we \*do\* need System.Windows.Forms

**\<@knocte\> **

MarioC: how?

**\<@sandy\> **

and the easiest way to do that is to install mono/mcs

**\<@knocte\> **

sandy: oh, that's right! but maybe we can build only MWF separately?

**\<@MarioC\> **

knocte, it's the same... skip installing mono/mcs, that's all

**\<@knocte\> **

but as sandy mentions, MWF depends on mcs, and mcs depends on mono, so...

07:49

**\<@sandy\> **

knocte, MarioC, everyone: No matter what, we MUST install and run MonoDevelop from the parallel environment

this is based on the recommendation of the MD developers

**\<@MarioC\> **

in our case we "need to" install because of UIA

**\<@sandy\> **

so we're not going to have a very minimal install anyway

**\<@MarioC\> **

and we are using latest MD that "needs" latest mono

so... as sandy says, we need mono/mcs anyway

07:50

**\<@knocte\> **

sandy: oh yeah you're right, unless we could tweak it to launch things under the other mono env

ok

**\<@sandy\> **

it won't be long before we have a tarball release containing the new SWF, anyway

07:51

so people will be able to install mono/mcs from a stable tarball instead of from SVN

**\<@decriptor\> **

SWF?

**\<@sandy\> **

Winforms

**\<@calvin\> **

sandy: what about the assembly details? (something miguel recommened?)

**\<@sandy\> **

calvin: well, that's nothing that really needs to concern everyone, but I'll explain

07:52

**\<@Ray\> **

decriptor: SWF == System.Windows.Forms  :)

**\<@sandy\> **

Miguel wants the UIAutomation\* assemblies from Olive installed separately from the 3.0 assemblies in Olive

before, we would install Olive, and our stuff would show up in the GAC, with symlinks in \$prefix/lib/mono/3.0

07:53

with my proposed patch, when we install Olive, our UIAutomation\* assemblies will still get installed into the GAC, with symlinks in \$prefix/lib/mono/a11y, and a mono-uia.pc file will be installed that references UIAutomation\* and WindowsBase, allowing people to compile with -pkg:mono-uia (and also allowing our assemblies to show up in MD's references dialog)

07:54

calvin: the thing I'm a little confused about is how this Olive stuff should get packaged, though

clearly we can package our UIAutomation\* stuff in Olive separately

07:55

but it would depend on WindowsBase

I'm just not sure what this is supposed to look like from a packaging standpoint

but I guess that's not really my problem :-)

**\<@decriptor\> **

:P

ray and I were talking a little bit about that last night

07:56

**\<@calvin\> **

heh, perhaps I'll walk over and have a discussion with Miguel about this

**\<@Ray\> **

sure

**\<@decriptor\> **

calvin: I'd walk over myself, but well that might take too long :P

**\<@calvin\> **

I'm guessing the reason he wants us packaged outside of Olive is due to the fact we're very Linux specific, and Olive will go on many platforms including windows

**\< jpallen\> **

so, before we adjourn, i have a question: when are we going to have some completed controls that we can start testing? :)

**\<@sandy\> **

calvin: there are allowances for such things in the makefiles, though

07:57

**\<@knocte\> **

jpallen: I think they could be tested already if QA devs set up their mono env as well

07:58

**\<@calvin\> **

jpallen: I think the issue we are waiting for on testing is the packaging and rollout... the tests should just fail on part of the controls aren't there

**\< jpallen\> **

ah

07:59

so we're waiting on decriptor? ;-)

**\<@decriptor\> **

:(

**\<@calvin\> **

jpallen: we have a number of issues that still need to be corrected to get 100% complete controls (in the bridge, the hierarchy, and other issues we discussed above)

yep, it's all on decriptor

heh

**\<@decriptor\> **

no pressure :)

**\<@calvin\> **

jpallen: I think the changes we've been making in the build system (that sandy discussed) will help with that

08:00

**\< jpallen\> **

ok. so can we be ready by the end of this next iteration?

**\<@calvin\> **

decriptor: can you be sure to put in Iteration 5 and 6 your plans and when you think that stuff will be ready to roll?

**\<@decriptor\> **

sure can

08:01

**\<@calvin\> **

decriptor: and as jpallen suggested, the end of this iteration would be best! :)

**\<@sandy\> **

I guess I'll prioritize the makefile stuff again

and put pressure on the olive guys to review and accept my changes

**\<@bgmerrell\> **

the problem with tests just failing on parts of controls that are not there is that in many cases the expected results of some action depend on the previous action succeeding.

Strongwind, by default, just bails as soon as one action fails.

08:02

**\<@decriptor\> **

let me know about the olive stuff

**\<@calvin\> **

bgmerrell: true, but at least we can start getting some test results

bgmerrell: even if they are all FAILED

**\<@sandy\> **

the sooner we see failing tests the sooner we can fix them :-)

fix our stuff, I mean

**\<@calvin\> **

sandy: oh, you didn't mean rig the tests?

08:03

**\<@sandy\> **

:-P

**\<@calvin\> **

heh

ok, I think that wraps this up

**\<@sandy\> **

Assert.Pass

**\<@calvin\> **

please go into Iteration 5 and get your stuff updated

Thanks everyone

**\<@sandy\> **

thanks cap'n

08:04

**\<@MarioC\> **

sandy, can I takeover the ListBox provider?

**\<@bgmerrell\> **

Well, what i'm saying is that if i have some app and checking a checkbox fails, Strongwind justs throws a stack trace and goes on to the next test

**\<@sandy\> **

MarioC: that would be great, if you have time

especially since ngao plans on doing CheckedListBox

**\<@MarioC\> **

sandy, I need to... because ComboBox uses it...

**\<@sandy\> **

MarioC: oh, sorry! :-/

08:05

I didn't realize I was blocking you

**\* sandy **

begins shame spiral

**\<@calvin\> **

bgmerrell: I understand, but when it throws a stack trace, that is reported as a failure right?

**\<@bgmerrell\> **

calvin: right, but a failure for the whole test, not just that action.

**\<@MarioC\> **

sandy, Ok, I'll update the schedule.

**\<@calvin\> **

bgmerrell: well, I'm not sure I understand, if this is going to be a problem, isn't it always going to be a problem, even when we think we have things done all the way?

08:06

**\<@MarioC\> **

done

**\<@bgmerrell\> **

calvin: well, i think it's the best way to do things. but if we're trying to test components we know aren't implmented completely i just don't think we'll get very far into the test, but i guess that's fine for now

08:08

**\<@calvin\> **

bgmerrell: I think for most cases, you'll find that the controls will check fine, but you may not get the events you expected or something like that... for the most part, the actions and such will work, that's the easy part

08:09

** **

-!- Ray is now known as Ray|brb

08:11

**\<@calvin\> **

bgmerrell: another example, you might have a menu.. the menu works, but if you remove the menu or try to dock it somewhere, that won't quite work (although I'm not sure we have menu done at all)

but what I'm saying is the fringe cases are the things you'll find aren't quite working, that's why the controls are not 100% done

**\<@bgmerrell\> **

calvin: well, i just remember trying to test the click action for the button control manually and was having pretty rough time testing a single action. maybe something has changed since then.

08:12

**\<@calvin\> **

bgmerrell: I think the problem there was the environment... but we'll never know until those tests begin to be executed

08:13

