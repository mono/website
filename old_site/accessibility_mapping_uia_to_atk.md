---
layout: obsolete
title: "Accessibility: Mapping UIA to ATK"
permalink: /old_site/Accessibility:_Mapping_UIA_to_ATK/
redirect_from:
  - /Accessibility:_Mapping_UIA_to_ATK/
---

Accessibility: Mapping UIA to ATK
=================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#UIA_Provider">1 UIA Provider</a>
<ul>
<li><a href="#UIA_Control_Types">1.1 UIA Control Types</a></li>
<li><a href="#UIA_Provider_Interfaces">1.2 UIA Provider Interfaces</a></li>
</ul></li>
<li><a href="#See_also">2 See also</a></li>
</ul></td>
</tr>
</tbody>
</table>

UIA Provider
------------

A page to show the mapping being used between UI Automation and ATK.

For an overview of the architecture see the [Architecture]({{site.github.url}}/old_site/Accessibility:_Architecture "Accessibility: Architecture") page.

### UIA Control Types

[UIA Control Types overview](http://msdn.microsoft.com/en-us/library/ms749005.aspx) (MSDN)

UIA Control Type

Status

Providers

ATK Roles

Notes

[Button](http://msdn.microsoft.com/en-us/library/ms742153.aspx)

Almost finished
(Calvin & Andres)

[IInvokeProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.iinvokeprovider.aspx) [IToggleProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.itoggleprovider.aspx)

ATK\_ROLE\_PUSH\_BUTTON

Work is still needed with states and updating FramingRect from UIA.

[Calendar](http://msdn.microsoft.com/en-us/library/ms753925.aspx)

Not Started

[IGridProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.igridprovider.aspx) [IScrollProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.iscrollprovider.aspx) [ISelectionProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.iselectionprovider.aspx) [ITableProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.itableprovider.aspx) [IValueProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.ivalueprovider.aspx)

ATK\_ROLE\_CALENDAR

[CheckBox](http://msdn.microsoft.com/en-us/library/ms751693.aspx)

Done (Andres)

[IToggleProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.itoggleprovider.aspx)

ATK\_ROLE\_CHECK\_BOX

[ComboBox](http://msdn.microsoft.com/en-us/library/ms752305.aspx)

Almost done (Andres)

ATK\_ROLE\_COMBO\_BOX

[DataGrid](http://msdn.microsoft.com/en-us/library/ms752044.aspx)

Not Started

ATK\_ROLE\_TABLE

[DataItem](http://msdn.microsoft.com/en-us/library/ms742561.aspx)

Not Started

[Document](http://msdn.microsoft.com/en-us/library/ms752058.aspx)

Not Started

ATK\_ROLE\_DOCUMENT\_FRAME

[Edit](http://msdn.microsoft.com/en-us/library/ms748367.aspx)

In progress (Andres)

ATK\_ROLE\_ENTRY

[Group](http://msdn.microsoft.com/en-us/library/ms742689.aspx)

In Progress
(Mike)

[IExpandCollapseProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.iexpandcollapseprovider.aspx)

ATK\_ROLE\_PANEL

[Header](http://msdn.microsoft.com/en-us/library/ms753110.aspx)

Not Started

[HeaderItem](http://msdn.microsoft.com/en-us/library/ms742202.aspx)

Not Started

ATK\_ROLE\_TABLE\_COLUMN\_HEADER ATK\_ROLE\_TABLE\_ROW\_HEADER

[Hyperlink](http://msdn.microsoft.com/en-us/library/ms742530.aspx)

Not Started

ATK\_ROLE\_LINK

[Image](http://msdn.microsoft.com/en-us/library/ms746603.aspx)

Not Started

ATK\_ROLE\_IMAGE

[List](http://msdn.microsoft.com/en-us/library/ms742462.aspx)

In Progress
(Calvin)

ATK\_ROLE\_LIST

[ListItem](http://msdn.microsoft.com/en-us/library/ms744765.aspx)

Done (Mike)

ATK\_ROLE\_LIST\_ITEM

[Menu](http://msdn.microsoft.com/en-us/library/ms741841.aspx)

In progress (Andres)

ATK\_ROLE\_MENU

We lack the provider yet

[MenuBar](http://msdn.microsoft.com/en-us/library/ms752322.aspx)

Not Started

ATK\_ROLE\_MENU\_BAR

[MenuItem](http://msdn.microsoft.com/en-us/library/ms746680.aspx)

Not Started

ATK\_ROLE\_MENU\_ITEM

[Pane](http://msdn.microsoft.com/en-us/library/ms749129.aspx)

In Progress
(Calvin)

[ITransformProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.itransformprovider.aspx) [IDockProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.idockprovider.aspx)

ATK\_ROLE\_PANEL

Work is still needed with states and updating FramingRect from UIA.

[ProgressBar](http://msdn.microsoft.com/en-us/library/ms743681.aspx)

Not Started

ATK\_ROLE\_PROGRESS\_BAR

[RadioButton](http://msdn.microsoft.com/en-us/library/ms750484.aspx)

Done (Andres)

ATK\_ROLE\_RADIO\_BUTTON

[ScrollBar](http://msdn.microsoft.com/en-us/library/ms743712.aspx)

In Progress
(Mike)

[IRangeValueProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.irangevalueprovider.aspx)

ATK\_ROLE\_SCROLL\_BAR

[Separator](http://msdn.microsoft.com/en-us/library/ms750550.aspx)

Not Started

ATK\_ROLE\_SEPARATOR

[Slider](http://msdn.microsoft.com/en-us/library/ms742106.aspx)

Not Started

ATK\_ROLE\_SLIDER

[Spinner](http://msdn.microsoft.com/en-us/library/ms744847.aspx)

Not Started

ATK\_ROLE\_DIAL

[SplitButton](http://msdn.microsoft.com/en-us/library/ms742545.aspx)

Not Started

[StatusBar](http://msdn.microsoft.com/en-us/library/ms745809.aspx)

Done (Mike)

[IGridProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.igridprovider.aspx)

ATK\_ROLE\_STATUSBAR

[Tab](http://msdn.microsoft.com/en-us/library/ms754207.aspx)

Not Started

ATK\_ROLE\_PAGE\_TAB\_LIST

[TabItem](http://msdn.microsoft.com/en-us/library/ms751611.aspx)

Not Started

ATK\_ROLE\_PAGE\_TAB

[Table](http://msdn.microsoft.com/en-us/library/ms750608.aspx)

Not Started

ATK\_ROLE\_TABLE

[Text](http://msdn.microsoft.com/en-us/library/ms752073.aspx)

Not Started

ATK\_ROLE\_TEXT

[Thumb](http://msdn.microsoft.com/en-us/library/ms742539.aspx)

Not Started

[TitleBar](http://msdn.microsoft.com/en-us/library/ms744939.aspx)

Not Started

ATK\_ROLE\_CAPTION

[ToolBar](http://msdn.microsoft.com/en-us/library/ms750425.aspx)

Not Started

ATK\_ROLE\_TOOL\_BAR

[ToolTip](http://msdn.microsoft.com/en-us/library/ms752335.aspx)

Not Started

ATK\_ROLE\_TOOL\_TIP

[Tree](http://msdn.microsoft.com/en-us/library/ms743706.aspx)

Not Started

ATK\_ROLE\_TREE

[TreeItem](http://msdn.microsoft.com/en-us/library/ms743384.aspx)

Not Started

ATK\_ROLE\_TREE\_TABLE

[Window](http://msdn.microsoft.com/en-us/library/ms746673.aspx)

In Progress

ATK\_ROLE\_WINDOW

### UIA Provider Interfaces

The following is a list of UIA Provider interfaces to be used in the table above.

[IExpandCollapseProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.iexpandcollapseprovider.aspx) [IGridItemProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.igriditemprovider.aspx) [IInvokeProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.iinvokeprovider.aspx) [IMultipleViewProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.imultipleviewprovider.aspx) [IRangeValueProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.irangevalueprovider.aspx) [IRawElementProviderAdviseEvents](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.irawelementprovideradviseevents.aspx) [IRawElementProviderFragment](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.irawelementproviderfragment.aspx) [IRawElementProviderFragmentRoot](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.irawelementproviderfragmentroot.aspx) [IRawElementProviderHwndOverride](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.irawelementproviderhwndoverride.aspx) [IRawElementProviderSimple](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.irawelementprovidersimple.aspx) [IScrollItemProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.iscrollitemprovider.aspx) [IScrollProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.iscrollprovider.aspx) [ISelectionItemProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.iselectionitemprovider.aspx) [ISelectionProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.iselectionprovider.aspx) [ITableItemProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.itableitemprovider.aspx) [ITableProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.itableprovider.aspx) [ITextProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.itextprovider.aspx) [ITextRangeProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.itextrangeprovider.aspx) [ITransformProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.itransformprovider.aspx) [IValueProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.ivalueprovider.aspx) [IWindowProvider](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.iwindowprovider.aspx)

See also
--------

Interesting as well are the [MWF-\>UIA mappings]({{site.github.url}}/old_site/Accessibility:_Control_Status "Accessibility: Control Status") and the [GTK-\>Gail-\>ATK-\>UIA mappings+candidates]({{site.github.url}}/old_site/Accessibility:_UiaAtkBridge#Case_study:_GTK "Accessibility: UiaAtkBridge").

