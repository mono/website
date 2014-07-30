---
title: "MonoTouch ReleaseNotes"
lastmodified: '2009-09-13'
permalink: /archived/MonoTouch_ReleaseNotes/
redirect_from:
  - /MonoTouch_ReleaseNotes/
---

MonoTouch ReleaseNotes
======================

MonoTouch Release Notes:

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#10-rc2">1 1.0 RC2</a></li>
<li><a href="#10-rc">2 1.0 RC</a></li>
<li><a href="#10-beta-8">3 1.0 Beta 8</a></li>
<li><a href="#10-beta-7">4 1.0 Beta 7</a></li>
<li><a href="#10-beta-6">5 1.0 Beta 6</a></li>
<li><a href="#10-beta-5">6 1.0 Beta 5</a></li>
<li><a href="#10-beta-4">7 1.0 Beta 4</a></li>
<li><a href="#10-beta-3">8 1.0 Beta 3</a></li>
<li><a href="#10-beta-2">9 1.0 Beta 2</a></li>
<li><a href="#10-beta-1">10 1.0 Beta 1</a></li>
</ul></td>
</tr>
</tbody>
</table>

[1.0 RC2](http://www.go-mono.com/monotouch-download/monotouch-0.9.10-20090913-0.pkg)
====================================================================================

Fixes in RC2

-   In very specific cases, wrappers could be shared improperly between methods leading to a crash.

[1.0 RC](http://www.go-mono.com/monotouch-download/monotouch-0.9.9-20090912-2.pkg)
==================================================================================

Additions in RC

-   Added System.Json
-   Added Mono.Security for HTTPS and NTLM
-   Added MonoTouch.Foundation.PreserveAttribute to preserve members from the linker
-   Added NSObject.BeginInvokeOnMainThread(Selector,NSObject), NSObject.BeginInvokeOnMainThread(NSAction) for the non-waiting behavior of -[NSObject performSelectorOnMainThread:withObject:waitUntilDone] (i.e. when waitUntilDone=NO)
-   Added CGImage.WithMaskingColors (float [])
-   Added static NSObject.Alloc (Class)
-   Added MediaPlayer binding
-   Added DrawString overloads for UIView
-   Added NSUrlMutableRequest binding
-   Added encoding operations to convert strings to NSData
-   Added NSData to string conversion routines
-   Added NSUrlConnection.SendSynchronousRequest
-   Added NSUrlRequest indexer to retrieve Header values

Fixes in RC

-   Fixed crash when using -linksdkonly
-   Fixed SpecialFolders.MyDocuments to point to the sandbox/Documents
-   Fixed System.IO.Compression
-   Fixed MapKit binding to allow interchangable use of MKAnnotation and MKPlacemark
-   Fixed NSBundle.LoadNib to property return an NSArray
-   Fixed Serialization of value type properties
-   Fixed invalid GCHandle storage of deleted objects
-   Fixed alignment error when throwing exceptions in the simulator
-   Fixed static generic context trampoline to not clobber \$r1

Removals in RC

-   Removed NSObject.InvokeOnMainThread (Selector, NSObject, bool)

Changes in RC

-   Renamed static CGImage.Copy (CGImage) to instance CGImage.Clone ()
-   Renamed instance CGImage.Copy (CGImage, CGColorSpace) to instance CGImage.WithColorSpace (CGColorSpace)
-   Renamed static CGImage.FromImageInReck (CGImage, RectangleF) to instance CGImage.WithImageInRect (RectangleF)
-   Renamed static CGImage.FromImageMask (CGImage, CGImage) to instance CGImage.WithMask (CGImage)
-   Renamed URL property to Url on NSUrlRequest

[1.0 Beta 8](http://www.go-mono.com/monotouch-download/monotouch-0.9-20090901-1.pkg)
====================================================================================

Additions in Beta 8

-   added -gcc\_flags option to mtouch
-   added NSData.Bytes and NSData.Count
-   added full support for decimal types

Fixes in Beta 8

-   fixed a bug when linking assemblies with InternalsVisibleTo attributes
-   fixed bug when pinvoke callbacks were called on an unregistered thread
-   fixed TabBarItem to exist on UIViewController
-   fixed compilation on x86 when -ObjC is used
-   fixed NSBundle.LoadNib binding

Changes in Beta 8

-   removed -lib flag from mtouch (use -gcc\_flags)

[1.0 Beta 7](http://www.go-mono.com/monotouch-download/monotouch-0.9-20090828-1.pkg)
====================================================================================

Additions in Beta 7

-   Added NSBundle.LoadNib
-   Added NSBundle.PathForImageResource
-   Added NSBundle.PathForSoundResource
-   Added NSData.FromUrl
-   Added UIImage.FromData
-   Added UITabBarController.TabBarItem

Fixes in Beta 7

-   Fixed mtouch invocation of the linker for simulator configurations.
-   Fixed UIActionSheet.WillDismiss event.

Changes in Beta 7

-   Removed the OpenTK.Graphics.ES11.GL.LoadAll() and OpenTK.Graphics.ES20.GL.LoadAll() methods. Now to initialize the GL types you must do one of two things:
    -   Inherit from OpenTK.Platform.iPhoneOS.iPhoneOSGameView, and call either iPhoneOSGameView.CreateFrameBuffer() or iPhoneOSGameView.Run() before using any GL methods.
    -   Call OpenTK.Platform.Utilities.CreateGraphicsContext() before making any GL calls.
-   The GLPaint and OpenGLESSample samples have been updated to use Utilities.CreateGraphicsContext() to initialize GL
-   New GLPaint-GV and OpenTLESSample-GV samples have been added to use iPhoneOSGameView for comparison

[1.0 Beta 6](http://www.go-mono.com/monotouch-download/monotouch-0.9-20090825-2.pkg)
====================================================================================

Additions in Beta 6

-   added experimental System.Xml support

Fixes in Beta 6

-   fixed long alignment when transitioning to icalls
-   fixed long alignment in managed methods compiled by the cross compiler
-   fixed exception handling when assemblies have been stripped

Changes in Beta 6

-   Updated OpenTK to r2183 (this is a API and ABI change)
-   renamed OpenTK.Graphics.ES11.ES to OpenTK.Graphics.ES11.GL
-   renamed OpenTK.Graphics.ES20.ES to OpenTK.Graphics.ES20.GL

[1.0 Beta 5](http://www.go-mono.com/monotouch-download/monotouch-0.9-20090821-0.pkg)
====================================================================================

Additions in Beta 5:

-   added Initial experimental Snow Leopard support.
-   added AVFramework bindings
-   added AddressBook bindings
-   added AddressBookUI bindings
-   added mtouch -lib for linking static native libraries

Fixes in Beta 5:

-   fixed null object marshalling
-   fixed Missing selector exception when using PerformSelector / InvokeOnMainThread
-   fixed Socket problem on device when probing for ipv6 support
-   fixed implicit conversion of null NSStrings
-   fixed UILabel.Text to allow null's
-   fixed mtouch to generate xcodeproj's with the requisite frameworks linked

[1.0 Beta 4](http://www.go-mono.com/monotouch-download/monotouch-0.9-20090818-0.pkg)
====================================================================================

Fixes in Beta 4:

-   fixed UIAlertView.Messeget typo
-   fixed crash with HttpWebClient.Credentials in NtlmClient
-   fixed \#532128, UIBarButtonItem.Clicked not working in some cases
-   fixed \#530963, linking issue with virtual generics methods
-   fixed \#531955, full-aot crash when using Dictionary\<int,int\>
-   fixed \#532120, full-aot crash working with String[]

[1.0 Beta 3](http://www.go-mono.com/monotouch-download/monotouch-0.9-20090817-3.pkg)
====================================================================================

Additions in Beta 3:

-   added bindings for NSAutoreleasePool
-   add moutch --version command
-   added bindings to StoreKit
-   added bindings to SystemConfiguration
-   Add NSObject.InvokeOnMainThread () bindings.

Fixes in Beta 3:

-   fixed alwaysBounceHorizontal typo
-   fixed \#530807 (typo in UITableView)
-   fixed UIView.MovedToSuperview typo
-   fixed alignment of doubles in the cross compiler
-   Improve documentation import run at installation time
-   fixed generic interface thunk code to not clobber IP register
-   fixed LINQ iterators with value types
-   fixed linking of GenericComparer\<\> (\#530961)
-   fixed null argument handling in runtime marshaller
-   fixed stackoverflow in PerformSelector call

[1.0 Beta 2](http://www.go-mono.com/monotouch-download/monotouch-0.9-20090810-0.pkg)
====================================================================================

Additions in Beta 2:

-   Added a -linksdkonly parameter to mtouch to link only the sdk and preserve the user assemblies.

Fixes in Beta 2:

-   Microsoft.Win32 namespace was too aggressively linked.
-   HttpRequestCreator and friends (Ftp, File) were missing their constructors.
-   mtouch was not properly reporting missing assemblies.
-   mtouch was not resolving references recursively.
-   mtouch now takes only one assembly, the other have to be specified by -r.
-   Fixed WebRequest authentication.
-   mtouch now signs the SDK assemblies.
-   Fixed a linker bug wrt virtual methods implementing interfaces and override a method defined in a base class.
-   Fixed a linker bg wrt virtual methods implementing generic interfaces.
-   Fixed a mtouch bug where arguments were not properly quoted when aot compiling the assemblies.
-   Fixed -framework linking when using things .
-   Improved imported documentation (properties now imported, etc.).

[1.0 Beta 1](http://www.go-mono.com/monotouch-download/monotouch-0.9-20090805-3.pkg)
====================================================================================

Initial Release.

