---
layout: obsolete
title: "Accessibility: Similarities and Differences"
lastmodified: '2008-12-25'
permalink: /old_site/Accessibility:_Similarities_and_Differences/
redirect_from:
  - /Accessibility:_Similarities_and_Differences/
---

Accessibility: Similarities and Differences
===========================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#systemwindowsforms">2 System.Windows.Forms</a>
<ul>
<li><a href="#domainupdown">2.1 DomainUpDown</a></li>
<li><a href="#monthcalendar">2.2 MonthCalendar</a></li>
<li><a href="#datagrid">2.3 DataGrid</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
------------

This page is meant to be used to explain differences between our implementation and MS's. We have found some scenarios in MS implementation showing that their implementation is incomplete or implements something totally different:

System.Windows.Forms
--------------------

### DomainUpDown

1.  .NET: Not implemented (throws NotImplementException).
2.  Mono:
    1.  Implements List Control Type.
    2.  Children: n ListItem Control Type.

### MonthCalendar

1.  .NET: Not implemented (throws NotImplementException).
2.  Mono:
    1.  Implements Calendar Control Type.
    2.  Children: 1 Grid Control Type.

### DataGrid

1.  .NET: Implements Table Control Type.
2.  Mono:
    1.  Mimics ListView implementation when View is Details, so implements DataGrid Control Type.
    2.  Children: 1 Header Item with n HeaderItem Items. n DataItem with n XXXX Control Type.



