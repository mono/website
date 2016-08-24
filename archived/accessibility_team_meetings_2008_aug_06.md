---
title: "Accessibility: Team Meetings 2008 Aug 06"
lastmodified: '2008-08-06'
redirect_from:
  - /Accessibility%3A_Team_Meetings_2008_Aug_06/
---

Accessibility: Team Meetings 2008 Aug 06
========================================

    -!- calvin changed the topic of #mono-a11y to: \*\*\* Iteration 12 Planning Meeting in progress \*\*\*\* - Accessibility
    07:01
    **<@calvin> **
    there are a number of people out of the office today
    so this might go rather quick
    07:02
    **<@Calen> **
    calvin: Brian asked me to give his report :)
    **<@calvin> **
    Calen: ok, I was going to ask you about that
    good
    let's go through our reports first and then I'll have jpallen review anything additional he has
    07:03
    ok, so top of the iteration is Sandy, go ahead
    **<@sandy> **
    I've mostly finished the NumericUpDownProvider, but its tests are not yet complete. I realized for it to work properly, I needed to get the LabeledBy property working. I spent quite some time trying to figure out how Microsoft was determining which label went with which control. Finally I decided that there was no decent logic to it, and started to implement a simple distance algorithm.
    Then Calvin asked me to look into the open UIA bugs, so I put that on hold (will finish it up today and tomorrow). I resolved two majors bugs and one minor one. There are two other bugs (411882 and 411444) that I think are pretty important, so unless somebody else was planning on fixing them I think I'll work on those this iteration, too.
    So this iteration I'll work on bugs, finish the NumericUpDownProvider tests, implement proper LabeledBy property support, improve our notifications when controls move on the screen (or move off of it), and start on a new control: PrintPreviewDialog.
    done
    (and I just realized my wiki changes got overwritten so I'll fix that after the meeting)
    **<@calvin> **
    sandy: wow, that was either prepared or you type super fast!
    07:04
    **<@sandy> **
     :-)
    **<@calvin> **
    thanks
    Mario, go ahead
    **<@sandy> **
    Calen: I think your changes got overwritten, too
    **<@mario> **
    In this iteration I fixed some bugs in ScrollBar, most of them because of a confusion in the MSDN documentation
    07:05
    **<@Calen> **
    sandy: oh..thanks, i will fix
    **<@mario> **
    tried to finish ErrorProvider, but I found that the component has a "special" behavior, because add controls that represent the error
    07:06
    (you know the ! mark)
    however, all those "new added controls" are "one big control", this affects navigation
    07:07
    so, now, I'm updating Navigation to support his kind of weird behavior
    I finish, PictureBox provider, (Pane control type)
    s/finish/finished
    07:08
    my plans for next iteration is to finish Navigation, fix some bugs found by mgorse in Scrollbar navigation and send the patches to review
    done
    **<@calvin> **
    mario: thanks
    07:09
    ngao: go ahead
    **<@ngao> **
    ok
    last iteration, i finished ProgressBar test and StatusBar navigation, also fixed some TODO fields.
    there are some troubles then implementing Image, since there are no image type controls, we couldn't construct or get image provider from a control. i'm still looking for controls in uispy.
    next iteration, i will implement edit and StatusBarPanel, by then i think the whole StatusBar will complete.
    done
    **<@calvin> **
    great!
    07:10
    mgorse: go ahead
    **<@mgorse> **
    It wasn't a very productive iteration for me
    I was trying to work on scrollbar tests but have been running into issues
    I've wrapped up an a11y issue with ORBit that Jared had me work on (not directly related to our project)
    I made some more scrollbar changes to handle scrollbars that don't implement IRangeValueProvider, but haven't tested or committed
    Yesterday I reworked the code to add a child in the bridge to use Navigate.GetDirection(NavigateDirection. Parent) to get the parent rather than using HostRawElementProvider, so now it's better able to add things where they should be added
    I figured out that Orca doesn't see keys sent from apps using the bridge because it is the responsibility of the app (ie, the bridge) to pass them on to the at-spi registry
    I asked about this on #a11y, if there was a reason that the registry daemon didn't do a key grab, and was told that popups and the screen saver won't come up if a program is doing a key grab
    07:11
    so I guess that means that it is up to the app to pass keys on, in the current design anyway. Not sure right now if there's a good way to do that in the uia-atk bridge. It's a bit odd since UIA isn't involved in passing keys on, as far as I know, so, if there were an event for it, then it wouldn't be part of UIA
    07:12
    next iteration I plan to finish working on scrollbars and map ProgressBar in the bridge
    done
    **<@calvin> **
    mgorse: yeah, when I first came on the desktop team I did some work on the screensaver and logout dialogs, and the key grab code was a mess in there!
    07:13
    mgorse: anything of significance from the open a11y meeting yesterday?
    well, I'll go ahead while waiting for a response from mgorse
    07:15
    **<@mgorse> **
    calvin: That reminds me that I need to post minutes. It was a short meeting; there weren't many people there. People were talking about modifying their statement on at-spi to mention CodeThink. I suggested that Novell should be mentioned, too. So we'll work on that and vote on the new statement next week
    **<@calvin> **
    I didn't get much done on my UIA plans due to a combination of some non-related UIA Novell work and some administrative work
    07:16
    So I asked sandy to start looking into the bugs in my place
    mgorse: good call
    I will be out of pretty much all of the upcoming iteration so I'm not going to schedule anything other than some work with knocte when he returns tomorrow and some other team stuff
    07:17
    knocte is still on vacation and I don't have a report from him so perhaps he can inject his plans in here when he returns from vacation
    07:18
    **<@mgorse> **
    calvin: That reminds me that I have a work-around for bug 411444, but it involves a hack in at-spi, so it isn't really ideal. Better if we can fix the issues with the glib mainloop, but I'm not relaly sure how to do that. I added a comment that explains the issue
    **<@sandy> **
    thanks mgorse
    07:19
    **<@calvin> **
    mgorse: ok, I'll review your comment (sandy, probably good to look at it too)
    Calen: why don't you go ahead with both your report and Brian's
    **<@Calen> **
    calvin: okay
    07:20
    Brian:
    Mostly worked on documentation. I did some cleanup of the
    Strongwind documentation, but mostly focused on documentation
    specific to using and understanding our test harness, adding tests
    to the test suite, the "official" test machines in Provo, etc. This
    documentation is almost finished
    (Accessibility:_Testing_Howto)
    This should basically finish up our basic automated framework for
    testing apps directly through pyatspi (using Strongwind), so next
    iteration I want to finally get into Orca testing and evaluate what
    we need to set up a similar automated framework
    calvin: that is Brian's report. now is mine
    07:21
    this iteration i have commited three new strongwind test code for scrollbar control against vscrollbar.py hscrollbar.py checkedlistbox.py. and loged two bugs.
    i have modified picturebox.py sample with giving a path to invoke the jpg picture.
    07:22
    and have modified some error in our test codes which i commited before.
    in next iteration i hope i can start to script for groupbox, picturebox, or listbox, checkedlistbox.
    actuality my script plan schedule base on Accessibility:_Control_Status and Accessibility:_Mapping_UIA_to_ATK wiki page with which one is marked 'done',
    so i hope every one can update them promptly. many many thanks :)
    07:23
    **<@jpallen> **
    good point calen
    07:24
    **<@Calen> **
    and thanks sandy and mgorse fixed bugs in time \^ \^
    done
    **<@calvin> **
    thanks
    **<@jpallen> **
    that is where we're doing our project tracking
    (high level project tracking)
    in other words
    when MS comes to me and asks how things are going and are we on schedule
    07:25
    it is these two wiki pages that i will turn to
    right now
    it appears that we are behind schedule
    is the UIA to ATK mapping wiki up to date?
    07:26
    **<@calvin> **
    jpallen: no, it's not
    07:27
    **<@jpallen> **
    ok
    **<@mgorse> **
    StatusBar is done, and ScrollBar is 50% done. I'll update the wiki to say that after the meeting
    07:28
    **<@calvin> **
    jpallen: I'll chat with knocte and make sure it gets up to date (oh, and mgorse)
    mgorse: thanks
    Ray: go ahead
    **<@Ray> **
    sure
    for my Build part:
    played with at-spi-dbus for a bit time, and succeeded to build at-spi-dbus on my laptop, but failed on OBS with same spec file, i don't know why, so i'll check it out later.
    07:29
    if someone interested in that, look into [https://build.opensuse.org/package/show](https://build.opensuse.org/package/show)? package=at-spi-dbus&project=home%3Auia2a tk
    and for my QA part:
    I have implemented ErrorProvider and DomainUpDown controls, and there are 10+ controls left, i will have them finished as soon as possible.
    07:30
    bgmerrel suggests me switching to write Strongwind test samples after i finish all the controls. so in the coming week, i'm still going to keep on playing with winform control samples.
    and to see what's the problem about at-spi-dbus on OBS.
    done
    **<@calvin> **
    Ray: nice, that sounds great
    07:31
    decriptor: don't want to miss you, are you here?
    decriptor: is at a conference and I'm not sure if he is really sitting in front of his computer
    **<@jpallen> **
    he's probably standing in the lab talking to a customer :)
    07:32
    **<@calvin> **
    it would appear that he is not there, so we can wrap up
    jpallen: do you have more to add?
    **<@jpallen> **
    just my normal rant about project tracking, which you already covered :)
    07:33
    **<@calvin> **
    heh
    ok
    **<@jpallen> **
    i think we're farther along than our wiki pages show
    we'll get those updated
    we'll talk more about this tomorrow in our team meeting
    07:34
    i'm assuming everyone will be there?
    **<@sandy> **
    yup
    **<@ngao> **
    yes
    **<@Ray> **
    yes!
    **<@Calen> **
    jpallen: yeah.
    **<@mario> **
    y!
    **<@calvin> **
    yes
    **<@jpallen> **
    good
     :)
    that's all
    **<@calvin> **
    ok, sandy will you do your normal IRC log magic to the wiki?
    **<@sandy> **
    sure thing
    07:35
    **<@calvin> **
    great! thanks everyone... have a good morning, good afternoon, and good night!
    **<@Ray> **
    thank you
    ** **
    -!- calvin changed the topic of #mono-a11y to: Accessibility
