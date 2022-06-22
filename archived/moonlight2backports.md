---
title: "Moonlight2Backports"
lastmodified: '2010-02-22'
redirect_from:
  - /Moonlight2Backports/
---

Moonlight2Backports
===================

Here is a list of commits that are candidates for backport to Moonlight's 2.0 branch (Moonlight 2.2)
----------------------------------------------------------------------------------------------------

moon

r148620 moon - [https://bugzilla.novell.com/show_bug.cgi?id=580901](https://bugzilla.novell.com/show_bug.cgi?id=580901) - [regression] My Silverlight chess board is broken in Moonlight 2.1 (Already backported in r152037).

r150505, r151553, r151933 moon - [https://bugzilla.novell.com/show_bug.cgi?id=582024](https://bugzilla.novell.com/show_bug.cgi?id=582024) - firefox 3.6 support (already backported on r152247, r152248, r152249)

Here is a list of commits that are candidates for backport to Moonlight's 2.0 branch (Moonlight 2.1)
----------------------------------------------------------------------------------------------------

moon

r146666 moon - [https://bugzilla.novell.com/show_bug.cgi?id=566639](https://bugzilla.novell.com/show_bug.cgi?id=566639) - Can't be compiled with HAVE_UNWIND

r148730 moon - [https://bugzilla.novell.com/show_bug.cgi?id=552190](https://bugzilla.novell.com/show_bug.cgi?id=552190) - Make sure StructureChanged is raised

r148762 moon - [https://bugzilla.novell.com/show_bug.cgi?id=569810](https://bugzilla.novell.com/show_bug.cgi?id=569810) - SIGSEGV in telecinco.es (and kwikpix.ca) wrt new/old NULL values

r148775 moon - g_unlink earlier to avoid leaving 0 byte files on error

r148780 moon - [http://bugzilla.novell.com/show_bug.cgi?id=566155](http://bugzilla.novell.com/show_bug.cgi?id=566155) (Missing event on StrokeDashArray)

r148798 moon - fix to gtk/moonlight-gtk.source to make docs work

r148819 moon - [https://bugzilla.novell.com/show_bug.cgi?id=549215](https://bugzilla.novell.com/show_bug.cgi?id=549215) - Allow MoonAtkBridge to cleanly shutdown before app domain is unloaded

r148825 moon - [http://bugzilla.novell.com/show_bug.cgi?id=535709](http://bugzilla.novell.com/show_bug.cgi?id=535709) - Multiple calls to Application:GetResourceStream leads to "IOException: Too many open files"

r148934, r149094, r149095, r149214 moon - [https://bugzilla.novell.com/show_bug.cgi?id=565731](https://bugzilla.novell.com/show_bug.cgi?id=565731) [https://bugzilla.novell.com/show_bug.cgi?id=569036](https://bugzilla.novell.com/show_bug.cgi?id=569036) - html bridge fixes for arrays

r149138 moon - [https://bugzilla.novell.com/show_bug.cgi?id=568186](https://bugzilla.novell.com/show_bug.cgi?id=568186) - moonlight 2.0 crashes on [http://www.inn.co.il/News/News.aspx/198682](http://www.inn.co.il/News/News.aspx/198682). Fix IS_NOTIFY_[SPLASH]SOURCE macros

r149243 moon - update Environment.Version test for SL3

r149257 moon - [http://bugzilla.novell.com/show_bug.cgi?id=568627](http://bugzilla.novell.com/show_bug.cgi?id=568627) - IsOffscreen event not raised when Visibility changes

r149330 moon - Implement WebClient.OnWriteStreamClosed

r149366 (and r149560) moon - [https://bugzilla.novell.com/show_bug.cgi?id=569845](https://bugzilla.novell.com/show_bug.cgi?id=569845) - html bridge fixes for indexed properties

r149420 moon - [https://bugzilla.novell.com/show_bug.cgi?id=570098](https://bugzilla.novell.com/show_bug.cgi?id=570098) - Don't auto-scroll back to the cursor on blink when the user manually scrolls in TextBox

r149425,149427,149486 moon - SL3 {Browser,Client}WebHttpRequest changes.

r149430 moon - [https://bugzilla.novell.com/show_bug.cgi?id=570145](https://bugzilla.novell.com/show_bug.cgi?id=570145) - ReadOnly TextBox should not display blinking cursor

r149481 moon - [https://bugzilla.novell.com/show_bug.cgi?id=570409](https://bugzilla.novell.com/show_bug.cgi?id=570409) - TextBox should not use horizontal scrollbars when TextWrapping set to Wrap

r149495 moon - new a11y tests

r149558 moon - [https://bugzilla.novell.com/show_bug.cgi?id=515189](https://bugzilla.novell.com/show_bug.cgi?id=515189) - Debugger.Break crashes firefox

r149561, r149562, r150158 moon - Rename all the NPAPI `NPP_` and `NPN_` symbols to `MOON_NPP_` and `MOON_NPN_` in order to avoid conflicts with other plugins

r149578 moon - Fixes exception when raising UIA event.

r149798 moon - [https://bugzilla.novell.com/show_bug.cgi?id=571823](https://bugzilla.novell.com/show_bug.cgi?id=571823) - Loaded event not emitted in certain cases

r149825 moon - [https://bugzilla.novell.com/show_bug.cgi?id=571908](https://bugzilla.novell.com/show_bug.cgi?id=571908) - Mouse capture is not lost correctly when scrolling

r149829 moon - [https://bugzilla.novell.com/show_bug.cgi?id=567278](https://bugzilla.novell.com/show_bug.cgi?id=567278) - ListBox.SelectedItem doesn't redraw selection

r149894 moon - [https://bugzilla.novell.com/show_bug.cgi?id=572163](https://bugzilla.novell.com/show_bug.cgi?id=572163) - ScrollBarVisibility.Hidden doesn't work

r149918 moon - new a11y tests

r149928 moon - [https://bugzilla.novell.com/show_bug.cgi?id=551974](https://bugzilla.novell.com/show_bug.cgi?id=551974) - Test CalendarAutomationPeer and related Peers.

r150133 moon - [https://bugzilla.novell.com/show_bug.cgi?id=572054](https://bugzilla.novell.com/show_bug.cgi?id=572054) - Internal method ItemsControl.GetContainerItem doesn't return children in TabControl

r150210 moon - [https://bugzilla.novell.com/show_bug.cgi?id=574276](https://bugzilla.novell.com/show_bug.cgi?id=574276) - TypeConverter types are not always registered before they're used

r150217 moon - [https://bugzilla.novell.com/show_bug.cgi?id=551977](https://bugzilla.novell.com/show_bug.cgi?id=551977) - Test TabControlAutomationPeer and related Peers.

r150221 moon - [https://bugzilla.novell.com/show_bug.cgi?id=574003](https://bugzilla.novell.com/show_bug.cgi?id=574003) - DataContractJsonSerializer should not serialize non public types / fields

r150323 moon - [http://bugzilla.novell.com/show_bug.cgi?id=574582](http://bugzilla.novell.com/show_bug.cgi?id=574582) (smcs wrapper script needs to be installed as part of the SDK)

r150504 moon - [https://bugzilla.novell.com/show_bug.cgi?id=565747](https://bugzilla.novell.com/show_bug.cgi?id=565747) - Crash after some http request

r151042 moon - [https://bugzilla.novell.com/show_bug.cgi?id=578004](https://bugzilla.novell.com/show_bug.cgi?id=578004) - mxap --desktop is broken.

mono and mcs

to be updated to **151801** from **branch 2-6**

mono-basic

r148747 mono-basic (mono-2.6 branch) - [http://bugzilla.novell.com/show_bug.cgi?id=565927](http://bugzilla.novell.com/show_bug.cgi?id=565927) (application almost working)

other

r\<branch only, not committed anywhere yet\> - patch in [https://bugzilla.novell.com/show_bug.cgi?id=570144](https://bugzilla.novell.com/show_bug.cgi?id=570144) - Moonlight link navigates to beta page

Security attributes needs to be regenerated (make detect) and **audit.sh** needs to be executed to review `[SecuritySafeCritical]` changes in the class libraries.
