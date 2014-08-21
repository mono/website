---
title: "Accessibility: Client API Functional Specification"
lastmodified: '2009-09-10'
redirect_from:
  - /Accessibility:_Client_API_Functional_Specification/
---

Accessibility: Client API Functional Specification
==================================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#uia-client-api-functional-specification">1 UIA Client API Functional Specification</a>
<ul>
<li><a href="#approach">1.1 Approach</a></li>
<li><a href="#winforms-apps">1.2 Winforms Apps</a></li>
<li><a href="#silverlight-apps">1.3 Silverlight Apps</a></li>
<li><a href="#linux-apps-via-at-spi">1.4 Linux Apps (via at-spi)</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

UIA Client API Functional Specification
=======================================

Approach
--------

Since developers are directly unit testing the implementation of the UIA Client API for Winforms, GTK+, and Silverlight applications, the focus for QA will be a little different.

QA for the Client API will focus on "real world" usage of the API. A typical company writing a user application might want to created automated UI tests using (surprise) UI Automation. So we will pick existing real world applications, and perform QA for those applications by writing tests of their functionality using the UIA Client API.

For Winforms and Silverlight applications, we can write these tests first in Windows. In a sense, these tests will represent specifications for each application. Then, when we run the tests on Linux, we will be verifying everything from our implementation of the UIA Client API, to the application, to the UI framework, to Mono itself.

In the end, these tests should be very helpful to many other projects. This could be especially important for Moonlight, which is currently in very active development.

Of course, if we need to create sample applications to test controls/widgets that just are not available in any practical real world applications, that is okay.

Winforms Apps
-------------

This is a basic mapping between winforms controls and UIA ControlTypes, pattern support, etc: [http://monouia.wik.is/Provider\_Functional\_Specification](http://monouia.wik.is/Provider_Functional_Specification)

We should verify that this is up-to-date, and add more detail about the scenarios that lead to various AutomationPatterns being supported.

KeePass, Paint.NET, and NClass might be some good applications to look at first.

Silverlight Apps
----------------

See [Accessibility:\_Moonlight\_Bridge\_Functional\_Specification](/Accessibility:_Moonlight_Bridge_Functional_Specification "Accessibility: Moonlight Bridge Functional Specification") for a mapping between Silverlight controls, ControlTypes, and supported AutomationPatterns.

Linux Apps (via at-spi)
-----------------------

This is intended to be as close as possible to a reverse of the [Accessibility:\_Bridge\_Functional\_Specification](/Accessibility:_Bridge_Functional_Specification "Accessibility: Bridge Functional Specification"). However, there is not a one-to-one mapping between at-spi roles and UIA control types. It is possible that, as we write real world application tests, we will find ways that this mapping could be improved, so this specification is a work in progress.

Note that for Linux apps, we should still take the approach of writing QA tests for real world applications. GTK\#-based applications might even welcome such tests upstream, so starting with applications like Banshee, Tomboy, and F-Spot might be the best approach.

-   Role: AccelLabel
    -   Control type: Text
-   Role: Alert
    -   Control type: Window
-   Role: Animation
    -   Control type: Image
    -   Patterns: Image
-   Role: Arrow
    -   Control type: Custom?
-   Role: Calendar
    -   Control type: Calendar
-   Role: Canvas
    -   Control type: Custom?
-   Role: CheckBox
    -   Control type: CheckBox
    -   Patterns: Toggle
-   Role: CheckMenuItem
    -   Control type: MenuItem
    -   Patterns: Toggle
-   Role: ColorChooser
    -   Control type: Window
-   Role: ColumnHeader
    -   Control type: Text
-   Role: ComboBox
    -   Control type: ComboBox
    -   Patterns: Selection
-   Role: DateEditor
    -   Control type: Custom?
-   Role: DesktopIcon
    -   Control type: Custom?
-   Role: DesktopFrame
    -   Control type: Frame
-   Role: Dial
    -   Control type: Slider
    -   Patterns: RangeValue
-   Role: Dialog
    -   Control type: Window
-   Role: DirectoryPane
    -   Control type: List?
-   Role: DrawingArea
    -   Control type: Dialog
-   Role: FileChooser
    -   Control type: Custom?
-   Role: Filler
    -   Control type: Group (TODO: Should this be Panel?)
-   Role: FocusTraversable
    -   Control type: Custom?
-   Role: FontChooser
    -   Control type: Custom?
-   Role: Frame
    -   Control type: Window
-   Role: GlassPane
    -   Control type: Pane
-   Role: HtmlContainer
    -   Control type: Custom?
-   Role: Icon
    -   Control type: Image
    -   Patterns: Image
-   Role: Image
    -   Control type: Image
    -   Patterns: Image
-   Role: InternalFrame
    -   Control type: Window
-   Role: Label
    -   Control type: Text
-   Role: LayeredPane
    -   Control type: Pane
-   Role: List
    -   Control type: List
    -   Patterns: Selection
-   Role: ListItem
    -   Control type: ListItem
    -   Patterns: SelectionItem
-   Role: Menu
    -   Control type: menu
-   Role: MenuBar
    -   Control type: MenuBar
-   Role: MenuItem
    -   Control type: MenuItem
    -   Patterns: Invoke
-   Role: OptionPane
    -   Control type: Custom?
-   Role: PageTab
    -   Control type: TabItem
    -   Patterns: SelectionItem
-   Role: PageTabList
    -   Control type: Tab
    -   Patterns: Selection
-   Role: Panel
    -   Control type: Pane
-   Role: PasswordText
    -   Control type: Edit
    -   Properties: IsPassword == true
-   Role: PopupMenu
    -   Control type: Custom?
-   Role: ProgressBar
    -   Control type: ProgressBar
-   Role: PushButton
    -   Control type: Button
    -   Patterns: Invoke
-   Role: RadioButton
    -   Control type: RadioButton
    -   Patterns: Selection, SelectionItem
-   Role: RadioMenuItem
    -   Control type: Custom?
-   Role: RootPane
    -   Control type: Custom?
-   Role: RowHeader
    -   Control type: Custom?
-   Role: ScrollBar
    -   Control type: ScrollBar
    -   Patterns: RangeValue
    -   Children: Up button, down button
-   Role: ScrollPane
    -   Control type: Custom?
-   Role: Separator
    -   Control type: Separator
-   Role: Slider
    -   Patterns: RangeValue
    -   Control type: Slider
-   Role: SpinButton
    -   Control type: SpinButton
    -   Control type: Slider
-   Role: SplitPane
    -   Control type: Pane
-   Role: Statusbar
    -   Control type: StatusBar
-   Role: Table
    -   Control type: Table
    -   Patterns: Grid, Table
-   Role: TableCell
    -   Control type: Dataitem if Parent is ControlType.Table, otherwise TreeItem
    -   Patterns: GridItem, ExpandCollapse, TableItem, SelectionItem (TODO: Should we expose GridItem and TableItem if parent is a Tree? The UIA spec doesn't say anything about a Tree exposing Grid/table patterns.)
-   Role: TableColumnHeader
    -   Control type: HeaderItem
    -   Parent: Header (all headers should be HeaderItems under a common Header control)
    -   Children: Text
-   Role: TableRowHeader
    -   Control type: HeaderItem
    -   Parent: Header (all headers should be HeaderItems under a common Header control)
    -   Children: Text
-   Role: TearOffMenuItem
    -   Control type: Custom?
-   Role: Terminal
    -   Control type: Custom?
-   Role: Text
    -   Control type: Document if contains MultiLine state; otherwise Edit
    -   Patterns: Text if contains MultiLine state; otherwise Value
-   Role: ToggleButton
    -   Control type: Button
    -   Patterns: Invoke
-   Role: ToolBar
    -   Control type: ToolBar
-   Role: ToolTip
    -   Control type: ToolTip
-   Role: Tree
    -   Control type: Tree
    -   Patterns: Selection
-   Role: TreeTable
    -   Control type: Tree if one column; Table otherwise
    -   Patterns: Selection, Grid/Table? (see TODO on TableCell)
-   Role: Unknown
    -   Control type: Custom
-   Role: Viewport
    -   Control type: Pane
-   Role: Extended
    -   Control type: Custom
-   Role: Window
    -   Control type: Window
-   Role: Header
    -   Control type: Group (TODO: Is there a better mapping for this? This is a document header.)
-   Role: Footer
    -   Control type: Group (TODO: Same comment as with header)
-   Role: Paragraph
    -   Control type: Text
    -   Patterns: Text
-   Role: Ruler
    -   Control type: Custom?
-   Role: Application
    -   Shouldn't appear; its children are exposed as the application's root elements
-   Role: Autocomplete
    -   Control type: List?
-   Role: Editbar
    -   Control type: Edit
    -   Patterns: Value
-   Role: Embedded
    -   Control type: Group
-   Role: Entry
    -   Control type: Edit
-   Role: Chart
    -   Control type: Custom?
-   Role: Caption
    -   Control type: Text
-   Role: DocumentFrame
    -   Control type: Document
-   Role: Heading
    -   Control type: Custom?
-   Role: Page
    -   Control type: Group
-   Role: Section
    -   Control type: Group
-   Role: RedundantObject
    -   Ideally, these should not appear
-   Role: Form
    -   Control type: Custom?
-   Role: Link
    -   Control type: Hyperlink
-   Role: InputMethodWindow
    -   Control type: Custom?


