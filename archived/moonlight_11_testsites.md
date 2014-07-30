---
title: "Moonlight 1.1 TestSites"
lastmodified: '2008-01-18'
permalink: /archived/Moonlight_1.1_TestSites/
redirect_from:
  - /Moonlight_1.1_TestSites/
---

Moonlight 1.1 TestSites
=======================

This is a list of test sites for Moonlight 1.1

Updated: Dec 5 2007 Build:

 ===2D Physics Simulation=== [http://www.chriscavanagh.com/Chris/Silverlight/Physics2D-1/TestPage.html](http://www.chriscavanagh.com/Chris/Silverlight/Physics2D-1/TestPage.html)

-   Requires 1.1
-   Sorta works. animations are definitely there, but clicking on the wind checkbox doesn't do anything, and firefox keeps popping up the "Unresponsive script" dialog. The checkbox being unresponsive might be because the script is eating too much cpu?
-   Note: page seems empty (possibly wrong plugin)

===3D Teapot Demo=== [http://www.dolittle.com/Silverlight/3D/TestPage.html](http://www.dolittle.com/Silverlight/3D/TestPage.html)

-   2 things blocking this demo:
    -   downloading media from remote servers video source changed to \`silverlightLogoLoop.wmv' cannot open uri \`silverlightLogoLoop.wmv': No such file or directory
    -   the MediaBase.MediaEnded event needs to be raised when the above .wmv finishes playing.
-   Note: URL requires the older (pre release) plugin

===Binary Clock=== [http://explosivedog.com/silverlight/binaryclock/default.html](http://explosivedog.com/silverlight/binaryclock/default.html)

-   Works!

===Browser Poker=== [http://support.newsgator.com/nickh/browserpoker/browserpoker.html](http://support.newsgator.com/nickh/browserpoker/browserpoker.html)

-   Starts up, but crashes when it tries to access IsolatedStorage.

> Unhandled Exception: System.IO.IsolatedStorage.IsolatedStorageException: No ApplicationIdentity available for AppDomain. at System.IO.IsolatedStorage.IsolatedStorage.InitStore (System.IO.IsolatedStorage.IsolatedStorageScope,System.Type) [0x0002e] in /home/cvs/mcs/class/corlib/System.IO.IsolatedStorage/IsolatedStorage.cs:157 at (wrapper remoting-invoke-with-check) System.IO.IsolatedStorage.IsolatedStorage.InitStore (System.IO.IsolatedStorage.IsolatedStorageScope,System.Type) \<0x0005a\> at System.IO.IsolatedStorage.IsolatedStorageFile.GetUserStoreForApplication () [0x0000a] in /home/cvs/mcs/class/corlib/System.IO.IsolatedStorage/IsolatedStorageFile.cs:220 at BrowserPoker.Page.SaveData () \<0x0004b\> at BrowserPoker.Page.chkbxSaveSettings\_MouseLeftButtonUp (object,System.Windows.Input.MouseEventArgs) \<0x00093\> at System.Windows.UIElement.InvokeMouseButtonUp (System.Windows.Input.MouseEventArgs) [0x0001c] in /home/cvs/olive/class/agclr/System.Windows/UIElement.cs:357 at Mono.Events.mouse\_button\_up\_callback (intptr,intptr,intptr) [0x00014] in /home/cvs/olive/class/agclr/Mono/Events.cs:173 at (wrapper delegate-invoke) System.MulticastDelegate.invoke\_void\_intptr\_intptr\_intptr (intptr,intptr,intptr) \<0x00050\> at Mono.CrossDomainProxy.call\_in\_target\_domain () [0x0001b] in /home/cvs/olive/class/agclr/Mono/Events.cs:72 at System.AppDomain.DoCallBack (System.CrossAppDomainDelegate) [0x0001a] in /home/cvs/mcs/class/corlib/System/AppDomain.cs:448 at (wrapper remoting-invoke-with-check) System.AppDomain.DoCallBack (System.CrossAppDomainDelegate) \<0x00045\> at Mono.CrossDomainProxy.wrapper (intptr,intptr,intptr) [0x00015] in /home/cvs/olive/class/agclr/Mono/Events.cs:64 at (wrapper native-to-managed) Mono.CrossDomainProxy.wrapper (intptr,intptr,intptr) \<0x00030\>

===Bubble Factory=== [http://cosmik.members.winisp.net/BubbleFactory/](http://cosmik.members.winisp.net/BubbleFactory/)

-   No JS errors. I get this on the console.

> Assembly not available: ClientBin/BubbleFactory.dll \*\* (Gecko:28016): WARNING \*\*: PARSER ERROR, STOPPING PARSING: Unable to resolve x:Class type 'BubbleFactory.Game;assembly=ClientBin/BubbleFactory.dll' line: 1 char: 1

===Bubble Mark=== [http://bubblemark.com/](http://bubblemark.com/)

-   Silverlight (CLR) works!
-   Silverlight (Javascript) works too :)

===Destroy All Invaders=== [http://www.andybeaulieu.com/silverlight/DestroyAll/Default.html](http://www.andybeaulieu.com/silverlight/DestroyAll/Default.html)

-   Works (!)

===Digger=== [http://www.aisto.com/Roeder/Silverlight/Digger/Default.aspx](http://www.aisto.com/Roeder/Silverlight/Digger/Default.aspx)

-   Works.

=== Disco Dance Floor=== [http://explosivedog.com/silverlight/discolights/](http://explosivedog.com/silverlight/discolights/)

-   Comes up, runs slow, and also seems to peg the event loop processing in Firefox.
-   Although the disco floor is updated and continues to move and rotate, the event loop seems to be dominated by it, and Mozilla becomes very unresponsive.
-   Note: URL requires the older (pre release) plugin

===Dr. Green Thumb=== [http://labs.blitzagency.com/?p=50](http://labs.blitzagency.com/?p=50)

-   Page comes up telling you to install WPF/e.
-   Note: same thing happens on SL (web page was updated to confirm this).

===Dr. Popper=== [http://www.bluerosegames.com/brg/drpopper/](http://www.bluerosegames.com/brg/drpopper/)

-   comes up, but is unresponsive to mouse clicks. there's an "overlay" canvas over the entire UI which eats all mouse events. Not sure how they're passed through on MS.
-   note: the downloadable source no longer match the available version.

===GOA WinForms Demo=== [http://community.netikatech.com/demos/](http://community.netikatech.com/demos/)

-   (Gecko:4903): WARNING \*\*: adding handler to event 'GotFocus', which has not been registered
-   (Gecko:4903): WARNING \*\*: adding handler to event 'LostFocus', which has not been registered
-   Error inside TryLoad: System.Exception: Unknown class

> Server stack trace: at NETiKA.Silverlight.WinFormHost.c (System.Object A\_0, System.EventArgs A\_1) [0x00000] at System.Windows.UIElement.InvokeLoaded () [0x0001c] in /home/cvs/olive/class/agclr/System.Windows/UIElement.cs:391 at Mono.Events.loaded\_callback (IntPtr target, IntPtr calldata, IntPtr closure) [0x00014] in /home/cvs/olive/class/agclr/Mono/Events.cs:72 at (wrapper native-to-managed) Mono.Events:loaded\_callback (intptr,intptr,intptr) at \<0x00000\> \<unknown method\> at (wrapper managed-to-native) Moonlight.Hosting:surface\_attach (intptr,intptr) at Moonlight.DomainInstance.TryLoad (System.Int32& error) [0x00139] in /home/cvs/moon/plugin/moonlight.cs:251 at (wrapper remoting-invoke-with-check) Moonlight.DomainInstance:TryLoad (int&) at (wrapper xdomain-dispatch) Moonlight.DomainInstance:TryLoad (object,byte[]&,byte[]&,int&) Exception rethrown at [0]: at (wrapper xdomain-invoke) Moonlight.DomainInstance:TryLoad (int&) at (wrapper remoting-invoke-with-check) Moonlight.DomainInstance:TryLoad (int&) at Moonlight.Loader.TryLoad (System.Int32& error) [0x0000f] in /home/cvs/moon/p

===Gradient Animation Demo=== [http://www.zillinois.com/blog/2007/05/16/YetAnotherSilverLightXAMLDemo.aspx](http://www.zillinois.com/blog/2007/05/16/YetAnotherSilverLightXAMLDemo.aspx)

-   Works!

===Infragistics Controls Demo=== [http://labs.infragistics.com/silverlight/](http://labs.infragistics.com/silverlight/)

-   Crashes firefox with:

> ManagedXamlLoader::LoadObject (ClientBin/Infragistics.Silverlight.dll, ClientBin/Infragistics.Silverlight.dll, , Infragistics.Silverlight.TechEd.MainPage) failed: Exception has been thrown by the target of an invocation. (System.Reflection.TargetInvocationException). \*\* (Gecko:25612): WARNING \*\*: PARSER ERROR, STOPPING PARSING: Unable to resolve x:Class type 'Infragistics.Silverlight.TechEd.MainPage;assembly=ClientBin/Infragistics.Silverlight.dll' line: 1 char: 1 \*\* (Gecko:25612): WARNING \*\*: PARSER ERROR, STOPPING PARSING: parsing aborted line: 6 char: 27 PluginXamlLoader::TryLoad: Could not load xaml file: /home/jbevain/.mozilla/firefox/82jmj387.default/Cache/8DAB8540d01 (missing\_assembly: (null)) Stacktrace: Native stacktrace: /home/jbevain/devel/mono/lib/libmono.so.0 [0xb22c2924] /home/jbevain/devel/mono/lib/libmono.so.0 [0xb22df1c1] /home/jbevain/devel/mono/lib/libmono.so.0 [0xb2273798] [0xb7fd7440] /home/jbevain/devel/mono/lib/moon/plugin/libmoonplugin.so(\_ZN14PluginInstance12StreamAsFileEP9\_NPStreamPKc+0x1ab) [0xb223b07b] /home/jbevain/devel/mono/lib/moon/plugin/libmoonplugin.so(NPP\_StreamAsFile+0x31) [0xb223c621] /usr/lib/firefox/firefox-bin [0x8240368] /usr/lib/firefox/firefox-bin [0x822ceec] /usr/lib/firefox/firefox-bin [0x8236b34] /usr/lib/firefox/firefox-bin [0x817b805] /usr/lib/firefox/firefox-bin [0x812d576] /usr/lib/firefox/firefox-bin [0x812d7d1] /usr/lib/firefox/libxpcom\_core.so [0xb7ef2644] /usr/lib/firefox/libxpcom\_core.so(PL\_HandleEvent+0x22) [0xb7f0b435] /usr/lib/firefox/libxpcom\_core.so(PL\_ProcessPendingEvents+0x74) [0xb7f0b6be] /usr/lib/firefox/libxpcom\_core.so [0xb7f0cda3] /usr/lib/firefox/firefox-bin [0x8254f66] /usr/lib/libglib-2.0.so.0 [0xb78f912d] /usr/lib/libglib-2.0.so.0(g\_main\_context\_dispatch+0x182) [0xb78cfad2] /usr/lib/libglib-2.0.so.0 [0xb78d2a9f] /usr/lib/libglib-2.0.so.0(g\_main\_loop\_run+0x1b7) [0xb78d2e57] /usr/lib/libgtk-x11-2.0.so.0(gtk\_main+0xb4) [0xb7c155f4] /usr/lib/firefox/firefox-bin [0x82552b2] /usr/lib/firefox/firefox-bin [0x86771f2] /usr/lib/firefox/firefox-bin [0x807cf2a] /usr/lib/firefox/firefox-bin [0x8078e54] /lib/libc.so.6(\_\_libc\_start\_main+0xdc) [0xb7291f9c] /usr/lib/firefox/firefox-bin [0x8078db1]

===JavaScript/.NET Chess=== [http://silverlight.net/samples/1.1/chess/run/default.html](http://silverlight.net/samples/1.1/chess/run/default.html)

-   This mostly works, with a few exceptions, these are tracked in the sldemos/chess/port/issues.txt (support for Javascript inside x:Code and animations are not working).

===Kids Doodler=== [http://delay.members.winisp.net/SilverlightKidsDoodler/](http://delay.members.winisp.net/SilverlightKidsDoodler/)

-   Works now, except for the "Zoom" button that should enable FullScreen

===Laugh-o-Sphere=== [http://sharepoint.microsoft.com/blogs/mikeg/silverlight1/PopflyMashups/bLaugh-o-Sphere.aspx](http://sharepoint.microsoft.com/blogs/mikeg/silverlight1/PopflyMashups/bLaugh-o-Sphere.aspx)

-   Just shows the "Get Microsoft Silverlight" badge. plugin version difference?

===Lutz Roeder Monotone=== [http://www.aisto.com/Roeder/Silverlight/Monotone/Default.aspx](http://www.aisto.com/Roeder/Silverlight/Monotone/Default.aspx)

-   Works. At least better than Silverlight which crashes on this for me.

===Michael's Journal=== [http://blogs.msdn.com/Synergist/pages/journal.aspx](http://blogs.msdn.com/Synergist/pages/journal.aspx)

===Photopoints Gallery=== [http://www.photopoints.com/main/Silverlight\_Alpha/](http://www.photopoints.com/main/Silverlight_Alpha/)

-   Fails due to missing HtmlPage.DocumentUri (we get a NRE because that getter currently always return null).

===Python Console=== [http://silverlight.net/Samples/1.1/DLR-Console/python/index.htm](http://silverlight.net/Samples/1.1/DLR-Console/python/index.htm)

-   ManagedXamlLoader.load\_code: 'DLRConsole.py' 'text/python'
-   ManagedXamlLoader.load\_code: Ignoring request to load code.

### Real Time Fluid Dynamics Demo

[http://static.johnspurlock.com/fluid/dynamics](http://static.johnspurlock.com/fluid/dynamics)

Starts up, but does not seem to do anything

===Sierpinski Triangle=== [http://www.cjcraft.com/silverlight/SierpinskiTriangle/Default.html](http://www.cjcraft.com/silverlight/SierpinskiTriangle/Default.html)

-   Works!
-   Note: requires an older version of the plugin.

===Silverlight Airlines Demo=== [http://delay.members.winisp.net/SilverlightAirlinesDemo/](http://delay.members.winisp.net/SilverlightAirlinesDemo/)

-   Works!
-   A few visual glitches, but things should behave as expected.

===Silverlight Learn Videos=== [http://silverlight.net/learn/learnvideo.aspx?video=125](http://silverlight.net/learn/learnvideo.aspx?video=125)

-   Black background, instead of transparent, in the plugin (XAML works fine)
-   Some LinearGradientBrush issues when
-   using MappingMode="Absolute" and a Transform
-   using two GradientStop at the same offset

===Silverlight Mind Map=== [http://blogs.msdn.com/synergist/pages/silverlight-map.aspx](http://blogs.msdn.com/synergist/pages/silverlight-map.aspx)

-   Don't see anything on the page, just a big blank section. (in IE7/XP, FF/XP, FF/Suse)
-   OLD: Seems to work, still the nodes are using the strange Hand Written font.

===Smalltalk in Silverlight=== [http://vistascript.net/vistascript/test](http://vistascript.net/vistascript/test)

-   Implicit assembly loading seems to fail loading Smalltalk:

> \*\* (Gecko:2397): WARNING \*\*: The following assembly referenced from /home/miguel/.mozilla/firefox/faxlddi4.FireBug/Cache/8B67FFBEd01 could not be loaded: Assembly: Smalltalk (assemblyref\_index=2) Version: 1.0.0.0 Public Key: (none) The assembly was not found in the Global Assembly Cache, a path listed in the MONO\_PATH environment variable, or in the location of the executing assembly (/home/miguel/.mozilla/firefox/faxlddi4.FireBug/Cache).

-   Animated UI comes up, this shows up in JS console:

> Warning: Element referenced by ID/NAME in the global scope. Use W3C standard document.getElementById() instead. Source File: [http://silverlight.net/samples/1.0/sprawl/js/createsilverlight.js](http://silverlight.net/samples/1.0/sprawl/js/createsilverlight.js) Line: 16

===Surface Prototype=== [http://silverlight.schwarz-interactive.de/ex02/](http://silverlight.schwarz-interactive.de/ex02/)

-   Seems to load okay, but nothing ever shows.

### Surface at Silverlight.net

[http://silverlight.net/samples/1.1/SilverlightSurface/Run/default.html](http://silverlight.net/samples/1.1/SilverlightSurface/Run/default.html)

This demo works, but images appear in full-size, then jump to become minimized, then gradually grow back to their full-size.

Our SVN version got a fix, but we should probably figure out why this happens.

===Telerik RadControls 3D Cube=== [http://www.telerik.com/demos/aspnet/silverlight/Cube/Examples/RoomDesigner/DefaultCS.aspx](http://www.telerik.com/demos/aspnet/silverlight/Cube/Examples/RoomDesigner/DefaultCS.aspx)

-   Loads up the background fine but nothing else shows up.

===Windows Journal-to-Silverlight Converter=== [http://www.microsoft.com/downloads/details.aspx?FamilyID=4964cd5f-0dcb-4c22-9378-773100d8e89f&displaylang=en](http://www.microsoft.com/downloads/details.aspx?FamilyID=4964cd5f-0dcb-4c22-9378-773100d8e89f&displaylang=en)

-   Windows specific conversion tool. not a web demo.

===Windows Vista Simulator=== [http://www.windowsvista.si/](http://www.windowsvista.si/)

-   Application appears, but nothing happen when clicking on the FreeTime or WorkTime graphics.
-   No tooltip appear when I leave the mouse on those either.

===XPSViewer=== [http://delay.members.winisp.net/SimpleSilverlightXpsViewer/](http://delay.members.winisp.net/SimpleSilverlightXpsViewer/)

-   Visually works. Yet it triggers a NotImplementedException that the application catches. That exception is thrown by the application itself... the XpsToSilverlightReader (inherit from XmlReader) implements only the few methods required to make it works... and throws on 10 other method. Obviously our XmlReader implementation require those...

===Zero Gravityd=== [http://www.ltbennett.com/](http://www.ltbennett.com/)

-   Very slow
-   Can usually play to the third level, then it crashes:

> Unhandled Exception: System.NullReferenceException: Object reference not set to an instance of an object at SpaceJumper.Tiles.SwitchPaddleControl.rotatePaddleAnimation (Int32 toRotate, Boolean state) [0x00000] at SpaceJumper.View.Gameboard.animatePaddles (System.Collections.Generic.List\`1 sp) [0x00000] at SpaceJumper.View.DisplayStack.animatePaddles (System.Collections.Generic.List\`1 sp) [0x00000] at SpaceJumper.GameMain.playerAnimated (System.Object sender, System.EventArgs args) [0x00000] at SpaceJumper.View.DisplayStack.playerAnimated (System.Object o, System.EventArgs evt) [0x00000] at SpaceJumper.View.Gameboard.playerAnimated (System.Object o, System.EventArgs evt) [0x00000] at SpaceJumper.Tiles.PlayerControl.returnToIdleAnimationComplete (System.Object sender, System.EventArgs evt) [0x00000] at System.Windows.Media.Animation.Storyboard.InvokeCompleted () [0x0001c] in /home/jbevain/sources/olive/class/agclr/System.Windows.Media.Animation/Storyboard.cs:107 at System.Windows.Media.Animation.Storyboard.UnmanagedCompleted (IntPtr target, IntPtr calldata, IntPtr closure) [0x00014] in /home/jbevain/sources/olive/class/agclr/System.Windows.Media.Animation/Storyboard.cs:100 at (wrapper native-to-managed) System.Windows.Media.Animation.Storyboard:UnmanagedCompleted (intptr,intptr,intptr)

