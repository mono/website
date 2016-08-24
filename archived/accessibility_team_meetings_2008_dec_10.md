---
title: "Accessibility: Team Meetings 2008 Dec 10"
lastmodified: '2009-01-07'
redirect_from:
  - /Accessibility%3A_Team_Meetings_2008_Dec_10/
---

Accessibility: Team Meetings 2008 Dec 10
========================================

    -!- sandy changed the topic of #mono-a11y to: Accessibility &amp; Mono | Accessibility | Iteration Meeting in progress
    07:03
    ****
    <@brad> so last iteration we were distracted with a whole lot of things
    07:04
    ****
    * sandy wants a gold star
    ****
    <@brad> bugs from QAtest breakages, etcbut we need to take steps to avoid distractions if at all possibleso that we can make our deadlinesso if there's anything at all that is bothering you, or that we could be doing better to avoid issues like thisplease let me know
    07:05
    ****
    <@sandy> I thought it was helpful when you suggested we push off QA bugs until next iteration...made me better able to focus, at least
    ****
    <@brad> as far as bugs coming in from QA, they'll be only marking as p1 issues that break the build, or otherwise make it very difficult to get anything donesandy: yeah, that will hopefully helpother bugs, p2 and lower, will be put off until the next iteration
    07:06
    so that developers can focuslets see, other than that, we have the 0.9.1 tag happening on fridayso please backport anything that meets the critera I mentioned earliermoving on, this sprint will be 3 weeks so that we can accomodate various holiday vacations
    07:07
    ****
    <@mgorse> brad: Do you know yet what time on Friday we'll tag for 0.9.1?
    ****
    <@brad> so our next meeting will be on the 30thmgorse: that depends on decriptor mainlymgorse: I'd imagine around 12 MST, but I'll send the details out later
    07:08
    so for developers, the priorities for this next iteration are as followshigh priority open bugs (p1), features for 0.9, backporting, open bugs, and 1.0 architecture stuff
    07:09
    and then new featuresfor 1.0I have a wiki page prepared that should help a bitAccessibility:_Sprint_4so when assigning work, please pick from this page firstsome of them are assigned to Andres, so please only select #444686 and #428614 from him
    07:10
    any questions before we move on?okbgmerrell: do you mind giving a quick recap of QA's deadlines coming up so that the developers are aware?
    07:11
    bgmerrell: or maybe delegate that to someone with a better keyboard?
    ****
    <@sandy> haha
    ****
    <@brad> hmm, he doesn't seem to be respondingcalen: could you fill us in on your deadlines?
    ****
    <@sandy> is there a wiki page with the QA schedule?
    07:12
    ****
    <@bgmerrell> yes almost to odffice
    ****
    <@brad> bgmerrell: heh, okay.. we can give you a bit of time
    ****
    <@decriptor> brad: hi
    07:13
    ****
    <@brad> decriptor: hello
    ****
    <@calen> yes, we have a  google doc in http://spreadsheets.google.com/ccc?key=p wydy7S3XPTBTRS9n_oBjJA&amp;hl=zh_CNbrad, can you set bug456343 to high priority?
    07:14
    ****
    <@brad> it would be really great if you guys could write a wiki doc at a very high level for uscalen: let me look
    ****
    <@bgmerrell> ahh, much better
    ****
    <@brad> calen: it's already a p1 and already mentioned on the wiki page
    07:15
    calen: what else would you like me to do?
    ****
    <@calen> brad, oh sorry, i didn't saw it. thanks!
    ****
    <@brad> calen: sure, no problembgmerrell: the floor is yours
    ****
    <@bgmerrell> okay, so basically Jared has asked QA to be very diligent in getting all of the controls that made it in 0.9 tested before Dec 17
    07:16
    so Ray, Calen and I have all been working only on Strongwind tests for the last few weekseach Wednesday we have deadlines set so that we can have all the controls tested by the 17th
    07:17
    like Calen said, the deadlines are shown in the google spreadsheet, but we can create a higher level wiki based on that
    ****
    <@brad> that would be great, thank you bgmerrellalright, anything else before we start assignments?
    07:18
    cool.  go ahead and start assigning work... please pick around 5 hours per day for as many days as you'll be in town.  Max 20 days
    07:19
    ****
    <@sandy> so the only Novell holidays are Dec 25 and Jan 1, right?
    07:21
    (in the US)
    ****
    <@brad> yes
    ****
    <@bgmerrell> right
    ****
    * bgmerrell waves his fist at the brad
    ****
    <@brad> bgmerrell: not my fault you're too slow...
    ****
    <@bgmerrell> !oh no you di'int
    07:22
    ****
    <@sandy> our iteration ends on teh 29th
    ****
    <@brad> yes
    ****
    <@sandy> I count 14 days(not including weekends)
    ****
    <@brad> ah, I was counting weekends... my badyes, so max 14 days :)
    ****
    * brad sends sandy a gold star sticker
    07:23
    ****
    <@ngao> brad: our next meeting will be on Tuesday(30th)? not Wednesday(31st)?
    ****
    <@brad> ngao: correct
    07:24
    ****
    <@knocte> right, maybe in that meeting there's a lot of people missing
    ****
    <@brad> ngao: some people in the US take the 31st off
    ****
    <@ngao> i see thanks
    ****
    <@brad> knocte: I think that's fine... if people are missing, they can catch up when they return
    07:25
    ****
    <@ray> brad, thanks for letting us know
    ****
    <@brad> ray: no problem
    ****
    <@bgmerrell> most people take the 30th off too, brad
    ****
    <@knocte> ok because I was thinking to take FTO that whole week
    ****
    <@bgmerrell> generally Provo is empty from the 24th-1st inclusive
    ****
    <@brad> by a show of hands, how many people are thinking about being on FTO?
    07:26
    during that week
    ****
    * bgmerrell shows his hands
    ****
    * sandy is planning on ITO
    ****
    * knocte shows his hands as well
    ****
    <@mario> me too.
    ****
    <@brad> alright lets seemaybe we move it to the 5th?does that sound good for everyone?
    07:27
    ****
    <@knocte> why not 24th? let's ask how many people will be here on that day
    ****
    <@brad> I
    ****
    <@sandy> Brad won'toh
    ****
    <@brad> I'll be on FTO
    ****
    <@sandy> :-P
    ****
    <@knocte> oh
    ****
    <@decriptor> I
    ****
    <@knocte> I won't be on FTO until 29th
    07:28
    ****
    <@brad> well, let's go back to the 5th... will anyone be gone then?
    ****
    <@ngao> FYI, we China guys will be on Holiday 1st-3rd, and 4th is back to work :)
    ****
    <@knocte> I think 6th is better for me
    ****
    <@brad> ngao: isn't the 4th a Sunday?
    07:29
    alright, jan 6th, going once, going twice...
    ****
    <@ngao> brad: yeah, but it's a switch day
    ****
    <@brad> ngao: hmm, how does that work?
    ****
    <@mario> I'm taking FTO on 6th
    07:30
    what about 7?
    ****
    <@knocte> x)
    ****
    <@ngao> brad: it's a switch day for 2nd
    ****
    <@brad> if anyone says they're taking FTO on the 7th, we'll have the meeting at their house
    ****
    * bgmerrell is thinking about getting a pool table for Christmas
    ****
     -!- peteb_ [~ptbrunet@cpe-70-122-57-22.austin.res.r r.com] has quit [ChatZilla 0.9.84-rdmsoft [XULRunner 1.8.0.9/2006120508]]
    07:31
    ****
    <@knocte> woohoo, let's fly to china!
    ****
    * brad is thinking about being in front of bgmerrell's house on christmas day with pool cues
    ****
    <@bgmerrell> :(
    ****
    <@ray> brad, 4th will be a swap day for 2th
    ****
    <@brad> ray: ah, I seeokay, done.  the 7th it is.can everyone please send me schedules of their FTO as soon as they know?  thanks
    07:32
    ****
    <@ray> knocte, that will be cool :)
    07:33
    ****
    <@knocte> ;)
    ****
    <@sandy> everybody, refresh Accessibility:_Sprint_4
    07:34
    ****
    <@decriptor> bgmerrell: you are going to get too much practice in
    ****
    <@calen> brad, BTW, today we filed some new bugs, i think they didn't in Sprint wiki, do you like assign them for next iteration?
    ****
    * decriptor is going to end up losing everytime instead of most of the time
    ****
    <@brad> calen: are they high priority?
    07:35
    sandy: you're a wonderful man
    ****
    <@calen> brad, P2 and P3
    07:36
    ****
    <@sandy> many people praise me for inventing regular expression find/replacebut not enough
    ****
    <@decriptor> sandy: you are awesome
    ****
    <@ray> sandy, woo
    ****
    <@sandy> ;-)
    ****
    <@bgmerrell> a pool table is a pretty big decision
    07:37
    and by big i mean physicallyit takes up a lot of space
    ****
    <@brad> calen: hmm, which bug #s?bgmerrell: the question you must ask yourself is, do you really need a dining room table?
    ****
    <@bgmerrell> hehe
    07:38
    ****
    <@ray> bgmerrell, why don't  you change you mind to have a virtual game instead of a physical one :P
    ****
    <@sandy> because it's pool!
    ****
    <@bgmerrell> we could just be the clampetts
    ****
    <@ray> hehe
    ****
    * bgmerrell watches the joke fly over everyone's heads and feels old
    ****
    <@calen> brad: 457990, 457939,457925,457846, 457845
    ****
    <@brad> bgmerrell: I got it, no worries
    ****
     -!- peteb [~ptbrunet@cpe-70-122-57-22.austin.res.r r.com] has joined #mono-a11y
    07:39
    ****
    <@mgorse> knocte: Would you like me to take 456341 (ComboBoxDropDown selection not implemented completely)?  It is currently unassigned
    ****
    <@knocte> hugh, I just assigned it to me, but let me check something
    ****
    <@mgorse> oh, you must have done it 10 seconds before I messaged :)
    07:40
    ****
    <@knocte> yep x)I thought that bug was part of some feature missing/untested, but now that I look more into it, it should be working
    07:41
    ****
    <@brad> calen: ok, they look likek they're all assigned out now
    07:43
    ****
    <@bgmerrell> mario: i do not agree that 457830 is a duplicate of 457846
    ****
    <@calen> brad, thanks :)
    ****
    <@mario> bgmerrell: I agree with you, however in the bridge, you care about HelpTextProperty, and HelpTextProperty is set either by AccessibleDescription or Tooltip
    07:44
    ****
    <@bgmerrell> mario: we're trying to make bugs as atomic as possible.  it seems like it would be realistic that one of those bugs be fixed while the other is open, which means it is a good candidate for two separate bugs.
    07:46
    in my view anyway. :)
    07:48
    ****
    <@mario> bgmerrell: go ahead and reopen the bug, however it will be the same fix for both.
    ****
    <@brad> as far as new controls, I'll take ToolStripButton, DateTimePicker and FlowLayoutPanel
    ****
    <@mario> brad: you unassigned me in 447851 :-(
    ****
    * decriptor steps out for a minute
    ****
    <@brad> mario: oops
    07:49
    mario: really?  I don't see you assignedmario: alright, I'll give it back
    ****
    <@bgmerrell> mario: are 457845 and 457846 both resolved?
    07:50
    ****
    <@mario> bgmerrell: missing bridge-side
    07:51
    ****
    <@bgmerrell> mario: oh, right, thanks
    ****
    <@mario> now my assigned bugs aren't assigned any more
    ****
    <@brad> mario: what happened?
    ****
    <@mario> so, bugzilla usually says something about a previous change before you commit yours.
    07:52
    ****
    <@bgmerrell> mario: it seems like your comment #2 in 457830 might be important to whoever fixes 457846 on the bridge side
    07:53
    ****
    <@mario> bgmerrell: yep, copying and pasting.
    ****
    <@sandy> brad: I have a bug I added to berserk, and it won't show up in my planning page (though it shows up for me on the main page)
    07:54
    brad: https://bugzilla.novell.com/show_bug.cgi ?id=456598
    ****
    <@brad> sandy: so did you get an error when you tried to add it?
    ****
    <@bgmerrell> ray: calen: #mono-a11y-qa?
    ****
    <@sandy> brad: only the second time
    ****
    <@brad> sandy: because it said it already existed?
    ****
    <@sandy> (said it was already part of the iteration, and when I checked to see who had it, it was me)
    ****
    <@brad> hmm, weird
    07:55
    sandy: did that come from last iteration?
    ****
    <@sandy> noI created the bug last iterationbut it's a regular P4 enhancement
    ****
    <@brad> weirdI'll look at it in a minute
    ****
    <@calen> bgmerrell, sure
    07:56
    ****
    <@sandy> okay, so if our next iteration meeting is the 7th now...
    07:58
    ...that means this iteration is 18 days
    ****
    <@brad> are you sure it isn't 20?
    07:59
    ****
    <@sandy> minus 2 holidays
    ****
    <@brad> wow, berserk is going berserk
    08:02
    ****
    <@sandy> heh
    08:03
    ****
    <@bgmerrell> i'm hungry
    08:04
    ****
    <@brad> well guys, I think we're done, so if the folks in China want to log off if you haven't already, please go ahead
    08:08
    ****
    <@mgorse> sandy: Are you finished working on TreeView?
    08:11
    ****
    <@sandy> mgorse: No, there are two bugs I'm only starting on this iteration: ExpandCollapse support and Value support for editing node namesmgorse: also, I need to patch MWF to have events when nodes are added/removed
    08:12
    there should be enough to get started on the bridge side, but it might be easier to wait until next iteration
    ****
    <@mgorse> ok
    08:14
    ****
    <@decriptor> http://monoport.com/38713
    08:16
    I'm getting a build fail on uiautomationwinforms 64bit onlylast known good rev is 121170, failed on 121217
    08:17
    ****
    <@brad> *** glibc detected *** /usr/bin/mono: free(): invalid pointer: 0x00000000010fd9e8 ***
    08:18
    decriptor: can you re-run it and see if it's consistent?
    ****
    <@decriptor> yeah
    ****
    <@sandy> I saw something weird like this periodically when building UIAutomationWinforms lately
    ****
    <@mgorse> Everything on the sprint 4 page has been assigned
    ****
    <@sandy> I'll pastebin it next time, I don't recall the exact errors
    08:19
    ****
    <@decriptor> 32 bit built findfine
    ****
    <@brad> mgorse: cool, feel free to take on other new feature workdecriptor: I just had a run-in with your doppelganger
    08:20
    ****
    <@sandy> well, except for this one: https://bugzilla.novell.com/show_bug.cgi ?id=443937
    ****
    <@decriptor> brad: ?
    ****
    <@brad> decriptor: https://bugzilla.novell.com/show_bug.cgi ?id=444289
    ****
    <@sandy> oh
    ****
    <@brad> decriptor: Steve Shaw
    ****
    <@sandy> nevermind, that one's fixed
    ****
    <@mgorse> sandy: I marked that fixed
    ****
    <@sandy> thanks mgorse, I was slow to catch up on that one :-)
    ****
    <@decriptor> brad: I'm stephen shaw
    08:21
    ****
    <@sandy> this one, though, is still unassigned: https://bugzilla.novell.com/show_bug.cgi ?id=447852
    ****
    <@mgorse> I'd fixed it a while, then bgmerrell re-opened it but later filed another bug for what wasn't fixed, and the original bug was never re-marked fixed
    ****
    <@brad> decriptor: I know, thus your doppelganger
    ****
    <@decriptor> brad: there is stephen shaw, steve shaw, and steven shaw here in provo :)
    ****
    <@mgorse> *sigh* I was mentally blocking that one out.  I guess I should take it.
    08:22
    ****
    <@ray> brad,  do you know is it correct if panel has "resizable" state?
    ****
    <@decriptor> steve and I both do build stuffthe other guy is in sales
    ****
    <@brad> ray: I guess it depends on the panelray: if the panel can be resized by a user, then yes.  otherwise no
    ****
    <@ray> brad, do you mean resize panel from UI?
    08:23
    ****
    <@brad> ray: correct
    ****
    <@ray> brad, ok, that makes clear, thanks ;)
    08:24
    ****
     -!- sandy changed the topic of #mono-a11y to: Accessibility &amp; Mono | Accessibility | Latest release is 0.9.0
