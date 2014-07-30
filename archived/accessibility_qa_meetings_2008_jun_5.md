---
title: "Accessibility: QA Meetings 2008 Jun 5"
lastmodified: '2008-06-06'
permalink: /archived/Accessibility:_QA_Meetings_2008_Jun_5/
redirect_from:
  - /Accessibility:_QA_Meetings_2008_Jun_5/
---

Accessibility: QA Meetings 2008 Jun 5
=====================================

mono-a11y irc meeting agenda Thursday, June 5 9:00PM MDT

1. RAY

     a.  Time
     b.  Focused or do a little of everything?

2. STRONGWIND (brief overview)

     a.  Running
     b.  Writing Tests
           Using together with Accerciser
     c.  Try your own

3. TEST SUITE

     a.  Standards
           Strongwind
           Sample Applications
           SVN
           In the code (tabs, space, indent size, etc)
     b.  Adding tests
           Try your own
     c.  Auditing tests
           Suggestions and method

4. ITERATIONS

     a.  Goal:  Follow at most one week behind development
     b.  Add all QA tasks to schedule as soon as we know about them
           Use it like a todo list for any non-trivial tasks

RAW IRC Capture
---------------

    [11:01] <jpallen> i think we're ready to get started
    [11:01] <Ray> sure
    [11:02] <jpallen> did you all see the agenda bgmerrell sent out earlier?
    [11:02] <Calen> yeah..
    [11:02] *** jpallen sets the channel topic to "QA Meeting".
    [11:02] <Ray> yeah, have seen it
    [11:02] <jpallen> ok.  great
    [11:02] <bgmerrell> Okay, I wanted to talk about Ray's time and role a little bit first, because that will probably effect the rest of the meeting
    [11:03] <jpallen> brian, do you want to go ahead and post the agenda and take us through it?
    [11:03] <Ray> sure, thanks
    [11:04] <bgmerrell> Sure, let me paste it somewhere
    [11:05] <bgmerrell> http://www.mono-project.com/Accessibility:_QA_Meetings_2008_Jun_5
    [11:05] <Ray> nice :)
    [11:06] <bgmerrell> jpallen: I wanted to get your input on what you had in mind for Ray's role.  Is he 1/2 QA and 1/2 build?
    [11:06] <jpallen> yes, that is the plan.  i was think half and half
    [11:06] <bgmerrell> or 1/10 build and 9/10 QA :)
    [11:07] <Ray> hehe
    [11:07] <Calen> hh..
    [11:07] <jpallen> we can adjust as we need to
    [11:07] <jpallen> that may not mean 20 hrs for one and 20hrs for another for each week
    [11:07] <Ray> bgmerrell: i do the QA works just like what you and calen did?
    [11:08] <jpallen> it may be that there is more work in qa now and less later or the other way around
    [11:08] <Ray> ok, make sense
    [11:08] <bgmerrell> Calen: Ray: do you think it would be more effective for Ray to work on one specific thing or to help wherever we need help that week?
    [11:09] <bgmerrell> Maybe jpallen has insight here...
    [11:09] <Calen> i think maybe when we have mor test work Ray can join to us.
    [11:09] <Calen> if his building work is not urgen
    [11:09] <Calen> \
    [11:10] <Calen> urgence*
    [11:10] <bgmerrell> I think the advantages to him working on one thing is that he could become very good and fast at it quickly.  The good thing about helping on many things is that we can get his help for any problem we have, but he might not have time to master everything.
    [11:10] <bgmerrell> So it is a trade-off.
    [11:10] <jpallen> i think it would be good to have some specific assignments and areas of focus for Ray as far as QA goes
    [11:11] <Ray> sure, good idear
    [11:11] <bgmerrell> Okay, I think that is a good idea too.
    [11:11] <Calen> good
    [11:11] <jpallen> Ray, let's have you start with a specific area of focus and assignment
    [11:11] <bgmerrell> Calen:  do you have any problem with that?
    [11:11] <Ray> jpallen: cool. :)
    [11:12] <Calen> no, sounds great
    [11:12] <bgmerrell> awesome
    [11:12] <bgmerrell> Ray:  Calen and I will come up with an area or two for you to focus on.
    [11:12] <Ray> so, what's the next? i need to write test apps just like what you and calen did?
    [11:12] <Calen> but it depend to Ray's interesting. i think
    [11:13] <Calen> depend on
    [11:13] <bgmerrell> I think Calen has that part under control, do you agree Calen?
    [11:13] <Ray> good, np, i like to do that
    [11:13] <bgmerrell> Ray: are you familiar with Python?
    [11:13] <Ray> i was learning it severl weeks ago
    [11:14] <Ray> in case i write test apps. lol
    [11:14] <Ray> bgmerrell: i agree with calen
    [11:14] <jpallen> ray: good job thinking ahead! :)
    [11:14] <bgmerrell> I think Calen can do the test apps, she has a large amount done already.  But everything we do is in python :)
    [11:15] <Ray> jpallen: thanks. :)
    [11:15] <Calen> yeah...i do it in Ironpython:)
    [11:15] <bgmerrell> Alternatively, Calen can start helping me with Strongwind tests and Ray can take over the sample applications?
    [11:16] <Ray> bgmerrell: sure, no problem for me.
    [11:16] <Calen> all our automation test will do in python, is it right? Brian
    [11:16] <bgmerrell> The Strongwind tests are more difficult, but I think Calen is ready :)
    [11:16] <bgmerrell> Calen: Right
    [11:17] <Ray> great, i like python. :)
    [11:17] <Calen> haha...yeah...but i have some question need ask you
    [11:17] <bgmerrell> Calen: no problem! :)
    [11:17] <Calen> thanks before:)
    [11:18] <bgmerrell> So Ray, let's have Calen help you code a couple of sample applications she is working on this iteration
    [11:18] <Calen> in advance
    [11:18] <bgmerrell> Next iteration we can task you with specific sample applications
    [11:18] <bgmerrell> Does that sound good?
    [11:18] <Ray> bgmerrell: sure, she could be my good mentor. :)
    [11:19] <Ray> bgmerrell: good!
    [11:19] <bgmerrell> Calen: is that okay with you?  I don't want to steal your sample application work from you!
    [11:19] <Calen> Brian, do you mean Ray will do app job from now, and i will do strongwind code?
    [11:19] <bgmerrell> Calen: if that is okay with you, I think it would work best.
    [11:19] <Calen> Okey.
    [11:20] <bgmerrell> Calen: You will be done with all the sample apps soon anyway if you keep doing it with all your time! :)
    [11:20] <bgmerrell> And we will not need many for several months.
    [11:20] <Calen> haha...
    [11:21] <bgmerrell> Okay, let's move onto the next part of the agenda
    [11:21] <Ray> calen rocks. :)
    [11:21] <bgmerrell> I think Calen has tried the demo strongwind test, right?
    [11:21] <bgmerrell> Ray: have you seen it?
    [11:21] <Calen> yes
    [11:21] <Calen> i have told Ray to see it
    [11:21] <Ray> yes
    [11:22] <mgorse> Fyi, I'm at the keyboard, but I'm going to sleep unless someone asks me to stay
    [11:22] <bgmerrell> mgorse:  stay if you want to join QA ;)
    [11:22] * bgmerrell recruits everyone.
    [11:23] <jpallen> hehe
    [11:23] <Calen> mgorse: have a good sleep:)
    [11:23] <mgorse> Night all
    [11:23] <-- mgorse has left this server (I quit).
    [11:24] <Ray> let's go ahead. :)
    [11:24] <Calen> Brain, can you introduce to us the action of each script in "testers", and the relationship between them. i mean how they relate each other.
    [11:25] <Calen> although, i can run them well and have read them some times, but i still like to learn more details about them from you
    [11:25] <bgmerrell> Calen: Sure!
    [11:25] <Calen> i think you will make more sense
    [11:25] <bgmerrell> okay, let me try to explain...
    [11:25] <bgmerrell> we have three different types of code
    [11:26] <bgmerrell> samples
    [11:26] <bgmerrell> testers
    [11:26] <bgmerrell> and drivers
    [11:26] <bgmerrell> the samples are the sample applications that we are writing for each WinForms control.  So we will have a sample for the Button control, the Label control, etc.
    [11:26] <bgmerrell> You know that already...
    [11:27] <Calen> yeah..:)
    [11:27] <bgmerrell> the testers are the strongwind tests that actually open and test those sample applications
    [11:28] <bgmerrell> so for a tester, you explain to strongwind where your sample application is, what your sample application contains, and how to test your sample application
    [11:28] <bgmerrell> So you tell strongwind "I have a Button application in /var/qa/code/samples/CheckButton.py.  The application has two buttons, this is how you push them"
    [11:29] <bgmerrell> Then you write a different test for strongwind saying "I want to push this button, and I want this to happen"
    [11:30] <bgmerrell> Strongwind then opens up CheckButton.py and pushes the buttons you tell it to, then it reports what happened.
    [11:30] <bgmerrell> Does that help?
    [11:30] <Ray> yeah, very clear
    [11:30] <Calen> haha...good story, thanks!
    [11:31] <bgmerrell> Haha, great!
    [11:31] <Calen> let me say
    [11:31] <Calen> we explain "where your sample application is" in __init__.py
    [11:31] <Calen> explain " what your sample application contains"
    [11:32] <Calen> in checkbuttonframe.py
    [11:32] <Calen> and  "how to test your sample application" in checkbutton-basic-ops.py
    [11:32] <bgmerrell> that is EXACTLY 100% right
    [11:32] <Calen> is it right?
    [11:33] <Calen> my another question is:
    [11:34] <Calen> in checkbutton-basic-ops.py, we set up uidgets(which we will test) as a parameter with checkbox.Text/button.Text, and this parameter will be invoked in checkbutton-basic-ops.py by "cbFrame.findCheckBox(cbFrame.CHECK_BUTTON_ONE).click()", is it right?
    [11:34] <Calen> uidgets = widgets
    [11:35] <Calen> in checkbutton-basic-ops.py, if we invoke a button we can use "click" to trigging this event , but how can we generate input by keyboard, for example, input some characters into a textbox. but then i am not sure if we need concern about that.
    [11:36] <Calen> that is all.
    [11:36] <bgmerrell> Calen: yeah, we can do that, but we don't need to worry about it right now
    [11:37] <bgmerrell> Calen: we can work on that together, later.
    [11:37] <bgmerrell> So that explains "samples" and "testers"
    [11:37] <bgmerrell> the "driver" is the "test harness", are you familiar with that term Calen?
    [11:38] <Calen> i have seen scripts of driver little more.
    [11:38] <bgmerrell> In other words, it is how we pull in all our tests together into a suite group
    [11:38] <bgmerrell> and then execute them all at the sample time and log the results
    [11:39] <Ray> do you mean test bed?
    [11:39] <bgmerrell> the driver scripts copy the logs out to the webserver at http://uiaqa.sled.lab.novell.com/uiaqa_logs (you can see them now)
    [11:39] <bgmerrell> the drivers make it so we don't have start and log the strongwind tests manually
    [11:40] <bgmerrell> we just execute local_run.py to execute the tests on a single local machine
    [11:40] <bgmerrell> or remote_run.py to execute the tests on one _or more_ remote machines.
    [11:40] <bgmerrell> for example, currently the remote_run.py on uiaqa.sled.lab.novell.com will actually run the tests on the lab machines in Provo
    [11:41] <bgmerrell> Ray: i am not familiar with that term, but i think it is the same thing :)
    [11:42] <Ray> ok
    [11:42] <bgmerrell> does that explain drivers to everyone?
    [11:42] <Calen> yeah..
    [11:42] <Ray> yep
    [11:43] <bgmerrell> i will probably maintain this part anyway
    [11:43] <bgmerrell> but feel free to fix all my bugs :)
    [11:43] <bgmerrell> and improve it
    [11:43] <Calen> i will :)
    [11:43] <Ray> absolutely ^^
    [11:44] <bgmerrell> okay, so moving on to part #3?
    [11:44] <Ray> go on
    [11:44] <bgmerrell> I want to make sure we have good standards
    [11:44] <Calen> for what?
    [11:44] <bgmerrell> For all of our code and svn procedures
    [11:45] <Calen> do we have some specification for script form? such as the name of script, the title and commentary in the script(author, time, description)
    [11:45] <bgmerrell> and our file names
    [11:45] <Calen> haha...it is my question.
    [11:45] <bgmerrell> Calen: no, and that is exactly what i mean
    [11:45] <bgmerrell> :)
    [11:45] <bgmerrell> Calen: would you like to make a wiki page for our standards?
    [11:46] <Calen> of course i like to do that
    [11:46] <bgmerrell> For example, some of the programs use 4 space indention and some use 2 space indention
    [11:46] <bgmerrell> some people like to use tabs instead of spaces
    [11:46] <Ray> woudl this link help?  http://www.python.org/dev/peps/pep-0008/
    [11:47] <bgmerrell> we just want to be consistent.  So if the file you are working on uses 4-space indentions, be sure to use 4-space indentions.  Python kind of enforces this already
    [11:47] <Calen> al...i think all of my script need to be checked. beause i always use "tab" indention.
    [11:47] <Ray> bgmerrell: in vim, we could use tabs for indent, but space will fill the tab. :)
    [11:47] <Ray> i mean "set expandtab"
    [11:48] <bgmerrell> We also want to make sure we update the test/ChangeLog whenever we check in our SVN changes.
    [11:48] <bgmerrell> Ray: yes, that is what i use too :)
    [11:48] <Ray> :_
    [11:48] <Ray> :)
    [11:49] <bgmerrell> Calen: depending on your editor, it might use space instead of tabs. You can see by opening the file in vim and typing ':set list'
    [11:49] <bgmerrell> tabs will appear as I^ and spaces will appear as empty spaces
    [11:49] <Calen> okey, thinks!
    [11:49] <bgmerrell> Calen: Also i want to make sure we have good standards for naming files
    [11:49] <jpallen> there are tools that will convert tabs to spaces . . .
    [11:51] <bgmerrell> Calen: For example I think we should name our sample apps according to the controls that are tested with them.. For example a sample that is used to test a CheckButton and a TestBox would be:  CheckButton_TestBox.py
    [11:51] <Ray> jpallen: what's the name? :)
    [11:51] <bgmerrell> So they are easy to find and identify.
    [11:51] <jpallen> Ray: i don't remember.  there are several available
    [11:52] <Ray> jpallen: cool, thanks
    [11:52] <Calen> but sometimes one app script will include many Control
    [11:52] <bgmerrell> I know in vim you can type :%s/<tab>/<spaces>/g
    [11:52] <Calen> such as ToolStrip-series.py
    [11:53] <bgmerrell> Calen:  That is a good point, as long as we are all consistent we can use any naming convention you want :)
    [11:55] <bgmerrell> So you can define the standards you think are best, then Ray and I and the community can check them before we name files and write tests :)
    [11:55] <bgmerrell> Calen: ^
    [11:55] <Calen> i noticed it's not easy to give a long name, so i notify them in http://www.mono-project.com/Accessibility:_Test_Plan_WinForms_Controls
    [11:55] <bgmerrell> Calen: great!
    [11:56] <bgmerrell> Calen:  I really like that page, by the way
    [11:56] <bgmerrell> Calen: you did a good job on it
    [11:56] <Calen> haha...thanks!
    [11:56] <bgmerrell> Okay, the next thing..
    [11:57] <bgmerrell> the tests.py file in the drivers directory is how you add tests to the test suite
    [11:57] <Calen> i have seen it.
    [11:57] <bgmerrell> once a sample app and a strongwind test for that sample app has been completed, you can add the test to tests.py
    [11:58] <bgmerrell> once the test is added to tests.py it will be run by the test harness together will all the other tests
    [11:59] <bgmerrell> so we should make a goal to write another gtk test application, a strongwind test for that application, and add the strongwind test to the test suite.
    [11:59] <bgmerrell> Ray can make the sample application and Calen and I can work on the strongwind test together
    [11:59] <bgmerrell> Does that sound good?
    [12:00] <Ray> that's great!
    [12:00] <bgmerrell> Okay, and I don't want this meeting to last longer than an hour, so let's finish up
    [12:01] <bgmerrell> I think in the future, when development is ready for us to start automating tests for WinForms apps, we should always make sure that a WinForms control never takes more than one full iteration to get automation tests written for it
    [12:01] <Ray> bgmerrell: how about "4. ITERATIONS"
    [12:01] <bgmerrell> Ray: yes, sorry, that's what i'm referring to
    [12:01] <Ray> :)
    [12:02] <bgmerrell> So if the developers finish a control on Friday, we should have it finished by the 2nd tuesday after that at the latest
    [12:02] <bgmerrell> and it should be in the test suite
    [12:02] <bgmerrell> Also make sure we add everything we're doing to the schedule page on the wiki
    [12:03] <bgmerrell> Use it like a personal "to do" list for every non-trivial thing you need to do
    [12:03] <bgmerrell> this is so we remember things that need done
    [12:03] <bgmerrell> and jpallen knows we're actually doing something :)
    [12:04] <jpallen> :)
    [12:04] <Ray> certainly
    [12:05] <-- peteb_ has left this server (Read error: 104 (Connection reset by peer)).
    [12:05] <bgmerrell> that's all for me, any questions that i can answer?
    [12:06] <Ray> bgmerrell: so the filename, function name etc we use is so-called Hungarian notation?
    [12:08] <bgmerrell> Calen: I think calen will decide for the filenames
    [12:08] <bgmerrell> oops
    [12:08] <bgmerrell> Ray: ^
    [12:08] <Ray> OK, :)
    [12:09] <Ray> bgmerrell: have we finished the meeting?
    [12:09] <Calen> let me sum up this meeting: Ray will start on App work. i will move on strongwind script and standard wiki. Brian will maintain drivers and start on strongwind script.
    [12:10] <bgmerrell> Ray: as far as functions go, I noticed that Strongwind uses hungarian notation but python normally uses function_names_like_this.  So we should just be consistent and use whatever is being used in the file we're editing.  If we're making a new file in python, we can generally use _s
    [12:10] <bgmerrell> Calen: sounds accurate
    [12:11] <jpallen> looks good to me
    [12:11] <jpallen> i would like to reiterate something brian said about the wiki
    [12:11] <Ray> thanks Calen
    [12:12] <jpallen> using the wiki for communicating your progress against your test plan is essential
    [12:12] <jpallen> notice how development is driving all of their planing through the wiki
    [12:12] <jpallen> i would like to see tighter integration between the qa plan and the development plan in the wiki
    [12:13] <jpallen> not only is it used as kind of a personal "to do" list as brian mentioned
    [12:13] <jpallen> it also should reflect progress against the plan
    [12:13] <Ray> yes, sir. :)
    [12:13] <jpallen> so, the wiki should give a sense of progress towards an already defined plan
    [12:13] <jpallen> :)
    [12:13] <jpallen> that's all i have
    [12:14] <bgmerrell> definitely, i think it will get tighter when we have a testable product from development
    [12:14] <bgmerrell> BUT, that also reminds me..
    [12:14] <jpallen> yep
    [12:14] <bgmerrell> we need to be sure to add our automated test infrastructure to our "Approach" in the test plan
    [12:14] <jpallen> yes
    [12:15] <bgmerrell> so anyone in the community can read our test plan and understand "drivers" "testers" and "samples" and how to add tests to the test suite
    [12:15] <bgmerrell> and how they can help us and how to name files, etc. :)
    [12:17] <Ray> cool  :)
    [12:18] <Calen> Brian, i forgot one question. i am not sure how strongwind scripts reflect "using together with Accerciser"?
    [12:18] <jpallen> hey guys.  i'm going to sign off now
    [12:18] <jpallen> good meeting!
    [12:18] <Ray> jpallen: sure, see you. :)
    [12:19] <Calen> jpallen: thanks Jared:)
    [12:19] <Ray> bgmerrell: oh yeah, that's what i want to know.
    [12:21] <jpallen> bye all.  brian, get some some sleep.  calen and ray have a nice afternoon
    [12:21] <-- jpallen has left this server (Leaving).
    [12:22] *** bgmerrell sets the channel topic to "http://www.mono-project.com/Accessibility".
    [12:22] <bgmerrell> Calen:  Oh, right!  using together with accerciser...
    [12:22] <Calen> dose it mentioned in assertResult in checkbuttonframe.py? when we check a Button control, we shall get a "push button" RoleName except "checked/unchecked"?
    [12:23] <bgmerrell> Calen: sorry, i didn't understand
    [12:24] <Calen> okey, i just don't know how they using together:)
    [12:25] <Calen> can you give us an example to make sense?
    [12:27] <Ray> do you mean how strongwind cooperate with accerciser?
    [12:27] <Calen> yes
    [12:30] <Calen> how strongwind mentions accerciser? ^ ^
    [12:31] <bgmerrell> Calen: you will see more when we work on one together.  But basically, we will use Accerciser to discover states that we see and search for in the sample application
    [12:31] <bgmerrell> We can also use accerciser to see valid actions for the sample applications.
    [12:33] <bgmerrell> Strongwind has some methods that coordinate with what accerciser can see.  So by using accerciser we can see what methods we can call in strongwind.
    [12:33] <bgmerrell> Does that help?
    [12:34] <Ray> yes

