---
layout: obsolete
title: "Accessibility: Bridge Functional Specification"
permalink: /old_site/Accessibility:_Bridge_Functional_Specification/
redirect_from:
  - /Accessibility:_Bridge_Functional_Specification/
  - /Accessibility:_Functional_Specification/
---

Accessibility: Bridge Functional Specification
==============================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#functional-specification">1 Functional Specification</a>
<ul>
<li><a href="#functionality">1.1 Functionality</a></li>
<li><a href="#ideas">1.2 Ideas</a></li>
<li><a href="#notes">1.3 Notes</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Functional Specification
========================

This document is intended to be a functional description of how System.Windows.Forms widgets are supposed to interact from a user perspective when viewed by Accerciser, or other AT-SPI Assistive Technologies.

Functionality
-------------

1.  Button
    1.  Acts As: Push Button
    2.  Similar To: GtkButton
    3.  Provides: AtkAccessible, AtkAction, AtkComponent, AtkImage, AtkText
    4.  Default State: Enabled, Focusable, Sensitive, Showing, Visible
    5.  Actions
        1.  Click: State =\> +Focused
            1.  Button Press: State =\> +Focused, +Armed
            2.  Button Release: State =\> -Armed

2.  CheckBox
    1.  Acts As: Check Box
    2.  Similar To: GtkCheckButton
    3.  Provides: AtkAccessible, AtkAction, AtkComponent, AtkImage, AtkText
    4.  Default State: Enabled, Focusable, Sensitive, Showing, Visible
    5.  Actions
        1.  Click: State =\> +Focused, +Checked
            1.  Button Press: State =\> +Focused
            2.  Button Release: State =\> +Checked

3.  CheckedListBox
    1.  Acts As: List
    2.  Similar To: GtkTreeView (List style)
    3.  Provides: AtkAccessible, AtkComponent, AtkSelection
    4.  Default State: Enabled, Focusable, Manages Descendants, Sensitive, Showing, Visible
    5.  Children
        1.  CheckBox
            1.  Acts As: Check Box
            2.  Provides: AtkAccessible, AtkAction, AtkComponent
            3.  Default State: Enabled, Focusable, Selectable, Sensitive, Showing, Transient, Visible
            4.  Actions: Toggle, Activate

    6.  (Inherits: GtkTreeView [List style])

4.  ColorDialog
    1.  Acts As: Color Chooser
    2.  Similar To: GtkColorSelDialog
    3.  Provides: AtkAccessible, AtkComponent
    4.  Default State: Enabled, Sensitive, Showing, Vertical, Visible
    5.  Actions: None

5.  ColumnHeader
    1.  Acts As: Table Column Header
    2.  Similar To: GtkTreeViewColumn
    3.  Provides: AtkAccessible, AtkAction, AtkComponent, AtkImage, AtkText
    4.  Default State: Enabled, Focusable, Selectable, Sensitive, Showing, Visible
    5.  Actions
        1.  Click: State =\> +Focused, +Armed, visible-data-changed, -Armed

6.  ComboBox
    1.  Simple
        1.  Acts As: Tree Table
        2.  Similar To: GtkTreeView (List style)
        3.  Provides: AtkAccessible, AtkComponent, AtkSelection
        4.  Actions:
            1.  Click

        5.  Default State: Enabled, Focusable, ManagesDescendants, Sensitive, Showing, Visible
        6.  Children: option\_0, option\_1 (all roles: table cell)

    2.  DropDown
        1.  Acts As: Combo Box
        2.  Similar To: GtkComboBoxEntry
        3.  Provides: AtkAccessible, AtkAction, AtkComponent, AtkSelection
        4.  Default State: Enabled, Sensitive, Showing, Visible
        5.  Actions
            1.  Anything that changes the selection (key press, mouse press, release...): selection-changed, active-descendant-changed(n, 0, [table\_cell\_obj) (where n is the pos + 1)

    3.  DropDownList
        1.  Acts As: Combo Box
        2.  Similar To: GtkComboBox
        3.  Provides: AtkAccessible, AtkAction, AtkComponent, AtkSelection
        4.  Default State: Enabled, Sensitive, Showing, Visible
        5.  Actions
            1.  Button Press: State =\> +Focused
            2.  Button Release: selection-changed, State =\> +Focused
            3.  Key Down: selection-changed

7.  ContainerControl
    1.  Acts As: Panel
    2.  Similar To: GtkLayout
    3.  Provides: AtkAccessible, AtkComponent
    4.  Default State: Enabled, Focusable, Sensitive, Showing, Visible
    5.  Actions: None

8.  ContextMenu (deprecated; new: ContextMenuStrip)
    1.  Acts As: Menu Bar
    2.  Similar To: GtkMenuBar?
    3.  Provides: (Inherits: MenuStrip)
    4.  Default State: (Inherits: MenuStrip)
    5.  Actions: (Inherits: MenuStrip)

9.  ContextMenuStrip
    1.  (Inherits: ContextMenu)

10. DataGrid (deprecated; new: DataGridView)
    1.  (Inherits: DataGridView)

11. DataGridBoolColumn
    1.  Acts As: Table Cell
    2.  Similar To: GtkCellRendererToggle
    3.  Provides: AtkAccessible, AtkAction, AtkComponent
    4.  Default State: Enabled, Focusable, Manages Descendants, Sensitive, Showing, Visible
    5.  Default Actions: Toggle, Activate
    6.  Actions
        1.  Toggled: state-changed:checked, state-changed:selected

12. DataGridTextBoxColumn
    1.  Acts As: Table Cell
    2.  Similar To: GtkCellRendererText
    3.  Provides: AtkAccessible, AtkAction, AtkComponent, AtkText
    4.  Default State: Active, Enabled, Focusable, Selectable, Selected, Sensitive, Showing, Single Line, Transient, Visible
    5.  Actions
        1.  Edit text: text-changed:delete, property-change:accessible-name, text-changed:insert, property-change:accessible-name

13. DataGridView
    1.  Acts As: Tree Table
    2.  Similar To: GtkTreeView
    3.  Default State: Enabled, Focusable, Sensitive, Showing, Visible
    4.  Actions
        1.  (Inherits: ListView)

14. DateTimePicker
    1.  Acts As: Calendar
    2.  Similar To: GtkCalendar
    3.  Default State: Enabled, Focusable, Sensitive, Showing, Visible
    4.  Actions: None
    5.  Note: GtkCalendar is not currently accessible.

15. DomainUpDown
    1.  Acts As: Spin Button
    2.  Similar To: GtkTreeView (List style)
    3.  Provides: AtkAccessible, AtkComponent, AtkText, AtkEditableText, AtkSelection
    4.  Default State: Editable, Enabled, Focusable, Sensitive, Showing, Single Line, Visible, Manages Descendants
    5.  Actions:
        1.  Item Click: selection-changed

16. ErrorProvider
    1.  Acts As: Panel
    2.  Similar To: N/A
    3.  Provides: AtkAccessible, AtkComponent
    4.  Note: This provider most likely shouldn't be exported, as it does nothing visibly.

17. FileDialog
    1.  Acts As: Dialog
    2.  Similar To: GtkFileChooser
    3.  Provides: AtkAccessible, AtkComponent
    4.  Default State: Enabled, Resizable, Sensitive, Showing, Visible
    5.  Actions: None

18. FlowLayoutPanel
    1.  Acts As: Panel
    2.  Similar To: GtkTable
    3.  Provides: AtkAccessible, AtkComponent
    4.  Default State: Enabled, Sensitive, Showing, Visible
    5.  Actions: None

19. FontDialog
    1.  Acts As: Font Chooser
    2.  Similar To: GtkFontSelectionDialog
    3.  Provides: AtkAccessible, AtkComponent
    4.  Default State: Enabled, Resizable, Sensitive, Showing, Visible
    5.  Actions: None

20. Form
    1.  Acts As: Frame
    2.  Similar To: GtkWindow
    3.  Provides: AtkAccessible, AtkComponent
    4.  Default State: Enabled, Resizable, Sensitive, Showing, Visible
    5.  Actions: None

21. GroupBox
    1.  Acts As: Panel
    2.  Similar To: GtkFrame
    3.  Provides: AtkAccessible, AtkComponent
    4.  Default State: Enabled, Sensitive, Showing, Visible
    5.  Actions: None

22. HelpProvider
    1.  NOTE: It's not fully implemented in Mono. See [note 1]({{site.github.url}}/old_site/Accessibility:_Bridge_Functional_Specification).

23. HScrollBar
    1.  Acts As: Scroll Bar
    2.  Similar To: GtkHScrollBar
    3.  Provides: AtkAccessible, AtkAction, AtkComponent, AtkValue
    4.  Default State: Enabled, Sensitive, Showing, Visible, Horizontal
    5.  Actions
        1.  Move scrollbar: property-change:accessible-value

24. Label
    1.  Acts As: Label
    2.  Similar To: GtkLabel
    3.  Provides: AtkAccessible, AtkComponent, AtkText
    4.  Default State: Enabled, Multi Line, Sensitive, Showing, Visible
    5.  Actions: None

25. LinkLabel
    1.  Acts As: Label
    2.  Similar To: GtkLabel
    3.  Provides: AtkAccessible, AtkComponent, AtkText, AtkHypertext, AtkAction
    4.  Default State: Enabled, Multi Line, Sensitive, Showing, Visible

26. ListBox
    1.  Acts As: List
    2.  Similar To: GtkTreeView (List style)
    3.  Provides: AtkAccessible, AtkComponent, AtkSelection
    4.  Default State: Enabled, Focusable, Manages Descendants, Sensitive, Showing, Visible
    5.  Children
        1.  Text
            1.  Acts As: List Item
            2.  Provides: AtkAccessible, AtkAction AtkComponent, AtkText
            3.  Actions: Activate

27. ListView
    1.  Acts As: Tree Table
    2.  Similar To: GtkTreeView (List style)
    3.  Provides: AtkAccessible, AtkComponent, AtkSelection, AtkTable
    4.  Default State: Enabled, Focusable, Manages Descendants, Sensitive, Showing, Visible
    5.  Children: column\_0 (role: table column header), cell\_0\_in\_column\_0 (role: table cell), cell\_1\_in\_column\_0, ..., column\_1, cell\_0\_in\_column\_1, ...
    6.  Actions:
        1.  Click on column header to cause row reordering: object:row-reordered, object:visible-data-changed

28. MainMenu (deprecated; new: MenuStrip)
    1.  Acts As: Menu Bar
    2.  Similar To: GtkMenuBar
    3.  Provides: AtkAccessible, AtkComponent, AtkSelection
    4.  Default State: Enabled, Sensitive, Showing, Visible
    5.  Actions: None

29. MaskedTextBox
    1.  (Inherits: TextBox)

30. MenuItem (deprecated; new: ToolStripMenuItem)
    1.  Acts As: Menu Item
    2.  Similar To: GtkMenuItem
    3.  Provides: AtkAccessible, AtkComponent, AtkAction, AtkText, AtkSelection
    4.  Default State: Enabled, Selectable, Sensitive, Showing, Visible
    5.  Actions:
        1.  Click/Enter(Activate) if child: +Focused, +Selected
        2.  Click/Enter(Activate) if parent: +Selected
        3.  KeyUp/Down to receive focus if child, or KeyLeft/Right to receive focus if parent: +Selected, +Focused
        4.  KeyUp/Down to leave focus: +Focused, -Selected
        5.  KeyX to select a child: selection-changed

31. MenuStrip
    1.  Acts As: Menu Bar
    2.  Similar To: GtkMenuBar
    3.  Provides: (Inherits: MainMenu)
    4.  Actions: (Inherits: MainMenu)

32. MonthCalendar
    1.  Acts As: Calendar
    2.  Similar To: GtkCalendar
    3.  Default State: Enabled, Focusable, Sensitive, Showing, Visible
    4.  Actions: None
    5.  Note: GtkCalendar is not currently accessible.

33. NotifyIcon
    1.  Note: Notification icons are not currently accessible, although work is on-going.

34. NumericUpDown
    1.  Acts As: Spin Button
    2.  Similar To: GtkSpinButton
    3.  Provides: AtkAccessible, AtkAction, AtkComponent, AtkText, AtkValue
    4.  Default State: Editable, Enabled, Focusable, Sensitive, Showing, Single Line, Visible
    5.  Actions
        1.  Press Up/Down Button: text-changed:delete, property-change:accessible-value, text-changed:insert

35. Panel
    1.  Acts As: Panel
    2.  Simila To: GtkContainer
    3.  Provides: AtkAccessible, AtkComponent
    4.  Default State: Enabled, Sensitive, Showing, Visible
    5.  Actions: None

36. OpenFileDialog
    1.  (Inherits: FileDialog)

37. PageSetupDialog
    1.  Acts As: Dialog
    2.  Similar To: GtkPageSetup
    3.  Provides: AtkAccessible, AtkComponent
    4.  Default State: Enabled, Modal, Sensitive, Showing, Visible
    5.  Actions: None

38. PictureBox
    1.  Acts As: Icon
    2.  Similar To: GtkImage
    3.  Provides: AtkAccessible, AtkComponent, AtkImage
    4.  Default State: Enabled, Sensitive, Showing, Visible
    5.  Actions: None

39. PrintPreviewControl
    1.  **TODO:** Research required, as Gtk+ doesn't currently provide accessible implementations of the Print Preview widget.

40. PrintPreviewDialog
    1.  **TODO:** Research required, as Gtk+ doesn't currently provide accessible implementations of the Print Preview widget.

41. ProgressBar
    1.  Acts As: Progress Bar
    2.  Similar To: GtkProgressBar
    3.  Provides: AtkAccessible, AtkComponent, AtkValue, AtkText
    4.  Default State: Enabled, Sensitive, Showing, Visible
    5.  Actions: None

42. PropertyGrid
    1.  (Inherits: TreeView)

43. RadioButton
    1.  Acts As: Radio Button
    2.  Similar To: GtkRadioButton
    3.  Provides: AtkAccessible, AtkAction, AtkComponent, AtkText, AtkImage
    4.  Default State: Armed, Checked, Enabled, Focusable, Sensitive, Showing, Visible
    5.  Actions
        1.  Option clicked: State =\> +Focused, +Checked (other RadioButton if previously checked: -Checked)

44. RichTextBox
    1.  Acts As: Text
    2.  Similar To: GtkTextView
    3.  Provides: AtkAccessible, AtkComponent, AtkStreamableContent, AtkText, AtkEditableText
    4.  Default State: Editable, Enabled, Focusable, Multi-Line, Sensitive, Showing, Visible
    5.  Actions
        1.  (Inherits: TextBox)

45. SaveFileDialog
    1.  (Inherits: FileDialog)

46. ScrollableControl
    1.  (Inherits: ScrollBar)

47. ScrollBar
    1.  Acts As: Scroll Bar
    2.  Similar To: GtkScrollBar
    3.  Provides: AtkAccessible, AtkAction, AtkComponent, AtkValue
    4.  Default State: Enabled, Focusable, Sensitive, Showing, Visible
    5.  Actions
        1.  Move scrollbar: property-change:accessible-value

48. Spinner
    1.  Acts As: Spin Button
    2.  Similar To: GtkSpinButton
    3.  Provides: AtkAccessible, AtkComponent, AtkValue, AtkAction, AtkText, AtkEditableText
    4.  Default State: Editable, Enabled, Focusable, Sensitive, Showing, Single Line, Visible
    5.  Actions:
        1.  Click (on arrow): property-change:accessible-value
        2.  (Inherits: TextBox)

49. SplitContainer
    1.  Acts As: Split Pane
    2.  Similar To: GtkHPaned (or GtkVPaned, depending on Orientation property)
    3.  Provides: AtkAccessible, AtkComponent, AtkValue
    4.  Default State: Enabled, Focusable, Sensitive, Showing, Vertical?, Visible
    5.  Actions
        1.  Move pane: property-changed:accessible-value

50. Splitter
    1.  Acts As: Split Pane
    2.  Similar To: GtkHPaned (or GtkVPaned, depending on DockStyle property)
    3.  Provides: AtkAccessible, AtkComponent, AtkValue
    4.  Default State: Enabled, Focusable, Sensitive, Showing, Horizontal or Vertical (depending on orientation), Visible
    5.  Actions
        1.  Move pane: property-changed:accessible-value

51. StatusBar
    1.  Acts As: Statusbar
    2.  Similar To: GtkStatusbar
    3.  Provides: AtkAccessible, AtkComponent, AtkText
    4.  Default State: Enabled, Sensitive, Showing, Visible
    5.  Actions: None

52. StatusBarPanel
    1.  Acts As: Label
    2.  Similar To: GtkBin (?)
    3.  Provides: AtkAccessible, AtkComponent
    4.  Default State: Enabled, Sensitive, Showing, Visible
    5.  Actions: None

53. StatusStrip
    1.  Acts As: Statusbar
    2.  Similar To: GtkStatusbar
    3.  Provides: AtkAccessible, AtkComponent, AtkText
    4.  Default State: Enabled, Sensitive, Showing, Visible
    5.  Actions: None

54. TabControl
    1.  Acts As: Page Tab List
    2.  Similar To: GtkNotebook
    3.  Provides: AtkAccessible, AtkComponent, AtkSelection
    4.  Default State: Enabled, Focusable, Sensitive, Showing, Visible
    5.  Actions
        1.  Change tab: selection-changed, visibile-data-changed

55. TableLayoutPanel
    1.  Acts As: Panel
    2.  Similar To: GtkTable
    3.  Provides: AtkAccessible, AtkComponent
    4.  Default State: Enabled, Sensitive, Showing, Visible
    5.  Actions: None

56. TabPage
    1.  Acts As: Page Tab
    2.  Similar To: GtkNotebookPage
    3.  Provides: AtkAccessible, AtkComponent, AtkText
    4.  Default State: Enabled, Multi Line, Selectable, Sensitive, Showing, Visible, Selected (if currently selected tab)
    5.  Actions: None

57. TextBox
    1.  Acts As: Text
    2.  Similar To: GtkTextView
    3.  Provides: AtkAccessible, AtkComponent, AtkStreamableContent, AtkText, AtkEditableText
    4.  Default State: Editable, Enabled, Focusable, Multi-Line or Single-Line (depending on Document or Edit control type), Sensitive, Showing, Visible
    5.  Actions
        1.  Click: State =\> +Focused, text-caret-moved
        2.  Move cursor: text-caret-moved
        3.  Insert a character: text-changed:insert, text-caret-moved
        4.  Select a character: text-caret-moved, text-selection-changed
        5.  Delete a character: text-changed:delete, text-caret-moved
        6.  Drag and drop a character: text-changed:insert, text-changed:delete, text-caret-moved

58. ThreadExceptionDialog
    1.  Acts As: Dialog
    2.  Similar To: None
    3.  Provides: AtkAccessible, AtkComponent
    4.  Default State: Enabled, Modal, Sensitive, Showing, Visible
    5.  Actions: None

59. ToolBar
    1.  Acts As: Tool Bar
    2.  Similar To: GtkToolbar
    3.  Provides: AtkAccessible, AtkComponent
    4.  Default State: Enabled, Sensitive, Showing, Visible
    5.  Actions: None

60. ToolBarButton
    1.  Acts As: Panel with Push Button child
    2.  Similar To: GtkToolbarButton
    3.  Provides: AtkAccessible, AtkAction, AtkComponent, AtkImage, AtkText
    4.  Default State: Enabled, Focusable, Sensitive, Showing, Visible
    5.  Actions
        1.  Button Press: State =\> +Focused, +Armed
        2.  Button Release: State =\> -Armed

61. ToolStrip
    1.  Acts As: Tool Bar
    2.  Similar To: GtkToolbar
    3.  Provides: AtkAccessible, AtkComponent
    4.  Default State: Enabled, Sensitive, Showing, Visible
    5.  Actions: None

62. ToolStripMenuItem
    1.  Acts As: Menu
    2.  Similar To: GtkImageMenuItem
    3.  (Inherits: MenuItem)

63. ToolStripComboBox
    1.  Acts As: Combo Box
    2.  Provides: AtkAccessible, AtkAction, AtkComponent, AtkSelection
    3.  Default State: (Inherits: ComboBox)
    4.  Actions
        1.  (Inherits: ComboBox)

64. ToolStripDropDownButton
    1.  Acts As: Menu
    2.  Provides: AtkAccessible, AtkComponent, AtkAction, AtkText, AtkSelection
    3.  Default State: Enabled, Selectable, Sensitive, Showing, Visible
    4.  Actions
        1.  (Inherits: MenuItem)

    5.  Notes:
        1.  Does not have Focusable or Focused state if it is a direct descendant of a ToolStrip.

65. ToolStripLabel
    1.  Acts As: Label
    2.  Provides: AtkAccessible, AtkComponent, AtkText
    3.  Default State: Enabled, Multi Line, Sensitive, Showing, Visible
    4.  Actions: None

66. ToolStripProgressBar
    1.  Acts As: ProgressBar
    2.  Provides: AtkAccessible, AtkComponent, AtkValue
    3.  Default State: Enabled, Sensitive, Showing, Visible
    4.  Action
        1.  (Inherits: ProgressBar)

67. ToolStripSeparator
    1.  Acts As: Separator
    2.  Similar To: SeparatorMenuItem
    3.  Provides: AtkAccessible, AtkComponent
    4.  Default State: Enable, Sensitive, Showing, Visible
    5.  Actions: None

68. ToolStripSplitButton
    1.  A panel with two buttons: a regular Button with a Toggle Button beside it. The children of the Toggle Button should be MenuItems and it should act similarly to ToolStripDropDownButton.

69. ToolStripTextBox
    1.  Acts As: TextBox
    2.  (Inherits: TextBox)

70. ToolTip
    1.  Acts As: Tool Tip
    2.  Similar To: GtkTooltip
    3.  (Inherits: Window)

71. TrackBar
    1.  Acts As: Slider
    2.  Similar To: GtkHScale (or GtkVScale, depending on Orientation property)
    3.  Provides: AtkAccessible, AtkAction, AtkComponent, AtkText, AtkValue
    4.  Actions
        1.  Move slider: text-changed:delete, text-changed:insert, property-change:accessible-value

72. TreeView
    1.  (Inherits: ListView)
    2.  Note: it should have a difference wrt ListView: cells that are below a parent cell should be children in the hierarchy, **however**, even the GtkTreeview in accerciser doesn't show this layout.
    3.  Actions (apart from ListView's ones):
        1.  Click on [+] to open a subtree: object:bounds-changed, object:visible-data-changed, object:active-descendant-changed, object:row-inserted

73. VScrollBar
    1.  Acts As: Scroll Bar
    2.  Similar To: GtkVScrollBar
    3.  Provides: AtkAccessible, AtkAction, AtkComponent, AtkValue
    4.  Default State: Enabled, Sensitive, Showing, Visible, Vertical
    5.  Actions
        1.  Move scrollbar: property-change:accessible-value

74. **TODO:** WebBrowser (comments on the discussion page)

Ideas
-----

1.  Another thing that would be useful for QA is to know what the "default" states are for each control and each style of control if applicable. Maybe there are a few states that are common to all default controls? e.g., Visible, Enabled? Not sure on this one. -bgmerrell

Notes
-----

1.  HelpProvider. Current implementation in mono supports HelpProvider, however the "?" button isn't shown in the titlebar, there's an explanation in [Bug 412849](https://bugzilla.novell.com/show_bug.cgi?id=412849) and the [working example](http://forge.novell.com/mailman/private/mono-a11y/2008-September/000100.html) to fake "?" button if you want to test the implementation in mono.


