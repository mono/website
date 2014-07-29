---
layout: obsolete
title: "Accessibility: QA Meetings 2009 Mar 25"
lastmodified: '2009-06-01'
permalink: /archived/Accessibility:_QA_Meetings_2009_Mar_25/
redirect_from:
  - /Accessibility:_QA_Meetings_2009_Mar_25/
---

Accessibility: QA Meetings 2009 Mar 25
======================================

BEGIN LOGGING AT Wed Mar 25 09:48:46 2009
 Mar 25 09:48:46 \* Now talking on \#mono-a11y-qa
 Mar 25 09:48:46 \* morbo gives channel operator status to calen
 Mar 25 10:01:04 \* bgmerrell (\~bean@166-70-62-135.ip.xmission.com) has joined \#mono-a11y-qa
 Mar 25 10:01:05 \* morbo gives channel operator status to bgmerrell
 Mar 25 10:05:27 \* felicia (\~mufx@61.14.130.209) has joined \#mono-a11y-qa
 Mar 25 10:05:28 \* morbo gives channel operator status to felicia
 Mar 25 10:05:32 \<calen\> welcome
 Mar 25 10:05:34 \<felicia\> hi I'm in
 Mar 25 10:07:31 \<bgmerrell\> Okay, great
 Mar 25 10:07:50 \<ray\> hey there.
 Mar 25 10:07:57 \<bgmerrell\> So I just wanted to get everyone together at the same time and quickly talk about a few things
 Mar 25 10:08:07 \<ray\> great!
 Mar 25 10:08:13 \<felicia\> I'm listening
 Mar 25 10:08:48 \<calen\> sure!
 Mar 25 10:09:16 \<bgmerrell\> felicia: we usually have these QA meetings every couple of months, just to make sure we are all working together
 Mar 25 10:09:49 \<felicia\> all right , thanks. bgmerrell
 Mar 25 10:09:56 \<bgmerrell\> sometimes we establish goals, ensure that we are meeting our goals, etc.
 Mar 25 10:10:29 \<calen\> yep
 Mar 25 10:10:39 \<bgmerrell\> So First of all, congratulations on your work on the 1.0 release
 Mar 25 10:10:51 \<ray\> thank u
 Mar 25 10:11:31 \<calen\> felicia, you study hard and quick:)
 Mar 25 10:11:55 \<felicia\> thank calen, you help me much .
 Mar 25 10:12:04 \<bgmerrell\> I know that the quality isn't perfect, especially considering it is a 1.0 release, but our managers insisted that it be a 1.0 release so that it could be bundled with Mono.
 Mar 25 10:12:15 \<felicia\> ray , thank very much , you do a lot help for me.
 Mar 25 10:12:33 \<bgmerrell\> Mono wouldn't bundle us with them unless it was a "stable release," which basically forced us to call it 1.0
 Mar 25 10:12:50 \<ray\> WOOW, cool !
 Mar 25 10:13:01 \<bgmerrell\> But considering that WinForms was 100% inaccessible just a short time ago, I think we did a lot of work
 Mar 25 10:13:13 \<ray\> exactly
 Mar 25 10:13:44 \<calen\> bgmerrell, obviously :)
 Mar 25 10:13:46 \<bgmerrell\> So we did a lot of work to help people with impairments, which is very cool!
 Mar 25 10:14:05 \<bgmerrell\> and we get to continue!
 Mar 25 10:14:17 \* ray nods
 Mar 25 10:14:57 \<bgmerrell\> So I just want to establish a plan for testing until the developers have some phase 2 work we can test
 Mar 25 10:15:26 \<bgmerrell\> there is still \*a lot\* of work we need to do on phase 1, there are still bugs obviously
 Mar 25 10:15:28 \<calen\> agree
 Mar 25 10:15:50 \<felicia\> sure
 Mar 25 10:16:08 \<bgmerrell\> So what we need to do is go through all of our tests that are not in tests.py and do the following:
 Mar 25 10:17:13 \<bgmerrell\> 1. Grep for any "BUG" references, and see if those bugs are fixed. If they are fixed, we need up run the test and make sure that the test is working. If it is working completely then we need to add it to tests.py. If there are more failures we need to log more bugs and/or add "BUG" references to the test.
 Mar 25 10:18:00 \<calen\> sure
 Mar 25 10:19:04 \<bgmerrell\> 2. Ensure that all the tests that are not in tests.py work completely and add them to tests.py. If they don't work completely then we need log new bugs or add BUG references for existing bugs.
 Mar 25 10:19:18 \<bgmerrell\> (remember, we only recently started using BUG references, so all tests don't have them)
 Mar 25 10:20:38 \<bgmerrell\> felicia: BUG references are just comments in our tests so we know why a test is failing. It is essentially a comment that says BUG\<bug number\>, e.g., BUG457479
 Mar 25 10:21:13 \<felicia\> year , I get it .
 Mar 25 10:22:18 \<bgmerrell\> Remember we should remove BUG references once the test passes.. we can change it to say something like "\# this test used to fail because of bug 457479, but it shouldn't say "BUG456479" anywhere, because we don't want the reference to appear when we grep for BUG\<bug number\>
 Mar 25 10:23:12 \<bgmerrell\> You don't have to leave in a comment stating that the test failed in the past, it's optional.
 Mar 25 10:23:16 \<bgmerrell\> "used to" means "in the past"
 Mar 25 10:23:19 \<bgmerrell\> by the way :)
 Mar 25 10:23:37 \<felicia\> yep thank good advices , bgmerrell .
 Mar 25 10:23:38 \<ray\> :)
 Mar 25 10:23:53 \<bgmerrell\> any questions about that?
 Mar 25 10:24:10 \<calen\> it's clearly :)
 Mar 25 10:24:17 \<ray\> no, actually, calen and me have done that way :)
 Mar 25 10:24:36 \<bgmerrell\> our final goal is to have all of our tests running successfully and then added to tests.py
 Mar 25 10:25:07 \<calen\> understand
 Mar 25 10:25:24 \<bgmerrell\> calen: I noticed you had added helpprovider.py to tests.py but I was still getting failures in helpprovider.py
 Mar 25 10:25:31 \<ray\> bgmerrell, even though the test scripts were done, would we review them each other, and then add it to tests.py?
 Mar 25 10:25:39 \<bgmerrell\> calen: a lot of the tests you added were really good though, so thank you
 Mar 25 10:25:55 \<calen\> bgmerrell, oh, you are welcome.
 Mar 25 10:26:17 \<calen\> bgmerrell, i will check the failures after the meeting
 Mar 25 10:26:46 \<bgmerrell\> calen: I fixed the helpprovider failures, but there might be others. You can try running the entire suite.
 Mar 25 10:27:03 \<calen\> bgmerrell, okay, thanks a lot
 Mar 25 10:28:10 \<bgmerrell\> ideally we would be runing all the tests daily even though they are not running successfully, but I need to work more on the dashboard before we do that.
 Mar 25 10:28:32 \<bgmerrell\> so for now, I think it is best to just add successful test scripts to tests.py so it is obvious when there is a regression
 Mar 25 10:28:58 \<ray\> bgmerrell, what can we do for you on dashboard?
 Mar 25 10:29:17 \<bgmerrell\> ray: I just need more time to work on it :) hopefully I can soon
 Mar 25 10:29:35 \<ray\> terrific :)
 Mar 25 10:29:39 \<calen\> you rock:)
 Mar 25 10:30:20 \<felicia\> cool:)
 Mar 25 10:30:50 \<bgmerrell\> So you guys should probably divide the tests that aren't in tests.py among yourselves
 Mar 25 10:31:24 \<calen\> okay,
 Mar 25 10:31:26 \<bgmerrell\> Ray and Calen already have tests assigned to them in our Strongwind status google spreadsheet, so maybe they can both share some with felicia.
 Mar 25 10:31:45 \<bgmerrell\> does that sound reasonable?
 Mar 25 10:31:56 \<felicia\> year
 Mar 25 10:32:00 \<calen\> sounds good
 Mar 25 10:32:17 \<ray\> yeah
 Mar 25 10:32:18 \<calen\> we will share some tests with felicia
 Mar 25 10:32:23 \<bgmerrell\> Okay, and I will be working on something a bit different
 Mar 25 10:32:28 \<felicia\> welcome
 Mar 25 10:33:20 \<calen\> in fact she has been working something on combobox\_simple test.
 Mar 25 10:35:37 \<calen\> bgmerrell, BTW, do we need do some investigation for phase 2 test?
 Mar 25 10:35:41 \<bgmerrell\> I will be using our code review tool to start reviewing our 75% complete tests
 Mar 25 10:35:44 \<bgmerrell\> [http://code.mono-a11y.org/r/10/](http://code.mono-a11y.org/r/10/)
 Mar 25 10:35:54 \<felicia\> I have run some tests, and try to write some examples, but these are just imitations
 Mar 25 10:35:59 \<bgmerrell\> that is just an example link
 Mar 25 10:36:04 \<ray\> bgmerrell, we can't access mono-a11y.org :(
 Mar 25 10:36:52 \<ray\> by the ways, what's the review board?
 Mar 25 10:37:21 \<bgmerrell\> calen: I think we will do research when the developers have a little more work done. I have not been involved with their research, so I really don't even know what they are working on.
 Mar 25 10:37:43 \<calen\> bgmerrell, make sense!
 Mar 25 10:38:39 \<bgmerrell\> ray: it is just a web tool to show a diff and comments about the diff
 Mar 25 10:39:08 \<ray\> bgmerrell, ok, but i don't know why we in China can't access mono-a11y.org domain
 Mar 25 10:39:47 \<bgmerrell\> ray: yeah, weird, I think they are working on it, but I will mention it to Stephen
 Mar 25 10:39:57 \<ray\> bgmerrell, awesome
 Mar 25 10:40:05 \<bgmerrell\> ray: here is another example you should be able to access: [http://demo.review-board.org/r/1483/](http://demo.review-board.org/r/1483/)
 Mar 25 10:40:27 \<bgmerrell\> Basically it will allow me to review your code, but also give you all an opportunity to see my feedback
 Mar 25 10:40:28 \<ray\> yeah, it works
 Mar 25 10:40:38 \<bgmerrell\> so we can all make improvements
 Mar 25 10:40:47 \<calen\> yes, thanks
 Mar 25 10:41:18 \<ray\> oh, it's an open source software
 Mar 25 10:41:26 \<bgmerrell\> ray: yep!
 Mar 25 10:41:38 \<ray\> rocks
 Mar 25 10:41:47 \<bgmerrell\> I am also working on some tests that change the style of controls at run-time
 Mar 25 10:42:00 \<bgmerrell\> runtime, rather
 Mar 25 10:42:13 \<bgmerrell\> and hopefully work on the dashboard
 Mar 25 10:42:27 \<bgmerrell\> Anyway, that is all I wanted to talk about. :)
 Mar 25 10:42:32 \<bgmerrell\> anyone else have anything to discuss?
 Mar 25 10:43:18 \<calen\> no question :)
 Mar 25 10:43:52 \<ray\> even though the test scripts were done, would we review them each other, and then add it to tests.py? or just add it in if it succeed to run?
 Mar 25 10:46:15 \<bgmerrell\> ray: I will be reviewing the actual test code line-by-line, however, if you want to do a quick review with each other (to make sure you are hitting all test cases, or make sure you have a valid bug, etc.) that is absolutely fine
 Mar 25 10:47:04 \<ray\> bgmerrell, got it
 Mar 25 10:47:46 \<bgmerrell\> continue the good work everyone :)
 Mar 25 10:48:16 \<calen\> yes sir :) thanks
 Mar 25 10:48:31 \<ray\> thank u for good organized
 Mar 25 10:48:42 \<felicia\> you rocks, thanks.
 Mar 25 18:44:45 \* ray has quit (Leaving)


