---
title: "MonoTouch XCode"
lastmodified: '2009-07-30'
redirect_from:
  - /MonoTouch_XCode/
---

MonoTouch XCode
===============

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#requirements">1 Requirements</a></li>
<li><a href="#sanity-check">2 Sanity Check</a></li>
<li><a href="#using-the-monotouch-framework">3 Using the MonoTouch Framework</a></li>
<li><a href="#embedding-the-sample">4 Embedding the Sample</a></li>
</ul></td>
</tr>
</tbody>
</table>

Requirements
============

To get started with MonoTouch and XCode you will need to install:

-   XCode from Apple
-   iPhone developer SDK from Apple
-   MonoTouch

Sanity Check
============

Once you have the above, start XCode and create a simple shell that will contain Mono, this is done by following these steps:

-   From the File Menu, select New Project
-   Select in iPhone OS the "Window based application" option.
-   Select Run from the Run menu

The above should launch an empty application in the iPhone simulator.

**Device Developers**: If you are a registered iPhone developer, you will want to also test that the above application runs on the iPhone or the iPod Touch by changing the Active SDK from "Simulator- XX | Debug" to "Device - XX | Debug" where XX is the version of the SDK that you have installed. Make sure that this application works correctly before proceeding.

Using the MonoTouch Framework
=============================

To use MonoTouch with your existing Objective-C project, you need to use the MonoTouch Framework. Follow these steps to prepare your project:

1.  Open your project and go to Project-\>Edit Project Settings and select the "Build" tab
2.  Change the Configuration drop down to "All Configurations"
3.  Add "/Developer/MonoTouch/SDKs/MonoTouch1.0.\$(PLATFORM_NAME).sdk" to the "Additional SDKs" field
4.  Add "-liconv -lmono -lmonotouch" to the "Other Linker Flags" field
5.  Change the "Code Signing Resource Rules Path" to "\$(SDKROOT)/ResourceRules.plist"

Embedding the Sample
====================

The next step is to create a sample C# program that will drive your application, from the File menu create a new file, select "Other" and then "Empty file" and call this "simple.cs"

In this file put the following code:

``` csharp
using MonoTouch.UIKit;
 
class Sample {
    static void Main (string [] args)
    {
        UIApplication.Main (args);
    }
}
```

You can compile the above program using the MonoTouch C# compiler, like this:

``` bash
smcs simple.cs -r:monotouch.dll
```

The next is to [embed Mono](/Embedding_Mono) in your Objective-C code and to have the code call the C# code. The simplest thing is to get the basics generated by the mtouch tool, issue the following command:

``` bash
mtouch simple.exe
```

The result of running the above command will produce a few files:

-   main.m: the source code to embed Mono in your Objective-C code.
-   \*.s: various files that contain the ARM assembly code for your program and any of their dependencies.
-   Info.plist: a sample Info.plist that you can use
-   PkgInfo: a sample PkgInfo that you can use.

You must add all of the `*.m` and `*.s` files to your build.
