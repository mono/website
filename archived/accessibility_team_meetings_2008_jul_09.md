---
title: "Accessibility: Team Meetings 2008 Jul 09"
lastmodified: '2008-07-09'
redirect_from:
  - /Accessibility:_Team_Meetings_2008_Jul_09/
---

Accessibility: Team Meetings 2008 Jul 09
========================================

-!- Calen changed the topic of \#mono-a11y to: :Accessibility team Iteration 8 meeting
07:00
**\<@Calen\> **
jpallen: hello
**\< jpallen\> **
Hello!
**\< Ray\> **
hello jpallen
07:01
**\<@Calen\> **
i think everybody is here now except Calvin and Andres. they can't attend this meeting so Jared asked me to run it.
my system not very strong it always log out automatically, so if i lost the link sandy please help continue running this meeting, thanks :)
07:02
**\< jpallen\> **
Go for it Calen
**\<@sandy\> **
np
**\<@Calen\> **
let's get started. we will run as usual,
07:03
first tell what you have done in Iteration7 then tell what you will do in Iteration8, after that remember say 'done' :)
also you can put forward any question you have, if it's a complex question someone can discuss it after the meeting, otherwise someone can answer it after he done \^ \^
we will follow the Iteration7 list.
sandy: would you please go first?
**\<@sandy\> **
sure thing
**\<@Calen\> **
sandy: please
07:04
**\<@sandy\> **
okay, so I talked to Miguel again about this outstanding olive patch, and he asked me to re-send it...then he ran off to GUADEC so I doubt there will be any resolution this until next week
decriptor alerted me to some issues with how the UiaAtkBridge package was installed
and I fixed that, but I've been struggling to have the makefiles work in a 64-bit environment
it simple makefile stuff that I'm just having trouble learning
07:05
so once again an iteration where I didn't get to coding
but since nobody here is running 64-bit besides knocte...
I'm going to ignore the problem for now so I can make some more measurable progress
so next iteration...
I'll finish all of my testing tasks that are listed
and I should pick up a new provider, or at least ask mario where current providers need work
07:06
done
**\<@Calen\> **
sandy: good! thanks
sandy: i know you have finished so many hard job, do you have wiki page done can share for other person?
07:07
**\<@sandy\> **
Calen: I didn't have time to update it, I will have to do it after the meeting
**\<@Calen\> **
Calen: i really hope can study from you :) thanks in advance..
07:08
**\<@sandy\> **
Calen: oh, you mean you want me to document the makefiles stuff on the wiki?
okay, I can do that
** **
-!- mgorse\_ [\~mgorse@c-65-96-135-104.hsd1.ma.comcast .net] has joined \#mono-a11y
**\< mgorse\_\> **
Sorry about that
**\<@Calen\> **
sandy: thanks
07:09
now turn next, Mario: please go:)
**\<@mario\> **
Ok.
This iteration was about Navigation, so ComboBox, ListBox, ScrollBar and other Controls that doesn't have children now are supporting navigation
07:11
however, I still need to test with Vista, because seems that when children are removed/added the tree is rebuild, meaning that each leaf has new runtimeId, you know, new instances
07:12
** **
-!- mgorse [\~mgorse@c-65-96-135-104.hsd1.ma.comcast .net] has quit [Ping timeout: 600 seconds]
**\<@mario\> **
so, Navigation is working, but more tests are needed.
next iteration: navigation and more tests.
07:13
done.
**\<@Calen\> **
mario: thanks:)
Ngao: go ahead please
**\< ngao\> **
ok
in the last iteration, I set up the parallel mono environment, and could compile the codes in it.
07:14
I read some codes of Behavior, and write StatusBarGridProviderBehavior.
for StatusBar, I think the properties of Grid control pattern shouldn't always return the default value, but I'm not very sure which provider is to be implemented.
in the next iteration, I would deeply understand the logic, especially Navigation, and try to figure out if another provider should be done for StatusBar.
done
**\<@Calen\> **
ngao: thanks, so will you work with mario or sandy?
07:15
**\< ngao\> **
Calen: yes
07:16
Calen: both
**\<@Calen\> **
ngao: nice
okay, let's jump over Calvin and Andres
next turn mgorse\_, please go
** **
-!- mgorse\_ is now known as mgorse
**\< mgorse\> **
ok
Last iteration I added a couple of missing pieces to atspi-dbus (the .po and .pc files, and coded a login-helper interface but haven't tested it)
07:17
and I patched gok to build against the new cspi but haven't done anything with the patch so far
also looked a bit at an a11y bug affecting OpenSUSE, but that's unrelated to anything
07:18
My plan from here on out is to only work on at-spi-dbus on an as-needed basis and to also work on other things, probably the UIA Atk bridge
07:19
I've asked Andres what he thought I should work on. He briefly wrote and suggested that ther emight be an infinite loop in the combobox constructor that I could look at. He said that he'd write again later
at the moment I'm updating my Mono installation, and I installed ironpython this morning, since I figure it might help me test things as I'm coding
07:20
I'm also moving this weekend, so I'm planning to take FTO on Friday
might know better later on today what I'll be doing this iteration, so I'll update the wiki then
done
**\<@Calen\> **
mgorse: cool job, thanks
07:21
bgmerrell: are you here? now turn you to report :)
**\<@bgmerrell\> **
I am here
This iteration I reviewed the code of all of our WinForms sample applications that we have been writing. I made some notes and sent them to Ray, who is maintaining those for us.
I also did some work with Tooltip and TreeView widgets in Gtk to get a better idea of how we can test them effectively in WinForms.
07:22
And I finished working with Calen on a couple of Gtk Strongwind tests and added them to our Gtk test suite. Calen is a Strongwind expert now :D This should all make the WinForms testing go a lot smoother.
**\<@Calen\> **
bgmerrell: lol
07:23
**\<@bgmerrell\> **
This next iteration hopefully we will start working against WinForms. I need to update the Fedora and Ubuntu VMs with our test environment if there is time, finish writing docs and a tutorial for our testing methods, and start looking at Orca tests.
** **
-!- jpallen [\~jpallen@ariadne.provo.novell.com] has quit [used jmIrc]
07:24
**\<@bgmerrell\> **
whatever is possible/most important
done
** **
-!- jpallen [\~jpallen@137.65.133.36] has joined \#mono-a11y
07:25
**\<@Calen\> **
bgmerrell: thanks very much
BTW, developers, would you like try our winforms application those we have finished?
**\<@sandy\> **
I'm sure they'll be helpful to us
07:26
**\<@mario\> **
Calen, sure, which one?
**\<@Calen\> **
i hope you can give us any suggestion \^ \^
mario: you can find them from SVN
07:27
mario: we put them in uia2atk/test/samples/
**\<@mario\> **
are the ipython apps?
**\<@Calen\> **
mario: yes
**\< Ray\> **
mario, ironpython, not ipython, :D
**\* sandy **
likes to say FePy
07:28
**\<@Calen\> **
mario: oh sorry,yeah ironpython
Ray: thanks Ray
**\< Ray\> **
mario, ipython is a interactive python shell i think
**\<@bgmerrell\> **
fyi, the suse package for Iron Python is IPCE
**\<@Calen\> **
in Accessibility:\_Test\_Plan\_WinForms\_Controls you can find which control link to which application
**\<@mario\> **
Ok, I'll try the samples.
07:29
**\< Ray\> **
mario, and give the feedback, please :)
**\<@mario\> **
Ray, sure
**\<@Calen\> **
 :)
**\< Ray\> **
mario, thank you so much
**\<@bgmerrell\> **
also, sandy discovered that you have to run "mono /usr/lib/IPCE/ipy/ipy.exe uia2atk/test/samples/foo.py"
**\<@Calen\> **
Okay, Ray please go your report
07:30
**\< Ray\> **
Calen, will you ahead of me? behind of bgmerrell ?
ok, my turn.
07:31
**\<@Calen\> **
Ray: you ahead of me in the list :)
**\< Ray\> **
in iteration 7, it's a BIG thanks to bgmerrel who spends so much time to review the samples i have written,
and i have followed up what bgmerrel suggested, starting to improve the samples.
now i have finished half of them, but more difficult samples are left,
so i should spend a lilttle time to finish the rest. on the other hand, i haven't implemented new samples. hope to have some finished in next cycle.
07:32
addtionally, a BIG thanks to decriptor as well, because of his valuable efforts of our building stuff, i haven't much time to spend on it.
thank you so much, decriptor.
so, in next iteration, continue to improve the rest samples, and hope to start new samples.
done
07:33
**\<@Calen\> **
Ray: don't worry the difficult samples, we trust you can do it well. thanks you improve some of my samples:)
07:34
now turn me to say
i have finished a practice of strongwind test script for statusbar, menubar/menuitem, toolbar, pagetab, scrollbar.
i wrote all of those tests in one test script by runing gedit as practice application because gedit have many controls can be run.
i posted my strongwind study information in my blog i hope it will helpful and i will update it in real time when i implement new control.
07:35
thanks bgmerrell responded to my blog, you give me a big help :)
oh, i have finished radiobutton without name with bgmerrell's help, but still have a problem in tooltip
07:36
i can't do findToolTip() it will return me search error
07:37
in next iteration i hope i can implement more controls, but now i haven't exact plan for what controls i will implement in next coming week maybe 'FileDialog, FontDialog, OpenFileDialog'. done
decriptor: how about you? plese go your report :)
**\<@decriptor\> **
Calen: ok
07:38
so this last iteration I worked on the build plan (Accessibility:\_Build\_Plan) so if anyone has any comments on that let me know. I also implemented OBS on build0 to an extent. Hopefully we can get that fully up and running. Possibly trying to patch a bug there. Started to put monobuild on build1.
07:40
this iteration, hopefully get OBS fully up and running. Hoping get monobuild up on the other machine. Start working with the mono team and seeing where we can help each other with the build stuff
07:41
done
**\<@Calen\> **
decriptor: thanks!
07:43
decriptor: i didn't see your name in schedule list:)
did i miss anybody? does any else topic we should talk?
**\< jpallen\> **
i would like to add a few things
07:44
**\<@Calen\> **
jpallen: please
**\< jpallen\> **
first of all, good job everyone on another iteration. We're continuing to make a lot of progress
07:45
as we report our efforts and what we plan on doing for the next iteration there is something missing
07:46
that is -- how are we tracking against our schedule
07:47
so, i have asked Andres to take a closer look at that
he sent me a preliminary analysis before he left for GUADEC
i will be working with him on this when he returns
as a result, we hope to have a better understanding of where we're at in regard to phase 1 of the project
07:48
in other words, overall, are we currently 30% complete, or 45% complete, etc.
this will allow is to manage our efforts a little bit tighter
07:49
so, stay tuned for some good stuff coming from Andres :)
**\< mgorse\> **
jpallen: When is he going to return?
**\< jpallen\> **
he is out all week
he will be back monday or tuesday next week
**\<@sandy\> **
mgorse: I think he said Tuesday
07:50
**\< mgorse\> **
ok
**\< jpallen\> **
also, i don't think last week's meeting log got posted to the wiki
who was going to do that?
**\<@sandy\> **
jpallen: perhaps I forgot to link it, but it's up
I'll fix that
**\<@Calen\> **
jpallen: i posted it
**\<@sandy\> **
Accessibility:\_Team\_Meetings\_2008\_Jul\_02
07:51
**\< jpallen\> **
ah
ok
i see it now
thanks
**\<@Calen\> **
sandy: please help post this meeting log, and give a link in Team wiki page. thanks:)
**\<@sandy\> **
will do
**\< jpallen\> **
i will be in the cambridge office at the beginning of next week
i will be doing some interviewing
**\< mgorse\> **
for our team?
07:52
**\< jpallen\> **
yes
mario: we'll sit down and chat for a bit while i'm there
i also plan on being in Beijing in October
**\<@mario\> **
jpallen, ok
**\< Ray\> **
jpallen, that's good :)
07:53
**\< jpallen\> **
Calen: Ray: ngao: any good candidates for our developer positions in Beijing?
**\< Ray\> **
not yet,
**\<@Calen\> **
jpallen: i havn't :(
**\< ngao\> **
jpallen: not yet.
**\< jpallen\> **
Calen: Ray: ngao: a recommendation from any of you would be highly valuable
07:54
**\< Ray\> **
jpallen, sure, we will try to find before you come. :)
**\< jpallen\> **
that would be great
i don't want to wait until i get there
i would like to fill those slots now
07:55
so, if you have any past associates that you think would be a good fit, please let me know
**\<@Calen\> **
jpallen: if we find we will send you their resume first:)
**\< Ray\> **
certainly
**\< ngao\> **
jpallen: ok
**\< jpallen\> **
great
07:56
ok. that's all from me. i've got to jump into another meeting now. thanks again, everyone, for all of your hard work and dedication. keep it up! :-)
**\<@Calen\> **
jpallen: thank! see you
**\< Ray\> **
jpallen, we will, thank you, jpallen
**\< jpallen\> **
bye
**\< ngao\> **
jpallen: thanks
**\<@Calen\> **
Okay, thanks for everyone. don't forget update status in schedule page.
07:57

