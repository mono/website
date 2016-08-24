---
title: "Accessibility: Team Meetings 2008 May 15"
lastmodified: '2008-05-15'
redirect_from:
  - /Accessibility%3A_Team_Meetings_2008_May_15/
---

Accessibility: Team Meetings 2008 May 15
========================================

Meeting Summary
---------------

    Attendants: bgmerrell, calen, calvin, jpallen, knocte, marioC, mgorse, ngao, raywang, sandy, vinnie

    Topic--remaining open positions on team(jared)
        2 development positions to fill in Beijing (not sure one of the candidates is going to accept)
        1 build manager and 1 build/qa position left to fill( Decriptor will ready to start as build manager on Monday, June 2nd)
        1 project manager or development manager.

    summarize: we still have 4 open positions. everyone can make some recommendations (sandy, mgorse, knocte have do that) .
    question 1: the different between devmgr and prjmgr?
        there are various responsibilities that are common between both of them, but a devmgr has direct reports and a prjmgr does not

    Topic--detailed breakdown of phase 1 architecture (calvin)
    the main page: Accessibility (have a bit of changed)
    Architecture document: Accessibility:_Architecture (have expanded)
        In phase 1: focus on the Provider side->
            Four logical sections of work to be done:
                   1.mgorse: is doing on port at-spi to DBUS, we will be investigation moving all of our work over to use it and perhaps extend it once mgorse done that work. (that is not part of agreement with Microsoft)
                   2.andres: fix up everyone's bindings in managed code to ATK (can't communicate to ATK without that)
    3.a largest number of us: Bridge from UIA to ATK
    4.a largest number of us: Enable winforms controls to be accessible using UIA

            About testing:
            we have two main products(projects) in phase 1:
                1.winforms
                2.building out the UIA Provider interfaces for any app or UI to use.
                        Brian and Calen: need to consider how testing is going to integrate into testing and verifying the UIA Provider interfaces? test all of the classes to make sure their enums  and such were valid. (will discuss it in a later meeting)

    Topic--phase 1 development roadmap (calvin)
    roadmap: Accessibility:_Roadmap
    schedule: Accessibility:_Project_Schedule
            1.notes: the iterative schedule is fluid: you should adjust the next iteration if you take longer than a weed, you should move on to next week's stuff if you take less than a week, you should change sequence of winforms controls and UIA control types if there is work that needs to be done in a specific order.
            2.task: MarioC and Sandy would talk and swap some controls in the iteration,
                        All people take a look at the schedule and do a planning on their own,

    iteration planning:  what need to be adjusted?
        1.CheckedListBox can be swapped with LinkLabel (MarioC),
        2.will work on Form and RadioButton in Iteration 1 - May 19 – 23 (Sandy),
        3.change item by a controltype that is already done, instead of the List, the Label (knocte)
        4.it might be a good idea to list out in this table, which control type the MWF control is going to use (sandy and MarioC)
        5.adjust interation1 to set up a test framework and start playing with controls that are done (Brian, Calen),
        6.we already have gtk-sharp free of patches to apply, so the packaging could start, we could do a branch for the winforms patch (Raywang)
        7.Ngao are going to be jumping in on the MWF control work. now ngao should look at the work sandy and MarioC have done and are doing, understand the architecture well, and then begin implementing interfaces on perhaps a more simple control. (Ngao)
        8.Add mgorse's work into the wiki. (mgorse)
        9.everyone should have tasks every interation to replase the status report/blog thing
        10.we need to keep status pages (cover each section of the project, MWF, provider controls, testing) up to date those are listed at the top of the schedule wiki page

    Topic--Open A11y working group (mgorse)
        it's a working group of the Linux Foundation that focused mostly on a11y issues under Linux. They have conference calls a lot of weeks on Tuesdays at 18:00 UTC. They have a wiki page on www.linux-foundation.org under workgroups.  don't anyone have to attend except if you are interested.

RAW IRC Capture
---------------

    --- jpallen has changed the topic to: ** UI Automation Team Meeting in Progress ** Topic:  Introduction
    <jpallen> ok.  should we get started?
    <RayWang> i'm ready
    <jpallen> alright
    here are the agenda items we plan on covering today:
    - remaining open positions on team (jared)
    <jpallen> - detailed breakdown of phase 1 architecture (calvin)
    - phase 1 development roadmap (calvin)
    <jpallen> - phase 1 development assignments (jared)
    we will probably have some time at the end for any other subjects that may come up, so please don't be shy
    i should also mention that the majority of what we will be covering is development-related
    we will cover some QA stuff
    but we will dive deeper into QA in our next meeting
    it will help our QA planning efforts a lot by getting a good development plan in place, which is what we are doing today
    so, let's start with our first agenda item:  remaining open positions on team (jared)
    --- jpallen has changed the topic to: ** UI Automation Team Meeting in Progress ** Topic:  remaining open positions on team (jared)
    <jpallen> (oh, i should mention that Calen has graciously agreed to take notes for us)
    thanks Calen!
    <Calen> you are welcome!
    <jpallen> so, we have been very busy putting this team together over the past few months
    I am very please with everyone we have on the team
    we still have a few remaining positions to fill
    we have 2 more development positions to fill in Beijing
    i was there a few weeks ago doing a lot of interviewing
    Calen, Ray and Neville all helped with the interviews as well
    we had some good candidates
    one, in particular, that I have made an offer to
    however, I'm not sure he's going to accep :-(
    he is leaning towards some other opportunities
    <RayWang> ok...
    <jpallen> but, I will keep trying to explain to him what a big mistake it is to pass this awesome opportunity up! :)
    we also have a build manager and build/qa position left to fill
    <jpallen> calvin and brian have been helping me do some of the interviews for those positions
    <jpallen> i made an offer to someone for the build manager position yesterday
    he accepted
    <sandy> woo hoo!
    <jpallen> yeah!
    <RayWang> it means i have a partner for build package?
    <jpallen> we just need to finish up the paperwork (I'm working with HR on this) and he should be ready to start on Monday, June 2nd
    <Calen> great!
    <jpallen> yes!
    poor Ray has felt sooo lonely ;-)
    <RayWang> jpallen: :)
    <jpallen> we have another candidate for the build/qa position that we interviewed
    <jpallen> calvin has sent him the test and we hope to hear back from him soon
    <jpallen> he is an acquaintance of Brian's
    <calvin> BTW, the person that accepted is decriptor, and he's on the channel now and has been hanging out here for the last couple of days
    <jpallen> ah!
    hello Stephen!
    <calvin> (don't know if he's actively here, but he is here)
    <jpallen> right
    that's awesome that he is already hanging out here
    --- calvin gives channel operator status to decriptor
    <knocte> decriptor: welcome!
    <sandy> welcome decriptor
    <MarioC> hey decriptor!
    <RayWang> decriptor: welcome.
    <ngao> decriptor, welcome
    <Calen> welcom decriptor
    * calvin feels like we just went through some strange welcoming ritual
    <mgorse> Welcome, decriptor :)
    yeah, felt like I had to join in the chorus
    <jpallen> the last position to fill is a project manager or development manager
    <knocte> :D
    <jpallen> calvin and i have been sharing this load up to now
    <jpallen> depending on what kind of candidates we get, i will hire either a PjM or DevMgr
    so, that is a total of 4 positions left
    the best candidates are almost always referrals from people on the team
    so, please, don't be shy about making some recommendations :)
    <sandy> jpallen: is there a job posting for the devmgr that's different than the prjmgr posting?
    <jpallen> sandy: no
    <sandy> I had a friend who was asking about those sorts of jobs at Novell
    <jpallen> cool
    send me his resume
    <sandy> but he doesn't have much community experience
    <jpallen> ok
    <sandy> lots of good work experience, though
    <mgorse> jpallen: Could you explain the difference between a project manager and a development manager?
    <sandy> I'll ping him again and see if he's still looking
    <jpallen> community experience is very important, but it is not everything
    ok
    <mgorse> jpallen: I'll also ping the person I mentioned to you
    <jpallen> mgorse: ok
    <knocte> jpallen: the only recommendation I have is the one I already sent you some time ago, but he's a developer
    <jpallen> the biggest difference between a project manager and a development manager is that a development manager has direct reports and a project manager typically does not
    knocte: ok.  thanks
    <sandy> jpallen: oh, my friend wants to stay in San Diego...is that possible?
    <jpallen> so, there are various responsibilities that are common between both positions
    <jpallen> i am prepared to be a bit fluid in regard to what responsibilities will ly with calvin, me and this new hire
    <jpallen> it all depends on the candidate experience
    the good news is:  there is plenty of opportunity to learn new things for each position on the team
    <calvin> jpallen: so if you end up hiring a Dev-Mgr, we'll report to them, and they report to you or Kelli?
    <jpallen> i like to see people step up and take responsibility on themselves
    <jpallen> calvin: the plan is that the dev mgr would report to me
    <jpallen> so, any questions about the remaining positions on the team and the plan there?
    <RayWang> jpallen: I have no problem.
    <jpallen> so, just a reminder to everyone:  please think of good candidates and send me their resumes! :)
    (especially the folks in Beijing)
    <RayWang> jpallen: ok, thanks :)
    <ngao> ok
    <knocte> well, now I'm thinking as a friend of mine (he works in Oracle now) but then I'm interested in the question that sandy made: would he work from home?
    <jpallen> knocte: good question
    my preference is always to have people together in an office
    <sandy> :-)
    <jpallen> but, good experience/abilities will override location
    <knocte> ok
    <jpallen> sandy will be in Provo someday, he's just slowly making his way here:  San Diego -> Las Vegas -> (Provo) :)
    <knocte> :D
    <sandy> heh hehh :-)
    <calvin> sandy, better start checking out St. George
    <jpallen> ok.  let
    <sandy> hope I don't get stuck somehwere in between...
    <jpallen> lol
    St. George is doable, but I'm not sure about the other's in between
    --> peteb_ (~ptbrunet@user-0vvdbck.cable.mindspring.com) has joined #mono-a11y
    <jpallen> ok.  let's move on to the next topic:  detailed breakdown of phase 1 architecture (calvin)
    <jpallen> now we're on to the fun stuff :)
    <jpallen> i'll let calvin take this one
    --- jpallen has changed the topic to: ** UI Automation Team Meeting in Progress ** Topic:  detailed breakdown of phase 1 architecture (calvin)
    <calvin> I've done a bit of Wiki work the last week or two on getting things cleaned up
    The main page is organized now in a way that make sense I hope: Accessibility
    Please look through it and either make changes or suggest them
    but on to the Architecture....
    I've also expanded the Architecture document: Accessibility:_Architecture
    Most of you are now familiar with this but perhaps the extra documentation will help explain the details
    I think I'll just give an overview of the way we are going to map from UIA to ATK and allow you to ask questions
    Many of you are familiar with this because you are working on it but I want to review for the rest of the team
    If you look at the Architecture page, I'm going to talk about the Provider details
    for the first phase of the project, we are only concerned with the Provider side of the entire architecture
    I shouldn't say only concerned, we are should be concerned about both sides, but our focus is on the Provider side
    So as far as engineering work, there are really three logical sections of work to be done, well, actually four that we are doing
    The first section is actually not part of our agreement with Microsoft, but it's important to making Linux accessible
    That's the work mgorse is doing on at-spi
    mgorse: is heavily involved in an effort to port at-spi to DBUS
    I'm not going to go much into that, but the work he is doing is somewhat disconnected from the rest of the team (for now)
    Once that work is closer to being done, we'll be investigating moving all of our work over to use it and perhaps extend it
    So let me focus now on the other three logical components of the work
    knocte: (Andres) has been doing a lot of work on fixing up our bindings to ATK (not just our bindings, but everyone's bindings in managed code)
    This is critical because without those, we cannot communicate to ATK
    <knocte> yeah and there are still some issues :(
    <calvin> knocte: indeed, and that will be an area we will need you to continue to focus on
    <knocte> ok
    <calvin> the second logical component is the Bridge from UIA to ATK
    and the last is enabling winforms controls to be accessible using UIA
    These last two components are going to involve the largest number of people so I will focus on them
    Much of this is in the document but I'll explain the way things work as a review
    The way an application enables itself to UIA is by implementing interfaces defined in the UI Provider
    hmm, maybe it's not worth me typing all of this information here when it's already in the wiki
    I guess maybe I should ask, has everyone had a chance to read over the Architecture document and does anyone have questions about it?
    * calvin thinks everyone is reading it now
    <MarioC> I don't
    <knocte> heh, I have read the majority I think
    <MarioC> I mean.. I don't have any questions...
    <mgorse> calvin: Have yo umodified it again since you asked us to look at it a couple days ago?
    <RayWang> calvin: so the orange part on the Architecture are the parts we shou\ld implement?
    <calvin> mgorse: maybe only slightly
    OK, so perhaps it's a good time to go over what people on the team will be focusing on
    But let me talk about something first
    calvin Calen
    ... and this will be important to bgmerrell and Calen
    well, all of us, but more to them
    <Calen> :)
    <calvin> We actually have two main products or projects we are building in this first phase
    I'm afraid most of my communications with bgmerrell and Calen have been about one, the winforms effort
    Making winforms accessible is important and we are focusing a lot on that, but in reality, that is only a part of the phase 1 work
    The other part is building out the UIA Provider interfaces for ANY application or UI to use
    So we'll need to look at how testing is going to integrate into testing and verifying the UIA Provider interfaces
    Engineering is/has been building unit tests to verify values and such (is that right Sandy)? but our testing may need to go beyond that
    Probably something we can discuss in a later meeting
    ok, jpallen did you want to advance to the next topic?  I'm not sure what else to cover on the architecture unless people have questions
    <sandy> calvin: we haven't been testing non-winforms implementations of UIA interfaces yet, if that's what you mean
    <calvin> sandy: no, I just meant unit tests for all of the classes, making sure their enums and such were valid?
    <sandy> calvin: oh, right, there are many of those
    <jpallen> ok.
    <jpallen> let's move on to: phase 1 development roadmap (calvin)
    --- jpallen has changed the topic to: ** UI Automation Team Meeting in Progress ** Topic:  phase 1 development roadmap (calvin)
    <calvin> So I've had a roadmap out there on the wiki for some time now
    Accessibility:_Roadmap
    and it hasn't really changed
    most of that roadmap comes from our agreement with Microsoft
    so it's a fixed thing
    What we haven't had is a real schedule
    one that really breaks down the work
    So starting on Monday, we are going to begin to work in 1 week iterations
    Accessibility:_Project_Schedule
    For those that have not worked in iterations, they are basically a period of time where each member of the team will have tasks assigned to them
    So if you look at that page, you'll see we have 26 iterations defined
    <jpallen> i have a couple of comments about iterative development
    <calvin> I went through and looked at how much time we have to finish phase 1, and broke down the work (roughly) into the iterations
    jpallen: do you want to do that now?
    <RayWang> calvin: may i ask you a question?
    <jpallen> calvin: yes
    <calvin> RayWang: yes, but why don't we let jpallen go first
    <jpallen> keep in mind that the iterative schedule is somewhat fluid
    <RayWang> calvin: yes, i am waiting for him. :)
    <jpallen> calvin has broken things down using the calendar and the list of controls, etc.
    <jpallen> however, it is no absoslute
    for example
    if you have a provider interface to implement in a given week and it takes longer than a week, we adjust things in the next iterateion
    iteration
    if it happnes to take much less then a week, you should move on to next week's stuff
    that's all :)
    <jpallen> back to you calvin
    <calvin> ok
    So not only is that true, but the order in which things are done is not fixed by any means
    Most of the WinForms controls and UIA Control Types were entered alphabetically
    <jpallen> good point
    <calvin> If there is work that needs to be done in a specific order, change it in the iterations... for example
    sandy pointed out that it probably doesn't make sense to build the "Checked ListBox" in iteration 1 when we haven't done the "ListBox" until Iteration 8
    I would expect MarioC to catch that and change the iteration
    <MarioC> Yep
    <calvin> In this case MarioC and Sandy would probably talk and swap some controls because MarioC has Checked ListBox and Sandy has ListBox
    However... I don't think we should do all of that adjusting up front
    <jpallen> so, people need to really take a close look at what you have in the schedule and do a little bit of planning on their own
    <calvin> and, there will need to be some cross planning between the work Sandy and MarioC are doing, and the work knocte and I will be doing
    <jpallen> time check:  i have a hard stop in 5 mintues
    <calvin> I tried to match things up there as well so when a List is being implemented, the List Control type will also be implemented, but I'm sure it's not exactly perfect
    ok
    So, we will need to have some iteration planning meetings
    <jpallen> yes
    <calvin> where we will decide before each iteration, what is actually going to be done, and make adjustments each week
    <jpallen> so, i think RayWang still has a question?
    <calvin> Once we have those meetings, I would expect the information in the Wiki to be much more elaborate that what is there now
    <sandy> knocte mentioned yesterday that maybe it would be better for the UIA/ATK mappings to happen the iteration after the relevant UIA Providers have been implemented
    <RayWang> yes
    <calvin> sandy: agreed on that point
    <RayWang> calvin: i noticed that Neville and me are not covered on the Project_Schedule page  so what should we do now?
    <calvin> RayWang: I only broke down the work for the components that are going to drive everyone else's work
    In fact, the WinForms Controls are really going to determine what everyone else does
    calvin Calen
    bgmerrell and Calen will be filling out their work in the iterations as we go
    Everyone should have tasks in the iterations
    The tables are far from complete,  they are only a skeleton of what is coming
    <RayWang> ok
    <jpallen> so, i was hoping to cover some of what calvin is saying in the next agenda item
    <ngao> i see
    <jpallen> we definitely did not forget about Ray or Neville
    <calvin> jpallen: ah, are you good on time or do you need to drop out?
    <jpallen> however, I've got another meeting i have to join right now
    <jpallen> calvin, can you take it from here?
    <calvin> jpallen: sure
    <jpallen> thanks
    before i leave
    * calvin looks at the agenda
    <jpallen> let me say that we need to have a similar meeting with qa
    <jpallen> let's digest what calvin has put on the wiki and fill out the iterations with qa work
    <jpallen> ray, i would like you to be involved with that
    <RayWang> jpallen: sure, i will!
    <jpallen> neville, can you remind all of us when you start full-time?
    <ngao> yes
    july 1st
    <jpallen> ok
    good
    so we will keep that in mind as we fill out the iterations more
    you will be given some assignments
    <ngao> ok
    <jpallen> ok.  i have to join another meeting (on the phone)
    <jpallen> so, calvin, please keep things going
    <calvin> so I think rather than try to schedule another iteration planning meeting, we'll just do it here and now
    then everyone will have a good idea of what they will be doing in the coming week
    and have a good idea of how the planning meetings work
    well, I don't know how they work yet, we've never had one, but we'll figure it out now and improve them as we go
    <sandy> :-)
    <calvin> So let's all look at iteration 1
    The first thing I'll ask is to the people already listed, what changes should we adjust?
    or what needs to be adjusted?
    Andres, how much time do you need to dedicate to the bindings still?
    <RayWang> calvin: should i do something in iteration 1?
    <MarioC> I think CheckedListBox can be swapped with LinkLabel
    <calvin> RayWang: yes, we'll get to that in a moment, ngao too
    <RayWang> calvin: ok, thanks. :)
    <ngao> ok
    <calvin> MarioC: ah... want the easy stuff first?
    heh
    <sandy> Since Button and CheckBox are already started, I expect I'll work on Form and RadioButton next week as well (not sure I'll finish Form)
    <knocte> I would change my item by a controltype that is already done (for example, instead of the List, the Label)
    <calvin> knocte: sounds good
    <MarioC> calvin, ;)
    <knocte> calvin: I don't know, I'll have to figure out with mkestner
    <knocte> but we have already some workarounds to be able to keep on working on the bridge
    <calvin> knocte: there isn't a Label control type, what did you mean?
    <knocte> oh, then it's called Text I think
    I meant the Label MWF control
    <calvin> ah yes
    hmm
    sandy and MarioC, it might be a good idea for you guys to list out in this table, which control type the MWF control is going to use
    <bgmerrell> will qa have code that can actually be packaged, installed, and tested against by iteration 1?
    <calvin> bgmerrell: packaged?  not sure about packaged, but installed and tested yes
    But if we could do packaging, that's what RayWang would do
    <sandy> bgmerrell: see Accessibility:_BuildingProviderSide
    <RayWang> yes,
    <calvin> What does everyone think?
    <MarioC> calvin, It's listed in Accessibility:_Control_Status, however we can list it again
    <calvin> knocte: I brought this up earlier and you seemed to think it was too early
    <bgmerrell> okay, so we'll need to adjust our iteration 1.. we'll probably use it to set up a test framework and maybe start playing with controls that are done, like Label.
    <calvin> the packages would only be used for testing to install our stuff and run automated tests on it
    <bgmerrell> Calen: does that sound right?
    <calvin> not for general distribution
    <knocte> calvin: well, right now no, because we already have gtk-sharp free of patches to apply
    <Calen> bgmerrell: yeah..
    <sandy> I'm wondering how we'd package up System.Windows.Forms.dll
    <bgmerrell> sandy: thanks for the link
    <sandy> bgmerrell: that page is very developer-centric, but it at least shows the steps required right now
    <knocte> so the packaging could start (because the workarounds for lacking glib-sharp/atk-sharp work now lay on the bridge itself)
    <calvin> ok, so RayWang it sounds like you have a good task for this iteration
    <knocte> except what sandy points out, right
    we could do a branch for the winforms patch
    <RayWang> sure
    <sandy> yeah, the winforms patch is really just proof-of-concept level
    <calvin> sandy: yeah, but we can just take from SVN, and then apply the patch in the build process
    <knocte> yep
    <calvin> but at least testing won't have to worry about building and applying patches, that's why we have RayWang!
    <sandy> calvin: sure, but would it be an entire mono package, or just mono-winforms, or what?
    <calvin> and decriptor when he is on board
    <sandy> I guess RayWang will figure out :-)
    <calvin> sandy: it will be whatever is needed!
    <sandy> it does look like it would just be a modified version of the mono-winforms package
    <calvin> ngao: I think you are going to be jumping in on the MWF control work
    <RayWang> what i should do is packaging the programs which helps to set up the environment?
    <calvin> RayWang: yes, so for this week,  much of your work will be discovering what needs to be packaged, and how to package it
    <ngao> calvin, ok,
    <calvin> RayWang: well, package and build
    <RayWang> calvin: make sense
    <calvin> so sandy and MarioC, you guys will need to help ngao come up to speed
    <sandy> sure thing boss
    <MarioC> y
    <calvin> ngao: I would expect you to look at the work they have done and are doing, understand the architecture well, and then begin implementing interfaces on perhaps a more simple control
    and sandy and MarioC can help with picking something good to "cut your teeth" on
    <sandy> so ngao will mostly be working on implementing providers?
    <ngao> calvin, ok, i see
    <calvin> ok, so before the weekend, let's have everyone update their tasks in iteration one to show what they will be working on
    and if you remove an existing task, make sure you either put it on the last open iteration, or swap it out somewhere so we don't lose it
    <RayWang> sure
    <calvin> Any questions on how this all works?
    <mgorse> calvin: Does what I'm working on need to be on the wiki, too?
    <calvin> mgorse: yes!  wow, thanks for the reminder
    <sandy> calvin: actually, I think I'll just add in a container control like GroupBox
    <calvin> oh good point
    so everyone should have tasks every iteration
    In a way, this is going to replace the status report/blog thing we were doing
    Your work is going to be tracked on this wiki page
    and hopefully jpallen is going to hire someone to do this so I don't have to
    <sandy> :-)
    <calvin> one more point that sandy brought up
    If you finish work early and are going to start on the next weeks iteration, if you think you can finish the work, bring it up into the current iteration
    Also, once an iteration is passed, I'll move it to the bottom of the wiki page so the current iteration is always at the top of the page
    Now, one last thing...
    We also have status pages that cover each section of the project, MWF, Provider Controls, and testing
    We need to keep those up to date too
    I know that's a lot of Wiki updating, but we have to track all of this somehow
    <knocte> ok
    <calvin> Those status pages are listed at the top of the schedule wiki page
    alright, that's all I have
    <sandy> calvin: so should we stop doing weekly status blogs, unless we have something interesting to share?
    <calvin> anything else?
    sandy: yes
    <bgmerrell> calvin: so you want to talk about integrating into testing and verifying the UIA Provider interfaces later?
    <mgorse> I wanted to talk briefly about the Open A11y working group while everyone is here
    <calvin> bgmerrell: yeah, let's do that later
    mgorse: ok
    <mgorse> In case anyone doesn't know, it's a working group of the Linux Foundation that focuses mostly on a11y issues under Linux (although they also have iAccessible2, which is a Windows standard)
    They have conference calls a lot of weeks on Tuesdays at 18:00 UTC
    On the last one, we talked about generally testing atk and at-spi, for instance.  They have a wiki page on www.linux-foundation.org under workgroups
    People felt that it might be good for the Mono team to come on a call every once in a while, at least for the first few minutes of the call, and give an update on how things are going and report any issues that we're running into.  So I was wondering if people had any thoughts on that
    --- calvin has changed the topic to: ** UI Automation Team Meeting in Progress ** Topic: Open A11y working group
    <mgorse> I mentioned it in the channel a couple days ago, and Calvin wasn't sure that it was necessarily worth doing, but I figured I'd bring it up when everyone was here.  Also, Calvin, feel free to jump in if I'm missing anything in describing the group
    <knocte> I wonder if it's interesting for the linux foundation, maybe not until we're require to extend AT-SPI...
    s/require/required
    <sandy> knocte: what about stuff like the recent problem you were having with atk?
    where you don'tknow if it can be solved in atk-sharp
    * sandy searched for reference
    <knocte> sandy: well, I'm sure they won't mind about if it can be solved in atk-sharp or not, but yes if we propose changes in atk itself
    which BTW was the thing I proposed when mkestner stated atk devs were using gpointers badly
    <sandy> knocte: I wasthinking about this: https://bugzilla.novell.com/show_bug.cgi?id=386950#c8
    <knocte> but it would be impossible to fix without breaking backwards compat
    <sandy> mm
    <knocte> yeah that's the thing I was commenting
    so it's no likely there will be any change on atk because of this
    <calvin> knocte: it might be something to bring up with the Linux Foundation though, just see what they think
    <knocte> maybe, but I'll figure out first how big the change would be, and what exactly to change
    <calvin> they have asked what issues we have run into
    So I think what mgorse was getting at, is they would love to have anyone from the team attend their meeting and participate
    <sandy> we're not really far enough in uia/atk mapping to have those sorts of issues, but I'm sure we will in the future
    <calvin> But my suggestion was that if you are interested, go for it, but I didn't want anyone to feel like they had to attend
    mgorse: was there anything else you wanted to bring up about the Linux Foundation?
    <mgorse> calvin: no
    <calvin> ok, then I'm going to officially end the meeting
    --- calvin has changed the topic to: Accessibility
    <calvin> Thanks everyone

