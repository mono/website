---
title: "Accessibility: QA Meetings 2009 May 20"
lastmodified: '2009-06-01'
redirect_from:
  - /Accessibility%3A_QA_Meetings_2009_May_20/
---

Accessibility: QA Meetings 2009 May 20
======================================

BEGIN LOGGING AT Wed May 20 22:17:02 2009
 May 20 22:17:02 \* Now talking on #mono-a11y-qa
 May 20 22:17:03 \* morbo gives channel operator status to calen
 May 20 22:17:07 \* bgmerrell (\~bean@166-70-62-135.ip.xmission.com) has joined #mono-a11y-qa
 May 20 22:17:08 \* morbo gives channel operator status to bgmerrell
 May 20 22:17:08 \* ngao (\~neville@123.117.188.223) has joined #mono-a11y-qa
 May 20 22:17:22 \* ray (\~dream@123.118.74.195) has joined #mono-a11y-qa
 May 20 22:17:25 \<calen\> bgmerrell, those are what we have talked in last QA meeting, sorry we make some delay to reply the reviews and verify bugs due to the ITO :)
 May 20 22:17:29 \<ray\> hey hey hey
 May 20 22:17:50 \* fecilia (\~chatzilla@123.112.38.218) has joined #mono-a11y-qa
 May 20 22:17:52 \<bgmerrell\> calen: no problem! i was expecting that
 May 20 22:18:08 \<bgmerrell\> hey hey hey ray ray ray
 May 20 22:18:14 \<calen\> ....
 May 20 22:18:15 \<ray\> :)
 May 20 22:18:30 \<fecilia\> hi guys
 May 20 22:18:39 \<bgmerrell\> So, I have been thinking
 May 20 22:18:51 \<bgmerrell\> since the developers aren't focusing on bug fixes right now
 May 20 22:19:00 \<bgmerrell\> things might be a little slow for you guys
 May 20 22:19:23 \<bgmerrell\> so I thought of a very important 3rd priority in addition to the two we discussed last time (and I just mentioned in #mono-a11y)
 May 20 22:19:47 \<bgmerrell\> since I have not had time to finish the dashboard, which will show the status of all the test results for every build
 May 20 22:19:58 \<bgmerrell\> we need to run these tests manually
 May 20 22:20:10 \<ray\> ok, that makes sense
 May 20 22:20:14 \<bgmerrell\> we'll have to do that until i'm done with the dashboard, which I will work on when i'm done reviewing
 May 20 22:20:30 \<bgmerrell\> so I would like Calen to divide up all the tests (you can all help her)
 May 20 22:20:49 \<calen\> sure
 May 20 22:20:59 \<bgmerrell\> and in your free time, just run the tests and check for new bugs or changes
 May 20 22:21:14 \<bgmerrell\> I have noticed quite a few bugs and bug fixes that have affected the tests as I review them
 May 20 22:21:40 \<bgmerrell\> sometimes a bug fix is incorrect, incomplete, or maybe the bug fix accidentally breaks something else
 May 20 22:21:47 \<bgmerrell\> so it is important that we continue running these tests
 May 20 22:22:02 \<calen\> yes, i agree
 May 20 22:22:15 \<bgmerrell\> I know there are (or were) a couple of P1 bugs that might affect a lot of tests
 May 20 22:22:34 \<bgmerrell\> I don't \*think\* it is necessary to comment out code if the bug affecting the test is a P1
 May 20 22:22:42 \<bgmerrell\> because it should be fixes fairly quickly
 May 20 22:22:47 \<bgmerrell\> s/fixes/fixed
 May 20 22:23:02 \<bgmerrell\> and then we'd just have to go back and uncomment the code a day (or a few days) later
 May 20 22:23:07 \<bgmerrell\> does that make sense?
 May 20 22:23:10 \<bgmerrell\> anyone disagree?
 May 20 22:23:17 \<calen\> make sense
 May 20 22:24:11 \* ngao agrees
 May 20 22:24:18 \<bgmerrell\> calen: I would also like it if you could read through our test plan wiki and update it to reflect some of these new things we are doing
 May 20 22:24:27 \<bgmerrell\> like bug references and anything else that is outdated
 May 20 22:24:31 \* fecilia agree
 May 20 22:24:45 \* ray nods
 May 20 22:24:50 \<bgmerrell\> calen has been on the QA team the longest, so she probably remembers the most details
 May 20 22:24:59 \<bgmerrell\> that's why i'm asking her.. if she accepts ;)
 May 20 22:25:12 \<calen\> ok, I will log it into my schedule
 May 20 22:25:21 \<bgmerrell\> calen: thanks, it's not a high priority
 May 20 22:25:39 \<bgmerrell\> just something we should do for anyone who joins the project in the future
 May 20 22:25:51 \<calen\> BTW, how long time or how many versions would be better to run the test , have any idea?
 May 20 22:26:35 \<calen\> oh, it's not correctly to explain
 May 20 22:26:51 \<bgmerrell\> I dunno.. Maybe a good goal would be to run 5 tests a day, and just restart when you have gone through all your tests
 May 20 22:26:56 \<bgmerrell\> of course, it is the 3rd priority
 May 20 22:27:13 \<bgmerrell\> so if you get less than 5 done that's fine
 May 20 22:27:29 \<calen\> sure
 May 20 22:27:36 \<bgmerrell\> or if you find a new bug when running the test and you spend all day investigating it, that's fine too
 May 20 22:27:57 \<calen\> haha..
 May 20 22:28:13 \<bgmerrell\> we won't run the tests manually anymore once we start working on phase 2
 May 20 22:28:25 \<bgmerrell\> but i think doing it now will help us make the 1.1 release a lot better
 May 20 22:28:55 \<ray\> absolutely
 May 20 22:29:21 \<bgmerrell\> anyway
 May 20 22:29:22 \* calen nod
 May 20 22:29:25 \<bgmerrell\> that's all i wanted to talk about
 May 20 22:29:29 \<bgmerrell\> anyone else have something
 May 20 22:29:30 \<bgmerrell\> ?
 May 20 22:30:00 \<bgmerrell\> so here are our priorities:
 May 20 22:30:03 \<bgmerrell\> in summary
 May 20 22:30:08 \<bgmerrell\> 1. review my reviews of your Strongwind tests
 May 20 22:30:13 \<bgmerrell\> 2. verify bug fixes daily and update test scripts by grepping for BUG references for fixed bugs
 May 20 22:30:26 \<bgmerrell\> 3. run a few tests a day and check for new bugs
 May 20 22:31:33 \* ray logs
 May 20 22:32:29 \* fecilia got it
 May 20 22:32:40 \<calen\> fecilia, and ngao maybe will need help more on (3), because Ray and me have many reviews and bugs wait us,
 May 20 22:32:52 \<bgmerrell\> ngao: ping
 May 20 22:33:12 \<calen\> also can helps on (2) if they agree :)
 May 20 22:33:34 \<bgmerrell\> do you guys have extra test machines in China?
 May 20 22:33:34 \* fecilia very glad to help on all:)
 May 20 22:33:51 \<fecilia\> yes
 May 20 22:33:58 \<calen\> we have another desktop
 May 20 22:34:00 \<fecilia\> I have two machines
 May 20 22:34:06 \<bgmerrell\> for example, do you have a machine that you could host VMs of a 32-bit and 64-bit version of openSUSE 11.1 ?
 May 20 22:34:40 \<calen\> yes,
 May 20 22:34:46 \<fecilia\> yes I have
 May 20 22:35:08 \<bgmerrell\> calen: that's fine calen (about your comment on 3)
 May 20 22:35:37 \<bgmerrell\> cool, I think I have something cool ngao could work on
 May 20 22:35:43 \<calen\> do you like us run tests on difference platform?
 May 20 22:35:59 \<calen\> or just like ngao to do that :)
 May 20 22:36:38 \<bgmerrell\> calen: it's probably a good idea for at least one person to be running 64-bit if possible
 May 20 22:37:03 \<bgmerrell\> but I wouldn't worry about testing everything on both platforms, because our test harness will do that
 May 20 22:38:31 \<bgmerrell\> i think it would be too time-consuming for us to do it
 May 20 22:38:47 \* calen nod
 May 20 22:39:18 \* bgmerrell wonders if ngao fell asleep at the keyboard
 May 20 22:39:22 \<bgmerrell\> ;)
 May 20 22:39:44 \<calen\> :)
 May 20 22:40:02 \<bgmerrell\> that's alright, it's not urgent
 May 20 22:40:11 \<bgmerrell\> have a good night everyone :)
 May 20 22:40:33 \<calen\> thanks, have a good day :)
 May 20 22:40:59 \<fecilia\> bgmerrell,hehe have a good day :)
 May 20 22:41:46 \<calen\> honestly, i fell sleepy:) last night, i just got 3 hours sleep...
 May 20 22:42:16 \<bgmerrell\> calen: yikes! :( that is not enough!
 May 20 22:42:19 \<fecilia\> calen: have a good sleep, hope you have a good sleep
 May 20 22:43:22 \<calen\> bgmerrell, welcome your email if you have some else, and thanks your reviews, it help me a lot :)
 May 20 22:43:25 \<calen\> fecilia, thanks
 May 20 22:43:45 \<calen\> good night everyone!
 May 20 22:44:15 \<ray\> gnite
 May 20 22:47:08 \<ngao\> hey guys, sorry
 May 20 22:47:54 \<bgmerrell\> no problem!
 May 20 22:48:35 \<bgmerrell\> ngao: i was thinking of something that might be good for you to hack on
 May 20 22:49:11 \<bgmerrell\> ngao: have you seen my dashboard?
 May 20 22:49:39 \<ngao\> bgmerrell: yes
 May 20 22:49:44 \<bgmerrell\> [http://uiaqa.sled.lab.novell.com/dashboard/dashboard.xml](http://uiaqa.sled.lab.novell.com/dashboard/dashboard.xml)
 May 20 22:49:47 \<bgmerrell\> cool
 May 20 22:50:28 \<ngao\> bgmerrell: oh, i was thinking RB
 May 20 22:50:51 \<fecilia\> ngao: what is RB?
 May 20 22:51:05 \<ngao\> fecilia: review board
 May 20 22:51:33 \<ngao\> bgmerrell: ok, i see dashboard now
 May 20 22:51:35 \<fecilia\> o I mix it with RP.
 May 20 22:51:50 \<ngao\> fecilia: hehe
 May 20 22:52:35 \<bgmerrell\> ngao: if you have some spare time, it might be cool for you to set up a machine with two VMs (32-bit and 64-bit openSUSE 11.1 VMs) and see if you can run the test harness code against them (i.e., tests running on both VMs simultaneously) and have the dashboard update with the log results
 May 20 22:53:39 \<ngao\> bgmerrell: run test/harness/local_run.py?
 May 20 22:54:06 \<bgmerrell\> ngao: yeah, but you would be usuing remote_run.py (which basically calls local_run.py on the test VMs)
 May 20 22:54:27 \<bgmerrell\> ngao: [Accessibility:_Testing_Howto#Strongwind_Test_Harness](/archived/accessibility_testing_howto/#strongwind-test-harness)
 May 20 22:54:30 \<bgmerrell\> that explains how it works
 May 20 22:54:36 \<bgmerrell\> but there is some really cool code to work with there
 May 20 22:54:57 \<bgmerrell\> i use inotify to detect new logs for the dashboard to update
 May 20 22:55:05 \<ngao\> bgmerrell: sure, i'll read the wiki and set up VMs to run tests
 May 20 22:55:13 \<ray\> actually that's what i was thinking in few days before, I could help if ngao needs.
 May 20 22:55:18 \<bgmerrell\> the XML logs are parsed by the XSLT to be displayed on the dashboard
 May 20 22:56:05 \<bgmerrell\> ray: yeah, that's would be fine. but everyone should focus on the top 3 priorities first
 May 20 22:56:10 \<ngao\> ray: it would be great :)
 May 20 22:56:22 \<ray\> ngao, ok, we can cooperate
 May 20 22:56:26 \<bgmerrell\> ngao hasn't written many tests, so he won't have many tests reviews
 May 20 22:56:43 \<ray\> bgmerrell, yep :)
 May 20 22:56:50 \<ngao\> bgmerrell: I should ssh to dashboard to modify results?
 May 20 22:57:07 \<bgmerrell\> ngao: no.. basically this is what happens
 May 20 22:57:39 \<bgmerrell\> 1. you set up the VMs, which will both mount a common CIFS/NFS share where the logs will be stores
 May 20 22:57:46 \<bgmerrell\> (there is other setup)
 May 20 22:58:09 \<bgmerrell\> 2. you will run remote_run.py (after configuring machines.py), which will run local_run.py on each of the machines in machines.py
 May 20 22:58:54 \<bgmerrell\> 3. when the tests finish on the remove machines (i.e., the machines in machines.py) the logs should be stored in the common shared CIFS/NFS share
 May 20 22:59:03 \<bgmerrell\> (you will need to configure that too)
 May 20 22:59:09 \<bgmerrell\> s/remove/remote
 May 20 22:59:22 \<fecilia\> interesting
 May 20 22:59:53 \<ngao\> cool. thanks for explaining
 May 20 22:59:59 \<ngao\> bgmerrell: \^
 May 20 23:00:08 \<bgmerrell\> 4. test/tools/dashboard/qamon.py will be running on the machine that is hosting the CIFS/NFS share
 May 20 23:00:21 \<bgmerrell\> and qamon.py uses inotify to detect when new log files are created
 May 20 23:00:35 \<bgmerrell\> when it detects new files, it rebuilds the dashboard.xml
 May 20 23:00:45 \<bgmerrell\> so it is all 100% automated, it's pretty neat
 May 20 23:01:00 \<bgmerrell\> it just needs some polishing and you might notice bugs as you set it up
 May 20 23:01:18 \<ngao\> awesome
 May 20 23:01:49 \<bgmerrell\> i would suggest having a phsyical machine that hosts the NFS/CIFS share \*and\* the two VMs
 May 20 23:01:57 \<bgmerrell\> it would make the setup quite simple
 May 20 23:02:15 \<bgmerrell\> here in Provo we have like 7 physical machines .. one hosts the CIFS/NFS share and the other 6 have 2 VMs each
 May 20 23:02:41 \<bgmerrell\> so that is the configuration it will be using officially
 May 20 23:02:43 \<ngao\> bgmerrell: yeah, I have a desktop that could host 2 VMs
 May 20 23:02:56 \<bgmerrell\> i can imagine all tohse machines going to China some day, but I don't really know that
 May 20 23:03:09 \<bgmerrell\> s/tohse/those
 May 20 23:03:12 \<bgmerrell\> ngao: sweet
 May 20 23:03:38 \<ngao\> bgmerrell: can't wait to get them :)
 May 20 23:04:30 \<fecilia\> bgmerrell, ngao:cool, I want to try it too.
 May 20 23:05:06 \<ngao\> fecilia: nice
 May 20 23:05:59 \<bgmerrell\> ngao: notice that when you click on one of the links on dashboard, it links to a log of the RPMs installing (if the RPMs were updated) and the test running
 May 20 23:06:03 \<bgmerrell\> for example, [http://uiaqa.sled.lab.novell.com/uiaqa_logs/suse64v0_package_status](http://uiaqa.sled.lab.novell.com/uiaqa_logs/suse64v0_package_status)
 May 20 23:06:15 \<bgmerrell\> the number at the very top is the test status
 May 20 23:06:18 \<bgmerrell\> 0 is pass, 1 is fail
 May 20 23:06:39 \<bgmerrell\> I use this to determine the color of the light icon on the dashabord
 May 20 23:06:42 \<bgmerrell\> dashboard
 May 20 23:06:47 \<bgmerrell\> i.e., red or green
 May 20 23:07:22 \<bgmerrell\> the problem is that the log is only for the most recent test run
 May 20 23:07:56 \<ray\> bgmerrell, why don't you host the log by a version control system?
 May 20 23:08:07 \<bgmerrell\> which basically is a race condition depending on which architecture finishes testing first
 May 20 23:08:39 \<bgmerrell\> so I was thinking that the link on the dashboard should go to another page of links for each of the most recent tests for each architecture and distro
 May 20 23:08:50 \<bgmerrell\> but you can look at what would be best
 May 20 23:09:34 \<bgmerrell\> ray: and just have a cron job to 'svn up' or 'git pull'?
 May 20 23:10:21 \<bgmerrell\> (not sure if i understand what you're suggesting)
 May 20 23:10:39 \<ray\> bgmerrell, no I mean using a version control system to monitor the logs, in that way, you may could review the logs which is not most recent. . :X
 May 20 23:12:45 \<bgmerrell\> ray: well, qamon.py just builds the dashboard whenever a log file is updated
 May 20 23:12:59 \<bgmerrell\> ray: the logic to determine which log files to display can be completely changed
 May 20 23:13:07 \<bgmerrell\> even the structure of how the logs are saved
 May 20 23:15:03 \<ray\> bgmerrell, ok, sounds good, it's cool :)
 May 20 23:17:25 \* ngao is now known as ngao|brb
 May 20 23:35:58 \* fecilia has quit (ChatZilla 0.9.84 [Firefox 3.0.6/2009011913])
 May 20 23:37:12 \<ray\> hey guys, gotta to off for some sleep
 May 20 23:37:14 \<ray\> bgmerrell, thank you, I'll look at your changes for my tests tomorrow. :)
 May 20 23:38:19 \* ray has quit (Leaving)
 May 20 23:53:17 \* ngao|brb is now known as ngao
 May 21 00:01:54 \* ngao has quit (Leaving)

