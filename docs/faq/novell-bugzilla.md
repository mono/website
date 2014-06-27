---
layout: docpage
navgroup: docs
title: "FAQ: Novell Bugzilla"
---

Accounts
--------

#### How do I create a Novell Bugzilla account?

Go to [Create a Novell Account](http://secure-www.novell.com/selfreg/jsp/createSimpleAccount.jsp?target=https%3A//bugzilla.novell.com/ichainlogin.cgi%3Ftarget%3Dindex.cgi%3FGoAheadAndLogIn%253D1). Fill out the information and click "Create Account". Make sure you remember to validate your account using the instructions in this FAQ.

#### I can't login because it says I need to validate my e-mail address

After creating a Novell bugzilla account, you should receive an e-mail asking you to validate your e-mail address. Follow the instructions in the e-mail and then try to login to bugzilla again.

If for some reason you don't receive the validation e-mail, you can ask them to re-send the validation e-mail by going to the [validate e-mail address](http://secure-www.novell.com/selfreg/jsp/protected/validateEmail.jsp) link. On the bottom of the page, under the section "Don't have a code?" click on the "Request Code" button. This will send you the validation e-mail.

#### How do I edit my Novell Account settings?

Go [Here](http://secure-www.novell.com/selfreg/jsp/protected/manageAccount.jsp).

General
-------

#### Why is Novell Bugzilla so slow?

Novell Bugzilla is used by many people, so at certain times of the day it is slower than at other times. Generally it is slower during 6:00am - 6:00pm MST because that's when the bulk of Novell employees use it.

That being said, even during those peak times, it isn't slow enough to be unusable. If it is unusable to you, it is probably while you are logging in to Bugzilla. This is actually not part of Bugzilla at all. It is the common authentication for all of Novell.Com called iChain. I have talked to both the Bugzilla and the iChain teams about this slowness and they are looking into it. One thing that seems to help is to turn off TLS 1.0 support in your browser. In FireFox on Linux you can do this by going to Edit / Preferences / Advanced / Encryption and unchecking the checkbox "Use TLS 1.0". Since I made this change, I haven't seen any long pauses while logging into Novell Bugzilla.

It is unfortunate that the slowness happens during login, as this is the first thing you do in Bugzilla. This seems to give the impression that all of Novell Bugzilla is slow, however, the rest of Novell Bugzilla should run at normal Bugzilla speed.

If there is a repeatable procedure to show slowness, or if you have a WireShark log of your Novell login session where it was slow, please contact twiest on [IRC]({{site.github.url}}/old_site/IRC "IRC") (\#mono).

#### I don't like the "My Bugs" saved search, how do I get rid of it?

You can't really delete it, but you can make it not show in the header / footer.

Here's how:

-   Login to Novell Bugzilla
-   Click on "Preferences"
-   Click on "Saved Searches"
-   Uncheck the "Show in Footer" checkbox that's next to "My Bugs / My Reports"
-   Click "Submit Changes"

#### Who do I contact if I have problems that aren't addressed on this FAQ?

Please contact twiest on [IRC]({{site.github.url}}/old_site/IRC "IRC") (\#mono).

