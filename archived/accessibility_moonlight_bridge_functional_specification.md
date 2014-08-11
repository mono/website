---
title: "Accessibility: Moonlight Bridge Functional Specification"
lastmodified: '2009-09-03'
redirect_from:
  - /Accessibility:_Moonlight_Bridge_Functional_Specification/
---

Accessibility: Moonlight Bridge Functional Specification
========================================================

Unlike the approach that was taken for the System.Windows.Forms ATK Bridge (where controls mapped by hand from UIAutomation to ATK), the Moonlight Bridge uses an automatic system for generating ATK adapters. The system relies on a set of base Pattern Implementors which map one or many UIAutomation Control Patterns to one or many ATK interfaces, assembling them into a complete Adapter for use by ATK.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#mapping-between-controls-and-uiautomation-patterns">1 Mapping between Controls and UIAutomation Patterns</a></li>
<li><a href="#mapping-control-types-to-atk-roles">2 Mapping Control Types to ATK Roles</a></li>
<li><a href="#mapping-uiautomation-control-patterns-to-atk-interfaces">3 Mapping UIAutomation Control Patterns to ATK interfaces</a>
<ul>
<li><a href="#generic-adapter">3.1 Generic Adapter</a>
<ul>
<li><a href="#properties">3.1.1 Properties</a></li>
<li><a href="#methods-to-expect-gtkgail-like-behavior">3.1.2 Methods to expect GTK/GAIL like behavior</a></li>
<li><a href="#states">3.1.3 States</a>
<ul>
<li><a href="#default-states">3.1.3.1 Default states</a></li>
<li><a href="#pattern-specific-states">3.1.3.2 Pattern-specific States</a></li>
</ul></li>
<li><a href="#relations">3.1.4 Relations</a></li>
<li><a href="#events">3.1.5 Events</a></li>
</ul></li>
<li><a href="#expandcollapseinvoketoggle-pattern-implementor">3.2 ExpandCollapse/Invoke/Toggle Pattern Implementor</a>
<ul>
<li><a href="#methods-to-expect-gtkgail-like-behavior_2">3.2.1 Methods to expect GTK/GAIL like behavior</a></li>
<li><a href="#methods-that-cannot-be-implemented">3.2.2 Methods that cannot be implemented</a></li>
<li><a href="#events_2">3.2.3 Events</a></li>
</ul></li>
<li><a href="#gridtable-pattern-implementor">3.3 Grid/Table Pattern Implementor</a>
<ul>
<li><a href="#methods-to-expect-gtkgail-like-behavior_3">3.3.1 Methods to expect GTK/GAIL like behavior</a></li>
<li><a href="#methods-to-expect-similar-gtkgail-like-behavior">3.3.2 Methods to expect similar GTK/GAIL like behavior</a></li>
<li><a href="#methods-that-cannot-be-implemented_2">3.3.3 Methods that cannot be implemented</a></li>
<li><a href="#events_3">3.3.4 Events</a></li>
</ul></li>
<li><a href="#rangevalue-pattern-implementor">3.4 RangeValue Pattern Implementor</a>
<ul>
<li><a href="#methods-to-expect-gtkgail-like-behavior_4">3.4.1 Methods to expect GTK/GAIL like behavior</a></li>
<li><a href="#methods-that-cannot-be-implemented_3">3.4.2 Methods that cannot be implemented</a></li>
<li><a href="#events_4">3.4.3 Events</a></li>
</ul></li>
<li><a href="#selection-pattern-implementor">3.5 Selection Pattern Implementor</a>
<ul>
<li><a href="#methods-to-expect-gtkgail-like-behavior_5">3.5.1 Methods to expect GTK/GAIL like behavior</a></li>
<li><a href="#methods-that-cannot-be-implemented_4">3.5.2 Methods that cannot be implemented</a></li>
<li><a href="#events_5">3.5.3 Events</a></li>
</ul></li>
<li><a href="#selectionitem-pattern-implementor">3.6 SelectionItem Pattern Implementor</a>
<ul>
<li><a href="#events_6">3.6.1 Events</a></li>
</ul></li>
<li><a href="#value-pattern-implementor">3.7 Value Pattern Implementor</a>
<ul>
<li><a href="#methods-to-expect-gtkgail-like-behavior_6">3.7.1 Methods to expect GTK/GAIL like behavior</a></li>
<li><a href="#methods-that-cannot-be-implemented_5">3.7.2 Methods that cannot be implemented</a></li>
<li><a href="#events_7">3.7.3 Events</a></li>
</ul></li>
<li><a href="#exceptions">3.8 Exceptions</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Mapping between Controls and UIAutomation Patterns
==================================================

To understand how a control should look in ATK, you must first understand two things: what is the control's UIAutomation Control Type, and what patterns does it implement. The table below shows both for all the Silverlight 2 controls.

[![](/archived/images/d/d2/Control-to-pattern.png)](/archived/images/d/d2/Control-to-pattern.png)

Silverlight 2 Control to UIAutomation Control Pattern mapping; for the original OpenOffice Calc document, see [[1]](http://www.mono-a11y.org/documentation/control-to-pattern.ods).

Mapping Control Types to ATK Roles
==================================

Once you know the UIAutomation Control Type, map it to the appropriate ATK Role using the table below.

|ControlType|ATK Role|
|:----------|:-------|
|Button|PushButton|
|Calendar|Calendar|
|CheckBox|CheckBox|
|ComboBox|ComboBox|
|Edit|Text|
|Hyperlink|Label|
|Image|Image|
|ListItem|ListItem|
|List|List|
|Menu|Menu|
|MenuBar|MenuBar|
|MenuItem|MenuItem|
|ProgressBar|ProgressBar|
|RadioButton|RadioButton|
|ScrollBar|ScrollBar|
|Slider|Slider|
|Spinner|SpinButton|
|StatusBar|Statusbar|
|Tab|PageTabList|
|TabItem|PageTab|
|Text|Label|
|ToolBar|ToolBar|
|ToolTip|ToolTip|
|Tree|Table|
|TableItem|TableCell|
|Custom|Unknown|
|Group|LayeredPane|
|Thumb|PushButton|
|DataGrid|Table|
|DataItem|TableCell|
|Document|Panel|
|SplitButton|PushButton|
|Window|Filler|
|Pane|Panel|
|Header|TableRowHeader|
|HeaderItem|TableCell|
|Table|Table|
|TitleBar|MenuBar|
|Separator|Separator|

Mapping UIAutomation Control Patterns to ATK interfaces
=======================================================

Then, map the UIA Control Patterns to a Pattern Implementor to understand the behavior of a given control.

Generic Adapter
---------------

All adapters inherit from the base Adapter class which provides an implementation of the Atk.Component interface. In particular, the following members are expected to be implemented:

### Properties

-   description (Description): Should return AutomationElementIdentifiers.HelpText.

-   getAlpha (Alpha): Always returns 1. (This could be implemented, but I don't think any current ATs will announce it)
-   getLayer (Layer): Always returns Atk.Layer.Widget
-   getMDIZOrder (MdiZorder): Always returns 0 as Silverlight doesn't support MDI

### Methods to expect GTK/GAIL like behavior

-   contains (Contains)
-   getExtents (GetExtents)
-   getPosition (GetPosition)
-   getSize (GetSize)
-   grabFocus (GrabFocus)
-   refAccessibleAtPoint (RefAccessibleAtPoint)
-   setExtents (SetExtents) - Only if control provides TransformPattern, `CanMove = true` and `CanResize = true`
-   setPosition (SetPosition) - Only if control provides TransformPattern and `CanMove = true`
-   setSize (SetSize) - Only if control provides TransformPattern and `CanResize = true`

### States

#### Default states

-   If the control is on screen:
    -   Atk.StateType.Showing
    -   Atk.StateType.Visible
-   If the control is Enabled:
    -   Atk.StateType.Sensitive
    -   Atk.StateType.Enabled
-   If the control is keyboard focusable:
    -   Atk.StateType.Focusable
-   If the control has keyboard focus:
    -   Atk.StateType.Focused
-   If the control is rendered horizontally:
    -   Atk.StateType.Horizontal
-   If the control is rendered vertically:
    -   Atk.StateType.Vertical

#### Pattern-specific States

-   If the control supports SelectionItem:
    -   Atk.StateType.Selectable
-   If the control supports SelectionItem and is selected:
    -   Atk.StateType.Selected
-   If the control supports Toggle, and is toggled:
    -   Atk.StateType.Checked
-   If the control supports Value and displays only one line
    -   Atk.StateType.SingleLine
-   If the control supports Value and displays more than one line
    -   Atk.StateType.MultiLine
-   If the control supports Value and is editable
    -   Atk.StateType.Editable
-   If the control supports ExpandCollapse
    -   Atk.StateType.Expandable
-   If the control supports ExpandCollapse and is expanded
    -   Atk.StateType.Expanded
-   If the control supports Transform and `CanResize = true`
    -   Atk.StateType.Resizable
-   If the control supports Invoke or Toggle, the following state will be raised when calling their main doAction:
    -   Atk.StateType.Armed

(TODO: determine if moon supports raising the state on click before **release** happens. If yes, Armed state will be lost when the user releases the button. If not, Armed state will be ON and immediately OFF when the action is triggered).

### Relations

-   Atk.RelationType.LabelledBy: Set if AutomationElementIdentifiers.LabeledBy is set.
-   Atk.RelationType.NodeChildOf: Set for treenodes that are children of other higher-level treenodes (and for the highest-level treenodes pointing to the TreeTable parent).
-   Atk.RelationType.MemberOf: Set for radiobuttons of the same group.

### Events

-   When control's accessible name changes:
    -   `object:accessible-name`
-   When control's visibility changes:
    -   `object:state-changed:visible`
-   When control's sensitivity changes:
    -   `object:state-changed:sensitive`
-   When control receives focus:
    -   `object:state-changed:focused`
    -   `focus_event`
-   When focus leaves control:
    -   `object:state-changed:focused`
-   When control's bounds are changed:
    -   `bounds_changed`

ExpandCollapse/Invoke/Toggle Pattern Implementor
------------------------------------------------

-   Implements: Atk.Action
-   Description: Maps ExpandCollpasePattern[[2]](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.iexpandcollapseprovider_members.aspx), InvokePattern[[3]](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.iinvokeprovider_members.aspx) and TogglePattern[[4]](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.itoggleprovider_members.aspx) to Atk.Action.

The Pattern Implementor maps the three patterns as the individual actions listed below:

-   ExpandCollapsePattern: "expand or collapse"
-   Invoke: "click"
-   Toggle: "click"

If both Invoke and Toggle patterns are implemented, the Toggle pattern's actions will take precedence.

### Methods to expect GTK/GAIL like behavior

-   nActions (NActions)
-   doAction (DoAction)
-   getDescription (GetDescription)
-   getKeyBinding (GetKeybinding)
-   getName (GetName)
-   getLocalizedName (GetLocalizedName)
-   setDescription (SetDescription)

### Methods that cannot be implemented

None

### Events

-   When control is expanded or collapsed:
    -   `visible_data_changed`

Grid/Table Pattern Implementor
------------------------------

-   Implements: Atk.Table
-   Description: Maps Grid[[5]](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.igridprovider.aspx) and Table[[6]](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.itableprovider.aspx) to Atk.Table.

IGrid is a subset of ITable, so every ITable provider will implement IGrid (but not the other way around).

### Methods to expect GTK/GAIL like behavior

-   refAt (RefAt)
-   getColumnDescription (GetColumnDescription)
-   addRowSelection (AddRowSelection)
-   removeRowSelection (RemoveRowSelection)
-   getRowDescription (GetRowDescription)
-   getRowHeader (GetRowHeader)
-   getIndexAt (GetIndexAt)
-   getColumnAtIndex (GetColumnAtIndex)
-   getRowAtIndex (GetRowAtIndex)
-   getColumnExtentAt (GetColumnExtentAt)
-   getRowExtentAt (GetRowExtentAt)
-   getSelectedRows (GetSelectedRows)
-   isRowSelected (IsRowSelected)
-   isSelected (IsSelected)
-   nColumns (NColumns)
-   nRows (NRows)

### Methods to expect similar GTK/GAIL like behavior

-   caption (Caption)
-   summary (Summary)

(Both will return the information that may be previously set.)

### Methods that cannot be implemented

-   setRowDescription (SetRowDescription)
-   setRowHeader (SetRowHeader)
-   setDescription (SetDescription)
-   setColumnDescription (SetColumnDescription)
-   setColumnHeader (SetColumnHeader)
-   getSelectedColumns (GetSelectedColumns)
-   isColumnSelected (IsColumnSelected)
-   addColumnSelection (AddColumnSelection)
-   removeColumnSelection (RemoveColumnSelection)

### Events

-   When rows are inserted:
    -   `row_inserted(row, n_inserted)`
-   When rows are deleted:
    -   `row_deleted(row, n_children_deleted)`

RangeValue Pattern Implementor
------------------------------

-   Implements: Atk.Value
-   Description: Maps RangeValuePattern[[7]](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.irangevalueprovider_members.aspx) to Atk.Value. Should be able to map API roughly 1:1.

### Methods to expect GTK/GAIL like behavior

-   minimumValue (GetMinimumValue)
-   maximumValue (GetMaximumValue)
-   minimumIncrement (GetMinimumIncrement)
-   currentValue (GetCurrentValue)
-   currentValue (SetCurrentValue)

### Methods that cannot be implemented

None

### Events

-   When control's value changes:
    -   `object:accessible-value`

Selection Pattern Implementor
-----------------------------

-   Implements: Atk.Selection
-   Description: Maps SelectionPattern[[8]](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.iselectionprovider_members.aspx) and SelectionItemPattern[[9]](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.iselectionitemprovider_members.aspx) to Atk.Selection. Unlike UIAutomation, selection in ATK is done in the parent container instead of the container's children. This Pattern Implementor maps the various selection methods from the children to the parent.

### Methods to expect GTK/GAIL like behavior

-   nSelectedChildren (SelectionCount)
-   selectChild (AddSelection)
-   clearSelection (ClearSelection)
-   isChildSelected (IsChildSelected)
-   getSelectedChild (RefSelection)
-   deselectChild (RemoveSelection)
-   selectAll (SelectAllSelection)

### Methods that cannot be implemented

None

### Events

-   None

SelectionItem Pattern Implementor
---------------------------------

### Events

-   When an object gains or loses selection:
    -   `object:state-changed:selected`
    -   `selection_changed`

Value Pattern Implementor
-------------------------

-   Implements: Atk.Text
-   Description: Maps ValuePattern[[10]](http://msdn.microsoft.com/en-us/library/system.windows.automation.provider.ivalueprovider_members.aspx) to Atk.Text. Can only retrieve and set the value of the control, but cannot control or retrieve things like selection, caret and text attributes.

### Methods to expect GTK/GAIL like behavior

-   getCharacterAtOffset (GetCharacterAtOffset)
-   getCharacterExtents (GetCharacterExtents)
-   getRangeExtents (GetRangeExtents)
-   getText (GetText)
-   getTextAfterOffset (GetTextAfterOffset)
-   getTextAtOffset (GetTextAtOffset)
-   getTextBeforeOffset (GetTextBeforeOffset)
-   characterCount (CharacterCount)

### Methods that cannot be implemented

-   addSelection (AddSelection)
-   getBoundedRanges (GetBoundedRanges)
-   getOffsetAtPoint (GetOffsetAtPoint)
-   getAttributeRun (GetRunAttributes)
-   getDefaultAttributes (DefaultAttributes)
-   getNSelections (GetNSelections)
-   getAttributes (GetAttributes)
-   removeSelection (RemoveSelection)
-   getSelection (GetSelection)
-   setSelection (SetSelection)
-   setCaretOffset (SetCaretOffset)
-   caretOffset (CaretOffset)

### Events

-   When the value changes:
    -   `visible_data_changed`

Exceptions
----------

-   GridSplitter: Implements Transform pattern (which is usually accessed in ATK via SetPosition) but Orca (TODO: check this) expects Atk.Value to be implemented instead. The feasibility of altering this in our design will have to be estimated by development.
-   TODO: Possible exception for Tables and Table-like controls.


