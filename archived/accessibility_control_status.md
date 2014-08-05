---
title: "Accessibility: Control Status"
lastmodified: '2008-10-14'
redirect_from:
  - /Accessibility:_Control_Status/
---

Accessibility: Control Status
=============================

WinForms Control List
---------------------

Read the following page for more information about Windows Forms providers implementation:

-   [Windows Forms Implementation]({{ site.github.url }}/Accessibility:_Winforms_Implementation "Accessibility: Winforms Implementation")
-   [Provider Functional Specification]({{ site.github.url }}/Accessibility:_Provider_Functional_Specification "Accessibility: Provider Functional Specification")
-   [Class diagram of \*Strip\* classes in System.Windows.Forms](http://armstrong-clan.net/dump/Strip.png)

Control

Status (of Provider)

ControlTypes

Provider

Notes

[Button](http://msdn.microsoft.com/en-us/library/system.windows.forms.Button.aspx)

Done

Button

ButtonProvider

Stuck on AcceleratorKeyProperty

[CheckBox](http://msdn.microsoft.com/en-us/library/system.windows.forms.CheckBox.aspx)

Done

CheckBox

CheckBoxProvider

[CheckedListBox](http://msdn.microsoft.com/en-us/library/system.windows.forms.CheckedListBox.aspx)

Done

List

ListBoxProvider

[ColorDialog](http://msdn.microsoft.com/en-us/library/system.windows.forms.ColorDialog.aspx)

Not Started

Window

 ?

[ColumnHeader](http://msdn.microsoft.com/en-us/library/system.windows.forms.ColumnHeader.aspx)

Not Started

Header

 ?

[ComboBox](http://msdn.microsoft.com/en-us/library/system.windows.forms.ComboBox.aspx)

95% (Mario)

ComboBox

ComboBoxProvider

Navigation: ScrollBar in internal ListBox.

[ContainerControl](http://msdn.microsoft.com/en-us/library/system.windows.forms.ContainerControl.aspx)

Not Started

 ?

 ?

[ContextMenu](http://msdn.microsoft.com/en-us/library/system.windows.forms.ContextMenu.aspx)

Not Started

 ?

 ?

[ContextMenuStrip](http://msdn.microsoft.com/en-us/library/system.windows.forms.ContextMenuStrip.aspx)

Not Started

 ?

 ?

[DataGrid](http://msdn.microsoft.com/en-us/library/system.windows.forms.DataGrid.aspx)

Not Started

[DataGrid](http://msdn.microsoft.com/en-us/library/ms743581.aspx) or Table

 ?

[DataGridBoolColumn](http://msdn.microsoft.com/en-us/library/system.windows.forms.DataGridBoolColumn.aspx)

Not Started

Custom

 ?

[DataGridTextBoxColumn](http://msdn.microsoft.com/en-us/library/system.windows.forms.DataGridTextBoxColumn.aspx)

Not Started

Custom

 ?

[DataGridView](http://msdn.microsoft.com/en-us/library/system.windows.forms.DataGridView.aspx)

Not Started

Table

 ?

[DateTimePicker](http://msdn.microsoft.com/en-us/library/system.windows.forms.DateTimePicker.aspx)

Not Started

Pane+

 ?

[DomainUpDown](http://msdn.microsoft.com/en-us/library/system.windows.forms.DomainUpDown.aspx)

Not Started

Spinner

 ?

[ErrorProvider](http://msdn.microsoft.com/en-us/library/system.windows.forms.ErrorProvider.aspx)

In Progress 95% (Mario)

Pane

ErrorProvider

Stuck on AccessKeyProperty. Missing Tests

[FileDialog](http://msdn.microsoft.com/en-us/library/system.windows.forms.FileDialog.aspx)

Not Started

Window

 ?

[FlowLayoutPanel](http://msdn.microsoft.com/en-us/library/system.windows.forms.FlowLayoutPanel.aspx)

Not Started

Pane

 ?

[FontDialog](http://msdn.microsoft.com/en-us/library/system.windows.forms.FontDialog.aspx)

In Progress (Neville)

Window

FontDialogProvider

[Form](http://msdn.microsoft.com/en-us/library/system.windows.forms.Form.aspx)

Done

Window

WindowProvider

[GroupBox](http://msdn.microsoft.com/en-us/library/system.windows.forms.GroupBox.aspx)

Done

Group

GroupProvider

[HelpProvider](http://msdn.microsoft.com/en-us/library/system.windows.forms.HelpProvider.aspx)

In Progress 95% (Mario)

ToolTip

HelpProvider

Missing Provider Events

[HScrollBar](http://msdn.microsoft.com/en-us/library/system.windows.forms.HScrollBar.aspx)

Done

ScrollBar or Pane

ScrollBarProvider

ScrollBar Control Type was implemented. Pane is used when the ScrollBar isn't contained in a Scrollable control. Missing Provider Events

[Label](http://msdn.microsoft.com/en-us/library/system.windows.forms.Label.aspx)

Done

Text

LabelProvider

[LinkLabel](http://msdn.microsoft.com/en-us/library/system.windows.forms.LinkLabel.aspx)

Done

HyperLink

LinkLabelProvider

ListBox.ListItem and ComboBox.ListItem

Done

ListItem

ListItemProvider

Stuck on IsOffscreenProperty, BoundingRectangleProperty, ClickablePointProperty, ItemTypeProperty

[ListBox](http://msdn.microsoft.com/en-us/library/system.windows.forms.ListBox.aspx)

Done

List

ListBoxProvider

[ListView](http://msdn.microsoft.com/en-us/library/system.windows.forms.ListView.aspx)

Not Started

List

[MainMenu](http://msdn.microsoft.com/en-us/library/system.windows.forms.MainMenu.aspx)

Not Started

 ?

 ?

[MaskedTextBox](http://msdn.microsoft.com/en-us/library/system.windows.forms.MaskedTextBox.aspx)

85%

Edit

TextBoxProvider

[MenuItem](http://msdn.microsoft.com/en-us/library/system.windows.forms.MenuItem.aspx)

Not Started

 ?

 ?

[MenuStrip](http://msdn.microsoft.com/en-us/library/system.windows.forms.MenuStrip.aspx)

In Progress (Sandy)

MenuBar

MenuStripProvider

[MonthCalendar](http://msdn.microsoft.com/en-us/library/system.windows.forms.MonthCalendar.aspx)

Not Started

Pane?

 ?

[NotifyIcon](http://msdn.microsoft.com/en-us/library/system.windows.forms.NotifyIcon.aspx)

Not Started

Button

 ?

[NumericUpDown](http://msdn.microsoft.com/en-us/library/system.windows.forms.NumericUpDown.aspx)

95% (Sandy)

Spinner

NumericUpDownProvider

Still testing

[Panel](http://msdn.microsoft.com/en-us/library/system.windows.forms.Panel.aspx)

Not Started

Pane

 ?

[OpenFileDialog](http://msdn.microsoft.com/en-us/library/system.windows.forms.OpenFileDialog.aspx)

Not Started

Window

 ?

[PageSetupDialog](http://msdn.microsoft.com/en-us/library/system.windows.forms.PageSetupDialog.aspx)

Not Started

Window

 ?

[PictureBox](http://msdn.microsoft.com/en-us/library/system.windows.forms.PictureBox.aspx)

Done

Pane

PictureBoxProvider

[PrintPreviewControl](http://msdn.microsoft.com/en-us/library/system.windows.forms.PrintPreviewControl.aspx)

Not Started

Pane+

 ?

[PrintPreviewDialog](http://msdn.microsoft.com/en-us/library/system.windows.forms.PrintPreviewDialog.aspx)

Not Started

Window

 ?

[ProgressBar](http://msdn.microsoft.com/en-us/library/system.windows.forms.ProgressBar.aspx)

Done

ProgressBar

ProgressBarProvider

[PropertyGrid](http://msdn.microsoft.com/en-us/library/system.windows.forms.PropertyGrid.aspx)

Not Started

Pane+

 ?

[RadioButton](http://msdn.microsoft.com/en-us/library/system.windows.forms.RadioButton.aspx)

Done

RadioButton

RadioButtonProvider

[RichTextBox](http://msdn.microsoft.com/en-us/library/system.windows.forms.RichTextBox.aspx)

50%

Document

TextBoxProvider

[SaveFileDialog](http://msdn.microsoft.com/en-us/library/system.windows.forms.SaveFileDialog.aspx)

Not Started

Window

 ?

[ScrollableControl](http://msdn.microsoft.com/en-us/library/system.windows.forms.ScrollableControl.aspx)

Not Started

 ?

 ?

[ScrollBar](http://msdn.microsoft.com/en-us/library/system.windows.forms.ScrollBar.aspx)

Done

ScrollBar or Pane

ScrollBarProvider

ScrollBar Control Type was implemented. Pane is used when the ScrollBar isn't contained in a Scrollable control. Missing Provider Events

[SplitContainer](http://msdn.microsoft.com/en-us/library/system.windows.forms.SplitContainer.aspx)

Not Started

Pane

 ?

[Splitter](http://msdn.microsoft.com/en-us/library/system.windows.forms.Splitter.aspx)

Not Started

Pane

 ?

[StatusBar](http://msdn.microsoft.com/en-us/library/system.windows.forms.StatusBar.aspx)

Done

StatusBar

StatusBarProvider

[StatusBarPanel](http://msdn.microsoft.com/en-us/library/system.windows.forms.StatusBarPanel.aspx)

Done

Edit

StatusBarProvider.StatusBarPanelProvider

[StatusStrip](http://msdn.microsoft.com/en-us/library/system.windows.forms.StatusStrip.aspx)

Not Started

StatusBar

 ?

[TabControl](http://msdn.microsoft.com/en-us/library/system.windows.forms.TabControl.aspx)

Not Started

Tab

 ?

[TableLayoutPanel](http://msdn.microsoft.com/en-us/library/system.windows.forms.TableLayoutPanel.aspx)

Not Started

Pane

 ?

[TabPage](http://msdn.microsoft.com/en-us/library/system.windows.forms.TabPage.aspx)

Not Started

TabItem

 ?

[TextBox](http://msdn.microsoft.com/en-us/library/system.windows.forms.TextBox.aspx)

85%

Edit or Document

TextBoxProvider

Missing: Document Control Pattern, full implementation of Edit Control Pattern.

[ThreadExceptionDialog](http://msdn.microsoft.com/en-us/library/system.windows.forms.ThreadExceptionDialog.aspx)

Not Started

Window

 ?

[ToolBar](http://msdn.microsoft.com/en-us/library/system.windows.forms.ToolBar.aspx)

Not Started

ToolBar

 ?

[ToolBarButton](http://msdn.microsoft.com/en-us/library/system.windows.forms.ToolBarButton.aspx)

Not Started

Button

 ?

[ToolStrip](http://msdn.microsoft.com/en-us/library/system.windows.forms.ToolStrip.aspx)

Not Started

ToolBar

 ?

[ToolStripMenuItem](http://msdn.microsoft.com/en-us/library/system.windows.forms.ToolStripMenuItem.aspx)

In Progress (Sandy)

MenuItem

[ToolStripComboBox](http://msdn.microsoft.com/en-us/library/system.windows.forms.ToolStripComboBox.aspx)

Not Started

ComboBox

ComboBoxProvider?

[ToolStripDropDownButton](http://msdn.microsoft.com/en-us/library/system.windows.forms.ToolStripDropDownButton.aspx)

Not Started

MenuItem

 ?

[ToolStripLabel](http://msdn.microsoft.com/en-us/library/system.windows.forms.ToolStripLabel.aspx)

Not Started

Text

 ?

[ToolStripProgressBar](http://msdn.microsoft.com/en-us/library/system.windows.forms.ToolStripProgressBar.aspx)

Not Started

ProgressBar

 ?

[ToolStripSeparator](http://msdn.microsoft.com/en-us/library/system.windows.forms.ToolStripSeparator.aspx)

Not Started

Separator

 ?

[ToolStripSplitButton](http://msdn.microsoft.com/en-us/library/system.windows.forms.ToolStripSplitButton.aspx)

Not Started

Button, Menu

 ?

[ToolStripTextBox](http://msdn.microsoft.com/en-us/library/system.windows.forms.ToolStripTextBox.aspx)

Not Started

Edit

 ?

[ToolTip](http://msdn.microsoft.com/en-us/library/system.windows.forms.ToolTip.aspx)

Done

ToolTip

ToolTipProvider

[TrackBar](http://msdn.microsoft.com/en-us/library/system.windows.forms.TrackBar.aspx)

Not Started

Slider

 ?

[TreeView](http://msdn.microsoft.com/en-us/library/system.windows.forms.TreeView.aspx)

Not Started

Tree

 ?

[VScrollBar](http://msdn.microsoft.com/en-us/library/system.windows.forms.VScrollBar.aspx)

Done

ScrollBar or Pane

ScrollBarProvider

ScrollBar Control Type was implemented. Pane is used when the ScrollBar isn't contained in a Scrollable control. Missing Provider Events

[WebBrowser](http://msdn.microsoft.com/en-us/library/system.windows.forms.WebBrowser.aspx)

Not Started

Pane+++

C

