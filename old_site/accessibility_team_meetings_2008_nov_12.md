---
layout: obsolete
title: "Accessibility: Team Meetings 2008 Nov 12"
lastmodified: '2008-11-13'
permalink: /old_site/Accessibility:_Team_Meetings_2008_Nov_12/
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Nov_12/
---

Accessibility: Team Meetings 2008 Nov 12
========================================

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
hey folks, welcome to the iteration meeting
```

07:01

``` nowiki
Today we'll start out our iteration meeting talking a bit about how we did last iteration.
```

07:02

``` nowiki
I'm not going to sugar coat this -- it didn't go so well.
```

``` nowiki
We started out with 202 hours of work, during the middle, we went up to 238 at the peak, and we've closed the iteration with a little over 140 hours.
```

``` nowiki
Basically, we were only able to work about 90 hours collectively when we should have been able to work about 280 hours.
```

``` nowiki
Now, I'm not saying that people haven't been working a full 8 hour day, but I need to understand what everyone was working on that wasn't part of the iteration.
```

``` nowiki
So if the developers could spend a few minutes and summarize in an email to me what they were working on that wasn't part of the iteration, that would be great.
```

07:03

``` nowiki
That being said, our estimates are about right on on average
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
brad: did the code migration have a big impact on time?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
decriptor: definitely, and I understand that
```

``` nowiki
but if there's anything that affected this sprint, I'd like to know about it
```

``` nowiki
(and that 280 hours includes everyone's FTO)
```

07:04

``` nowiki
any questions about this last iteration before I move on?
```

``` nowiki
okay
```

``` nowiki
so this next iteration is the last one before our 0.9 release
```

07:05

``` nowiki
it's a short iteration, only 1 week
```

``` nowiki
and we have a lot of work that remains
```

``` nowiki
especially in the Bridge
```

``` nowiki
so if we run dry of provider work, the provider folks will probably have to help out mike and andres
```

``` nowiki
personally, I'll be taking only bridge work this iteration to assist with this
```

``` nowiki
for this next release, the milestones that have been communicated are as follows:
```

07:06

``` nowiki
dev feature complete on november 19th
```

``` nowiki
then we will hand off everything to stephen
```

``` nowiki
who will tag, and get our RPMs ready in obs
```

``` nowiki
the build should hopefully be complete by the 21st
```

``` nowiki
and we'll release the next Monday on the 24th
```

07:07

``` nowiki
now you'll notice I've omitted the QA period I had talked about before
```

``` nowiki
the reason is that we have very few bugs that the developers can work on during this week if they're not working on features
```

``` nowiki
so instead, we're going to prioritize bugs that come in with a P1 or P2 priority
```

07:08

``` nowiki
so if you're a developer and working on an enhancement and a bug comes in with a P1 or P2
```

``` nowiki
please wrap up what you were working on, and work on the bug
```

``` nowiki
this will hopefully assist QA in their test development
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
brad: so we should knock out existing P1s and P2s before even starting enhancement bugs?
```

07:09

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
completing all the work is not going to be easy, so everyone needs to pitch in to make it happen
```

``` nowiki
sandy: yes, definitely
```

****

``` nowiki
* sandy&nbsp;
```

``` nowiki
notices there are a few
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
any questions so far?
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
we should estimate those bugs before assigning, right?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sure, estimating is always important :)
```

07:10

``` nowiki
for the bugs, it helps us become better estimators
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
and the ones that come during the iteration?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
yes, everything you work on should be estimated if possible
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
ok
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
anything else?
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
the problem is that not everybody is watching the generic email for bugs
```

07:11

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: good point
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
and hence don't notice new bugs
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
if QA could send an email to mono-a11y when they find a new high priority bug, that would be great
```

****

``` nowiki
&lt;@bgm&gt;&nbsp;
```

``` nowiki
hrm.
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
I'll make some tinyurls of good queries and put them in /topic ?
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
on the page I've worked on in berserk, I'll also add some numbers about unassigned/unestimated bugs
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: cool
```

07:12

``` nowiki
bgm: ideas?
```

``` nowiki
we can talk about this after the meeting
```

``` nowiki
the last thing I wanted to mention is that I've added a new feature to berserk
```

``` nowiki
some of you might have seen it already
```

``` nowiki
basically, this last iteration, we still had issues with people marking their hours daily
```

07:13

``` nowiki
so I've added a daemon to berserk that will send you a polite reminder every night
```

``` nowiki
if the hours on the bugs you have assigned haven't changed that day
```

****

``` nowiki
&lt;@bgm&gt;&nbsp;
```

``` nowiki
brad: i thought developers should be monitoring mono-a11y-qa for new bugs that aren't your guys' enhancements
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
bgm: we haven't been... let's chat about this a little later then
```

****

``` nowiki
&lt;@bgm&gt;&nbsp;
```

``` nowiki
because i see no reason that QA should need to log a bug and then e-mail the bug
```

07:14

``` nowiki
seems uberedundant.
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
bgm: fair enough.  maybe I can watch new bugs as they come in, and make sure someone is on it
```

``` nowiki
great, that's all I had to talk about
```

07:15

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
bgm: The QA bugs have been going to mono-a11y-bugs, so I'm not sure why we also need to watch mono-a11y-qa.  Am I missing something?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
So if the developers could each spend some time and assign themselves issues out of the 0.9 release, that would be awesome
```

****

``` nowiki
&lt;@bgm&gt;&nbsp;
```

``` nowiki
mgorse: the QA contact for the bugs we log is mono-a11y-qa, so that list should only get new bugs that QA logs
```

07:16

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
now?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
make sure to add them to Berserk, and also make sure to have near 100% load if possible
```

``` nowiki
sandy: please
```

``` nowiki
bgm: mono-a11y-qa is the qa contact for all bugs though
```

``` nowiki
bgm: so wouldn't it get bug mail for *every* bug we log, and everything we change?
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
brad: Do you have any suggestions as to how many hours to file?  I went through and figured out what bugs I was thinking of assigning to myself, but it gave me 63 hours.  But I was assuming that it would just be Andres and I who would be working on the bridge, so maybe I should remove some of them
```

07:17

****

``` nowiki
&lt;@bgm&gt;&nbsp;
```

``` nowiki
mono-a11y-bugs the QA contact when you guys create an enhancement?  (https://bugzilla.novell.com/show_bug.cg i?id=428475)
```

``` nowiki
just a random bug i grabbed.
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
bgm: well, there are only 5 days in the next iteration, so you shouldn't assign more than 30ish
```

****

``` nowiki
&lt;@bgm&gt;&nbsp;
```

``` nowiki
mgorse: ^
```

07:18

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
bgm: mono-a11y-qa is the qa contact for all the bugs, I thought
```

``` nowiki
oh, it's not
```

07:19

``` nowiki
weird
```

****

``` nowiki
&lt;@bgm&gt;&nbsp;
```

``` nowiki
that is how i thought we were differentiating between enhancements (spam to QA) and "real" bugs
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ah, I guess that makes sense... but I don't think it was intentional... :)
```

****

``` nowiki
&lt;@bgm&gt;&nbsp;
```

``` nowiki
:P
```

07:20

``` nowiki
i guess i just assumed when that's how things ended up
```

07:21

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
ngao: do you want to grab the remaining 0.9 provider bugs? RadioButton and ScrollBar?
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- jpallen [~jpallen@ariadne.provo.novell.com] has joined #mono-a11y
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
hey jared
```

07:22

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
brad, mario, ngao: I am using this query to find open 0.9 provider bugs: http://tinyurl.com/56ehx9
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
sandy: aren't they already done?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sandy: perfect
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
ngao: missing client tests, I guess.
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
guys, gonna restart berserk real quick
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
ngao: for some reason there are open bugs, so somebody needs to look at them :-)
```

``` nowiki
I grabbed webbrowser
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ok, it's back
```

07:23

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
mario: sandy: ok, i'll take them
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: what bridge tasks can I take?
```

07:24

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
http://tinyurl.com/4cpvsl
```

07:25

``` nowiki
that's open bridge bugs in the 0.9 release
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
wow
```

07:26

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
NumericUpDown
```

``` nowiki
VScrollbar (mm, but that may depend on Scrollbar)
```

07:27

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
brad: so I'm at ~20 hours, should I add bridge work now?
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
knocte: brad: I just took 428574, but I could take something else instead if that makes things easier
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
can I take Scrollbar (bridge)?
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
or look at P1/P2 bugs first?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sandy: yeah
```

``` nowiki
sandy: we'll have to integrate bugs into our sprint
```

``` nowiki
sandy: so load up
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
and RichTextBox will definitely depend on unfinished TextBox
```

07:28

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
knocte: are you going to work in combobox? I can take it.
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
combobox is almost finished
```

``` nowiki
let me take it
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
mgorse: go ahead and take that one
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
ScrollBar and its descendants should basically be done; I don't remember if there was a reason I hadn't marked them fixed
```

07:29

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
ok, I will wait for the missing bugs, let me know when everyone is finished.
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
Oh, right--there's the AtkAction stuff
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
calen, ray: feel free to leave if you'd like, unless you have any questions for folks
```

``` nowiki
ngao: and feel free to leave once you've assigend your work
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
brad, ok for me
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
brad: np
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
brad: ok
```

07:30

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
gnite folks!
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
brad, will we need to report the plans of next two weeks
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
bgm, ping
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ray: no, I think your scrum reports cover that pretty well
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
knocte: do you still want https://bugzilla.novell.com/show_bug.cgi ?id=436145 ?
```

``` nowiki
or should I grab it?
```

****

``` nowiki
&lt;@bgm&gt;&nbsp;
```

``` nowiki
calen: pong
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: what about ToolStrip*?
```

07:31

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
bgm: can you running form_basic_ops.py pass?
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
brad: leave for me anything about ToolStripMenuItem or ComboBox related
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
mgorse: I can work in Scrollbar if you are not going to.
```

****

``` nowiki
&lt;@bgm&gt;&nbsp;
```

``` nowiki
calen: let me look!
```

07:32

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: ok, maybe you could come up with a list of things that you and mike haven't claimed for us
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
brad: besides, I think 436145 should be fixed now because of a recent refactoring
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
bgm, it fails to assert the extra wondows has been closed by using altF4()
```

``` nowiki
bgm: it looks like a bug, but I am not sure very much.
```

07:33

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
yeah, take in account that in last iteration we had to assign all *Begin bugs so they seem to be no unclaimed bugs, or unclaimed bugs that depend on unfinished Begin* bugs
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
mario: I haven't assigned anything from it to myself.  I'm not sure what, if anything, still needs doing
```

07:34

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: since you have more intimite knowledge, would you mind preparing that list?
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
brad: take 428530
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: ok, thanks
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
ok, I'll do that list
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
knocte: are there bridge bugs I could take?
```

07:36

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
once knocte has that list, we should be able to work off of it
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
bgm: the test would jump off with assert error  when running "message.altF4()" and "extraform.altF4()"
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
I just un-assigned 428584 and 428617.  Had too many hours.
```

07:37

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
brad,  alright, then I am leaving now. because Starbucks will be closed with 30 minutes. so if you have any questions on me, drop me emails?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ray: will do, thanks!
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
brad: should these be milestoned to 0.9? http://tinyurl.com/5tvn3o
```

07:38

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
hey brad, I may have found a bug in berserk, I just clicked in "plan your sprint", and I have 1 bug assigned that I didn't add, and indeed that bug is assigned to you
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
ray, see you tomorrow!
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
ok, bye
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
ray: see you
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: hmm, weird
```

``` nowiki
sandy: yes, definitely
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
brad: ok I'll update them
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: what number?
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
428609
```

07:39

****

``` nowiki
&nbsp;
```

``` nowiki
-!- ray [~ray@221.220.15.25] has quit [good day, sirs :)]
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: hmm, that was assigned to you last iteration, wasn't it
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
oh right, but others as well
```

``` nowiki
and those others don't appear
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: so I know exactly why that's happening
```

``` nowiki
knocte: there are snapshots that exist with you as the assigned_to, so it's pulling that in.  that's definitely a bug, and a weird one at that
```

07:40

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
I see
```

``` nowiki
so I should remove it from my list? or you want to keep it in order to reproduce the bug more easily?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: no, just leave it
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
brad, knocte, mario, ngao: so here is a query for all unassigned 0.9 bugs in any category: http://tinyurl.com/5jcl9h
```

07:41

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
you shouldn't even be able to delete it to be honest
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
ok
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sandy: awesome
```

****

``` nowiki
&lt;@bgm&gt;&nbsp;
```

``` nowiki
calen: sorry, i am having trouble updating RPMs, one moment please
```

07:42

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
okay, all provider work is assigned
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
bgm: ok
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: hows the list going?
```

07:43

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
for now I have 428505,428530,428397,428584,428617,42854 3
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
sandy: thanks!
```

****

``` nowiki
* sandy&nbsp;
```

``` nowiki
is lost
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
sandy: hey, MenuItem (not to confuse with ToolStripMenuItem) was finally moved to 1.0, right?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
I'll take 428397
```

07:44

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
knocte: yes
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
ok, moving
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
mario: damn, you took that one...
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
brad: what what!?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
mario: you took 428397 :)
```

``` nowiki
ok, I'll take 428617
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
i'd like to take statusstrip (bridge) 428585
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
Some of these bridge bugs will just involve checking that the functionality is there and/or writing tests
```

07:45

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
aweseom
```

07:46

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
yep
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
ok
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
can I take 444066?
```

``` nowiki
and 436409?
```

****

``` nowiki
* sandy&nbsp;
```

``` nowiki
will take NumericUpDown bugs if nobody else is
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
444066 is listbox, mgorse: do you mind?
```

07:47

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
that one is easy
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
knocte: brad: Either way is fine with me
```

07:48

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
and 436409 will depend on all combobox work being finished
```

``` nowiki
the testscase is huge
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
brad: should I stop because I'm at 31 hours?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sandy: yeah... if you finish early, you can always pick up more
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
or should we assign until everything's gone?
```

``` nowiki
ok
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
actually I don't really know, just by looking at the description, if 444066 is a bridge bug or a provider bug
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ok, I still have hours... what else can I take?
```

07:49

``` nowiki
mgorse: I'll look at both then... thanks
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
I'm taking 442328!
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
I'll take 428504
```

****

``` nowiki
&lt;@bgm&gt;&nbsp;
```

``` nowiki
calen: i see what you're saying.
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ngao: how are you doing on work?
```

07:50

****

``` nowiki
&lt;@bgm&gt;&nbsp;
```

``` nowiki
calen: interesting, this didn't happen before right?
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
brad: i'm taking bridge bugs
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
anyone working on scrollbar?
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
bgm: i am not sure when this happened
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
where does bridge test code place? sorry, i'm not familiar with bridge side
```

07:51

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ngao: cool, just wanted to make sure you were getting enough bridge bugs
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
brad: are we going to replace all the reflection with InternalsVisibleTo in this iteration?
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
bgm: what do you think? is it a bug?
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
brad: I just looked briefly, and 444066 is probably a bridge bug, the bridge never checking the property
```

****

``` nowiki
&lt;@bgm&gt;&nbsp;
```

``` nowiki
calen: i will look at it today.  yes, i think it is a bug
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
mario: hmm, I think we should focus on the features first
```

``` nowiki
mgorse: ah cool
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
brad: ok. right!
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ok, I'm taking 428567 and 428628 (scrollbar, vscrollbar)
```

07:52

``` nowiki
and 428629
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
all the AtkText bugs are somehow related, right?
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
yep
```

``` nowiki
why, what are you looking at
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
bgm: okay, we need log it
```

07:53

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
knocte: just the bugs, nothing else.
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
i'll take 428503
```

****

``` nowiki
&lt;@bgm&gt;&nbsp;
```

``` nowiki
calen: okay, i will see if i can figure out why it is happening and log a bug so you can sleep :)
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
the ErrorProvider bug: 428505 is wrong, because the errorprovider adds controls for each control showing errormessages
```

07:54

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
bgm: seems they have fixed the close problem for main windows but still leave the issue for extra windows :)
```

``` nowiki
bgm: great!
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
mario, you mean that the spec is wrong?
```

07:55

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
ErrorProvider, its an image, actually, nothing else
```

``` nowiki
knocte: is, it is an image
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
mario: you can take that one, and fix the spec accordingly
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
knocte: ok
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
anyone taking 436834?
```

07:56

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
bgm: if you change the code(Line 70) to "message.findPushButton("OK").click()
```

``` nowiki
print "aaaaaaaaaa", message", you would see we still can find message frame after close it
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
brad: anything else to cover in the meeting?
```

07:57

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
mgorse: this is already fixed, isn't it: 428471 ?
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
I may need to bail soon
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sandy: nope, that's it
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
left wife's car at dentist, boring story
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
no worries
```

07:58

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
brad: go ahead
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
cool, all that is left is *TextBox, and ToolStripComboBox
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
ToolStripComboBox? I thought I got that one
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
mario: I'm not sure
```

07:59

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
and TextBox you mean RichTextBox and ToolStripTextBox, right?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
no, I still see ToolStripComboBox on this report.... let me refresh
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
oh yes
```

``` nowiki
I guess that ones will be finished just because of combobox being finished
```

08:00

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
mgorse: but why a table cell? is because of the checkbox and the item, so we have a table of n rows and 2 columns ? is that the reason
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
so they will be just unit tests
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ngao: how many hours did you end up with?
```

08:01

****

``` nowiki
* calen&nbsp;
```

``` nowiki
time to sleep. request bgm to log bug for Form's closed issue
```

08:02

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
bye!
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
gnite!
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
brad: 19 hrs, i could take rich text box
```

08:03

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
brad: question, so if we have to select 30 h, and I got 31, why berserk says I'm on 74% load?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ngao: 19 hours is good... let us know when you're low on hours
```

``` nowiki
knocte: heh, uh... I forgot to take into account weekends
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
:)
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- calen [~calen@61.149.60.129] has quit [Remote closed the connection]
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
the one thing I forgot to mention... did everyone transfer in their bugs they didn't complete from last iteration?
```

08:04

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
yes
```

****

``` nowiki
* brad&nbsp;
```

``` nowiki
high-fives sandy
```

****

``` nowiki
* sandy&nbsp;
```

``` nowiki
falls over
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
mario: I'm not sure.  I hadn't noticed that.
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
brad: oops, not yet
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sandy: what happened to iron man?
```

``` nowiki
ngao: heh, maybe that'll make up for the 10 hours? :)
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
:-P
```

08:05

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
brad: just wait for reviews
```

****

``` nowiki
&lt;@bgm&gt;&nbsp;
```

``` nowiki
hrm.. why do we show all of this "Embeds" stuff under "Relations" in Accerciser than Gtk doesn't show?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
mario: don't forget to add your bugs to berserk
```

08:07

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
brad: yes. don't worry.
```

``` nowiki
can you delete bugs from bersek?
```

08:08

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
trash icon
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
bgm: haven't you found any case in Gtk in which it happens?
```

08:09

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
sandy: tried that, maybe is a bug.
```

``` nowiki
because i'm not the assignee in the bug!
```

08:10

****

``` nowiki
&lt;@bgm&gt;&nbsp;
```

``` nowiki
knocte: i haven't.  i have seen relations when i explicitely create them in Gtk (like to associate a label to a button), but i don't think i have ever seen "embeds"
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
bgm: ok, then that's a bug
```

``` nowiki
file it please
```

****

``` nowiki
&lt;@bgm&gt;&nbsp;
```

``` nowiki
will do
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
good catch ;)
```

****

``` nowiki
&lt;@bgm&gt;&nbsp;
```

``` nowiki
:)
```

08:11

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
is everyone done with their assignments?
```

``` nowiki
then this meeting is adjourned!
```

08:12

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
yes
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
let's ask the inverse? anyone still assigning?
```

``` nowiki
hehe
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
mario: so I committed the navigation stuff
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
sandy: nice!
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
the only "big" change you'll notice...
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
sandy: hey cool, I was depending on that :)
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
is that I got rid of ChildNavigation
```

``` nowiki
everybody uses ParentNavigation now
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
good.  I hate kids.
```

08:13

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
haha
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- knocte changed the topic of #mono-a11y to: Accessibility: http://www.mono-project.com/Accessibilit y
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
and all the navigation infastructure moved from fragmentrootcontrolprovider to fragmentcontrolprovider
```

``` nowiki
the rest of the changes are just details from that...but it's all one commit you can look at if you're curious
```

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
sandy: mind taking care of the log?
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
knocte: will do, in a bit...need to run away actually
```

``` nowiki
mario: let me know if you come across anything weird since the change
```

08:14

****

``` nowiki
&lt; knocte&gt;&nbsp;
```

``` nowiki
no worries
```

``` nowiki
thanks
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
I ran all of the unit tests on provider and bridge sides
```

``` nowiki
and got same results before and after my change
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
sandy: so, do you know when to use Fragment and when FragmentRoot?
```

``` nowiki
honestly, I don't see why they use it indistinctly
```

08:15

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
mario: I'm still not 100% about when to pick one over another
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
should we ask Microsoft?
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
so, now Fragments support children, when should we use FragmentRoot... I don't get it.
```

08:16

``` nowiki
MSDN says something about it, but, don't know. I agree with brad we should ask Microsoft.
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
yeah, probably
```

08:17

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
maybe in Silverlight that thing makes more sense.
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
okay, back in a bit
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- You're now known as sandy|away
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
mario, sandy: do you guys want to draft an email and send it to me, and I'll make sure it gets to Microsoft?
```

****

``` nowiki
&lt;@sandy|away&gt;&nbsp;
```

``` nowiki
brad: sure
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
sure
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
thanks
```

