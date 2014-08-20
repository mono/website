---
title: "Accessibility: Team Meetings 2008 May 28"
lastmodified: '2008-05-28'
redirect_from:
  - /Accessibility:_Team_Meetings_2008_May_28/
---

Accessibility: Team Meetings 2008 May 28
========================================

Meeting Summary
---------------

    Attendants: calvin, jpallen, knocte, marioC, mgorse, ngao, raywang, sandy, bgmerrell, calen

    Topic—Iteration 1 review
    <sandy> Done CheckBox and Label, done 95% with Button (not sure how to implement some properties and if they can be implement).
    <MarioC> Refactored the events, LinkLabel provider is done, done 50% with TextBox.
    <calvin> Done 65% with Button UIA Control Type(Missing IScrollProvider and ITextProvider implementations.).
    <Calen> Done some simple application sample with winforms "button\label\linklabel\numericUpDown\textbox\groupBox\checkbox\radiobutton\panel" control by Ironpython.
    <bgmerrell> (1)the lab machines and vms are all set up and running. (2)the information for the test lab in Provo is https://wiki.innerweb.novell.com/index.php/UIAQA. (3)set up strongwind and written some automated, proof-of-concept tests against GTK sample applications. (4)have a method to automate the testing on all the lab machine
    <Ray> (1)Accquire the concepts and knowledges of accessibility. (2)Try to build olive, gtk-sharp packages on OBS.
    <ngao> to understand the architecture and the relationship between modules
    <mgorse> Done cspi. modified some files (spi_main.c, spi_listener.c, and spi_event.c) to remove some CORBA stuff and start adding code to interface with dbus. changed some headers around (untested)
    <knocte> (1)dealing with the implementation of Atk.TextImplementor interface. (2)was now investigating about the unique state of Label to be implemented and looking at the difference between ATK_ROLE_ACCEL_LABEL and the normal (currently used ATK_ROLE_LABEL). (3)label widget is accessible.

    Remind: we all need update our status and notes of what we had planned in schedule page.


    Topic-- Iteration 2 plan

    <sandy> will working on Form, GroupBox, and RadioButton
    <MarioC> will finish TextBoxProvider: implement IScrollProvider and ItextProvider, and tests
    <calvin> will finish up Button, do Form and Atk.ComponentImplementor
    <Calen> will still write winforms app sample
    <bgmerrell> (1)will implement the rest of the test framework automation,(2) making sure all the scripts copy out to the remote machines and execute locally on them and do logging. (3)dig around more with strongwind
    <Ray> (1)split olive into some sub-packages. (2)build patched mcs and mono.(3)talk about more plan for QA.(4)talk to new hacker
    <ngao> start implementing some simple controls or read some more codes
    <mgorse> will(1) work on event listeners and passing events, (2) start on the code to parse UpdateTree signals and call GetTree, and (3) work on the component interface if  have time
    <knocte> (1) change the plan MenuItem bridge class to CheckBox bridge class.(2)figure out as well how to implement other interfaces in other classes. (3)try to grow the tests more.(4)try to help with ComponentImplementor
    <jpallen> will get together with Brian , Calen and Ray next week to go over a more detailed iteration plan for QA

    Remind: With Ray's packaging, he don't need to build all of olive. just UIAutomation + WindowBase

RAW IRC Capture
---------------

    <calvin> I'll post the entire log to the wiki
     sandy: but that would be good
     I've modified the wiki with our schedule: Accessibility:_Project_Schedule
     and moved Iteration 1 to the past iterations
     so iteration 2 is now at the top
     You'll all note that several people have updated the status of iteration 1
     We all need to go into iteration 1 and update the status of what we had planned
     Whatever work was not done in iteration 1 needs to be moved into a future iteration
     In my case, I moved the remaining work from iteration 1 into iteration 2
     So perhaps we can go through iteration one and everyone can give status on their work
     Let's just go down the list of tasks and have everyone report in what happened... Sandy you're up first
    * bgmerrell is here
    <bgmerrell> soorry
    <sandy> okay, well I added GroupBox to my list after I found out the iteration would be longer, but ended up not having much time for it (I forgot to account for time writing unit tests)
     so I finished CheckBox and Label (that one's listed in a later iteration),and am almost done with Button
     there are a couple of properties that I'm not sure how to implement (of if they can be implemented)
     that's it
    <calvin> sandy: hmm, maybe we need a place to track stuff like that
    <sandy> makes sense
    <calvin> if we get to a point where we have properties or items that just don't fit...
     Perhaps we just log that in the iteration notes for now, or maybe on your control status
     sandy: that's a better place
    <sandy> will do
    <calvin> sandy: we should add a "Notes" column to that table to log stuff like that
    <sandy> GroupBox will actually fit really well with Form/Window this iteration
    <sandy> calvin: agreed
    <calvin> sandy: and if you have the time, convert it to a wiki table (that html is aweful!)
    <sandy> yay regex
    <calvin> sandy: ok, sounds good
     MarioC: can you give us your status on iteration 1
    <MarioC> Sure. I refactored the events, the idea is simple, reuse them. I may change the way InitializeEvent is called.
     LinkLabel provider is done.
     I'm going to use Iteration 2 to finish TextBoxProvider, I think this provider will work for Text-related controls: TextBox, MaskedTextBox and RichTextBox
     that's it
    <calvin> great, thanks
     thanks also for the status update in the table (that's what I'm looking for from everyone)
     ok, my turn
     There was a lot of support code that is still needed for all ControlTypes, specifically the ComponentImplementor
     That will provide for things like size, location, etc. and properties common to all elements
     I got into that and wasn't able to finish so I've moved that work into Iteration 2
    --> knocte (~knocte@170.Red-81-38-79.dynamicIP.rima-tde.net) has joined #mono-a11y
    <knocte> hi, sorry for being late
    <calvin> Buttons are there and are responding to at-spi commands
     knocte: welcome
     that's it for me
     knocte: we are reviewing interation 1 and just giving status of what we did
    <sandy> knocte: http://paste2.org/p/32663
    <knocte> ok
    <calvin> knocte: you arrived just in time to give us your status
    * knocte reads the past conversation
    <calvin> knocte: ok, let's skip knocte for now and come back so he is up to speed
     Calen:
    <Calen> Okey
     i have finished some simple application sample with winforms "button\label\linklabel\numericUpDown\textbox\groupBox\checkbox\radiobutton\panel" control by Ironpython.
     but i am not sure if they are the exactly way to be used when we do test.
    <calvin> Calen and or bgmerrell: where is the code repository for this?
    <bgmerrell> uiaqa.sled.lab.novell.com:/var/qa/code for now.
     we will probably use an innerforge svn or something in the future.
     sorry, outerforge
    <calvin> bgmerrell: ok, can you make that happen this week?
    <bgmerrell> definitely.
    <calvin> Calen: are you done with your status?
    <knocte> why not just the mono repo like us? (just thinking out loud)
    <Calen> sorry i will done it.
     done = do
    <bgmerrell> knocte: I don't think either of us have svn access to the mono repo
    <calvin> bgmerrell: yeah, why not the mono repo?
     bgmerrell: that can be fixed
    <knocte> bgmerrell: oh yeah that's a problem
    <bgmerrell> I requested it from miguel via e-mail, but didn't receive a response.
    <calvin> bgmerrell: ok, I'll work on that
    <knocte> maybe it got lost in the spam folder
    <bgmerrell> calvin: great, we'll plan on that, then.
    <calvin> let's just get your stuff into the uia2atk repo
     Calen: thanks!
     Brian: status
     BTW, for everyone, when you are done with your status, just say that you are done so we know to move on.
    <bgmerrell> Okay, the lab machines and vms are all set up and running
     https://wiki.innerweb.novell.com/index.php/UIAQA
     that is the information for the test lab in Provo
     I have set up strongwind and written some autoated, proof-of-concept tests against GTK sample applications
     automated*
     and have a method to automate the testing on all the lab machine
     so as soon as we are ready, we can just plug the strongwind tests into the winforms apps
     and they'll generate a report.. something like this:  http://www.medsphere.org/projects/strongwind/sample_output/gcalctool-basic-ops/procedures.xml
     done
    <calvin> bgmerrell: thanks, what about your task "Write Test Script For Button"
     :)
     bgmerrell: I would have hoped that all of those items would have shown up in your tasks for iteration 1
     but maybe you didn't have all of the information up front
     ok, moving on
     Ray: status
    <Ray> yes
     last week, I continue to accquire the concepts and knowledges of accessibility.
     lurk around on gnome.org etc.
     and on the end of last week, Calen, neville and me spends some hours to discuss the Architecture and our understanding.
     second, i try to build several packages on OBS,
     such as olive, gtk-sharp. which spend some times.
     but now, i realize i may split the olive package into some sub-packages according to your advices,
     and continue to use those patches which are located in uia2atk directory to patch mcs and mono etc.
     I wish i could discuss the build process and more details with someone else in the near future. :)
     in iteration 2, i will patch mono, and mcs
     over.
    <bgmerrell> calvin: sorry, the tasks for Calen and I on the wiki were just placeholders, i did not think to add all the setup tasks I was doing.
    <jpallen> Stephen will be starting on the team next week and he will be someone that you will be working with closely :-)
    <Ray> jpallen: great news, thanks jared. :)
    <calvin> Ray: thanks
    <Ray> calvin: thanks
    <calvin> ngao: status
    <ngao> ok
     i reviewed the wiki to understand the architecture and the relationship between modules
     and as Ray mentioned, the discussion helped me much
    <jpallen> I would like to get together with Brian , Calen and Ray next week to go over a more detailed iteration plan for QA
    <Ray> jpallen: sure.
    <Calen> jpallen:great :)
    <calvin> ngao: did you have more?
    <ngao> that's it
    <bgmerrell> jpallen: did you ping me earlier?  it said "pong" so i wasn't sure if I pinged you in my sleep or what :)
    <calvin> mgorse: status
    <mgorse> I've been starting to work on cspi
     I've modified some files (spi_main.c, spi_listener.c, and spi_event.c) to remove some CORBA stuff and start adding code to interface with dbus
     and changed some headers around
     I haven't tested what I've done so far, though, other than to test that it compiles
     There is a program in the at-spi test directory called simple-at that I've been planning to test with once it compiles
    <calvin> mgorse: probably a hard thing to test fully without the rest of the implementation!
    <mgorse> I had that for iteration 2, but, now that I've looked at it a bit more, I'm realizing that it draws in a lot more symbols than what I was thinking.  So I might want to move the part about testing the registry into the future and move up things that I was planning on doing in the future (ie, the component and text interfaces) into this iteration
     over
    <calvin> mgorse: thanks
     So I'd like everyone to update their status in the table here: Accessibility:_Project_Schedule
     or at least the status for their tasks in iteration 1
    <knocte> calvin: my turn?
    <calvin> knocte: yes, sorry
     knocte: go
    <knocte> hehe, ok
     I spent most of the time dealing with the implementation of Atk.TextImplementor interface (which finally I reused easily in the Button class), but it was difficult and time-consuming to get it completely right,
     (this, for the TextLabel class in the bridge)
     above all the boundaryType related to sentences, which made me re-think the approach even 3 times, and well,
     as well as it's happenning with the ComponentImplementor thing, there's some bits of this interface that still are very specifical to dealing with graphics (coordinates, scanning of widgets in rectangular areas..)
     which I left unimplemented for now.
     I was now investigating about the unique state of Label to be implemented (which seems easier) and looking at the difference between ATK_ROLE_ACCEL_LABEL and the normal (currently used ATK_ROLE_LABEL).
     At least now the label widget is accessible (as it's shown in accerciser with the FormTest and you can navigate it with the API browser).
     I haven't had time to keep on dealing with the glib#/atk# issues, and I lack also some tests less ATK-centric (although I have been refactoring the UiaAtkBridgeTest assembly in order for us to make it grow more easily).
     done
    <calvin> knocte: thanks
    * calvin thinks knocte can type fast!
    <knocte> :)
    <calvin> Originally I was thinking we would do a review of the past iteration by everyone, and then do a planning for the next iteration
    <-- jpallen has quit (Ping timeout: 600 seconds)
    <calvin> We'll do that today, but I think next time, as we go through everyone, let's just review and plan at once
     So let's go back through everyone (in the same order) and have everyone mention what they are planning for the upcoming iteration
     Remember to say "done" when you are done
     sandy: go
    <sandy> I'll be working on Form, GroupBox, and RadioButton
     done
    --> jpallen (~jpallen@ariadne.provo.novell.com) has joined #mono-a11y
    <sandy> (unless you want more details)
    <calvin> sandy: nope, not unless someone has questions
     MarioC: go
    <MarioC> finish TextBoxProvider: implement IScrollProvider and ITextProvider
     tests and tests
     done
    <calvin> heh
    <Calen> maybe i will still write winforms app sample
     done
    <calvin> oh me: I'l finish up Button, do Form and Atk.ComponentImplementor
     done
     bgmerrell: go
    <bgmerrell> I will implement the rest of the test framework automation, i.e., making sure all the scripts copy out to the remote machines and execute locally on them and do logging.. etc. etc.
     and dig around more with strongwind
     done
    <calvin> Ray: go
    <knocte> (I would ask not to be the last one this time because I have an appointment with the dentist in 15 minutes) :)
    <calvin> ah, indeed
    <Ray> 1. follow your infomation, split olive into some sub-packages,
    <calvin> Ray: hold on a sec
     knocte: go
    <Ray> ok
    <knocte> I guess I'll change my current planned MenuItem bridge class by one whose ControlType is already implemented, like the ComboBox which was done this week
     I'll try to figure out as well how to implement other interfaces in other classes that are needed also on this one
     and I'll try to grow the tests more
    <sandy> knocte: we didn't do ComboBox
     do you mean CheckBox?
    <knocte> oh sorry
     then the RadioButton or the CheckBox, ok
     and I'll try to help with ComponentImplementor, which is global for all bridge classes derived from Adapter
     done
    <Ray> it's me?
    <calvin> Ray: yep, go
    <Ray> 1. follow your infomation, split olive into some sub-packages,
     2. build patched mcs and mono
     3. talk about more plan for QA according to jared's time
     4. talk to new hacker if he/she is on board.
     done
    <calvin> Cool
     So...
     With Ray's packaging, I was thinking he didn't really need to build all of olive
     The only thing we really use in there right now is the UIAutomation related packages
     So I suggested that perhaps he only build an RPM for the testers to use that has the UIAutomation stuff
    <Ray> calvin: understand
    <calvin> sandy, MarioC, knocte: any thoughts there?
    <sandy> there might be some dependencies
     WindowBase is in Olive, and we depend on that
    <Ray> we lose  mike
    <MarioC> calvin, agree, also include the winform-patched package
    <knocte> maybe he could chat with wade about it
    <calvin> MarioC: right, but that comes right from mono right? not olive?
    <sandy> right...should probably find out how mono-winforms is currently packaged, and do the same thing except with our patch
    <calvin> sandy: agreed, I meant the UIAutomation + WindowBase
    <MarioC> calvin, right
    <calvin> Ray: ok, so let's go as you planned
    <Ray> sure
    <calvin> ngao: go
    <knocte> maybe wade has something working now because moonlight has been released and it uses some parts of olive I believe
    <ngao> i'm thinking if i could start implementing some simple controls or read some more codes?
     done
    <calvin> ngao: indeed, I'd like you to chat with sandy and MarioC about which one you could "cut your teeth" on
     ngao: but after the meeting sometime
    <ngao> ok, i will
    <calvin> mgorse: go
     although you kinda already mentioned what you were planning above
    <mgorse> On cspi, I'll (1) work on event listeners and passing events, (2) start on the code to parse UpdateTree signals and call GetTree, and (3) work on the component interface if I have time
     done
    <calvin> thanks
     did I miss anyone?
    * decriptor I plan on starting to work next week :P
    <calvin> decriptor: go
    <decriptor> that's it :)
    <calvin> heh
    <Ray> decriptor: can't wait. :)
    <decriptor> calvin: oh and get that 24" from you
    <calvin> let's have everyone update their planned tasks in the iteration 2 table and update your status for iteration 1
     Any comments on the format of this meeting?
    <bgmerrell> good
    <calvin> Any suggestions as to what me might do differently?
     Other than, I think we'll just make one pass in the future and get status, and plans
    <sandy> calvin: as you say, do past+future all at once
    <calvin> sandy: right
    <mgorse> calvin: Might be quicker to just have one go-round as you were suggesting; maybe try that next week and see how it goes
    <knocte> (well sorry guys I have to leave, I'll be here in an hour or so; thanks!)
    <calvin> ok, we're done

