---
title: "Mono Summit 2007 Session List"
lastmodified: '2007-11-22'
redirect_from:
  - /Mono_Summit_2007_Session_List/
---

Mono Summit 2007 Session List
=============================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#opening-keynote">1 Opening Keynote</a></li>
<li><a href="#c-sharp-30-and-linq">2 C Sharp 3.0 and LINQ</a></li>
<li><a href="#developing-applications-with-monodevelop">3 Developing Applications with Monodevelop</a></li>
<li><a href="#birds-of-a-feather-sessions">4 Birds of a Feather Sessions</a></li>
<li><a href="#towards-a-virtual-babel-mono-in-second-life">5 Towards A Virtual Babel: Mono In Second Life</a></li>
<li><a href="#nunit">6 NUnit</a></li>
<li><a href="#mono-on-the-mac">7 Mono on the Mac</a></li>
<li><a href="#greengrass">8 Greengrass</a></li>
<li><a href="#db4o">9 db4o</a></li>
<li><a href="#mono-on-embedded-devices">10 Mono on Embedded Devices</a></li>
<li><a href="#developing-desktop-applications-with-moonlight">11 Developing Desktop applications with Moonlight</a></li>
<li><a href="#gaia-ajax-widgets---the-alternative-to-ajax">12 Gaia Ajax Widgets - The alternative to Ajax</a></li>
<li><a href="#meet-the-experts">13 Meet The Experts</a></li>
<li><a href="#debugging-mono-applications-with-mdb">14 Debugging Mono Applications with MDB</a></li>
<li><a href="#boo--a-lean-mean-dsl-machine">15 Boo – A lean mean DSL Machine</a></li>
<li><a href="#monocecil">16 Mono.Cecil</a></li>
<li><a href="#boxerp">17 Boxerp</a></li>
<li><a href="#opensuse-build-service">18 openSUSE Build Service</a></li>
<li><a href="#using-monoaddins">19 Using Mono.Addins</a></li>
</ul></td>
</tr>
</tbody>
</table>

Opening Keynote
---------------

Presenter: **Miguel de Icaza**

In this presentation we will discuss the progress since last year and present our roadmap for the next year as well as sharing some interesting stories of Mono.

Miguel created the Gnome and Mono projects and currently is in charge of Mono and Moonlight at Novell.

C Sharp 3.0 and LINQ
--------------------

Presenter: **Marek Safar**

C# 3.0 introduces many new and powerful features which target developer productivity, and reduce the amount of code necessary to achieve the same work. This session will explore each new feature in the context of existing conventions as well as the implications of LINQ. If you want to start writing Mono enabled C# 3.0 applications you should not miss this session.

Marek is the main developer for Mono's C# 3.0 compiler at Novell. Prior to joining Novell he contributed extensively to the C# compiler by providing new features and extensive bug fixing.

Developing Applications with Monodevelop
----------------------------------------

Presenter: **Lluis Sanchez**

This session will show how to use the MonoDevelop IDE to develop applications with Mono: creating GTK# applications with the integrated visual designer, using custom widget libraries, ASP.NET projects, working with Visual Studio projects, working with Version Control integration, generating tarballs and packages, internationalization, integration with Makefiles, and other interesting features.

Lluis Sánchez leads the MonoDevelop project and has turned a community-driven project into one of Mono's most important projects. Prior to leading this effort he was in charge of Remoting and ASP.NET WebServices in the Mono project.

Birds of a Feather Sessions
---------------------------

A Birds of a Feather session is an informal discussion between a group with similar interests. If you have an idea for a BoF session you would like to host or attend, please list it on the [Summit BoF Wiki page](http://mono.wik.is/2007_Mono-Meeting/Birds_of_a_Feather_Sessions). Time will be set aside on the first and last days of the Mono Summit for BoFs. You may also schedule after hours BoF sessions.

Towards A Virtual Babel: Mono In Second Life
--------------------------------------------

Presenter: **Jim Purbrick**

Second Life is a large, on-line virtual world where avatars dance, fly, shop, play, meet, work, fall in love... and program. About 256k residents of Second Life have written 2.5 billion lines of code and run 30 million scripts 24/7 in a continuous 3D landscape twice the size of Montreal. This giant, collaborative development environment is run on a grid of over 12k CPUs that simulate the land of Second Life. Integrating the Mono virtual machine in to this environment has presented a huge set of challenges but also major advantages and paves the way towards a day where the Second Life software speaks as many languages as its residents.

Dr Jim Purbrick has both academic and industry experience in designing and building virtual worlds. At Nottingham University he worked on the MASSIVE-3 virtual environment system and Prix Ars Electronica-winning mixed-reality games with IGDA award winners, Blast Theory. In industry Jim designed online games at Codemasters, developed networking and load balancing technology for Warhammer Online, and is currently working on scripting and networking technology for Second Life while setting up Linden Lab Brighton.

NUnit
-----

Presenter: **Charlie Poole, NUnit Project**

[NUnit](/NUnit) is an open source test framework for all languages that run on Mono or .NET. It is one of the most widely used test frameworks for .NET and seems to be the only framework with the stated goal of supporting Mono on an equal footing with .NET. This session will a mix of information about currently available features and those things that are coming in the new NUnit 3.0 platform. Here are some of the highlights I plan to cover...

For newbies (brief)

-   What unit-testing is about
-   Writing tests with NUnit

For those who already use NUnit

-   Cool stuff in the latest release
-   [NUnitHowTo](/NUnitHowTo) - You tell me what you want covered

For the intrepid

-   Writing Addins for NUnit
-   The next NUnit

Charlie Poole is the creator of NUnit, the unit testing framework used by Mono and also wildly popular in the .NET world.

Mono on the Mac
---------------

Presenter: **Geoff Norton**

A session covering the most common use cases of mono on the mac, including but not limited to discussion on the current state of System.Windows.Forms, Cocoa#, ObjC# and other Macintosh technologies.

Geoff Norton is the author of Cocoa#, ObjC# and the native Windows.Forms driver for the MacOS. Geoff joined Novell recently and has been in charge of improving Mono's OSX support.

Greengrass
----------

Presenter: **Federico Di Gregorio**

Greengrass is just another RDF library but with a twist or two. First it is entirely managed C# code, developed entirely on Mono. Also, it has the ability to serialize and deserialize RDF resources (OWL instances) into CLR objects giving the programmer the ability to use high-level object-oriented programming patterns instead of the classical low-level triple access. This talk will explain Greengrass internals, how to map RDF concepts to an object-oriented programming language and will show how to use the library and the ggtool program to work with an OWL ontology.

db4o
----

Presenter: **Rodrigo B. de Oliveira**

General introduction to [db4o](http://www.db4o.com) with a focus on the latest time-saving features such as Native Queries and Transparent Activation which rely to a great extent on Mono.Cecil.

Rodrigo B de Oliveira is a language designer (he created the Boo programming language) and currently is employed at db4o.

Mono on Embedded Devices
------------------------

Presenter: **Everaldo Canuto**

Learn what you need to do to get Mono up and running on all sorts of embedded devices.

Everaldo Canuto is one of the Windows.Forms developers. Prior to joining Novell he worked on getting a software development stack based on Mono for the Maemo platform.

Developing Desktop applications with Moonlight
----------------------------------------------

Presenter: **Stephane Delcroix**

Stephane Delcroix recently joined Novell to work on Moonlight. Prior to Novell he was a contributor to the GNOME project, and in particular to the F-Spot photo management application.

Gaia Ajax Widgets - The alternative to Ajax
-------------------------------------------

Presenter: **Thomas Hansen**

So many Ajax solutions exists today for .Net and Mono, Gaia takes a relatively unique approach in that it doesn't require you to know JavaScript. Hear from the founding father of Gaia how Gaia works and what makes Gaia tick.

Meet The Experts
----------------

Meet the Experts is your opportunity to interact with the Mono team. Ever wonder what steps you need to take to embed Mono in your application? Have a great idea for an optimization in Moonlight? Wonder why the debugger isn't working for your application? Now's your chance to get your questions answered and make your suggestions heard. The Mono team will be divided into groups like Runtime, Moonlight and Winforms and you will be free to wander from group to group and ask them anything you want.

Debugging Mono Applications with MDB
------------------------------------

Presenter: **Martin Baulig**

Learn how to debug your Mono applications using our managed debugger.

Martin Baulig works at Novell on the Mono debugger. He was the architect of our generics support (both in the C# compiler and the runtime) and was previously the maintainer for the C# compiler where he implemented many of its features. Prior to joining Novell, Martin worked on the GNOME project where he was instrumental to Gnome 1.x and was one of the Gnome 2.x leads.

Boo – A lean mean DSL Machine
-----------------------------

Presenter: **Rodrigo B. de Oliveira**

A general introduction to the [boo](http://boo.codehaus.org/) programming language with a focus on its meta-programming features.

 Rodrigo B de Oliveira is a language designer (he created the Boo programming language) and currently is employed at db4o.

Mono.Cecil
----------

Presenter: **[Jb Evain](http://evain.net/blog)**

[Cecil](/Cecil) is a library to generate and inspect programs and libraries in the ECMA CIL format. This talk will be the occasion to discover, or re-discover in details what's exactly [Cecil](/Cecil), what it can do, what it is used for, and its lively ecosystem.

JB Evain created the Cecil library which is now in wide use in many applications in .NET and Mono. He joined Novell to work on Moonlight and our core class libraries. Prior to joining Novell he worked for db4o.

Boxerp
------

Presenter: **Carlos Ble**

Boxerp is a framework for distributed enterprise applications for .Net and Mono. Boxerp proposes an MVC architecture for desktop applications that makes your code easier to maintain. Provides a cross-platform responsive engine that makes it easier to deal with threads and port your application from one GUI toolkit to another. The framework simplifies the data binding process using AOP and implements data binding support for Gtk# through custom widgets and also custom widgets for Windows Forms and WPF providing validation and business rules. More info at [http://boxerp.org](http://boxerp.org)

openSUSE Build Service
----------------------

Presenter: **[Wade Berrier](http://wadeberrier.blogspot.com)**

Installing software that is not included in your distribution can be daunting for new as well as seasoned users. The [openSUSE Build Service](http://en.opensuse.org/Build_Service) aims to make software easily available for the masses.

From a developer perspective, the Build Service allows you to build and distribute packages for many Linux distributions (SUSE, Redhat, Debian, etc...). The system simplifies and automates several tasks that are normally associated with packaging.

Rough outline of discussion items:

-   Challenges on Linux with users installing software, and how the build service addresses this problem. "I have some killer software, but no one is using it because they can't install it!"
-   Example of installing software from the Build Service
-   As needed introduction to rpm based packaging
-   How the build service eases packaging, promotes good practices, and fosters cooperation
-   Getting started and a simple example
-   Q & A

Using Mono.Addins
-----------------

Presenter: **Lluis Sanchez**

This session will show how to use Mono.Addins to create extensible applications. It will explain the basics concepts of the library, and how to create a basic add-in and add-in host. We'll also discuss about design decisions to make when creating extensible applications, and how to get the most out of Mono.Addins.

 [![Logo uned.gif](/archived/images/e/e1/Logo_uned.gif)](/archived/images/e/e1/Logo_uned.gif) [![Cindetec.png](/archived/images/8/86/Cindetec.png)](/archived/images/8/86/Cindetec.png)
