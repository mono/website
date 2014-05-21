---
layout: obsolete
title: "Accessibility: White%27s white list"
lastmodified: '2009-09-11'
permalink: /old_site/Accessibility:_White%27s_white_list/
redirect_from:
  - /Accessibility:_White%27s_white_list/
---

Accessibility: White%27s white list
===================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#whites-white-list">1 White's white list</a>
<ul>
<li><a href="#introduction">1.1 Introduction</a>
<ul>
<li><a href="#whats-white">1.1.1 What's White?</a></li>
<li><a href="#why-our-qas-need-white">1.1.2 Why our QAs need White?</a></li>
<li><a href="#whats-the-risk-for-writing-test-samples-with-white">1.1.3 What's the risk for writing test samples with White</a></li>
<li><a href="#whats-the-white-list-for-white">1.1.4 What's the white list for White</a></li>
</ul></li>
<li><a href="#whites-white-list_2">1.2 White's white list</a>
<ul>
<li><a href="#note">1.2.1 Note</a></li>
<li><a href="#list">1.2.2 List</a></li>
</ul></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

White's white list
==================

Introduction
------------

### What's White?

[White](http://www.codeplex.com/white/) is a UI automation library works on top of [UIAutomation framework](http://msdn.microsoft.com/en-us/library/ms747327.aspx) of .Net (and also mono in the future).

### Why our QAs need White?

In comparison with calling UIAutomation Client API directly, White provides functions to allow developers implement the same UI automation logic with much fewer LOC. Some notable examples of those provided functions are: Application class, SearchCriteria class and the concrete sub-classes of IUIItem for viarious controls. Our QAs can benefit from them when writing UIAutomation test samples.

### What's the risk for writing test samples with White

The White library used not only UIAutomation framework but also native system calls to implement its functions. However our QAs only need to verify the correctness of Mono UIAutomation implementation, so one risk for our QAs is that the functions they called to verify UIAutomation may internally not totally depend on UIAutomation, therefore the failure of such test may not always indicate a bug in Mono UIAutomation implementation, and on the other hand the pass of such test maybe irrelevant with any UIAutomation function at all.

### What's the white list for White

In "White's white list", some classes/members which totally rely on managed code and UIAutomation framework are listed. Test samples written with those White functions are supposed to be kept away from the risk mentioned in last section.

White's white list
------------------

### Note

-   All listed classes/methods are defined in "White.Core.dll".
-   For our QAs, they are safe to call normal list items
-   Only part of members of the *italic list items* are safe to be called, so please only call the functions represented by the item's normal sub-items.
-   Normal items followed by "\~" represent those functions which are safe to be called, while probably useless to our QAs.

### List

-   *Core namespace*
    -   Application class
    -   AutomationException class
    -   C class
    -   CacheMode enum
    -   Constants class
    -   Debug class
    -   *Desktop class*
        -   public virtual List\<Window\> Windows()
    -   Processes class
    -   VerticalSpan class
    -   WhiteAssertionException class
    -   WhiteException class
-   All types in Core.AutomationElementSearch namepsace
-   All types in Core.AutomationElementSearch.Properties namespace
-   All types in Core.Configuration namespace
-   All types in Core.Factory namespace
-   All types in Core.Logging namespace
-   All types in Core.ScreenMap namespace
-   All types in Core.Session namespace
-   All types in Core.UIA namespace
-   All types in Core.UIItemEvents namespace
    -   Though in the static ctor of many \*Event classes, native Win32 APIs are called, but they are just used to set the event name, and I don't think they will cause the risk mentioned in [\#What's the risk for writing test samples with White](#whats-the-risk-for-writing-test-samples-with-white)
-   All types in Core.UIItems.Finders namespace
-   All types in Core.UIItems.Actions namespace
-   All types in Core.UIItems.Container namespace
-   *Core.UIItems namespace*
    -   **You're safe to call HookEvent/UnHookEvents in all concrete classes of IUIItem**
    -   *CheckBox class*
        -   Checked.get
    -   DateFormat class\~
    -   DateUnit enum\~
    -   *DateTimePicker class*
        -   Date.get
    -   Error class
    -   *Label class*
        -   Text.get
    -   *ListView class*
        -   public virtual ListViewHeader Header { get; }
        -   public virtual ListViewRows Rows { get; }
        -   public virtual ListViewRows SelectedRows { get; }
        -   public virtual ListViewCell Cell(string column, int zeroBasedRowIndex);
        -   public virtual ListViewRow Row(string column, string value);
    -   *ListViewRow class*
        -   IsSelected.get
    -   *MultilineTextBox class*
        -   Text.get
    -   *Panel class*
        -   Text.get
    -   *ProgressBar class*
        -   Maximum.get
        -   Minimum.get
        -   Value.get
    -   *Slider class*
        -   LargeChangeAmount.get
        -   LargeDecrementButton.get
        -   LargeIncrementButton.get
        -   SmallChangeAmount.get
        -   Value.get
    -   *Spinner class*
        -   Value.get, Value.set
    -   *TextBox class*
        -   BulkText.set
        -   Text.get
    -   ToolTip class
    -   UIActionException class
    -   *UIItem class*
        -   public override bool Equals(object obj);
        -   public virtual Error Error(Window window);
        -   public virtual void Focus();
        -   public virtual AutomationElement GetElement(SearchCriteria searchCriteria);
        -   public override int GetHashCode();
        -   public virtual void LogStructure();
        -   public virtual bool NameMatches(string text);
        -   public override string ToString();
        -   public static string ToString(AutomationElement element);
        -   public virtual bool ValueOfEquals(AutomationProperty property, object compareTo);
        -   public virtual void Visit(WindowControlVisitor windowControlVisitor);
        -   AccessKey.get
        -   ActionListener.get
        -   AutomationElement.get
        -   Bounds.get
        -   ClickablePoint.get
        -   Enabled.get
        -   Framework.get
        -   Id.get
        -   IsFocussed.get
        -   IsOffScreen.get
        -   Location.get
        -   Name.get
        -   PrimaryIdentification.get
        -   ScrollBars.get
        -   Visible.get
    -   UIItemCollection class
    -   UIItemContainer class
    -   WindowsFramework class\~
    -   WinFromSlider class\~
    -   WinformTextBox class\~
    -   WPFLable class\~
    -   WPFSlider class\~
-   *Core.UIItems.WindowItems namespace*
    -   DisplayState enum
    -   TitleBar class\~
        -   It's safe to be called, but the title bar buttons are found by name, i.e. "Maximize", "Minimize" or "Restore" etc, and I'm not sure about its usability on Linux, so we'd better not use this class
    -   *Window class*
        -   public virtual void Close();
        -   public virtual ToolStrip GetToolStrip(string primaryIdentification);
        -   public virtual UIItemContainer MdiChild(SearchCriteria searchCriteria);
        -   public virtual Window MessageBox(string title);
        -   public virtual Window ModalWindow(string title);
        -   public abstract Window ModalWindow(string title, InitializeOption option);
        -   public virtual List\<Window\> ModalWindows();
        -   public virtual StatusStrip StatusBar(InitializeOption initializeOption);
        -   public override string ToString();
        -   public override void Visit(WindowControlVisitor windowControlVisitor);
        -   public virtual void WaitTill(WaitTillDelegate waitTillDelegate);
        -   public virtual void WaitWhileBusy();
        -   IsClosed.get
        -   IsModal.get
        -   Title.get
        -   TitleBar.get\~
        -   ToolStrip.get
        -   ToolTip.get


