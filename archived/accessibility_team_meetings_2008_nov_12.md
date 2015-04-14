---
title: "Accessibility: Team Meetings 2008 Nov 12"
lastmodified: '2008-11-13'
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Nov_12/
---

Accessibility: Team Meetings 2008 Nov 12
========================================

    ****
    <@brad> hey folks, welcome to the iteration meeting
    07:01
    Today we'll start out our iteration meeting talking a bit about how we did last iteration.
    07:02
    I'm not going to sugar coat this -- it didn't go so well.We started out with 202 hours of work, during the middle, we went up to 238 at the peak, and we've closed the iteration with a little over 140 hours.Basically, we were only able to work about 90 hours collectively when we should have been able to work about 280 hours.Now, I'm not saying that people haven't been working a full 8 hour day, but I need to understand what everyone was working on that wasn't part of the iteration.So if the developers could spend a few minutes and summarize in an email to me what they were working on that wasn't part of the iteration, that would be great.
    07:03
    That being said, our estimates are about right on on average
    ****
    <@decriptor> brad: did the code migration have a big impact on time?
    ****
    <@brad> decriptor: definitely, and I understand thatbut if there's anything that affected this sprint, I'd like to know about it(and that 280 hours includes everyone's FTO)
    07:04
    any questions about this last iteration before I move on?okayso this next iteration is the last one before our 0.9 release
    07:05
    it's a short iteration, only 1 weekand we have a lot of work that remainsespecially in the Bridgeso if we run dry of provider work, the provider folks will probably have to help out mike and andrespersonally, I'll be taking only bridge work this iteration to assist with thisfor this next release, the milestones that have been communicated are as follows:
    07:06
    dev feature complete on november 19ththen we will hand off everything to stephenwho will tag, and get our RPMs ready in obsthe build should hopefully be complete by the 21stand we'll release the next Monday on the 24th
    07:07
    now you'll notice I've omitted the QA period I had talked about beforethe reason is that we have very few bugs that the developers can work on during this week if they're not working on featuresso instead, we're going to prioritize bugs that come in with a P1 or P2 priority
    07:08
    so if you're a developer and working on an enhancement and a bug comes in with a P1 or P2please wrap up what you were working on, and work on the bugthis will hopefully assist QA in their test development
    ****
    <@sandy> brad: so we should knock out existing P1s and P2s before even starting enhancement bugs?
    07:09****
    <@brad> completing all the work is not going to be easy, so everyone needs to pitch in to make it happensandy: yes, definitely
    ****
    * sandy notices there are a few
    ****
    <@brad> any questions so far?
    ****
    < knocte> we should estimate those bugs before assigning, right?
    ****
    <@brad> sure, estimating is always important :)
    07:10
    for the bugs, it helps us become better estimators
    ****
    < knocte> and the ones that come during the iteration?
    ****
    <@brad> yes, everything you work on should be estimated if possible
    ****
    < knocte> ok
    ****
    <@brad> anything else?
    ****
    < knocte> the problem is that not everybody is watching the generic email for bugs
    07:11****
    <@brad> knocte: good point
    ****
    < knocte> and hence don't notice new bugs
    ****
    <@brad> if QA could send an email to mono-a11y when they find a new high priority bug, that would be great
    ****
    <@bgm> hrm.
    ****
    <@sandy> I'll make some tinyurls of good queries and put them in /topic ?
    ****
    < knocte> on the page I've worked on in berserk, I'll also add some numbers about unassigned/unestimated bugs
    ****
    <@brad> knocte: cool
    07:12
    bgm: ideas?we can talk about this after the meetingthe last thing I wanted to mention is that I've added a new feature to berserksome of you might have seen it alreadybasically, this last iteration, we still had issues with people marking their hours daily
    07:13
    so I've added a daemon to berserk that will send you a polite reminder every nightif the hours on the bugs you have assigned haven't changed that day
    ****
    <@bgm> brad: i thought developers should be monitoring mono-a11y-qa for new bugs that aren't your guys' enhancements
    ****
    <@brad> bgm: we haven't been... let's chat about this a little later then
    ****
    <@bgm> because i see no reason that QA should need to log a bug and then e-mail the bug
    07:14
    seems uberedundant.
    ****
    <@brad> bgm: fair enough.  maybe I can watch new bugs as they come in, and make sure someone is on itgreat, that's all I had to talk about
    07:15****
    <@mgorse> bgm: The QA bugs have been going to mono-a11y-bugs, so I'm not sure why we also need to watch mono-a11y-qa.  Am I missing something?
    ****
    <@brad> So if the developers could each spend some time and assign themselves issues out of the 0.9 release, that would be awesome
    ****
    <@bgm> mgorse: the QA contact for the bugs we log is mono-a11y-qa, so that list should only get new bugs that QA logs
    07:16****
    <@sandy> now?
    ****
    <@brad> make sure to add them to Berserk, and also make sure to have near 100% load if possiblesandy: pleasebgm: mono-a11y-qa is the qa contact for all bugs thoughbgm: so wouldn't it get bug mail for *every* bug we log, and everything we change?
    ****
    <@mgorse> brad: Do you have any suggestions as to how many hours to file?  I went through and figured out what bugs I was thinking of assigning to myself, but it gave me 63 hours.  But I was assuming that it would just be Andres and I who would be working on the bridge, so maybe I should remove some of them
    07:17****
    <@bgm> mono-a11y-bugs the QA contact when you guys create an enhancement?  (https://bugzilla.novell.com/show_bug.cg i?id=428475)just a random bug i grabbed.
    ****
    <@brad> bgm: well, there are only 5 days in the next iteration, so you shouldn't assign more than 30ish
    ****
    <@bgm> mgorse: ^
    07:18****
    <@brad> bgm: mono-a11y-qa is the qa contact for all the bugs, I thoughtoh, it's not
    07:19
    weird
    ****
    <@bgm> that is how i thought we were differentiating between enhancements (spam to QA) and "real" bugs
    ****
    <@brad> ah, I guess that makes sense... but I don't think it was intentional... :)
    ****
    <@bgm> :P
    07:20
    i guess i just assumed when that's how things ended up
    07:21****
    <@sandy> ngao: do you want to grab the remaining 0.9 provider bugs? RadioButton and ScrollBar?
    ****
     -!- jpallen [~jpallen@ariadne.provo.novell.com] has joined #mono-a11y
    ****
    <@brad> hey jared
    07:22****
    <@sandy> brad, mario, ngao: I am using this query to find open 0.9 provider bugs: http://tinyurl.com/56ehx9
    ****
    <@ngao> sandy: aren't they already done?
    ****
    <@brad> sandy: perfect
    ****
    <@mario> ngao: missing client tests, I guess.
    ****
    <@brad> guys, gonna restart berserk real quick
    ****
    <@sandy> ngao: for some reason there are open bugs, so somebody needs to look at them :-)I grabbed webbrowser
    ****
    <@brad> ok, it's back
    07:23****
    <@ngao> mario: sandy: ok, i'll take them
    ****
    <@brad> knocte: what bridge tasks can I take?
    07:24****
    * knocte looks
    ****
    <@brad> http://tinyurl.com/4cpvsl
    07:25
    that's open bridge bugs in the 0.9 release
    ****
    <@sandy> wow
    07:26****
    < knocte> NumericUpDownVScrollbar (mm, but that may depend on Scrollbar)
    07:27****
    <@sandy> brad: so I'm at ~20 hours, should I add bridge work now?
    ****
    <@mgorse> knocte: brad: I just took 428574, but I could take something else instead if that makes things easier
    ****
    <@mario> can I take Scrollbar (bridge)?
    ****
    <@sandy> or look at P1/P2 bugs first?
    ****
    <@brad> sandy: yeahsandy: we'll have to integrate bugs into our sprintsandy: so load up
    ****
    < knocte> and RichTextBox will definitely depend on unfinished TextBox
    07:28****
    <@mario> knocte: are you going to work in combobox? I can take it.
    ****
    < knocte> combobox is almost finishedlet me take it
    ****
    <@brad> mgorse: go ahead and take that one
    ****
    <@mgorse> ScrollBar and its descendants should basically be done; I don't remember if there was a reason I hadn't marked them fixed
    07:29****
    <@mario> ok, I will wait for the missing bugs, let me know when everyone is finished.
    ****
    <@mgorse> Oh, right--there's the AtkAction stuff
    ****
    <@brad> calen, ray: feel free to leave if you'd like, unless you have any questions for folksngao: and feel free to leave once you've assigend your work
    ****
    <@ray> brad, ok for me
    ****
    <@calen> brad: np
    ****
    <@ngao> brad: ok
    07:30****
    <@brad> gnite folks!
    ****
    <@ray> brad, will we need to report the plans of next two weeks
    ****
    <@calen> bgm, ping
    ****
    <@brad> ray: no, I think your scrum reports cover that pretty well
    ****
    <@sandy> knocte: do you still want https://bugzilla.novell.com/show_bug.cgi ?id=436145 ?or should I grab it?
    ****
    <@bgm> calen: pong
    ****
    <@brad> knocte: what about ToolStrip*?
    07:31****
    <@calen> bgm: can you running form_basic_ops.py pass?
    ****
    < knocte> brad: leave for me anything about ToolStripMenuItem or ComboBox related
    ****
    <@mario> mgorse: I can work in Scrollbar if you are not going to.
    ****
    <@bgm> calen: let me look!
    07:32****
    <@brad> knocte: ok, maybe you could come up with a list of things that you and mike haven't claimed for us
    ****
    < knocte> brad: besides, I think 436145 should be fixed now because of a recent refactoring
    ****
    <@calen> bgm, it fails to assert the extra wondows has been closed by using altF4()bgm: it looks like a bug, but I am not sure very much.
    07:33****
    < knocte> yeah, take in account that in last iteration we had to assign all *Begin bugs so they seem to be no unclaimed bugs, or unclaimed bugs that depend on unfinished Begin* bugs
    ****
    <@mgorse> mario: I haven't assigned anything from it to myself.  I'm not sure what, if anything, still needs doing
    07:34****
    <@brad> knocte: since you have more intimite knowledge, would you mind preparing that list?
    ****
    < knocte> brad: take 428530
    ****
    <@brad> knocte: ok, thanks
    ****
    < knocte> ok, I'll do that list
    ****
    <@ngao> knocte: are there bridge bugs I could take?
    07:36****
    <@brad> once knocte has that list, we should be able to work off of it
    ****
    <@calen> bgm: the test would jump off with assert error  when running "message.altF4()" and "extraform.altF4()"
    ****
    <@mgorse> I just un-assigned 428584 and 428617.  Had too many hours.
    07:37****
    <@ray> brad,  alright, then I am leaving now. because Starbucks will be closed with 30 minutes. so if you have any questions on me, drop me emails?
    ****
    <@brad> ray: will do, thanks!
    ****
    <@sandy> brad: should these be milestoned to 0.9? http://tinyurl.com/5tvn3o
    07:38****
    < knocte> hey brad, I may have found a bug in berserk, I just clicked in "plan your sprint", and I have 1 bug assigned that I didn't add, and indeed that bug is assigned to you
    ****
    <@calen> ray, see you tomorrow!
    ****
    <@ray> ok, bye
    ****
    <@ngao> ray: see you
    ****
    <@brad> knocte: hmm, weirdsandy: yes, definitely
    ****
    <@sandy> brad: ok I'll update them
    ****
    <@brad> knocte: what number?
    ****
    < knocte> 428609
    07:39****
     -!- ray [~ray@221.220.15.25] has quit [good day, sirs :)]
    ****
    <@brad> knocte: hmm, that was assigned to you last iteration, wasn't it
    ****
    < knocte> oh right, but others as welland those others don't appear
    ****
    <@brad> knocte: so I know exactly why that's happeningknocte: there are snapshots that exist with you as the assigned_to, so it's pulling that in.  that's definitely a bug, and a weird one at that
    07:40****
    < knocte> I seeso I should remove it from my list? or you want to keep it in order to reproduce the bug more easily?
    ****
    <@brad> knocte: no, just leave it
    ****
    <@sandy> brad, knocte, mario, ngao: so here is a query for all unassigned 0.9 bugs in any category: http://tinyurl.com/5jcl9h
    07:41****
    <@brad> you shouldn't even be able to delete it to be honest
    ****
    < knocte> ok
    ****
    <@brad> sandy: awesome
    ****
    <@bgm> calen: sorry, i am having trouble updating RPMs, one moment please
    07:42****
    <@sandy> okay, all provider work is assigned
    ****
    <@calen> bgm: ok
    ****
    <@brad> knocte: hows the list going?
    07:43****
    < knocte> for now I have 428505,428530,428397,428584,428617,42854 3
    ****
    <@mario> sandy: thanks!
    ****
    * sandy is lost
    ****
    < knocte> sandy: hey, MenuItem (not to confuse with ToolStripMenuItem) was finally moved to 1.0, right?
    ****
    <@brad> I'll take 428397
    07:44****
    <@sandy> knocte: yes
    ****
    < knocte> ok, moving
    ****
    <@brad> mario: damn, you took that one...
    ****
    <@mario> brad: what what!?
    ****
    <@brad> mario: you took 428397 :)ok, I'll take 428617
    ****
    <@ngao> i'd like to take statusstrip (bridge) 428585
    ****
    <@mgorse> Some of these bridge bugs will just involve checking that the functionality is there and/or writing tests
    07:45****
    <@sandy> aweseom
    07:46****
    < knocte> yep
    ****
    <@ngao> ok
    ****
    <@brad> can I take 444066?and 436409?
    ****
    * sandy will take NumericUpDown bugs if nobody else is
    ****
    < knocte> 444066 is listbox, mgorse: do you mind?
    07:47****
    <@brad> that one is easy
    ****
    <@mgorse> knocte: brad: Either way is fine with me
    07:48****
    < knocte> and 436409 will depend on all combobox work being finishedthe testscase is huge
    ****
    <@sandy> brad: should I stop because I'm at 31 hours?
    ****
    <@brad> sandy: yeah... if you finish early, you can always pick up more
    ****
    <@sandy> or should we assign until everything's gone?ok
    ****
    <@mgorse> actually I don't really know, just by looking at the description, if 444066 is a bridge bug or a provider bug
    ****
    <@brad> ok, I still have hours... what else can I take?
    07:49
    mgorse: I'll look at both then... thanks
    ****
    <@mario> I'm taking 442328!
    ****
    <@brad> I'll take 428504
    ****
    <@bgm> calen: i see what you're saying.
    ****
    <@brad> ngao: how are you doing on work?
    07:50****
    <@bgm> calen: interesting, this didn't happen before right?
    ****
    <@ngao> brad: i'm taking bridge bugs
    ****
    <@brad> anyone working on scrollbar?
    ****
    <@calen> bgm: i am not sure when this happened
    ****
    <@ngao> where does bridge test code place? sorry, i'm not familiar with bridge side
    07:51****
    <@brad> ngao: cool, just wanted to make sure you were getting enough bridge bugs
    ****
    <@mario> brad: are we going to replace all the reflection with InternalsVisibleTo in this iteration?
    ****
    <@calen> bgm: what do you think? is it a bug?
    ****
    <@mgorse> brad: I just looked briefly, and 444066 is probably a bridge bug, the bridge never checking the property
    ****
    <@bgm> calen: i will look at it today.  yes, i think it is a bug
    ****
    <@brad> mario: hmm, I think we should focus on the features firstmgorse: ah cool
    ****
    <@mario> brad: ok. right!
    ****
    <@brad> ok, I'm taking 428567 and 428628 (scrollbar, vscrollbar)
    07:52
    and 428629
    ****
    <@mario> all the AtkText bugs are somehow related, right?
    ****
    < knocte> yepwhy, what are you looking at
    ****
    <@calen> bgm: okay, we need log it
    07:53****
    <@mario> knocte: just the bugs, nothing else.
    ****
    <@ngao> i'll take 428503
    ****
    <@bgm> calen: okay, i will see if i can figure out why it is happening and log a bug so you can sleep :)
    ****
    <@mario> the ErrorProvider bug: 428505 is wrong, because the errorprovider adds controls for each control showing errormessages
    07:54****
    <@calen> bgm: seems they have fixed the close problem for main windows but still leave the issue for extra windows :)bgm: great!
    ****
    < knocte> mario, you mean that the spec is wrong?
    07:55****
    <@mario> ErrorProvider, its an image, actually, nothing elseknocte: is, it is an image
    ****
    < knocte> mario: you can take that one, and fix the spec accordingly
    ****
    <@mario> knocte: ok
    ****
    <@brad> anyone taking 436834?
    07:56****
    <@calen> bgm: if you change the code(Line 70) to "message.findPushButton("OK").click()print "aaaaaaaaaa", message", you would see we still can find message frame after close it
    ****
    <@sandy> brad: anything else to cover in the meeting?
    07:57****
    <@mario> mgorse: this is already fixed, isn't it: 428471 ?
    ****
    <@sandy> I may need to bail soon
    ****
    <@brad> sandy: nope, that's it
    ****
    <@sandy> left wife's car at dentist, boring story
    ****
    <@brad> no worries
    07:58****
    < knocte> brad: go ahead
    ****
    <@brad> cool, all that is left is *TextBox, and ToolStripComboBox
    ****
    < knocte> ToolStripComboBox? I thought I got that one
    ****
    <@mgorse> mario: I'm not sure
    07:59****
    < knocte> and TextBox you mean RichTextBox and ToolStripTextBox, right?
    ****
    <@brad> no, I still see ToolStripComboBox on this report.... let me refresh
    ****
    < knocte> oh yesI guess that ones will be finished just because of combobox being finished
    08:00****
    <@mario> mgorse: but why a table cell? is because of the checkbox and the item, so we have a table of n rows and 2 columns ? is that the reason
    ****
    < knocte> so they will be just unit tests
    ****
    <@brad> ngao: how many hours did you end up with?
    08:01****
    * calen time to sleep. request bgm to log bug for Form's closed issue
    08:02****
    <@calen> bye!
    ****
    <@brad> gnite!
    ****
    <@ngao> brad: 19 hrs, i could take rich text box
    08:03****
    < knocte> brad: question, so if we have to select 30 h, and I got 31, why berserk says I'm on 74% load?
    ****
    <@brad> ngao: 19 hours is good... let us know when you're low on hoursknocte: heh, uh... I forgot to take into account weekends
    ****
    < knocte> :)
    ****
     -!- calen [~calen@61.149.60.129] has quit [Remote closed the connection]
    ****
    <@brad> the one thing I forgot to mention... did everyone transfer in their bugs they didn't complete from last iteration?
    08:04****
    <@sandy> yes
    ****
    * brad high-fives sandy
    ****
    * sandy falls over
    ****
    <@mgorse> mario: I'm not sure.  I hadn't noticed that.
    ****
    <@ngao> brad: oops, not yet
    ****
    <@brad> sandy: what happened to iron man?ngao: heh, maybe that'll make up for the 10 hours? :)
    ****
    <@sandy> :-P
    08:05****
    <@ngao> brad: just wait for reviews
    ****
    <@bgm> hrm.. why do we show all of this "Embeds" stuff under "Relations" in Accerciser than Gtk doesn't show?
    ****
    <@brad> mario: don't forget to add your bugs to berserk
    08:07****
    <@mario> brad: yes. don't worry.can you delete bugs from bersek?
    08:08****
    <@sandy> trash icon
    ****
    < knocte> bgm: haven't you found any case in Gtk in which it happens?
    08:09****
    <@mario> sandy: tried that, maybe is a bug.because i'm not the assignee in the bug!
    08:10****
    <@bgm> knocte: i haven't.  i have seen relations when i explicitely create them in Gtk (like to associate a label to a button), but i don't think i have ever seen "embeds"
    ****
    < knocte> bgm: ok, then that's a bugfile it please
    ****
    <@bgm> will do
    ****
    < knocte> good catch ;)
    ****
    <@bgm> :)
    08:11****
    <@brad> is everyone done with their assignments?then this meeting is adjourned!
    08:12****
    <@sandy> yes
    ****
    < knocte> let's ask the inverse? anyone still assigning?hehe
    ****
    <@sandy> mario: so I committed the navigation stuff
    ****
    <@mario> sandy: nice!
    ****
    <@sandy> the only "big" change you'll notice...
    ****
    < knocte> sandy: hey cool, I was depending on that :)
    ****
    <@sandy> is that I got rid of ChildNavigationeverybody uses ParentNavigation now
    ****
    <@brad> good.  I hate kids.
    08:13****
    <@mario> haha
    ****
     -!- knocte changed the topic of #mono-a11y to: Accessibility: Accessibility
    ****
    <@sandy> and all the navigation infastructure moved from fragmentrootcontrolprovider to fragmentcontrolproviderthe rest of the changes are just details from that...but it's all one commit you can look at if you're curious
    ****
    < knocte> sandy: mind taking care of the log?
    ****
    <@sandy> knocte: will do, in a bit...need to run away actuallymario: let me know if you come across anything weird since the change
    08:14****
    < knocte> no worriesthanks
    ****
    <@sandy> I ran all of the unit tests on provider and bridge sidesand got same results before and after my change
    ****
    <@mario> sandy: so, do you know when to use Fragment and when FragmentRoot?honestly, I don't see why they use it indistinctly
    08:15****
    <@sandy> mario: I'm still not 100% about when to pick one over another
    ****
    <@brad> should we ask Microsoft?
    ****
    <@mario> so, now Fragments support children, when should we use FragmentRoot... I don't get it.
    08:16
    MSDN says something about it, but, don't know. I agree with brad we should ask Microsoft.
    ****
    <@sandy> yeah, probably
    08:17****
    <@mario> maybe in Silverlight that thing makes more sense.
    ****
    <@sandy> okay, back in a bit
    ****
     -!- You're now known as sandy|away
    ****
    <@brad> mario, sandy: do you guys want to draft an email and send it to me, and I'll make sure it gets to Microsoft?
    ****
    <@sandy|away> brad: sure
    ****
    <@mario> sure
    ****
    <@brad> thanks
