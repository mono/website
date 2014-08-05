---
title: "Accessibility: Architecture"
lastmodified: '2008-08-15'
redirect_from:
  - /Accessibility:_Architecture/
---

Accessibility: Architecture
===========================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#overview">1 Overview</a>
<ul>
<li><a href="#gnome-desktop">1.1 GNOME Desktop</a></li>
<li><a href="#ui-automation">1.2 UI Automation</a></li>
<li><a href="#ui-automation-on-linux">1.3 UI Automation on Linux</a></li>
</ul></li>
<li><a href="#provider-details">2 Provider Details</a>
<ul>
<li><a href="#atk">2.1 ATK</a></li>
<li><a href="#uia-provider">2.2 UIA Provider</a></li>
<li><a href="#uiaatk-bridge">2.3 UIA/ATK Bridge</a></li>
</ul></li>
<li><a href="#definitions">3 Definitions</a></li>
</ul></td>
</tr>
</tbody>
</table>

Overview
--------

### GNOME Desktop

The GNOME Desktop has a rich infrastructure for accessibility. At the core of this infrastructure is the Assistive Technology Service Provider Interface (at-spi). The at-spi layer is built on CORBA using Bonobo and has several bindings to communicate to it although the most popular are [pyatspi](http://live.gnome.org/GAP/PythonATSPI), a python binding for Assistive Technologies (ATs) and the Accessibility ToolKit ([ATK](http://library.gnome.org/devel/atk/unstable/)), a C interface for the GNOME Desktop and applications. ATs like the screen-reader ORCA run in their own process and still communicate with the desktop and applications using at-spi. In an effort to align the terminology with that used in UI Automation, the AT process boundary and interfaces will be referred to as clients and the applications process boundary and interfaces will be referred to as providers.

### UI Automation

Microsoft created the UI Automation specification to enhance the existing technologies available on the Windows platform. The UI Automation specification has a similar architecture to the Gnome Desktop in that there is a mechanism for ATs to communicate with applications and the desktop out-of-process. In UI Automation, the ATs bind to the UIA Client interfaces and the desktop and applications write to the UIA Provider interfaces. The communication between the two processes is called the Core.

### UI Automation on Linux

To make UI Automation integrate with the GNOME Desktop, UI Automation needs to integrate into the existing accessibility frameworks; namely at-spi and ATK. The UIA Client interfaces will be written on a bridge that will act as the UIA Core and provide a translation layer to at-spi. Similarly, the UIA Provider interfaces will be written on a bridge that will act as the UIA Core and provide a translation layer to ATK. The following diagram shows all of these technologies and layers put together.

[![Architecture.png]({{ site.github.url }}/archived/images/3/37/Architecture.png)]({{ site.github.url }}/archived/images/3/37/Architecture.png)

Provider Details
----------------

### ATK

In order for an application to be accessible on the GNOME Desktop, it needs to provide information about its user interface using ATK. If the application is written using GTK+, all of the standard widgets provide the needed information to ATK and therefore the application will by default be accessible. For applications that do not use GTK+ for their user interface, additional work needs to be done to make them accessible.

ATK (and at-spi) create a hierarchy of UI elements to present the UI to ATs. ATK has a defined set of roles that each UI element can use to describe the type of element and how to interact with it. For example, a button on the screen would report that it's role is ATK\_ROLE\_PUSH\_BUTTON. UI elements are not limited to a single role in ATK as it is possible to have a UI element that can do more than one thing. For example, a button can act as a button but can also contain other elements like a label or picture. In this case a button may report it's roles as ATK\_ROLE\_PUSH\_BUTTON and ATK\_ROLE\_PANEL.

\< *insert more about events here* \>

### UIA Provider

For an application to be accessible using UIA, it must implement UIA Provider interfaces for its UI elements similar to the way the ATK works. Also similar to the GNOME Desktop, Windows applications using the standard WIN32 or Windows Forms widgets will automatically be accessible for the standard widgets. Part of the effort of this project is also to make all of the standard Windows Forms widgets accessible in the Mono project using UI Automation.

UI Automation also creates a hierarchy of UI elements to present to ATs. UI Automation also has ATK\_ROLE-like interfaces for elements to implement called Control Patterns. The difference is that Control Patterns are more generic than ATK roles and provide a way to categorize and expose a control's functionality independent of the control type or the appearance of the control. As a comparison, in ATK a checkbox would use role ATK\_ROLE\_CHECK\_BOX, in UIA, a checkbox would use the Toggle Pattern to indicate it's an element that is able to be toggled. That toggle pattern could apply to any number of actual controls whereas the ATK\_ROLE\_CHECK\_BOX is more specific to a control that is checked or not checked.

UI Automation also has a standard set of Control Types which are more specific to types of UI controls. Control Types define a set of Attributes, Control Patterns, and Events for clients to be aware of. In the case of a Button, the Control Type specifies that the button must either implement the Toggle Pattern or the Invoke Pattern. The typical way to add accessibility in UIA for some UI element is to choose a Control Type that closely matches the element and implement the required provider interfaces. Additional Control Patterns may also be implemented but the UI element must implement what is specified in the Control Type definition.

Microsoft provides overviews of UIA on MSDN:

-   [UI Automation Control Patterns](http://msdn.microsoft.com/en-us/library/ms752362.aspx)
-   [UI Automation Properties](http://msdn.microsoft.com/en-us/library/ms752056.aspx)
-   [UI Automation Events](http://msdn.microsoft.com/en-us/library/ms748252.aspx)

Be aware that the documentation from Microsoft explains the technology from the view of applications integrating with providers or ATs integrating with the client. This project is writing the Core which sits between the two so the perspective doesn't always match the documentation on MSDN. Control Patterns are actually exposed to the applications as a set of interfaces that must be implemented. Those will be referred to as the Provider Interfaces for the purposes of this architecture.

### UIA/ATK Bridge

The bridge from UIA Providers to ATK needs to map the Properties, Events, and Control Patterns from UIA Providers to ATK roles, events, and properties. A UIA element does not report back which provider interfaces it implements but it does report back the Control Type. Since UIA Control Types are a better match for a mapping to ATK roles, they will be used as the primary means of the mapping. The UIA element's object will also be introspected for any additional provider interfaces that are implemented and accounted for in the mapping.

Details about the actual mapping of UIA Providers and Control Types to ATK can be found on the [Mapping UIA to ATK]({{ site.github.url }}/Accessibility:_Mapping_UIA_to_ATK "Accessibility: Mapping UIA to ATK") page.

Definitions
-----------

[UIA](http://msdn2.microsoft.com/en-us/accessibility/bb892133.aspx)---Microsoft UI Automation. A managed code application programming interface (API), exposing user interface controls for test automation and assistive technology. Part of the .NET framework starting at 3.0. Successor of MSAA (Microsoft Active Accessibility)
 UIA Clients---Applications such as screen readers and testing frameworks written in managed code (e.g., C\#/VB).
 UIA Providers---UI implementations or application controls such as checkboxes. Written in managed code or C/C++.
 AT---Assistive technology. A generic term that includes assistive, adaptive, and rehabilitative devices and the process used in selecting, locating, and using them.
 AT-SPI---A toolkit neutral way of providing accessibility facilities in applications. AT-SPI can also be used to automate testing of user interfaces. AT-SPI is currently supported by GTK+2, JAVA/Swing, Mozilla, and StarOffice/OpenOffice. For our product, AT-SPI will act as the equivalent of the UIA core.
 ATK---Accessibility toolkit. A developer toolkit that allows programmers to use common GNOME accessibility features in their applications. The ATK interface is toolkit-independent--implementations could be written for any widget set, such as GTK, Motif or Qt.
 GAIL---GNOME Accessbility Implementation Library. GAIL provides accessibility support for GTK by implementing AtkObjects for widgets in GTK. GAIL is dynamically loadable (as a module) at runtime by a GTK application. Once loaded, those parts of your application that use standard GTK widgets will have a basic level of accessibility, without you having to modify your application at all. (If GAIL is not loaded, GTK widgets will have a default accessibility implementation that essentially returns no information, though it nominally conforms to the ATK API.)
 ATK/UIA Bridge---Mapping of ATK to the UIA provider APIs.
 UIA/at-spi Bridge---Mapping of AT-SPI to the UIA client APIs.
 [WinForms]({{ site.github.url }}/docs/gui/winforms/)---One of the many GUI Toolkits for use with Mono, working towards compatibility with Microsoft's System.Windows.Forms.
 [Moonlight]({{ site.github.url }}/Moonlight "Moonlight")---The Mono-based implementation of Silverlight.
 [Accerciser](http://live.gnome.org/Accerciser)---An interactive Python accessibility explorer for the GNOME desktop. It uses AT-SPI to inspect and control widgets, allowing you to check if an application is providing correct information to assistive technologies and automated test frameworks.
 [Orca](http://live.gnome.org/Orca)---Open source scriptable screen reader. Using various combinations of speech, braille, and magnification, Orca helps provide access to applications and toolkits that support the AT-SPI (e.g., the GNOME desktop).
 [IronPython](http://www.codeplex.com/Wiki/View.aspx?ProjectName=IronPython)---Implementation of the Python programming language, targeting .NET and Mono. It makes .NET libraries easily available to Python programmers, while maintaining full compatibility with the Python language.
 [CPython](http://www.python.org)---The default, most-widely used implementation of the Python programming language. It is written in C, hence the name CPython.
 [Strongwind](http://medsphere.org/projects/strongwind)---A GUI test automation framework inspired by dogtail. Strongwind is object-oriented and extensible. Strongwind is written in Python and uses the pyatspi library to manipulate and query the state of applications.

