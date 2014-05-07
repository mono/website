---
layout: obsolete
title: "Accessibility: Team Meetings 2008 Dec 10"
permalink: /old_site/Accessibility:_Team_Meetings_2008_Dec_10/
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Dec_10/
---

Accessibility: Team Meetings 2008 Dec 10
========================================

``` nowiki
-!- sandy changed the topic of #mono-a11y to: Accessibility &amp; Mono | http://www.mono-project.com/Accessibilit y | Iteration Meeting in progress
```

07:03

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
so last iteration we were distracted with a whole lot of things
```

07:04

****

``` nowiki
* sandy&nbsp;
```

``` nowiki
wants a gold star
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
bugs from QA
```

``` nowiki
test breakages, etc
```

``` nowiki
but we need to take steps to avoid distractions if at all possible
```

``` nowiki
so that we can make our deadlines
```

``` nowiki
so if there's anything at all that is bothering you, or that we could be doing better to avoid issues like this
```

``` nowiki
please let me know
```

07:05

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
I thought it was helpful when you suggested we push off QA bugs until next iteration...made me better able to focus, at least
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
as far as bugs coming in from QA, they'll be only marking as p1 issues that break the build, or otherwise make it very difficult to get anything done
```

``` nowiki
sandy: yeah, that will hopefully help
```

``` nowiki
other bugs, p2 and lower, will be put off until the next iteration
```

07:06

``` nowiki
so that developers can focus
```

``` nowiki
lets see, other than that, we have the 0.9.1 tag happening on friday
```

``` nowiki
so please backport anything that meets the critera I mentioned earlier
```

``` nowiki
moving on, this sprint will be 3 weeks so that we can accomodate various holiday vacations
```

07:07

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
brad: Do you know yet what time on Friday we'll tag for 0.9.1?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
so our next meeting will be on the 30th
```

``` nowiki
mgorse: that depends on decriptor mainly
```

``` nowiki
mgorse: I'd imagine around 12 MST, but I'll send the details out later
```

07:08

``` nowiki
so for developers, the priorities for this next iteration are as follows
```

``` nowiki
high priority open bugs (p1), features for 0.9, backporting, open bugs, and 1.0 architecture stuff
```

07:09

``` nowiki
and then new features
```

``` nowiki
for 1.0
```

``` nowiki
I have a wiki page prepared that should help a bit
```

``` nowiki
http://mono-project.com/Accessibility:_S print_4
```

``` nowiki
so when assigning work, please pick from this page first
```

``` nowiki
some of them are assigned to Andres, so please only select #444686 and #428614 from him
```

07:10

``` nowiki
any questions before we move on?
```

``` nowiki
ok
```

``` nowiki
bgmerrell: do you mind giving a quick recap of QA's deadlines coming up so that the developers are aware?
```

07:11

``` nowiki
bgmerrell: or maybe delegate that to someone with a better keyboard?
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
haha
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
hmm, he doesn't seem to be responding
```

``` nowiki
calen: could you fill us in on your deadlines?
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
is there a wiki page with the QA schedule?
```

07:12

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
yes almost to odffice
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
bgmerrell: heh, okay.. we can give you a bit of time
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
brad: hi
```

07:13

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
decriptor: hello
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
yes, we have a  google doc in http://spreadsheets.google.com/ccc?key=p wydy7S3XPTBTRS9n_oBjJA&amp;hl=zh_CN
```

``` nowiki
brad, can you set bug456343 to high priority?
```

07:14

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
it would be really great if you guys could write a wiki doc at a very high level for us
```

``` nowiki
calen: let me look
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
ahh, much better
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
calen: it's already a p1 and already mentioned on the wiki page
```

07:15

``` nowiki
calen: what else would you like me to do?
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
brad, oh sorry, i didn't saw it. thanks!
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
calen: sure, no problem
```

``` nowiki
bgmerrell: the floor is yours
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
okay, so basically Jared has asked QA to be very diligent in getting all of the controls that made it in 0.9 tested before Dec 17
```

07:16

``` nowiki
so Ray, Calen and I have all been working only on Strongwind tests for the last few weeks
```

``` nowiki
each Wednesday we have deadlines set so that we can have all the controls tested by the 17th
```

07:17

``` nowiki
like Calen said, the deadlines are shown in the google spreadsheet, but we can create a higher level wiki based on that
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
that would be great, thank you bgmerrell
```

``` nowiki
alright, anything else before we start assignments?
```

07:18

``` nowiki
cool.  go ahead and start assigning work... please pick around 5 hours per day for as many days as you'll be in town.  Max 20 days
```

07:19

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
so the only Novell holidays are Dec 25 and Jan 1, right?
```

07:21

``` nowiki
(in the US)
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
yes
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
right
```

****

``` nowiki
* bgmerrell&nbsp;
```

``` nowiki
waves his fist at the brad
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
bgmerrell: not my fault you're too slow...
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
!
```

``` nowiki
oh no you di'int
```

07:22

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
our iteration ends on teh 29th
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
yes
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
I count 14 days
```

``` nowiki
(not including weekends)
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ah, I was counting weekends... my bad
```

``` nowiki
yes, so max 14 days :)
```

****

``` nowiki
* brad&nbsp;
```

``` nowiki
sends sandy a gold star sticker
```

07:23

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
brad: our next meeting will be on Tuesday(30th)? not Wednesday(31st)?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ngao: correct
```

07:24

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
right, maybe in that meeting there's a lot of people missing
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ngao: some people in the US take the 31st off
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
i see thanks
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
knocte: I think that's fine... if people are missing, they can catch up when they return
```

07:25

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
brad, thanks for letting us know
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ray: no problem
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
most people take the 30th off too, brad
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
ok because I was thinking to take FTO that whole week
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
generally Provo is empty from the 24th-1st inclusive
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
by a show of hands, how many people are thinking about being on FTO?
```

07:26

``` nowiki
during that week
```

****

``` nowiki
* bgmerrell&nbsp;
```

``` nowiki
shows his hands
```

****

``` nowiki
* sandy&nbsp;
```

``` nowiki
is planning on ITO
```

****

``` nowiki
* knocte&nbsp;
```

``` nowiki
shows his hands as well
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
me too.
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
alright lets see
```

``` nowiki
maybe we move it to the 5th?
```

``` nowiki
does that sound good for everyone?
```

07:27

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
why not 24th? let's ask how many people will be here on that day
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
I
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
Brad won't
```

``` nowiki
oh
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
I'll be on FTO
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
:-P
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
oh
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
I
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
I won't be on FTO until 29th
```

07:28

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
well, let's go back to the 5th... will anyone be gone then?
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
FYI, we China guys will be on Holiday 1st-3rd, and 4th is back to work :)
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
I think 6th is better for me
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ngao: isn't the 4th a Sunday?
```

07:29

``` nowiki
alright, jan 6th, going once, going twice...
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
brad: yeah, but it's a switch day
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ngao: hmm, how does that work?
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
I'm taking FTO on 6th
```

07:30

``` nowiki
what about 7?
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
x)
```

****

``` nowiki
&lt;@ngao&gt;&nbsp;
```

``` nowiki
brad: it's a switch day for 2nd
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
if anyone says they're taking FTO on the 7th, we'll have the meeting at their house
```

****

``` nowiki
* bgmerrell&nbsp;
```

``` nowiki
is thinking about getting a pool table for Christmas
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- peteb_ [~ptbrunet@cpe-70-122-57-22.austin.res.r r.com] has quit [ChatZilla 0.9.84-rdmsoft [XULRunner 1.8.0.9/2006120508]]
```

07:31

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
woohoo, let's fly to china!
```

****

``` nowiki
* brad&nbsp;
```

``` nowiki
is thinking about being in front of bgmerrell's house on christmas day with pool cues
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
:(
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
brad, 4th will be a swap day for 2th
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ray: ah, I see
```

``` nowiki
okay, done.  the 7th it is.
```

``` nowiki
can everyone please send me schedules of their FTO as soon as they know?  thanks
```

07:32

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
knocte, that will be cool :)
```

07:33

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
;)
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
everybody, refresh http://mono-project.com/Accessibility:_S print_4
```

07:34

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
bgmerrell: you are going to get too much practice in
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
brad, BTW, today we filed some new bugs, i think they didn't in Sprint wiki, do you like assign them for next iteration?
```

****

``` nowiki
* decriptor&nbsp;
```

``` nowiki
is going to end up losing everytime instead of most of the time
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
calen: are they high priority?
```

07:35

``` nowiki
sandy: you're a wonderful man
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
brad, P2 and P3
```

07:36

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
many people praise me for inventing regular expression find/replace
```

``` nowiki
but not enough
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
sandy: you are awesome
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
sandy, woo
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
;-)
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
a pool table is a pretty big decision
```

07:37

``` nowiki
and by big i mean physically
```

``` nowiki
it takes up a lot of space
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
calen: hmm, which bug #s?
```

``` nowiki
bgmerrell: the question you must ask yourself is, do you really need a dining room table?
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
hehe
```

07:38

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
bgmerrell, why don't  you change you mind to have a virtual game instead of a physical one :P
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
because it's pool!
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
we could just be the clampetts
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
hehe
```

****

``` nowiki
* bgmerrell&nbsp;
```

``` nowiki
watches the joke fly over everyone's heads and feels old
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
brad: 457990, 457939,457925,457846, 457845
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
bgmerrell: I got it, no worries
```

****

``` nowiki
&nbsp;
```

``` nowiki
-!- peteb [~ptbrunet@cpe-70-122-57-22.austin.res.r r.com] has joined #mono-a11y
```

07:39

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
knocte: Would you like me to take 456341 (ComboBoxDropDown selection not implemented completely)?  It is currently unassigned
```

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
hugh, I just assigned it to me, but let me check something
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
oh, you must have done it 10 seconds before I messaged :)
```

07:40

****

``` nowiki
&lt;@knocte&gt;&nbsp;
```

``` nowiki
yep x)
```

``` nowiki
I thought that bug was part of some feature missing/untested, but now that I look more into it, it should be working
```

07:41

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
calen: ok, they look likek they're all assigned out now
```

07:43

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
mario: i do not agree that 457830 is a duplicate of 457846
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
brad, thanks :)
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
bgmerrell: I agree with you, however in the bridge, you care about HelpTextProperty, and HelpTextProperty is set either by AccessibleDescription or Tooltip
```

07:44

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
mario: we're trying to make bugs as atomic as possible.  it seems like it would be realistic that one of those bugs be fixed while the other is open, which means it is a good candidate for two separate bugs.
```

07:46

``` nowiki
in my view anyway. :)
```

07:48

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
bgmerrell: go ahead and reopen the bug, however it will be the same fix for both.
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
as far as new controls, I'll take ToolStripButton, DateTimePicker and FlowLayoutPanel
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
brad: you unassigned me in 447851 :-(
```

****

``` nowiki
* decriptor&nbsp;
```

``` nowiki
steps out for a minute
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
mario: oops
```

07:49

``` nowiki
mario: really?  I don't see you assigned
```

``` nowiki
mario: alright, I'll give it back
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
mario: are 457845 and 457846 both resolved?
```

07:50

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
bgmerrell: missing bridge-side
```

07:51

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
mario: oh, right, thanks
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
now my assigned bugs aren't assigned any more
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
mario: what happened?
```

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
so, bugzilla usually says something about a previous change before you commit yours.
```

07:52

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
mario: it seems like your comment #2 in 457830 might be important to whoever fixes 457846 on the bridge side
```

07:53

****

``` nowiki
&lt;@mario&gt;&nbsp;
```

``` nowiki
bgmerrell: yep, copying and pasting.
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
brad: I have a bug I added to berserk, and it won't show up in my planning page (though it shows up for me on the main page)
```

07:54

``` nowiki
brad: https://bugzilla.novell.com/show_bug.cgi ?id=456598
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sandy: so did you get an error when you tried to add it?
```

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
ray: calen: #mono-a11y-qa?
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
brad: only the second time
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
sandy: because it said it already existed?
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
(said it was already part of the iteration, and when I checked to see who had it, it was me)
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
hmm, weird
```

07:55

``` nowiki
sandy: did that come from last iteration?
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
no
```

``` nowiki
I created the bug last iteration
```

``` nowiki
but it's a regular P4 enhancement
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
weird
```

``` nowiki
I'll look at it in a minute
```

****

``` nowiki
&lt;@calen&gt;&nbsp;
```

``` nowiki
bgmerrell, sure
```

07:56

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
okay, so if our next iteration meeting is the 7th now...
```

07:58

``` nowiki
...that means this iteration is 18 days
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
are you sure it isn't 20?
```

07:59

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
minus 2 holidays
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
wow, berserk is going berserk
```

08:02

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
heh
```

08:03

****

``` nowiki
&lt;@bgmerrell&gt;&nbsp;
```

``` nowiki
i'm hungry
```

08:04

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
well guys, I think we're done, so if the folks in China want to log off if you haven't already, please go ahead
```

08:08

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
sandy: Are you finished working on TreeView?
```

08:11

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
mgorse: No, there are two bugs I'm only starting on this iteration: ExpandCollapse support and Value support for editing node names
```

``` nowiki
mgorse: also, I need to patch MWF to have events when nodes are added/removed
```

08:12

``` nowiki
there should be enough to get started on the bridge side, but it might be easier to wait until next iteration
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
ok
```

08:14

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
http://monoport.com/38713
```

08:16

``` nowiki
I'm getting a build fail on uiautomationwinforms 64bit only
```

``` nowiki
last known good rev is 121170, failed on 121217
```

08:17

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
*** glibc detected *** /usr/bin/mono: free(): invalid pointer: 0x00000000010fd9e8 ***
```

08:18

``` nowiki
decriptor: can you re-run it and see if it's consistent?
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
yeah
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
I saw something weird like this periodically when building UIAutomationWinforms lately
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
Everything on the sprint 4 page has been assigned
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
I'll pastebin it next time, I don't recall the exact errors
```

08:19

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
32 bit built find
```

``` nowiki
fine
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
mgorse: cool, feel free to take on other new feature work
```

``` nowiki
decriptor: I just had a run-in with your doppelganger
```

08:20

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
well, except for this one: https://bugzilla.novell.com/show_bug.cgi ?id=443937
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
brad: ?
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
decriptor: https://bugzilla.novell.com/show_bug.cgi ?id=444289
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
oh
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
decriptor: Steve Shaw
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
nevermind, that one's fixed
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
sandy: I marked that fixed
```

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
thanks mgorse, I was slow to catch up on that one :-)
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
brad: I'm stephen shaw
```

08:21

****

``` nowiki
&lt;@sandy&gt;&nbsp;
```

``` nowiki
this one, though, is still unassigned: https://bugzilla.novell.com/show_bug.cgi ?id=447852
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
I'd fixed it a while, then bgmerrell re-opened it but later filed another bug for what wasn't fixed, and the original bug was never re-marked fixed
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
decriptor: I know, thus your doppelganger
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
brad: there is stephen shaw, steve shaw, and steven shaw here in provo :)
```

****

``` nowiki
&lt;@mgorse&gt;&nbsp;
```

``` nowiki
*sigh* I was mentally blocking that one out.  I guess I should take it.
```

08:22

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
brad,  do you know is it correct if panel has "resizable" state?
```

****

``` nowiki
&lt;@decriptor&gt;&nbsp;
```

``` nowiki
steve and I both do build stuff
```

``` nowiki
the other guy is in sales
```

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ray: I guess it depends on the panel
```

``` nowiki
ray: if the panel can be resized by a user, then yes.  otherwise no
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
brad, do you mean resize panel from UI?
```

08:23

****

``` nowiki
&lt;@brad&gt;&nbsp;
```

``` nowiki
ray: correct
```

****

``` nowiki
&lt;@ray&gt;&nbsp;
```

``` nowiki
brad, ok, that makes clear, thanks ;)
```

08:24

****

``` nowiki
&nbsp;
```

``` nowiki
-!- sandy changed the topic of #mono-a11y to: Accessibility &amp; Mono | http://www.mono-project.com/Accessibilit y | Latest release is 0.9.0
```

