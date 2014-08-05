---
title: "Accessibility: Specification Notes"
lastmodified: '2009-07-31'
redirect_from:
  - /Accessibility:_Specification_Notes/
---

Accessibility: Specification Notes
==================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#issues">2 Issues</a>
<ul>
<li><a href="#uia-tree">2.1 UIA Tree</a></li>
<li><a href="#msdn">2.2 MSDN</a></li>
</ul></li>
<li><a href="#feature-requests">3 Feature requests</a>
<ul>
<li><a href="#specific-to-the-winforms-implementation">3.1 Specific to the Winforms Implementation</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
------------

This page contains a list of items to discuss with Microsoft. In particular, it should contain:

1.  Questions and defects found in the UIA specification or in Microsoft's implementation of the UIA spec.
2.  Features in UIA that are needed to bridge AT-SPI/ATK functionality

Issues
------

### UIA Tree

1.  Structure Changed Automation Event: ChildAdded event is generated when an item is added, however ChildRemoved is not generated when item is removed.
2.  Structure Changed Automation Event: When to generate ChildrenBulkRemoved, ChildrenBulkAdded and ChildrenInvalidated?
3.  Navigation: Some controls (for example, ScrollBar, ListBox or ComboBox) seem to sort internal providers somehow.
4.  ControlType Automation Property: no event is generated when the ControlType changes, for example, changing SWF.ListView.View from SWF.View.LargeIcon to SWF.View.Details.
5.  ToolStripSplitButton seems like it should map to ControlType.SplitButton, but in UISpy it shows up as ControlType.Button, with no way to access the dropdown items. We are assuming this is a bug in the MSAA\<-\>UIA mapping of MS's implementation, and will be implementing our provider with support for ControlType.SplitButton.

### MSDN

1.  StatusBar control type has two IsKeyboardFocusableProperty entries. See: [http://msdn.microsoft.com/en-us/library/ms745809.aspx\#Required\_UI\_Automation\_Properties](http://msdn.microsoft.com/en-us/library/ms745809.aspx#Required_UI_Automation_Properties)
2.  ScrollBar control type says: should support RangeValue Pattern when container doesn't support ScrollPattern, however, ScrollBar Winforms provider always supports RangeValue even if the container supports Scroll Pattern: *"This functionality is required to be supported only if the Scroll control pattern is not supported on the container that has the scroll bar."* [http://msdn.microsoft.com/en-us/library/ms743712.aspx](http://msdn.microsoft.com/en-us/library/ms743712.aspx)
3.  StatusBarPanel is Edit control type, and on MSDN it says: TextPattern is required, but with nunit test on Vista, it is not supported. [http://msdn.microsoft.com/en-us/library/ms748367.aspx](http://msdn.microsoft.com/en-us/library/ms748367.aspx)
4.  TextUnits are not well documented -- definition of "line" and "paragraph" are not well understood. See [http://msdn.microsoft.com/en-us/library/system.windows.automation.text.textunit.aspx](http://msdn.microsoft.com/en-us/library/system.windows.automation.text.textunit.aspx)
5.  TextUnit.Format for TextBox is supposed to resemble TextUnit.Word according to MSDN, but instead resembles TextUnit.Page.
6.  MessageBox (ControlType.Window) has LocalizedControlTypeProperty of "Dialog" in UISpy on Vista, but MSDN says the value should always be "window" (it is for Form). [http://msdn.microsoft.com/en-us/library/ms746673.aspx](http://msdn.microsoft.com/en-us/library/ms746673.aspx)
7.  Panel Control Type in UISpy and ClientTest doesn't support any of patterns.
8.  MaskedTextBox, MonthCalendar, DateTimePicker, and DomainUpDown do not support any patterns.
9.  Separator Control Type in UISpy IsContentElement is TRUE, while on MSDN is FALSE.
10. SWF.DataGrid is ControlType.Table and doesn't implement required patterns: Grid and Table.
11. Setting SWF.DataGrid.ColumnHeadersVisible to false doesn't remove the Header Children, besides those children return invalid values, such as BoundingRectangle and IsOffScreen.
12. PropertyGrid's elements differ from what is shown visually.

Feature requests
----------------

1.  There's no API for capturing the keys.
2.  There's no API for measuring coordinates of fonts. This is needed to implement AtkText::GetRangeExtents and AtkText::GetCharacterExtents.
3.  There's no API for determining the number, position, and URI of links in a LinkLabel or invoking links other than the first one. In the meantime an interface was defined to get these values: Mono.UIAutomation.Bridge.IHypertext
4.  There's no API to know if a certain widget has an image in in it (i.e.: SWF.Button, SWF.CheckBox, SWF.RadioButton,...)
5.  There's no API to collapse SWF.ListViewGroup, in other words: there's no way to emulate Group.InvokePattern.[Collapse/Expand] in ListView when View is LargeIcon or SmallIcon.
6.  There's no API to cut/copy/paste text ranges to/from the clipboard, needed for Atk.EditableText.
7.  AutomationFocusChangedEvent is fired only once when focus changes, giving information about the widget that received the focus, however it would be interesting to receive an event also when a widget looses focus, to be consistent with the 2nd element on the list **Specific to the Winforms Implementation**.
8.  ITextProvider should be able to modify text in a rich way. This is especially needed with MaskedTextBox as it is difficult to maintain the correct behavior exclusively with IValueProvider. TODO: Expand on this.
9.  A multiline TextBox doesn't implement IValueProvider so it is impossible to edit the text. We differ from Microsoft's implementation here (implementing IValueProvider).
10. ISelectionProvider::GetSelection is ambiguous for complex widgets, e.g.: DataGridView. Should it return cells, columns, rows, etc?
11. There's no API to get selected columns. This is needed for DataGridView. ISelectionProvider only supports GetSelection, and this method is used to return selected rows. You might use ISelectionItem for each item and verify if ISelectionItem.IsSelected returns true, however items children may/may not implemented this interface.

### Specific to the Winforms Implementation

-   ToolStripButton should implement TogglePattern when CheckOnClick = True.
-   An AutomationPropertyChangedEvent is not fired (for the property HasKeyboardFocusProperty) when a widget looses focus (it should come with OldValue==true,NewValue==false). This is needed for Bug \#445199. FIXME: Right now, instead of not having this bug in our UIA impl, we have implemented the feature request above about sending AutomationFocusChangedEvent when a widget looses focus.
-   An AutomationPropertyChangedEvent is not fired (for the property AutomationNameProperty) when a widget's AccessibleDescription property is changed. This is needed for Bug \#457845.
-   A PopupButton in an OpenFileDialog is using MenuItem control type instead of the logical Button control type. This is needed for bug \#474647.
-   ToolStripSplitButtons seems not to have a way to invoke them or to open their dropdown (because they don't implement any pattern and don't have children by default). Examples: a) on a SaveFileDialog, the Views button. b) [toolstripsplitbutton.py](http://anonsvn.mono-project.com/viewvc/trunk/uia2atk/test/samples/toolstripsplitbutton.py?view=markup)


