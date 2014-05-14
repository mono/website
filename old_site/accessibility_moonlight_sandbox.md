---
layout: obsolete
title: "Accessibility: Moonlight Sandbox"
permalink: /old_site/Accessibility:_Moonlight_Sandbox/
redirect_from:
  - /Accessibility:_Moonlight_Sandbox/
---

Accessibility: Moonlight Sandbox
================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#moonlight-sandbox">1 Moonlight Sandbox</a>
<ul>
<li><a href="#tasks-for-research-week">1.1 Tasks for Research Week</a>
<ul>
<li><a href="#provider">1.1.1 Provider</a>
<ul>
<li><a href="#deliverables">1.1.1.1 Deliverables</a></li>
<li><a href="#research">1.1.1.2 Research</a></li>
<li><a href="#links">1.1.1.3 Links</a></li>
</ul></li>
<li><a href="#bridge">1.1.2 Bridge</a>
<ul>
<li><a href="#deliverables_2">1.1.2.1 Deliverables</a></li>
</ul></li>
<li><a href="#plugin-integration">1.1.3 Plugin integration</a>
<ul>
<li><a href="#deliverables_3">1.1.3.1 Deliverables</a></li>
</ul></li>
</ul></li>
<li><a href="#requirements-for-moonlight-development">1.2 Requirements for Moonlight development</a></li>
<li><a href="#running-the-moonlight-20-unit-test-suite">1.3 Running the Moonlight 2.0 unit test suite</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Moonlight Sandbox
=================

This is a space to collect ideas about the Moonlight work for Phase 2.

Tasks for Research Week
-----------------------

We'll attack research week from three fronts:

### Provider

-   Investigate the API that existing Microsoft Silverlight 2 providers use
    -   Specifically, what standard System.Windows.Automation API needs to be implemented? What about System.Automation.Peers?
-   Determine what level of effort will be required to implement that API, or alternatively to adapt providers to use our existing API
-   What kind of integration will be necessary with the moon repo? Does moon need to depend on our uia2atk repository? If so, how will that work?
-   How much effort is required to complete the UIA providers for RuntimeControls?

#### Deliverables

-   A summary of your findings sent to the team via email. Additionally, an hour estimate for completing the Runtime Controls, and for any necessary API modifications.

#### Research

-   Silverlight 2 is a subset of WPF and supports building complex user interfaces, so basically you can define flexible composite Controls, for example, a ListBox containing Grids, and those Grids containing StackPanels and those StackPanels containing Buttons, and so on.
-   Accessibility in SL2 is defined using AutomationPeers, there is an AutomationPeer for each control, for example ButtonAutomationPeer is used by ButtonControl.
-   Accessibility in SL2 is initialized automatically by Silverlight 2 by calling an overridden method: SWAP.AutomationPeer.OnCreateAutomationPeer, this method returns and instance that should not be destroyed until the associated control is disposed, same approach as in MonoUIAutomationWinforms.
-   AutomationPeer is not equal to IRawElementProviderSimple, however there's a method to cast from IRawElementProviderSimple: *AutomationPeer.PeerFromProvider*
-   There's a factory FrameworkElementAutomationPeer to create peers: *CreatePeerForElement(UIElement)*, similar to ProviderFactory.GetProvider and *SWAP.XXXXXPeer.FromElement(UIElement)*, similar to ProviderFactory.FindProvider.
-   Navigation is different, IRawElementProviderFragment doesn't exist, so there is no explicit sibling navigation, 2 methods replace IRawElementProviderFragment.Navigate: AutomationPeer.GetParent and AutomationPeer.GetChildren.
-   Patterns and properties implementation is similar, however due to attached properties in Silverlight we need to implement a new class: SWA.AutomationProperties (see table below) to support DependencyObject.GetValue/DependencyObject.SetValue.
-   There are some AutomationPeer classes already implemented (found in the Sample Source Code for Silverlight 2 Runtime and SDK Controls) however the core (primitives and simple controls) are not implemented in this source code.

API difference

**.NET 3.5**

**Silverlight 2**

Namespace *System.Windows.Automation*

-TextPattern

+TextPattern

---

+AutomationProperties

UIAutomationTypes.dll

System.Windows.dll

Namespace *System.Windows.Automation.Peers*

Doesn't not exist

Must be implemented (Similar to MonoUIAutomationWinforms)

---

System.Windows.dll

Namespace *System.Windows.Automation.Provider*

---

Subset of .NET 3.5

UIAutomationProvider.dll

System.Windows.dll

*Automation Events*

Using SWAProvider.AutomationInteropProvider.RaiseXXXXEvent methods

Using SWAPeers.AutomationPeer.RaiseXXXXEvents methods

#### Links

-   [Creating Accessibility-aware Silverlight 2 Content](http://www.code-magazine.com/Article.aspx?quickid=0810062)
-   [Microsoft® Silverlight™ 2 Software Development Kit Documentation](http://www.microsoft.com/Downloads/details.aspx?familyid=BCE7684A-507B-4FC6-BC99-6933CD690CAB&displaylang=en)
-   [Sample Source Code for Silverlight 2 Runtime and SDK Controls](http://www.microsoft.com/downloads/details.aspx?FamilyID=EB83ED4C-AC85-4DE9-8395-285628EE2254&displaylang=en)

### Bridge

-   How should the bridge be loaded and integrate with the providers?
-   Where should the bridge reside so that it can be used by moon?
-   How do SL2 controls map to Atk.Roles? Will any additional bridge work be required to support the SL2 controls?

#### Deliverables

-   Email report with a plan for loading and integrating the bridge with the providers.
-   A list of SL2 controls and which Atk.Role they map to.
-   A high-level breakdown and ballpark hour estimate for any bridge customization required for the SL2 controls.

### Plugin integration

-   How can a FF plugin inject an Atk.Object into the DOM tree?
-   How will the Bridge be distributed so that it can be used by the plugin?

#### Deliverables

-   Email to the team containing an hour estimate for integration, and a proposal for how it should be integrated and distributed.

Requirements for Moonlight development
--------------------------------------

-   mozilla-nspr-devel
-   mozilla-nss-devel
-   mozilla-xulrunner190-devel
-   ImageMagick-devel
-   libMagick++-devel
-   fetchmsttfonts, to avoid failures when running moon-unit (still using OpenSUSE 11? follow [this](http://www.benkevan.com/blog/installing-microsoft-fonts-on-opensuse-110/))

Running the Moonlight 2.0 unit test suite
-----------------------------------------

-   cd moon/test/
-   make install-test-plugin
-   make install-test

-   cd moon/test/2.0/moon-unit
-   make test


