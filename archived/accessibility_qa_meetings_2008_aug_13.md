---
title: "Accessibility: QA Meetings 2008 Aug 13"
lastmodified: '2008-08-13'
redirect_from:
  - /Accessibility%3A_QA_Meetings_2008_Aug_13/
---

Accessibility: QA Meetings 2008 Aug 13
======================================

10:15 \<bgmerrell\> are either of you familiar with the term "smoke test?"
 10:15 \<calen\> have any adjustment?
 10:16 \<ray\> do i need a cigarette? joking :P
 10:16 \<bgmerrell\> hehe
 10:16 \<calen\> i hear that, but i don't know how to do
 10:16 \<ray\> does it means stress test?
 10:16 \<bgmerrell\> okay,... first of all..
 10:16 \<calen\> heard
 10:16 \<bgmerrell\> from Wikipedia "Smoke testing is done by developers before the build is released or by testers before accepting a build for further testing."
 10:17 \<bgmerrell\> we will do the second part, i.e., QA will perform a smoke test before accepting a build for further testing.
 10:18 \<bgmerrell\> it's like a sanity test.
 10:18 \<bgmerrell\> the idea will be for one of us to validate that new build and/or RPMs are not broken
 10:19 \<bgmerrell\> and that we can all test effectively with the new RPMs before we all try to download and use them
 10:19 \<bgmerrell\> does that make sense?
 10:19 \<calen\> bgmerrell: yes
 10:19 \<ray\> yes
 10:19 \<ray\> actually, calen already did it :)
 10:19 \<calen\> bgmerrell: that is what i had said in our test plan befor i think:)
 10:19 \<bgmerrell\> excellent :)
 10:20 \<calen\> ray: not exactly :)
 10:20 \<bgmerrell\> calen: do we have any winforms tests that are 100% finished and not waiting for some bug?
 10:20 \<calen\> bgmerrell: no
 10:20 \<bgmerrell\> okay, i didn't think so
 10:21 \<bgmerrell\> when we do, we will want to make sure it is added to the test suite (tests.py)
 10:21 \<bgmerrell\> then we can start doing our smoke tests
 10:22 \<bgmerrell\> then we will designate one person to download the newest RPMs and update a wiki page to inform others if they should update or not
 10:22 \<calen\> bgmerrell: do you mean use our strongwind test code to do smoke tests
 10:22 \<calen\> ?
 10:23 \<bgmerrell\> calen: for now yes, if they start to take too long, maybe we will have a smoke-tests.py to perform only a few tests
 10:23 \<bgmerrell\> instead of tests.py which will have all the tests
 10:23 \<ray\> calen, i think bgmerrell means we could download the rpms which is newly built, and install them to see if there are some prolbems
 10:24 \<bgmerrell\> ray: right, but to see if there are some problems we can use our strongwind tests
 10:24 \<ray\> ah , o k
 10:24 \<bgmerrell\> if the most/all of the tests fail, when they were successful before, we know there are problems :)
 10:24 \<bgmerrell\> calen: does that sound okay? or did you have a different idea?
 10:25 \<calen\> bgmerrell: but my idea is if we should check if all patches which \<decriptor\> want to build into have been included, and all rpms can be install the first, than run our test
 10:25 \<bgmerrell\> calen: yeah, sounds perfect
 10:25 \<calen\> then to make sure new rpms is ready
 10:27 \<bgmerrell\> How would we "check if all patches which \<decriptor\> want to build into have been included?"
 10:29 \<calen\> i think it need decriptor give us a list
 10:30 \* ray is looking for some details about smoke test
 10:30 \<calen\> and extra rpms to give a diff :)
 10:31 \<calen\> i don't know if it can be done like that \^\^
 10:32 \<bgmerrell\> [http://build1.sled.lab.novell.com/uia/](http://build1.sled.lab.novell.com/uia/) has previous rpms
 10:32 \<bgmerrell\> if we know the revision numbers that were used to create the RPMs we can look at the ChangeLog differences
 10:32 \<calen\> sorry, i mean get patches from rpms
 10:32 \<ray\> i got it, smoke test is something like sanity check, then people could do the next
 10:33 \<bgmerrell\> ray: right, [http://en.wikipedia.org/wiki/Smoke_test#Smoke_testing_in_software_development](http://en.wikipedia.org/wiki/Smoke_test#Smoke_testing_in_software_development)
 10:34 \<calen\> that is name "?????" in china. hehe
 10:36 \<calen\> bgmerrell: sorry, there is no way to check out patches from rpm :(
 10:37 \<calen\> how can we know new patch has been include into rpm?
 10:38 \<ray\> bgmerrell, so when we install new rpms and no one is broken, then we can test in strongwind?
 10:38 \<bgmerrell\> calen: the only thing we can do is look at the changelog
 10:38 \<bgmerrell\> decriptor would have to do the same thing
 10:39 \<bgmerrell\> changelogs\*
 10:39 \<ray\> calen, i think best way is to see the rpm's changelog or revision
 10:41 \<calen\> according changelogs to run samples which has been mentioned in changelogs, then run our strongwind test?
 10:41 \<bgmerrell\> i'm trying to think about the changelogs.. because there will be a lot of changelogs to look at
 10:42 \<bgmerrell\> i think our bugs will be the best indicators
 10:42 \<calen\> because sometimes some control's application cann't be invoked after update the rpms
 10:42 \<ray\> bgmerrell, what about to see the rpms's changelog ,
 10:42 \<bgmerrell\> ray: where is that?
 10:43 \<ray\> rpm -q --changelog, do we talk about the one thing ? :)
 10:43 \<ray\> rpm -qp --changelog xxx.rpm
 10:44 \<bgmerrell\> let me download the new RPMs
 10:45 \<calen\> there is no changelog by use rpm -qp --changelog \*\*\*.rpm now
 10:46 \<bgmerrell\> okay
 10:46 \<bgmerrell\> I will talk to jared and decriptor about this
 10:46 \<bgmerrell\> and see what we can do
 10:46 \<bgmerrell\> we don't have to solve it now
 10:46 \<calen\> it return (none), maybe descriptor will add it ??
 10:47 \<bgmerrell\> the problem is we have lots and lots of rpms
 10:47 \<bgmerrell\> I think the best thing to do would be to have the builders add a comment to a bug when its patch has been built
 10:48 \<bgmerrell\> does that sound reasonable?
 10:48 \<bgmerrell\> i think that is how other teams do it
 10:48 \<bgmerrell\> but i will need to discuss that with jared and stephen
 10:49 \<calen\> but they also would add something new except for bugs
 10:50 \<bgmerrell\> yes, true, but is it necessary to monitor \*everything\* in each rpm?
 10:50 \<bgmerrell\> the wiki pages are supposed to abstract that for us so we can see the progress
 10:53 \<bgmerrell\> i don't think it is necessary, but maybe i'm dumb :)
 10:53 \<calen\> i still have problem:( i think the best way is from builder, because just builder have the exactly idea which has been build
 10:54 \<bgmerrell\> i don't know anything about building.. does he know exactly what is being built?
 10:54 \<bgmerrell\> maybe ray knows
 10:54 \<calen\> if a developer make 'done' for one control or one bridge, but builder never include, we also can't do test for it
 10:56 \<bgmerrell\> but the builds are created at each revision automatically
 10:56 \<ray\> when devs commited the code, svn will add a revision number, then the build machine will build all the source code i think
 10:56 \<bgmerrell\> so any code that is checked it \*should\* be built
 10:56 \<calen\> oh..that make sense
 10:57 \<bgmerrell\> so maybe the developers just adding the revision number when they mark a bugged as fixed will be good enough
 10:57 \<bgmerrell\> and we can make sure that revision is built
 10:57 \<bgmerrell\> does that sound okay?
 10:57 \<calen\> great
 10:57 \<bgmerrell\> okay awesome, i will talk to knocte about that
 10:58 \<bgmerrell\> but i also wanted to talk about who should do the smoke tests...
 10:59 \<bgmerrell\> i think ray is a good candidate because he is also involved with the builds so he can troubleshoot any problems that are build related
 10:59 \<ray\> no problem
 10:59 \<bgmerrell\> and also he will allow the full-time QA people (calen and I) to focus on testing
 11:00 \<bgmerrell\> what do you think
 11:00 \<bgmerrell\> Calen?
 11:00 \<calen\> agree
 11:00 \<bgmerrell\> great
 11:00 \<ray\> so when rpms updated, i download all of them, install them to see if there are some broken one? or how to do that ?
 11:00 \<calen\> before i join novell, builder do this job in my before company...
 11:01 \<calen\> then he give our QA a test list..hehe
 11:01 \<bgmerrell\> calen: cool, on my previous team the QA automation team did it
 11:02 \<ray\> hehe, you work for Dale?
 11:03 \<bgmerrell\> ray: yeah.. when rpms are updated, you will (1) install them and make sure they all install properly (2) run the smoke tests using the test harness
 11:03 \<bgmerrell\> for now the smoke tests will just be tests.py, but that might change
 11:03 \<calen\> because builder should check all of the patches has been commit. sometimes developer say they have commit a patch in bugzilla but actuality they lost
 11:03 \<bgmerrell\> but we don't have any tests ready yet
 11:04 \<bgmerrell\> ray: yeah, he was me previous boss :)
 11:04 \<ray\> bgmerrell, just run tests.py
 11:04 \<ray\> just run that script ?
 11:04 \<bgmerrell\> ray: well, you will run local_run.py or remote_run.py, which rely on tests.py
 11:05 \<bgmerrell\> ray: do you have extra test/lab machines in china?
 11:05 \<ray\> yeah, i think i can use my desktop :)
 11:05 \<calen\> bgmerrell: yes, after they fix app closing issue, we can add form test into tests.py
 11:06 \<bgmerrell\> it would be good to run a test on each platform
 11:06 \<bgmerrell\> suse, ubuntu, and fedora.. but maybe we lack hardware
 11:06 \<bgmerrell\> you could run them in Provo and view the logs
 11:07 \<ray\> bgmerrell, for now, we only have suse package from monobuild :)
 11:08 \<bgmerrell\> ray: right, but for the future
 11:08 \<ray\> bgmerrell, oh exactly
 11:08 \<bgmerrell\> ray: maybe in the future i will set up smoke test vms in provo
 11:08 \<bgmerrell\> and you can just run your tests and look at the logs
 11:09 \<ray\> bgmerrell, no matter, i have those VM installed :) , i can test them for now :)
 11:09 \<bgmerrell\> for now you can just make sure the RPMs install, and you can just check to make sure some of the controls that are marked "done" appear in Accerciser
 11:10 \<ray\> ok
 11:10 \<ray\> that's clear
 11:10 \<bgmerrell\> but hopefully Calen's form test can be put into tests.py soon!
 11:10 \<calen\> hehe..i hope
 11:10 \<ray\> nice :)
 11:11 \<bgmerrell\> ray: then you can just send out an e-mail to the mailing list
 11:11 \<bgmerrell\> ray: Smoke tests pass! | Smoke tests fail! :)
 11:11 \<calen\> it can't be run but can't be exited
 11:12 \<bgmerrell\> yeah, so ray could even run it manually if he wanted
 11:12 \<bgmerrell\> when do you both go back to the office?
 11:12 \<ray\> ah, sound interesting :)
 11:12 \<calen\> Aug.26
 11:13 \<bgmerrell\> calen: do you understand how local_run.py and remote_run.py work?
 11:13 \<ray\> 25 i guess
 11:13 \<calen\> 25, yeah
 11:13 \<ray\> oops, from 25th, we have hack week
 11:13 \<calen\> bgmerrell: i think i understand
 11:13 \<bgmerrell\> calen: have you tried running remote_run.py before?
 11:14 \<calen\> bgmerrell: i just have tried one or two times
 11:14 \<bgmerrell\> calen: cool :) maybe you can show ray how they work when you get back to the office
 11:15 \<calen\> bgmerrell: np :)
 11:21 \<bgmerrell\> ray: so when you see an e-mail from stephen you can try to do smoke tests immediately, depending on the time of day of course :)
 11:22 \<ray\> bgmerrell, sure
 11:26 \<calen\> i have sent test howto to ray, it would be more helpful to him yet
 11:26 \<bgmerrell\> it looks like the developers are already adding the revision number to comments when they fix the bugs
 11:26 \<bgmerrell\> [https://bugzilla.novell.com/show_bug.cgi?id=412206](https://bugzilla.novell.com/show_bug.cgi?id=412206)
 11:27 \<bgmerrell\> [https://bugzilla.novell.com/show_bug.cgi?id=411345](https://bugzilla.novell.com/show_bug.cgi?id=411345)
 11:27 \<bgmerrell\> [https://bugzilla.novell.com/show_bug.cgi?id=416602](https://bugzilla.novell.com/show_bug.cgi?id=416602)
 11:27 \<calen\> yeah..i noticed it
 11:27 \<bgmerrell\> so we can just make sure those revisions are built if we need to
 11:27 \<ray\> yep
 11:27 \<bgmerrell\> calen: great, thanks calen (for sending test howto to ray)
 11:31 \<bgmerrell\> i forgot
 11:31 \<bgmerrell\> one more thing
 11:31 \<bgmerrell\> i already talked to Calvin about this, but i don't think we will use testopia
 11:31 \<bgmerrell\> testopia is used to track test cases
 11:32 \<ray\> oh due to we have svn ?
 11:32 \<calen\> yeah
 11:32 \<bgmerrell\> but i think we can consider each of our test scripts as test cases
 11:32 \<bgmerrell\> what do you think calen?
 11:32 \<calen\> i agree
 11:32 \<bgmerrell\> i think testopia will create too much "overhead"--additional work
 11:32 \<bgmerrell\> okay, awesome.
 11:33 \<bgmerrell\> we will need to update our test plan accordingly
 11:33 \<bgmerrell\> i can do that
