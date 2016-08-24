---
title: "Accessibility: Team Meetings 2009 Feb 09"
lastmodified: '2009-02-09'
redirect_from:
  - /Accessibility%3A_Team_Meetings_2009_Feb_09/
---

Accessibility: Team Meetings 2009 Feb 09
========================================

    ****
    <@brad> alright folks, let's get started
    07:04****
    <@sshaw> time to party
    ****
    < ray> brad, yes, but those wiki pages are not _really_ correct , right?for some controls
    ****
    <@brad> first off, I really want to thank everyone for putting extra effort in for this rleaseray: they should be.  if they're not, you need to let us know
    ****
    < ray> sshaw, oh, never mind, dude :)
    ****
    <@brad> so I'd like to start off by going around the room and having everyone update us on their status
    07:05
    namely, I'd like to know how many hours of work remain (estimated)
    ****
    < ray> brad, yeah, that's we will do, but i was wondering when you implement the code, what's your devs' reference? :)
    ****
    <@brad> and if they think anything needs to be addressed before we are feature completeray: I'll explain after the meeting
    07:06****
    < ray> brad, yes, sorry :D
    ****
    <@brad> let's start reverse alphabetically by nicksandy: you're up
    ****
    <@sandy> so you can go last?
    ****
    <@brad> hehsandy why do I always have to go first? :)
    ****
    <@sandy> so I've got about 6 hours of work left for my features, plus 8 hours to really finish all my unit tests
    07:07****
    <@sshaw> brad: because you are al capitano:)s/al/il/
    ****
    <@sandy> I ran into some irritating problems with MenuItemit already has a couple of known issues for 1.0
    ****
    <@brad> are these issues in Mono Winforms?
    ****
    <@sandy> but it looks like I may either be spending time hacking around bounding rectangle issues, or adding another one to the listbrad: yesthe winforms api doesn't support muchand I didn't realize some flaws in what I get with internal stuff
    07:08
    in shortMS deprecated this API for a reason :-)anyway, that's my statusshould be done for tomorrow(except maybe some unit tests, we'll see)
    ****
    <@brad> alright.  of course, prioritize the feature work.  we can always do unit tests tomorrow
    07:09****
    <@sandy> I do know how to fix this stuff for Mono 2.6but there is no way jpobst will let changes in nowbecause he's not familiar with the codedone
    ****
    <@brad> that's totally understandablealright, ngao ?
    ****
    < ngao> brad: yes
    07:10****
    <@brad> ngao: can you give your update for us?
    ****
    < ngao> brad: surebrad: there's propertygrid left to implement and colordialog is missing unit test
    07:11
    brad: I'm figuring out how to get BaseColorControl provider
    ****
    <@brad> ngao: what's left to do on propertygrid?
    07:12****
    < ngao> brad: and about PropertyGrid, why it's inner control can't be added by itself
    ****
    <@brad> we may not be recieving events about itanyway, how many hours do you think you have outstanding on that?
    07:13****
    < ngao> brad: actually, i'm not sure about propertygrid, but I think i could talk about colordialog with you guys after meeting and finish it
    07:14****
    <@brad> ngao: alright... maybe if you want to give propertygrid to me, I can finish it up
    ****
    < ngao> brad: oh, thank you, if it won't block your schedule?
    07:15****
    <@brad> ngao: oh, it's no problemngao: just send me the bug numberngao: is that it?  can we move on?
    ****
    < ngao> brad: alright
    07:16****
    <@brad> mgorse: your turn!
    ****
    <@mgorse> okNotifyIcon is the only feature I have left, and I need to expose the bounding rectangle for the iconso I'm guessing about 3 hours, but I've been struggling to figure out how to do that, so it's hard for me to say
    07:17
    The rest are unit tests, which might be another 3-4 hoursIe, I need to test that an accessible-value event is received when a ScrollBar's value is changed, but I vaguely remember trying to add a test for that the other day and the gail test failing, so I need to look into it again
    07:18
    I've generally been having trouble testing eventsbut that's all.  I have PropertyGrid on the bridge, and I don't think it should require any more bridge work in theory, but we need a unit test
    ****
    <@brad> cool
    07:19
    alright, mario, you're up
    ****
    <@mario> helloI'm missing tests for DataGridXXXProvider showever, there's a ListView test that tests ListView when View.Details,
    07:20
    honestly I've been having problems writting the tests, segfaults and that kind of problems
    ****
    <@sandy> :-/
    ****
    <@mario> is driving me crazy, but I'm trying to find the issue.I'm talking about bridge tests, btw
    ****
    <@brad> yeah, I've been having the same kind of issues
    ****
    <@mario> provider side is complete
    07:21
    so, I hope to finish writing all tests today.
    ****
    <@brad> I think next phase, we need to invest more time into making sure our tests are repeatablemario: how many hours do you think you have left?
    ****
    <@mario> I guess 8hrs, more or less
    07:22****
    <@brad> mario: and am I right in saying that none of that work is actually feature work, just unit tests?
    ****
    <@mario> yes, all unit testsbridge tests, actually
    ****
    <@brad> ok, cool
    07:23****
    <@mario> oh I forgot, I'm missing to fix 2 bugslet's add 4 hours more
    ****
    <@sandy> I probably should have specified that besides the bounding rectangle bug, all my work is bridge-side
    ****
    <@brad> those can easily be put off till tomorrow though
    ****
    <@mario> two QA reported bugs
    ****
    <@brad> alright, knocte, I think you're alphabetically next
    ****
    <@knocte> I go
    07:24
    so, thanks to sandy's work on the provider for contextmenu*, the bridge unit tests have been starting to yield some failures, and I've fixed some of them, but I still have to fix 4:a) GetExtents is failing to give positive coordinatesb) the test is deadlocking on app termination (maybe because I'm not yet handling the MenuClosed event)c) the test affects other test in the suite if it's not run the last oned) still don't know if it passes Atk.Selection testsI guess I will need 4 hours for this
    07:25
    and later I'll do a test for ContextMenu, which maybe it's working out of the box by just wrapping it under the same bridge class as ContextMenuStrip (I guess I need 1 or 2 hours more for this)after that, if I have time, I'll refactor a bit more the menu stuff
    ****
    <@brad> ok, sounds good
    07:26****
    <@knocte> and with that, I would be feat complete
    ****
    <@brad> super.as for me, I'll be taking on Neville's PropertyGrid workbut my last feature was ScrollableControlwhich I finished on Friday
    ****
    <@sandy> (seems to have not broken anything)
    07:27****
    <@brad> for the most part, wherever it's used, it's worked out of the box on the Bridgeyeah, surprisingly enoughI've hit some odd cases though... UpDownBase subclasses ScrollableControlbut Mono doesn't seem to implement it properlyso I've got to file some bugs when I get a chance
    07:28
    and that's really itI'll be sending out some policies about tomorrowbasically, only bug fixes, no new features, likely some form of code review required
    07:29
    and working with Sandy to split up some exploratory tasks when people get done with the bugs they assign tomorrowanything else anyone wants to bring up?ok, meeting adjourned
    07:30
    thanks guys for joining
    ****
    <@sshaw> brad: no thank you
    07:31****
    <@knocte> sandy: can you post the log? :)
    07:33****
    <@sandy> knocte: yeahI noticed the other day that I missed a few...but yeah, I'll post this
    07:34****
    <@knocte> cool thx
