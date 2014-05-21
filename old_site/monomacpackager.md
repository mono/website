---
layout: obsolete
title: "MonoMacPackager"
lastmodified: '2012-12-12'
permalink: /old_site/MonoMacPackager/
redirect_from:
  - /MonoMacPackager/
  - /MonomacPackager/
  - /MonoMacPackaging/
---

MonoMacPackager
===============

With the new release of the [MonoMac]({{site.github.url}}/old_site/MonoMac "MonoMac") add-in for MonoDevelop, you can easily turn your Mono application into a Mac bundle, and you can also get a Mac installer for your application.

If you want to create self-contained Mac bundles or publish your software to the Mac AppStore, you should get [Xamarin.Mac](http://xamarin.com/mac) which is a strict superset of MonoMac.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#getting-started">1 Getting Started</a></li>
<li><a href="#creating-your-mac-application">2 Creating your Mac application</a>
<ul>
<li><a href="#bundles-and-mono">2.1 Bundles and Mono</a></li>
</ul></li>
<li><a href="#creating-an-installer-package">3 Creating an Installer package</a></li>
</ul></td>
</tr>
</tbody>
</table>

Getting Started
===============

You will need the following components installed:

-   From Apple:
    -   At least XCode 4.5, this contains the developer tools to build Mac apps
    -   Apple's Application Tools (login to developer.apple.com/mac)
        -   **Yes, you need this. No, you can't ignore this. You wont be able to publish to the AppStore without it. Yes, we mean it.**

-   From Mono:
    -   Mono 2.10.9
    -   MonoDevelop 3.1.0 (released on December 12th)

Creating your Mac application
=============================

Mac bundles are directories with the .app extension that contain all of the components necessary for your application to run. They contain your executable, any images, UI definitions, pdfs, graphics, data files, internationalization resources and any other resource that your application needs at runtime. If you want to learn more about what goes in a bundle, you can read Apple's [Bundle Programming Guide](http://developer.apple.com/library/mac/#documentation/CoreFoundation/Conceptual/CFBundles/Introduction/Introduction.html).

To create native Mac bundles, you should create a new project based on any of the MonoMac profiles: the document-based application, the empty-application, or the window-based application. This will configure your project to be compiled as a Mac bundle.

When you compile your application, MonoDevelop will create a Mac bundle that integrated with the operating system. You will want to provide a custom icon, and tune the launch parameters in the Info.plist file that MonoDevelop generates for you.

Bundles and Mono
----------------

By default, MonoDevelop creates application bundles that require the Mono framework to be installed (it is typically installed in /Library/Frameworks/Mono.framework). This creates small bundles, as only your code and your resources are packaged, the entire Mono stack is shared across all of the Mono applications on the System.

But sometimes you want to distribute your application without requiring end users to install Mono on their own, distribute your app on the Mac App Store, or you might want to take a dependency on a particular version of Mono that you have tested and QAed on site. For those scenarios, you should obtain a license to [Xamarin.Mac](http://xamarin.com/mac).

Creating an Installer package
=============================

Even if your bundle is completely self-contained into the .app directory, if you are planning on distributing your app in the Mac AppStore, you must create an installer package. Or you might want to create an installer to give your users an installer, instead of having them drag-and-drop the application into their /Applications folder.

You can distribute this .pkg file to your users, and it will guide them through the process of installing your application, this is what the generated installer looks like if you check this option:

[![Md-monomac-installer.png]({{site.github.url}}/old_site/images/a/ad/Md-monomac-installer.png)]({{site.github.url}}/old_site/images/a/ad/Md-monomac-installer.png)

