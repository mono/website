---
title: "Moonlight/ControlStatus"
lastmodified: '2009-04-09'
redirect_from:
  - /Moonlight/ControlStatus/
---

Moonlight/ControlStatus
=======================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#controls-in-systemwindowsdll">1 Controls in System.Windows.dll</a>
<ul>
<li><a href="#containers">1.1 Containers</a></li>
<li><a href="#buttons">1.2 Buttons</a></li>
<li><a href="#dialogs">1.3 Dialogs</a></li>
<li><a href="#lists-listboxes-comboboxes-etc">1.4 Lists, listboxes, comboboxes, etc</a></li>
<li><a href="#scrolling">1.5 Scrolling</a></li>
<li><a href="#slider-and-progressbar">1.6 Slider and ProgressBar</a></li>
<li><a href="#text">1.7 Text</a></li>
<li><a href="#control">1.8 Control</a></li>
<li><a href="#contentcontrol">1.9 ContentControl</a></li>
<li><a href="#deepzoom">1.10 DeepZoom</a></li>
<li><a href="#ink">1.11 Ink</a></li>
<li><a href="#media">1.12 Media</a></li>
<li><a href="#misc">1.13 Misc</a></li>
</ul></li>
<li><a href="#controls-in-systemwindowscontrolsdll">2 Controls in System.Windows.Controls.dll</a>
<ul>
<li><a href="#calendar">2.1 Calendar</a></li>
<li><a href="#datepicker">2.2 DatePicker</a></li>
<li><a href="#tabcontrol">2.3 TabControl</a></li>
</ul></li>
<li><a href="#controls-in-systemwindowscontrolsdatadll">3 Controls in System.Windows.Controls.Data.dll</a>
<ul>
<li><a href="#datagrid">3.1 DataGrid</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Controls in System.Windows.dll
------------------------------

### Containers

-   Border (System.Windows.Controls) (**100% done**)
-   Canvas (System.Windows.Controls) (**100% done**)
-   Panel (System.Windows.Controls) (**100% done**)

-   Grid (**80% done**)
    -   Grid (System.Windows.Controls)
    -   ColumnDefinition (System.Windows.Controls)
    -   ColumnDefinitionCollection (System.Windows.Controls)
    -   RowDefinition (System.Windows.Controls)
    -   RowDefinitionCollection (System.Windows.Controls)

-   StackPanel (System.Windows.Controls) (**100% done**)

-   Popup (System.Windows.Controls.Primitives) (**90% done**)

-   Tooltips (**\~0% done**, we have beta1 source code, which needs a lot of work)
    -   depends on Popup (System.Windows.Controls.Primitives)
    -   ToolTip (System.Windows.Controls)
    -   ToolTipService (System.Windows.Controls))

### Buttons

-   Button (System.Windows.Controls) (**100% done**, included in SL2 RTM source drop)

-   RadioButton (System.Windows.Controls) (**100% done**, included in SL2 RTM source drop)

-   CheckBox (System.Windows.Controls) (**100% done**, included in SL2 RTM source drop)

-   ButtonBase (System.Windows.Controls.Primitives) (**100% done**, included in SL2 RTM source drop)

-   RepeatButton (System.Windows.Controls.Primitives) (**100% done**, included in SL2 RTM source drop)

-   ToggleButton (System.Windows.Controls.Primitives) (**100% done**, included in SL2 RTM source drop)

### Dialogs

-   OpenFileDialog (System.Windows.Controls) (**100% done**)

-   SaveFileDialog (System.Windows.Controls) (**0% done**, SL3 control, easy enough to implement)

### Lists, listboxes, comboboxes, etc

-   Selector (System.Windows.Controls.Primitives) (**100% done**)

-   ItemsControl (System.Windows.Controls) (**\~50% done**)
-   ItemsPresenter (System.Windows.Controls) (**\~50% done**)
-   ItemsPanelTemplate (System.Windows.Controls) (**\~50% done**)
-   ItemCollection (System.Windows.Controls) (**\~90% done**)

-   ListBox (System.Windows.Controls) (**\~25% done**)
-   ListBoxItem (System.Windows.Controls) (**\~25% done**)

-   ComboBox (**\~10% done**)
    -   depends on Popup (System.Windows.Controls.Primitives)
    -   ComboBox (System.Windows.Controls)
    -   ComboBoxItem (System.Windows.Controls)

### Scrolling

-   ScrollViewer (System.Windows.Controls) (**80% done**, needs converting/porting from the Beta1 drop)

-   ScrollContentPresenter (System.Windows.Controls) (**80% done**, needs converting/porting from the Beta1 drop)

-   ScrollBar (System.Windows.Controls.Primitives) (**100% done**, included in SL2 RTM source drop)

-   Thumb (**100% done**, included in SL2 RTM source drop)

### Slider and ProgressBar

-   Slider (System.Windows.Controls)
    -   included in SL2 RTM source drop
-   ProgressBar (System.Windows.Controls)
    -   included in SL2 RTM source drop
-   RangeBase (System.Windows.Controls.Primitives)
    -   included in SL2 RTM source drop

### Text

-   blocking on ScrollViewer

-   TextBlock (System.Windows.Controls) (**90% done**)

-   TextBox (System.Windows.Controls) (**90% done**)

-   PasswordBox (System.Windows.Controls) (**90% done**)

### Control

-   Control (System.Windows.Controls) (**100% done**)

-   ControlTemplate (System.Windows.Controls) (**100% done**)

-   UserControl (System.Windows.Controls) (**100% done**)

### ContentControl

-   ContentControl (System.Windows.Controls) (**100% done**)

-   ContentPresenter (System.Windows.Controls) (**100% done**)

### DeepZoom

-   MultiScaleImage (System.Windows.Controls) (**90% done**)

### Ink

-   InkPresenter (System.Windows.Controls)
    -   done

### Media

-   MediaElement (System.Windows.Controls)
    -   done

-   Image (System.Windows.Controls)
    -   done

### Misc

-   HyperlinkButton (System.Windows.Controls) (**80% done**, beta1 code needs porting/cleaning up)

Controls in System.Windows.Controls.dll
---------------------------------------

### Calendar

-   (**100% done**, included in the SL2 RTM source drop)

### DatePicker

-   (**100% done**, included in the SL2 RTM source drop)

### TabControl

-   (**100% done**, included in the SL2 RTM source drop)

Controls in System.Windows.Controls.Data.dll
--------------------------------------------

### DataGrid

-   (**100% done**, included in the SL2 RTM source drop)
