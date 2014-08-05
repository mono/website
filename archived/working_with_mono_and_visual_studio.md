---
title: "Working with Mono and Visual Studio"
lastmodified: '2009-02-27'
redirect_from:
  - /Working_with_Mono_and_Visual_Studio/
---

Working with Mono and Visual Studio
===================================

 Tools and Tips for Building & Testing Visual Studio.NET Projects with Mono.

**Warning: VSPrj2Make\# is unmaintained and only supports VS2003 style solutions. If you wish to generate makefiles from VS2005 or VS2008 solutions, you should use the generation capability provided in MonoDevelop.**

Once you have Mono installed in your system, you will want to install the VSPrj2Make\# package to complement your Visual Studio environment. VSPrj2Make is available from [its project page](http://forge.novell.com/modules/xfcontent/downloads.php/prj2make-sharp/Windows/).

A screencast on how to install it is available [here](http://www.mfconsulting.com/product/prj2make-sharp/tutorial/installing-vsprj2make.html).

VSPrj2Make provides an add-in to Visual Studio that offers a number of features:

-   Create Makefiles (both Microsoft's NMake and Unix Make).
-   Create distribution units (packages your source code for building elsewhere).
-   Test your code from Visual Studio with Mono (Winforms, Gtk\# and WebForms and WebServices).

This is available from the tools menu in Visual Studio:

[![Addin.png]({{ site.github.url }}/archived/images/6/65/Addin.png)]({{ site.github.url }}/archived/images/6/65/Addin.png)

Screencasts for:

-   Visual Studio: [Test in Mono](http://www.mfconsulting.com/product/prj2make-sharp/tutorial/TestInMono-SwfApp.html) to Run a Windows Form Application.

-   Visual Studio: [Test in Mono](http://www.mfconsulting.com/product/prj2make-sharp/tutorial/TestInMono-WebApp.html) to Run an ASP.NET application.


