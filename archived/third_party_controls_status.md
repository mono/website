---
title: "Third Party Controls Status"
lastmodified: '2009-04-03'
redirect_from:
  - /Third_Party_Controls_Status/
---

Third Party Controls Status
===========================

This page tracks some popular third party control and the status towards getting them to run on Mono. These reports were generated against Mono 1.2.6, and the versions of these controls publicly available on December 27th, 2007.

These are controls for Windows.Forms, not controls for ASP.NET

Produced by AdTsai as part of the [GHOP](http://code.google.com/p/google-highly-open-participation-mono/) program.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#dundas">1 Dundas</a>
<ul>
<li><a href="#dundas-chart">1.1 Dundas Chart</a>
<ul>
<li><a href="#dundas-chart-for-windows-forms---professional-vs2005---net-20">1.1.1 Dundas Chart for Windows Forms - Professional (VS2005 - .NET 2.0)</a></li>
<li><a href="#dundas-chart-for-windows-forms---professional-vs2003---net-11">1.1.2 Dundas Chart for Windows Forms - Professional (VS2003 - .NET 1.1)</a></li>
</ul></li>
<li><a href="#dundas-map">1.2 Dundas Map</a>
<ul>
<li><a href="#dundas-map-for-windows-forms-vs2005---net-20">1.2.1 Dundas Map for Windows Forms (VS2005 - .NET 2.0)</a></li>
</ul></li>
<li><a href="#dundas-gauge">1.3 Dundas Gauge</a>
<ul>
<li><a href="#dundas-gauge-for-windows-forms-vs2005---net-20">1.3.1 Dundas Gauge for Windows Forms (VS2005 - .NET 2.0)</a></li>
<li><a href="#dundas-gauge-for-windows-forms-vs2003---net-11">1.3.2 Dundas Gauge for Windows Forms (VS2003 - .NET 1.1)</a></li>
</ul></li>
</ul></li>
<li><a href="#syncfusion">2 Syncfusion</a>
<ul>
<li><a href="#essential-grid">2.1 Essential Grid</a></li>
<li><a href="#essential-tools">2.2 Essential Tools</a></li>
<li><a href="#essential-chart">2.3 Essential Chart</a></li>
<li><a href="#essential-diagram">2.4 Essential Diagram</a></li>
<li><a href="#essential-pdf">2.5 Essential PDF</a></li>
<li><a href="#essential-xlsio">2.6 Essential XlsIO</a></li>
<li><a href="#essential-docio">2.7 Essential DocIO</a></li>
<li><a href="#essential-calculate">2.8 Essential Calculate</a></li>
<li><a href="#essential-grouping">2.9 Essential Grouping</a></li>
<li><a href="#essential-htmlui">2.10 Essential HTMLUI</a></li>
<li><a href="#essential-edit">2.11 Essential Edit</a></li>
<li><a href="#essential-schedule">2.12 Essential Schedule</a></li>
</ul></li>
<li><a href="#infragistics">3 Infragistics</a>
<ul>
<li><a href="#wingrid">3.1 WinGrid</a></li>
<li><a href="#wincalcmanager">3.2 WinCalcManager</a></li>
<li><a href="#winchart">3.3 WinChart</a></li>
<li><a href="#windatasource">3.4 WinDataSource</a></li>
<li><a href="#windockmanager">3.5 WinDockManager</a></li>
<li><a href="#winexplorerbar">3.6 WinExplorerBar</a></li>
<li><a href="#wingauge">3.7 WinGauge</a></li>
<li><a href="#wingriddocumentexporter">3.8 WinGridDocumentExporter</a></li>
<li><a href="#wingridexcelexporter">3.9 WinGridExcelExporter</a></li>
<li><a href="#wininkprovider">3.10 WinInkProvider</a></li>
<li><a href="#winlistbar">3.11 WinListbar</a></li>
<li><a href="#winlistview">3.12 WinListView</a></li>
<li><a href="#infragisticsdocuments">3.13 Infragistics.Documents</a></li>
<li><a href="#infragisticsexcel">3.14 Infragistics.Excel</a></li>
<li><a href="#winschedule">3.15 WinSchedule</a></li>
<li><a href="#winspellchecker">3.16 WinSpellChecker</a></li>
<li><a href="#wintabbedmdi">3.17 WinTabbedMdi</a></li>
<li><a href="#wintab">3.18 WinTab</a></li>
<li><a href="#wintoolbars">3.19 WinToolbars</a></li>
<li><a href="#wintree">3.20 WinTree</a></li>
</ul></li>
<li><a href="#janus-systems">4 Janus Systems</a>
<ul>
<li><a href="#gridex">4.1 GridEX</a></li>
<li><a href="#schedule">4.2 Schedule</a></li>
<li><a href="#uicontrols">4.3 UIControls</a></li>
<li><a href="#timeline">4.4 Timeline</a></li>
</ul></li>
<li><a href="#spreadsheetgear">5 SpreadsheetGear</a>
</li>
<li><a href="#xceed">6 Xceed</a>
<ul>
<li><a href="#compression">6.1 Compression</a></li>
<li><a href="#ftp">6.2 FTP</a></li>
<li><a href="#datagrid">6.3 DataGrid</a></li>
<li><a href="#dockingwindows">6.4 DockingWindows</a></li>
<li><a href="#editors">6.5 Editors</a></li>
<li><a href="#grid">6.6 Grid</a></li>
<li><a href="#smartui">6.7 SmartUI</a></li>
</ul></li>
<li><a href="#telerik">7 Telerik</a>
<ul>
<li><a href="#radcontrols">7.1 RadControls</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Dundas
======

Dundas Chart
------------

[Dundas Chart Official Website](http://dundas.com/Products/Chart/NET/index.aspx)

Dundas Chart for .NET is the industry leader in .NET Charting Solutions. Providing you with the most comprehensive features, the most complete sample framework, and the best live technical support available. From start to finish, our team is dedicated to providing what you need to make your project successful.

Whether you are implementing charting into internal projects, or building data visualization applications for clients, Dundas Chart offers advanced, award-winning data visualization technology to get the most out of your data.

### Dundas Chart for Windows Forms - Professional (VS2005 - .NET 2.0)

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No P/Invokes are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 1|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 27|

[Full Report](http://www.jpobst.com/mono/DundasChartVS2003.html)

### Dundas Chart for Windows Forms - Professional (VS2003 - .NET 1.1)

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No P/Invokes are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 1|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 33|

[Full Report](http://www.jpobst.com/mono/DundasChartVS2005.html)

Dundas Map
----------

[Dundas Map Official Website](http://dundas.com/Products/Map/NET/index.aspx)

Understanding your data is a challenge, but is pivotal to acting on trends and patterns. You need to group and visualize data in an easy to interpret way for it to be used effectively. You can achieve this easier interpretation visually, using Charts, Graphs or Gauges, and now in an exciting new way, using Dundas Map for .NET.

Dundas Map for .NET is a fully managed, AJAX enabled solution for visualizing your geographic data. With a comprehensive features set available in ASP.NET and Windows Forms Editions, Dundas Map is the perfect solution for building advanced .NET Digital Dashboards where map and geographic elements are required.

### Dundas Map for Windows Forms (VS2005 - .NET 2.0)

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No P/Invokes are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 3|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 40|

[Full Report](http://www.jpobst.com/mono/DundasMapVS2003.html)

Dundas Gauge
------------

[Dundas Gauge Official Website](http://dundas.com/Products/Gauge/NET/index.aspx)

Building web and desktop applications that visualize dynamic data is a task perfectly suited to Dundas Gauge for .NET, the industry leader in .NET Gauge technology.

Designed specifically to display and monitor real-time data using a range of fully customizable Gauge and Dial types, Dundas Gauge for .NET is ideal for developers building digital dashboards, manufacturing, financial, and other applications that monitor KPI's (Key Performance Indicators) and other critical data.

### Dundas Gauge for Windows Forms (VS2005 - .NET 2.0)

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No P/Invokes are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 1|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 22|

[Full Report](http://www.jpobst.com/mono/DundasGaugeVS2003.html)

### Dundas Gauge for Windows Forms (VS2003 - .NET 1.1)

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No P/Invokes are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 1|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 29|

[Full Report](http://www.jpobst.com/mono/DundasGaugeVS2005.html)

Syncfusion
==========

Essential Grid
--------------

[Essential Grid Official Website](http://www.syncfusion.com/products/Grid/windows/default.aspx)

Essential Grid offers Microsoft Excel-like grid functionality and high performance grouping support for both flat and hierarchical data sources. It allows extremely detailed customization down to the cell level. Multi-level Undo/Redo, Shared Scrollbar support, Data/View separation, Floating cells, more than 30 cell types, and unmatched extensibility are features that are unique to Essential Grid.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 68|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 6|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 35|

[Full Report](http://www.jpobst.com/mono/SyncfusionEssentialGrid.html)

Essential Tools
---------------

[Essential Tools Official Website](http://www.syncfusion.com/products/Tools/windows/default.aspx)

Essential Tools is an extensive collection of nearly 80 user interface components. Easily create robust and usable application interfaces such as those emulating Visual Studio.NET and Microsoft Office 2007.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 68|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 6|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 35|

[Full Report](http://www.jpobst.com/mono/SyncfusionEssentialTools.html)

Essential Chart
---------------

[Essential Chart Official Website](http://www.syncfusion.com/products/Chart/windows/default.aspx)

Essential Chart is a business-oriented charting component. It offers an innovative data object model that makes it easy to populate the chart with any kind of data source. Essential Chart features an advanced styles architecture that makes complex multi-level formatting very easy.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 9|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 2|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 29|

[Full Report](http://www.jpobst.com/mono/SyncfusionEssentialChart.html)

Essential Diagram
-----------------

[Essential Diagram Official Website](http://www.syncfusion.com/products/Diagram/windows/default.aspx)

Essential Diagram is an extensible and high-performance .NET diagramming framework for Windows Forms and ASP.NET applications. It can be used for developing Microsoft Visio-like interactive graphics and diagramming applications. It stores graphical objects in a node graph and renders those objects onto the screen. Essential Diagram supports both vector and raster graphics on the drawing surface.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 68|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 2|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 26|

[Full Report](http://www.jpobst.com/mono/SyncfusionEssentialDiagram.html)

Essential PDF
-------------

[Essential PDF Official Website](http://www.syncfusion.com/products/Pdf/windows/default.aspx)

Essential PDF is a .NET library that can produce Adobe PDF files from your data. It features a full-fledged object model allowing for the easy creation of PDF files using any .NET language. It does not have any external dependencies.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 377|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 2|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 19|

[Full Report](http://www.jpobst.com/mono/SyncfusionEssentialPDF.html)

Essential XlsIO
---------------

[Essential XlsIO Official Website](http://www.syncfusion.com/products/Xlsio/windows/default.aspx)

Essential XlsIO is a .NET library that can read and write Microsoft Excel files (BIFF 8 format). It features a full-fledged object model similar to the Microsoft Office Automation libraries. It can be used on systems that do not have Microsoft Excel installed, making it an excellent report engine for tabular data.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 26|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 10|

[Full Report](http://www.jpobst.com/mono/SyncfusionEssentialXlsIO.html)

Essential DocIO
---------------

[Essential DocIO Official Website](http://www.syncfusion.com/products/Docio/windows/default.aspx)

Essential DocIO is a .NET library that can read and write Microsoft Word files. It features a full-fledged object model similar to the Microsoft Office automation libraries. Essential DocIO makes it easy to create rich Word documents from your applications.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 29|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 2|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 15|

[Full Report](http://www.jpobst.com/mono/SyncfusionEssentialDocIO.html)

Essential Calculate
-------------------

[Essential Calculate Official Website](http://www.syncfusion.com/products/calculate/windows/default.aspx)

Essential Calculate allows you to add extensive calculation support to your business objects. When used in conjunction with Essential XlsIO, you can fully load, manipulate, and compute Microsoft Excel spreadsheets without any dependence on Excel. Essential Calculate is UI-independent and can be used in both ASP.NET and Windows Forms applications.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No P/Invokes are called.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods marked with [MonoTodo] are called.|

[Full Report](http://www.jpobst.com/mono/SyncfusionEssentialCalculate.html)

Essential Grouping
------------------

[Essential Grouping Official Website](http://www.syncfusion.com/products/Grouping/windows/default.aspx)

Essential Grouping is a high performance grouping engine that can group any list of data. Essential Grouping is extremely optimized and can handle large amounts of dynamic data. It features support for related data and filters. All aspects of the grouping engine are extensible, and users can add functionality as needed.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No P/Invokes are called.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods marked with [MonoTodo] are called.|

[Full Report](http://www.jpobst.com/mono/SyncfusionEssentialGrouping.html)

Essential HTMLUI
----------------

[Essential HTMLUI Official Website](http://www.syncfusion.com/products/HtmlUI/windows/default.aspx)

Essential HTMLUI renders Hyper-Text Markup Language (HTML). The functionality of the control is similar to a web browser used for display purposes. HTML elements displayed in the HTMLUI control are exposed as programmatic elements that support standard events.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 14|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 1|

[Full Report](http://www.jpobst.com/mono/SyncfusionEssentialHTMLUI.html)

Essential Edit
--------------

[Essential Edit Official Website](http://www.syncfusion.com/products/Edit/windows/default.aspx)

Essential Edit is a syntax highlighting edit control that is designed to be extensible and easy to use. Essential Edit supports automatic outlining, multi-level undo/redo, rich formatting options, and easy configuration. It comes with predefined XML-based language configurations for syntax coloring of some commonly used languages.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 75|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 16|

[Full Report](http://www.jpobst.com/mono/SyncfusionEssentialEdit.html)

Essential Schedule
------------------

[Essential Schedule Official Website](http://www.syncfusion.com/products/schedule/windows/default.aspx)

Essential Schedule is a UI control library available for both Windows Forms and ASP.NET that lets you add Outlook-like scheduling support to your applications. The user interface presented in the Windows Forms and ASP.NET versions mimics the Outlook user interface.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 6|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods marked with [MonoTodo] are called.|

[Full Report](http://www.jpobst.com/mono/SyncfusionEssentialSchedule.html)

Infragistics
============

WinGrid
-------

[WinGrid Official Website](http://www.infragistics.com/dotnet/netadvantage/winforms/wingrid.aspx#Overview)

WinGrid™ is a hierarchical data grid control with full support for bound and unbound data display that surpasses other .NET grids on the market and shifts your data-driven WinForms app into a new realm of more productive possibilities. WinGrid supports complex data entry scenarios, custom layouts, rich printing and print preview, easy interop with Microsoft® Excel™ and Adobe® PDF file formats, and an almost unlimited array of look and feel options.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 2|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 2|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 17|

[Full Report](http://www.jpobst.com/mono/InfragisticsWinGrid.html)

WinCalcManager
--------------

[WinCalcManager Official Website](http://www.infragistics.com/dotnet/netadvantage/winforms/wincalcmanager.aspx#Overview)

The WinCalcManager™ adds Microsoft Excel formula support to NetAdvantage Windows Forms controls, including WinGrid™ and the WinEditors™. In Visual Studio 2005, native Microsoft controls including DataGridView can participate in a calculation network as well. This means no matter what type of control you are using on a form, Microsoft or Infragistics, your controls can include Excel like formulas.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 2|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 2|

[Full Report](http://www.jpobst.com/mono/InfragisticsWinCalcManager.html)

WinChart
--------

[WinChart Official Website](http://www.infragistics.com/dotnet/netadvantage/winforms/winchart.aspx#Overview)

Data visualization is critical to understanding the numbers. With WinChart™ you can easily create and customize the best visualization for your information to impress and enlighten your users. The WinChart's intelligent charting and optimized default settings provide a number of incredibly rich, high fidelity 2D and 3D chart types while giving a productive developer experience.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No P/Invokes are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 1|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 4|

[Full Report](http://www.jpobst.com/mono/InfragisticsWinChart.html)

WinDataSource
-------------

[WinDataSource Official Website](http://www.infragistics.com/dotnet/netadvantage/winforms/windatasource.aspx#Overview)

Load-on-demand (or virtual data operations) are necessary for high performance applications. The WinDataSource™ is used by the WinGrid™ and other controls to handle large amounts of data, while seamlessly allowing the UI to remain responsive as data loads into the non-visible client area of the control. WinDataSource can be used with any databound control, and as an intermediary between a control and a data source.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No P/Invokes are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 3|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods marked with [MonoTodo] are called.|

[Full Report](http://www.jpobst.com/mono/InfragisticsWinDataSource.html)

WinDockManager
--------------

[WinDockManager Official Website](http://www.infragistics.com/dotnet/netadvantage/winforms/windockmanager.aspx#Overview)

Maximize screen real-estate by creating complex layouts using WinDockManager. Windows can be grouped with horizontal or vertical splits, stacked into tabbed groups, and pinned or set to auto-hide, just like the windows in Visual Studio 2003 or Visual Studio 2005. Sliding groups let you create windows with groups like the Visual Studio toolbar

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 47|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 42|

[Full Report](http://www.jpobst.com/mono/InfragisticsWinDockManager.html)

WinExplorerBar
--------------

[WinExplorerBar Official Website](http://www.infragistics.com/dotnet/netadvantage/winforms/winexplorerbar.aspx#Overview)

Add advanced navigational capabilities to your Windows Forms applications with WinExplorerBar. With multiple viewstyles, you can easily change the way your application looks and behaves without writing any code.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 1|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 20|

[Full Report](http://www.jpobst.com/mono/InfragisticsWinExplorerBar.html)

WinGauge
--------

[WinGauge Official Website](http://www.infragistics.com/dotnet/netadvantage/winforms/wingauge.aspx#Overview)

Whether it's for a sidebar gadget or an internal portal such as Sharepoint, gauges play a crucial role on any dashboard. WinGauge™ combines separate visual elements with graphical flair to create multifaceted gauges with 3 visual display modes: Radial, Linear and Digital. The composable architecture of the WinGauge also allows hybrid combinations of any of these so you can create a radial voltage gauge (voltmeter) to accentuate fine movements in electrical potential with a digital readout that gives a precise measure at any instant in time.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No P/Invokes are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 2|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods marked with [MonoTodo] are called.|

[Full Report](http://www.jpobst.com/mono/InfragisticsWinGauge.html)

WinGridDocumentExporter
-----------------------

[WinGridDocumentExporter Official Website](http://www.infragistics.com/dotnet/netadvantage/winforms/wingriddocumentexporter.aspx#Overview)

Adobe® Portable Document Format (PDF) and Microsoft®'s Extensible Paper Specification (XPS), an open XML document standard used by applications like Microsoft Office® 2007, together constitute a major share of the electronic documents exchanged between information workers today, and this trend can only grow as tens of millions of new clients capable of working in these formats are installed around the globe each year.

Adding the WinGridDocumentExporter™ component to your Windows Forms application increases collaboration by letting your users share documents generated from WinGrid™ data in these widely supported formats. It takes only a single method call to produce professional-quality XPS and PDF reports. Selectively export data rows, headers and summaries by handling any of a comprehensive set of events that allow you to control the export process.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No P/Invokes are called.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 1|

[Full Report](http://www.jpobst.com/mono/InfragisticsWinGridDocumentExporter.html)

WinGridExcelExporter
--------------------

[WinGridExcelExporter Official Website](http://www.infragistics.com/dotnet/netadvantage/winforms/wingridexcelexporter.aspx#Overview)

Export row data, headers, and summaries from the WinGrid™ to a binary-compatible Excel spreadsheet (.XLS), which can be opened inside Excel 97 or later. One call to the Export method on the non-visual WinGridExcelExporter™ component, perhaps in response to a button click or menu command, is all it takes to export your WinGrid data to an Excel file.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 1|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods marked with [MonoTodo] are called.|

[Full Report](http://www.jpobst.com/mono/InfragisticsWinGridExcelExporter.html)

WinInkProvider
--------------

[WinInkProvider Official Website](http://www.infragistics.com/dotnet/netadvantage/winforms/wininkprovider.aspx#Overview)

Make your applications "pen perfect" for the Tablet PC with the Ink support provided by the WinInkProvider™. All editors, grid, schedule, and treeview controls can allow easy input on the Tablet PC with the WinInkProvider and our advanced PenInputPanel™. Provide in-place editing, masked edit, and more for your Tablet PC applications.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No P/Invokes are called.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods marked with [MonoTodo] are called.|

[Full Report](http://www.jpobst.com/mono/InfragisticsWinInkProvider.html)

WinListbar
----------

[WinListbar Official Website](http://www.infragistics.com/dotnet/netadvantage/winforms/winlistbar.aspx#Overview)

WinListBar is a Windows Forms control that aids in navigation to forms in your applications. The user experience for Listbar is similar to the experience of using Microsoft Outlook 97; you have the ability to create Groups, and within those Groups, you can add any number of Items.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 1|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods marked with [MonoTodo] are called.|

[Full Report](http://www.jpobst.com/mono/InfragisticsWinListbar.html)

WinListView
-----------

[WinListView Official Website](http://www.infragistics.com/dotnet/netadvantage/winforms/winlistview.aspx#Overview)

You are probably familiar with the Microsoft® ListView control, which is used to display a collection of items in various different views. An example of the ListView control in action can be seen in Windows® Explorer in which files in the current directory are displayed. What you are probably not aware of, however, is that the intrinsic ListView control that ships with Visual Studio™ is in actuality a wrapper around the same COM ListView control that was shipped with Visual Basic 6.0.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 1|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods marked with [MonoTodo] are called.|

[Full Report](http://www.jpobst.com/mono/InfragisticsWinListView.html)

Infragistics.Documents
----------------------

[Infragistics.Documents Official Website](http://www.infragistics.com/dotnet/netadvantage/winforms/infragisticsdocuments.aspx#Overview)

The Infragistics.Documents code library for .NET helps C# and VB.NET developers alike in the layout and production of quality electronic documents. Supporting both the Adobe® Portable Document Format (PDF) and the Extensible Paper Specification (XPS) document formats, Infragistics.Documents makes your content readable by any of the millions of PDF and XPS-supporting applications already installed worldwide. An interface-driven, easy to program against object model abstracts away low-level document format details. This organization focuses your development effort on using the features you need to produce as simple, or as sophisticated, a document layout as your application requires.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 5|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 19|

[Full Report](http://www.jpobst.com/mono/InfragisticsDocuments.html)

Infragistics.Excel
------------------

[Infragistics.Excel Official Website](http://www.infragistics.com/dotnet/netadvantage/winforms/infragisticsexcel.aspx#Overview)

Maximize the value your users get out of the information in your Windows® Forms application by making it portable with Microsoft® Excel® and many other popular spreadsheet applications. Now you can build your data-driven solutions on top of the Infragistics.Excel code library for C# and VB.NET developers, with the interoperability you need to both read and write .XLS files. Your users will appreciate the new found freedom of taking data with them to work with in the best environment for the task, such as running "What If?" scenarios in Excel and then importing those calculations back into your application. Leveraging this collaboration can produce remarkable returns because we take care of the file interoperability, and relieve you of having to replicate expensive spreadsheet capabilities on your own.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No P/Invokes are called.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods marked with [MonoTodo] are called.|

[Full Report](http://www.jpobst.com/mono/InfragisticsExcel.html)

WinSchedule
-----------

[WinSchedule Official Website](http://www.infragistics.com/dotnet/netadvantage/winforms/winschedule.aspx#Overview)

WinSchedule™ provides everything necessary for a full-featured resource scheduling application. With multiple data-bound views for schedule data, it is simply a matter of drag and drop to mimic an Outlook™ style schedule user interface.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 3|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 2|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 26|

[Full Report](http://www.jpobst.com/mono/InfragisticsWinSchedule.html)

WinSpellChecker
---------------

[WinSpellChecker Official Website](http://www.infragistics.com/dotnet/netadvantage/winforms/winspellchecker.aspx#Overview)

With WinSpellChecker, you can check the spelling of any text based control, including TextBoxes, RichTextBoxes, and any object that implements the IProvideTextBox or ISupportSpellChecking interfaces. The WinSpellChecker component can check spelling as the end user types, and automatically correct commonly misspelled words. Misspelled words are underlined with the familiar red 'squiggly' line.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 14|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods marked with [MonoTodo] are called.|

[Full Report](http://www.jpobst.com/mono/InfragisticsWinSpellChecker.html)

WinTabbedMdi
------------

[WinTabbedMdi Official Website](http://www.infragistics.com/dotnet/netadvantage/winforms/wintabbedmdi.aspx#Overview)

WinTab™, WinTabStrip™ and WinTabbedMdi™ give you a full set of features for a tab-metaphor user interface. With WinTab, you get full control over every aspect of the tab, including a shared tab area which can be used across multiple tabs. WinTabStrip gives you complete databinding control over the tab and the WinTabbedMdi gives you Visual Studio like tabbed MDI child windows.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 24|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 16|

[Full Report](http://www.jpobst.com/mono/InfragisticsWinTabbedMdi.html)

WinTab
------

[WinTab Official Website](http://www.infragistics.com/dotnet/netadvantage/winforms/wintabs.aspx#Overview)

WinTab™, WinTabStrip™ and WinTabbedMdi™ give you a full set of features for a tab-metaphor user interface. With WinTab, you get full control over every aspect of the tab, including a shared tab area which can be used across multiple tabs. WinTabStrip gives you complete databinding control over the tab and the WinTabbedMdi gives you Visual Studio like tabbed MDI child windows.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 18|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 1|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 1|

[Full Report](http://www.jpobst.com/mono/InfragisticsWinTab.html)

WinToolbars
-----------

[WinToolbars Official Website](http://www.infragistics.com/dotnet/netadvantage/winforms/wintoolbars.aspx#Overview)

Sophisticated navigation and toolbar capabilities can be added to your Windows Forms applications with NetAdvantage's WinToolbarManager component which provides toolbar, cascading menu, task pane, Office 2007 ribbon, gallery and navigation capabilities. Our comprehensive, intuitive collection of tools empower developers to create familiar user interfaces that decrease the learning curve for end users while providing a rich and robust experience.

||
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods that are still missing in Mono: 1|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 56|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 85|

[Full Report](http://www.jpobst.com/mono/InfragisticsWinToolbars.html)

WinTree
-------

[WinTree Official Website](http://www.infragistics.com/dotnet/netadvantage/winforms/wintree.aspx#Overview)

WinTree is a fully databound, hierarchical tree for Windows Forms that supports single and multi-column nodes. Using tree, you can easily display related hierarchical data based on ADO.NET DataRelationships. The benefit of a tree over a grid is the ability to have different columsets on each parent node; where a grid must maintain the same structure on each level, a tree does not have this requirement.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 2|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 2|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 6|

[Full Report](http://www.jpobst.com/mono/InfragisticsWinTree.html)

Janus Systems
=============

GridEX
------

[Janus Systems Official Website](http://www.janusys.com/controls/)

The Janus GridEX Control for .NET is a 100% C# managed control that has been totally revamped to better take advantage of Microsoft’s .NET framework capabilities; The control has most features you could expect from a Grid and more.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 113|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 6|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 69|

[Full Report](http://www.jpobst.com/mono/JanusGridEX.html)

Schedule
--------

[Janus Systems Official Website](http://www.janusys.com/controls/)

The Janus Schedule Control for .NET is a 100% C#, managed control patterned after Outlook’s Calendar View.

The control can present appointments or items arranged on a calendar, similar to a day planner in paper form. You can view items in different blocks of time or “Views”, which represent Days, Work Weeks, Weeks and Months. Since all the Views are part of the same Schedule control you can easily switch between them.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 40|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 11|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 30|

[Full Report](http://www.jpobst.com/mono/JanusSchedule.html)

UIControls
----------

[Janus Systems Official Website](http://www.janusys.com/controls/)

The new Janus UI Controls for Microsoft .NET is a comprehensive toolkit of user interface controls designed to provide a modern look to Microsoft .NET Windows Forms applications.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 395|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 19|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 313|

[Full Report](http://www.jpobst.com/mono/JanusUIControls.html)

Timeline
--------

[Janus Systems Official Website](http://www.janusys.com/controls/)

A novel control patterned after MS Outlook’s Journal. The Janus Timeline Control is ideal for displaying items in relation to time.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 33|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 3|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 31|

[Full Report](http://www.jpobst.com/mono/JanusTimeline.html)

SpreadsheetGear
===============

[SpreadsheetGear Official Website](http://www.spreadsheetgear.com/products/spreadsheetgear.net.aspx)

SpreadsheetGear for .NET 2007 is a royalty free Microsoft Excel compatible spreadsheet component built by industry veterans for any Microsoft .NET Framework solution, featuring the fastest and most complete Excel compatible calculation engine as well as rich Windows Forms Spreadsheet Controls.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 2|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 1|

[Full Report](http://www.jpobst.com/mono/SpreadsheetGear.html)

Xceed
=====

Compression
-----------

[Xceed Compression Official Website](http://xceed.com/Zip_Net_Intro.html)

The leading .NET compression library. Designed with Microsoft's collaboration, this is the first and still the best 100%-managed .NET Zip library. Source code available in the Blueprint Edition.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No P/Invokes are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 8|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 10|

[Full Report](http://www.jpobst.com/mono/XceedCompression.html)

FTP
---

[Xceed FTP Official Website](http://xceed.com/FTP_NET_Intro.html)

Easily add efficient FTP and Secure FTP file transfer to your .NET or ASP.NET apps.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 169|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 20|

[Full Report](http://www.jpobst.com/mono/XceedFTP.html)

DataGrid
--------

[Xceed DataGrid Official Website](http://xceed.com/Grid_WPF_Intro.html)

Powerful, editable & 100% stylable WPF data grid!

||
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods that are still missing in Mono: 5598|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No P/Invokes are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 2|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 3|

[Full Report](http://www.jpobst.com/mono/XceedDataGrid.html)

DockingWindows
--------------

[Xceed DockingWindows Official Website](http://xceed.com/Docking_WinForms_Intro.html)

A time-saving set of rich and flexible UI controls for Windows Forms.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 39|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 6|

[Full Report](http://www.jpobst.com/mono/XceedDockingWindows.html)

Editors
-------

[Xceed Editors Official Website](http://xceed.com/Editors_WinForms_Intro.html)

Customizable, combinable editor controls for flexible building user interfaces.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 72|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 21|

[Full Report](http://www.jpobst.com/mono/XceedEditors.html)

Grid
----

[Xceed Grid Official Website](http://xceed.com/Grid_WinForms_Intro.html)

An advanced, multi-talented, 100% extensible data grid control.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 47|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 81|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 61|

[Full Report](http://www.jpobst.com/mono/XceedGrid.html)

SmartUI
-------

[Xceed SmartUI Official Website](http://xceed.com/SmartUI_WinForms_Intro.html)

10 visual controls for advanced, user-friendly .NET interfaces.

||
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|All methods called exist in Mono.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 60|
|[![Button ok.png](/archived/images/7/75/Button_ok.png)](/archived/images/7/75/Button_ok.png)|No methods that throw NotImplementedException are called.|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 1|

[Full Report](http://www.jpobst.com/mono/XceedSmartUI.html)

Telerik
=======

RadControls
-----------

[Telerik RadControls Official Website](http://www.telerik.com/products/winforms/overview.aspx)

Dazzling WPF-like features with classic Windows Forms.

||
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods that are still missing in Mono: 14|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|P/Invokes called: 434|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called that throw NotImplementedException: 49|
|[![Dialog-warning.png](/archived/images/1/1a/Dialog-warning.png)](/archived/images/1/1a/Dialog-warning.png)|Methods called marked with [MonoTodo]: 162|

[Full Report](http://www.jpobst.com/mono/TelerikRadControls.html)

