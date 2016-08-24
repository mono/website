---
title: "Accessibility: Phase II Work Breakdown"
lastmodified: '2009-03-24'
redirect_from:
  - /Accessibility%3A_Phase_II_Work_Breakdown/
---

Accessibility: Phase II Work Breakdown
======================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#phase-ii-work-breakdown">1 Phase II Work Breakdown</a>
<ul>
<li><a href="#high-level-breakdown">1.1 High Level Breakdown</a>
<ul>
<li><a href="#firefox-plugin-brad">1.1.1 Firefox Plugin (Brad)</a></li>
<li><a href="#moon-uia-atk-bridge-andres">1.1.2 Moon Uia Atk Bridge (Andres)</a></li>
<li><a href="#moonlight-providers-mario">1.1.3 Moonlight Providers (Mario)</a></li>
<li><a href="#at-spi-sharp-mike">1.1.4 AT-SPI-sharp (Mike)</a></li>
<li><a href="#at-spi-to-uia-mike">1.1.5 AT-SPI to UIA (Mike)</a></li>
<li><a href="#uia-to-dbus---uiadbuscorebridge-sandy">1.1.6 UIA to DBus - UiaDbusCoreBridge (Sandy)</a></li>
<li><a href="#uia-client-api-implementation-sandy">1.1.7 UIA Client API Implementation (Sandy)</a></li>
</ul></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Phase II Work Breakdown
=======================

High Level Breakdown
--------------------

Please write entries in the form of:

### Firefox Plugin (Brad)

-   Develop plugin infrastructure. (3 days)

### Moon Uia Atk Bridge (Andres)

-   Sync with the Security patches from Seb Pouliout in order to support latest versions of moonlight. (4 days)
-   Polish the patch to glib / atk -sharp in order to be accepted by MKestner. (3 days)
-   Polish my patch to moon (System.Windows.dll) to load the bridge. (3 days)
-   Rework my research patch to call, with the embedding API, the method to get the main AtkObject from the bridge, and integrate it into Brad's patch to moonlight which implements the new NPAPI method. (3 days)
-   Left-overs to get the "hello world" working: the deliverable could be to have a simple Silverlight app with a button be exposed in accerciser (below the Firefox atk hierarchy). (3 days)
-   Develop the bridge classes that will represent the Atk-Objects. (3 days to *estimate* this big task)

### Moonlight Providers (Mario)

-   Update SWA and SWAProviders to Silverlight 2. (3 days)
-   Implement SWAPeers: Automation, FrameworkElement (3 days)
-   Implement SWAPeers: ButtonBase (Peer, Button, HyperlinkButton, RepeatButton, ToggleButton, CheckBox, Radio) (4 days)
-   Implement SWAPeers: Item (Peer, SelectorItem, ListBoxItem) (5 days)
-   Implement SWAPeers: ItemControls (Peer, Selector, ComboBox, ListBox) (5 days)
-   Implement SWAPeers: TextBlock, TextBox, PasswordBox, (4 days)
-   Implement SWAPeers: MediaElement, MultiScale, ScrollViewer, Thumb, Image. (5 days)
-   Implement SWAPeers: RangeBase (Peer, ProgressBar, ScrollBar, Slider) (3 days)

### AT-SPI-sharp (Mike)

-   Finish Accessible/Application infrastructure and unit testing framework (4 days)
-   Map method calls and create proxies for interfaces (8 days)
-   Map events (8 days)

### AT-SPI to UIA (Mike)

-   Map at-spi-sharp Accessible to UIA objects (3 days)
-   Implement navigation (4 days)
-   at-spi roles/states -\> UIA properties (5 days)
-   at-spi state-changed events -\> property-changed events (5 days)
-   at-spi interfaces -\> UIA patterns and pattern properties (8 days)

### UIA to DBus - UiaDbusCoreBridge (Sandy)

-   Allow for multiple bridges, and set up basic infrastructure for UiaDbusCoreBridge. (3 days)
-   Create DbusCore methods for accessing UIA elements of an application (I doubt we'll require a registry). (3 days)
-   Support for publishing a complete hierarchy with only the simple provider interface over UiaDbusCoreBridge. Includes working on navigation issues. (3-5 days)
-   Wrap each Provider interface in a DbusCore equivalent. Keep an eye out for thread safety. (3 days)

### UIA Client API Implementation (Sandy)

-   Implement UIA element source abstraction layer (IAutomationSource, IElement) for DbusCore, keeping at-spi in mind. (3 days)
-   Implement TreeWalker abstraction layer for DbusCore, keeping at-spi in mind. (3 days)
-   Add merge support for TreeWalker so that at-spi accessibles in WebBrowser are sensibly conveyed. (3 days)
-   Automation class (event handling). Requires adding support to UiaDbusCoreBridge (5 days)
-   CacheRequest. (5-10 days?)
-   Create DbusCore\*Pattern subclasses, including mechanism for (un)associating them with AutomationElements. Could involve research into exception propagation over DBus. (3 days)
-   Implement AutomationElementCollection, \*EventArgs, and \*Condition classes. (3 days)
-   Implement TextPatternRange. (3 days)
-   Implement Client\* classes (includes research and quite a bit of testing in how client-side providers are used). (5 days)
-   AutomationElement.FocusedElement, which I believe may not be support by at-spi. (3 days)
-   AutomationElement:FromHandle, FromLocalProvider, FromPoint. (3 days)


