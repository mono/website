---
title: "Webservices and GtkSharp"
lastmodified: '2005-10-05'
redirect_from:
  - /Webservices_and_GtkSharp/
---

Webservices and GtkSharp
========================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#requirements">2 Requirements</a></li>
<li><a href="#gtk-application">3 Gtk# application</a>
<ul>
<li><a href="#glade-design">3.1 Glade design</a></li>
</ul></li>
<li><a href="#web-service">4 Web Service</a>
<ul>
<li><a href="#writing">4.1 Writing</a></li>
<li><a href="#testing">4.2 Testing</a></li>
</ul></li>
<li><a href="#joining-both-applications">5 Joining both applications</a></li>
<li><a href="#contributors">6 Contributors</a></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
============

The applications are becoming more difficult and more robust, the requirements are increasing every day and the users demand better applications more quickly. Computing is more and more common and the new technologies forces the resources to operate to the maximum. Now with Web Services technology is possible to write powerful applications of one more a simpler form. The main purpose of this writing is to show a simple but useful example for using a web service through an application written in C# using Gtk#.

Requirements
============

The samples was written using:

-   mono 1.1.9.1
-   Gtk# 2.5.9
-   xsp 1.1.9.1
-   Glade 2.12

Compiling and running using [Ubuntu Linux](http://www.ubuntulinux.org) -breezy-.

Gtk# application
=================

This is a very simple application that uses the Web Service by calling it for adding two numbers written in the two Gtk.Entry widgets.

[![Simple Gtk\# application for adding two numbers](/archived/images/e/e1/Gtk_webservices.png)](/archived/images/e/e1/Gtk_webservices.png "Simple Gtk# application for adding two numbers")

Glade design
------------

The following is the glade definition for the Gtk# application. This application has defined three events: when clicking the "Add" button, when clicking the "Close" button and when closing the Window.

``` xml
#File: gui.glade
<?xml version="1.0" standalone="no"?> <!--*- mode: xml -*-->
<!DOCTYPE glade-interface SYSTEM "http://glade.gnome.org/glade-2.0.dtd">
 
<glade-interface>
 
<widget class="GtkWindow" id="_window">
  <property name="visible">True</property>
  <property name="title" translatable="yes">Gtk# and Webservices</property>
  <property name="type">GTK_WINDOW_TOPLEVEL</property>
  <property name="window_position">GTK_WIN_POS_NONE</property>
  <property name="modal">False</property>
  <property name="resizable">True</property>
  <property name="destroy_with_parent">False</property>
  <property name="decorated">True</property>
  <property name="skip_taskbar_hint">False</property>
  <property name="skip_pager_hint">False</property>
  <property name="type_hint">GDK_WINDOW_TYPE_HINT_NORMAL</property>
  <property name="gravity">GDK_GRAVITY_NORTH_WEST</property>
  <property name="focus_on_map">True</property>
  <property name="urgency_hint">False</property>
  <signal name="delete_event" handler="OnWindowDeleted" last_modification_time="Sat, 24 Sep 2005 02:46:42 GMT"/>
 
  <child>
    <widget class="GtkVBox" id="vbox1">
      <property name="visible">True</property>
      <property name="homogeneous">False</property>
      <property name="spacing">0</property>
 
      <child>
    <widget class="GtkVBox" id="vbox2">
      <property name="visible">True</property>
      <property name="homogeneous">False</property>
      <property name="spacing">0</property>
 
      <child>
        <widget class="GtkHBox" id="hbox1">
          <property name="border_width">3</property>
          <property name="visible">True</property>
          <property name="homogeneous">False</property>
          <property name="spacing">0</property>
 
          <child>
        <widget class="GtkLabel" id="label1">
          <property name="visible">True</property>
          <property name="label" translatable="yes">_First number:</property>
          <property name="use_underline">True</property>
          <property name="use_markup">False</property>
          <property name="justify">GTK_JUSTIFY_LEFT</property>
          <property name="wrap">False</property>
          <property name="selectable">False</property>
          <property name="xalign">0.5</property>
          <property name="yalign">0.5</property>
          <property name="xpad">0</property>
          <property name="ypad">0</property>
          <property name="mnemonic_widget">_firstNumber</property>
          <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
          <property name="width_chars">-1</property>
          <property name="single_line_mode">False</property>
          <property name="angle">0</property>
        </widget>
        <packing>
          <property name="padding">0</property>
          <property name="expand">False</property>
          <property name="fill">False</property>
        </packing>
          </child>
 
          <child>
        <widget class="GtkEntry" id="_firstNumber">
          <property name="width_request">30</property>
          <property name="visible">True</property>
          <property name="can_focus">True</property>
          <property name="editable">True</property>
          <property name="visibility">True</property>
          <property name="max_length">2</property>
          <property name="text" translatable="yes"></property>
          <property name="has_frame">True</property>
          <property name="invisible_char">*</property>
          <property name="activates_default">False</property>
        </widget>
        <packing>
          <property name="padding">0</property>
          <property name="expand">True</property>
          <property name="fill">True</property>
        </packing>
          </child>
 
          <child>
        <widget class="GtkLabel" id="label2">
          <property name="visible">True</property>
          <property name="label" translatable="yes">_Second number:</property>
          <property name="use_underline">True</property>
          <property name="use_markup">False</property>
          <property name="justify">GTK_JUSTIFY_LEFT</property>
          <property name="wrap">False</property>
          <property name="selectable">False</property>
          <property name="xalign">0.5</property>
          <property name="yalign">0.5</property>
          <property name="xpad">0</property>
          <property name="ypad">0</property>
          <property name="mnemonic_widget">_secondNumber</property>
          <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
          <property name="width_chars">-1</property>
          <property name="single_line_mode">False</property>
          <property name="angle">0</property>
        </widget>
        <packing>
          <property name="padding">0</property>
          <property name="expand">False</property>
          <property name="fill">False</property>
        </packing>
          </child>
 
          <child>
        <widget class="GtkEntry" id="_secondNumber">
          <property name="width_request">30</property>
          <property name="visible">True</property>
          <property name="can_focus">True</property>
          <property name="editable">True</property>
          <property name="visibility">True</property>
          <property name="max_length">2</property>
          <property name="text" translatable="yes"></property>
          <property name="has_frame">True</property>
          <property name="invisible_char">*</property>
          <property name="activates_default">False</property>
        </widget>
        <packing>
          <property name="padding">0</property>
          <property name="expand">True</property>
          <property name="fill">True</property>
        </packing>
          </child>
        </widget>
        <packing>
          <property name="padding">0</property>
          <property name="expand">True</property>
          <property name="fill">True</property>
        </packing>
      </child>
 
      <child>
        <widget class="GtkHBox" id="hbox2">
          <property name="border_width">2</property>
          <property name="visible">True</property>
          <property name="homogeneous">False</property>
          <property name="spacing">0</property>
 
          <child>
        <widget class="GtkLabel" id="label3">
          <property name="visible">True</property>
          <property name="label" translatable="yes">_Result:</property>
          <property name="use_underline">True</property>
          <property name="use_markup">False</property>
          <property name="justify">GTK_JUSTIFY_LEFT</property>
          <property name="wrap">False</property>
          <property name="selectable">False</property>
          <property name="xalign">0.5</property>
          <property name="yalign">0.5</property>
          <property name="xpad">0</property>
          <property name="ypad">0</property>
          <property name="mnemonic_widget">_resultNumber</property>
          <property name="ellipsize">PANGO_ELLIPSIZE_NONE</property>
          <property name="width_chars">-1</property>
          <property name="single_line_mode">False</property>
          <property name="angle">0</property>
        </widget>
        <packing>
          <property name="padding">0</property>
          <property name="expand">False</property>
          <property name="fill">False</property>
        </packing>
          </child>
 
          <child>
        <widget class="GtkEntry" id="_resultNumber">
          <property name="visible">True</property>
          <property name="can_focus">True</property>
          <property name="editable">False</property>
          <property name="visibility">True</property>
          <property name="max_length">0</property>
          <property name="text" translatable="yes"></property>
          <property name="has_frame">True</property>
          <property name="invisible_char">*</property>
          <property name="activates_default">False</property>
        </widget>
        <packing>
          <property name="padding">0</property>
          <property name="expand">True</property>
          <property name="fill">True</property>
        </packing>
          </child>
        </widget>
        <packing>
          <property name="padding">0</property>
          <property name="expand">True</property>
          <property name="fill">True</property>
        </packing>
      </child>
    </widget>
    <packing>
      <property name="padding">0</property>
      <property name="expand">True</property>
      <property name="fill">True</property>
    </packing>
      </child>
 
      <child>
    <widget class="GtkHButtonBox" id="hbuttonbox1">
      <property name="visible">True</property>
      <property name="layout_style">GTK_BUTTONBOX_END</property>
      <property name="spacing">0</property>
 
      <child>
        <widget class="GtkButton" id="button1">
          <property name="visible">True</property>
          <property name="can_default">True</property>
          <property name="can_focus">True</property>
          <property name="label">gtk-close</property>
          <property name="use_stock">True</property>
          <property name="relief">GTK_RELIEF_NORMAL</property>
          <property name="focus_on_click">True</property>
          <signal name="clicked" handler="OnCloseClicked" last_modification_time="Sat, 24 Sep 2005 02:37:46 GMT"/>
        </widget>
      </child>
 
      <child>
        <widget class="GtkButton" id="button2">
          <property name="visible">True</property>
          <property name="can_default">True</property>
          <property name="can_focus">True</property>
          <property name="label">gtk-add</property>
          <property name="use_stock">True</property>
          <property name="relief">GTK_RELIEF_NORMAL</property>
          <property name="focus_on_click">True</property>
          <signal name="clicked" handler="OnAddClicked" last_modification_time="Sat, 24 Sep 2005 02:37:35 GMT"/>
        </widget>
      </child>
    </widget>
    <packing>
      <property name="padding">0</property>
      <property name="expand">False</property>
      <property name="fill">True</property>
    </packing>
      </child>
    </widget>
  </child>
</widget>
 
</glade-interface>
```

The following is the C# code for using with the glade resource.

``` csharp
#File: GtkApp.cs
//mcs -pkg:glade-sharp-2.0,gtk-sharp-2.0 -resource:gui.glade,gui.glade GtkApp.cs -out:gtkapp.exe
using Glade;
using Gtk;
using System;
 
namespace GtkWebService
{
    public class GtkApp
    {
        public GtkApp (string[] args)
        {
            Application.Init();
            XML _xml = new XML ("gui.glade", "_window", null);
            _xml.Autoconnect (this);
            Application.Run();
        }
 
        public void Show ()
        {
            _window.Show ();
        }
 
        private void OnWindowDeleted (object o, DeleteEventArgs args)
        {
            Application.Quit ();
        }
 
        private void OnCloseClicked (object o, EventArgs args)
        {
            _window.Hide ();
            Application.Quit ();
        }
 
        private void OnAddClicked (object o, EventArgs args)
        {
            //Here we will call the web service... later
        }
 
        public static void Main (string []args)
        {
            GtkApp app = new GtkApp (args);
            app.Show ();
        }
 
        private XML _xml;
        [Widget] private Window _window;
        [Widget] private Entry _firstNumber;
        [Widget] private Entry _secondNumber;
        [Widget] private Entry _resultNumber;
    }
}
```

Web Service
===========

Writing
-------

Writing web services is not difficult, on the contrary it's a very easy task, you only need to derive from the System.Web.Services.WebService class, set some public methods with their respective attributes and ready. Lets starting writing our web service:

``` csharp
#File: RemoteWebService.cs
//mcs -r:System,System.Web,System.Web.Services RemoteWebService.cs -t:library
using System;
using System.Web;
using System.Web.Services;
 
namespace GtkWebservice
{
    [WebService (Description="Our first web service")]
    public class RemoteWebService : System.Web.Services.WebService
    {
        [WebMethod (Description="Adds two numbers")]
        public int Add (int firstNumber, int secondNumber)
        {
            return firstNumber + secondNumber;
        }
    }
}
```

We need to set the *[WebService ()]* attribute in the class for setting that class as the web service class, and we need to set the *[WebMethod ()]* attribute for setting that method as one web service's method, remember to set as public your web service methods, of course if you want to access then by the "outside world".

Testing
-------

After compiling the source you will get an assembly called *RemoteWebService.dll*, now we need to write the *web service page*, this page is an ASP.NET web page, for our example we need something like this, save this code as *index.asmx*:

``` asp
<%@ WebService Class="GtkWebservice.RemoteWebService" %>
```

move the assembly to a new folder called *bin* in the current directory, and then run xsp:

    xsp --port:8081

By opening your browser using the *[http://localhost:8081/index.asmx](http://localhost:8081/index.asmx)* URL you should get the RemoteWebService page for testing the the application, try it by using the test form clicking the "Add" link from the left menu.

If everything works **we have our web service!!** Now we need to *join* both applications.

Joining both applications
=========================

You need to acces the web service from within your Gtk# application, for doing that task you need to get the proxy from that web service, use this:

    wsdl http://localhost:8081/index.asmx?wsdl -out:WSAppProxy.cs -n:GtkWebService

for creating the proxy class that allows you to access the public methods from the webservice.

Now we need to edit the old method

``` csharp
private void OnAddClicked (object o, EventArgs args)
{
    try
    {
        int firstNumber = Convert.ToInt32 (_firstNumber.Text);
        int secondNumber = Convert.ToInt32 (_secondNumber.Text);
            RemoteWebService ws = new RemoteWebService ();
        _resultNumber.Text = ws.Add (firstNumber, secondNumber).ToString ();
    }
    catch (Exception ex)
    {
        _resultNumber.Text = "Use numbers!";
    }
}
```

and recompile the Gtk# application again:

    mcs -pkg:glade-sharp-2.0,gtk-sharp-2.0 -r:System.Web,System.Web.Services -resource:gui.glade,gui.glade GtkApp.cs WSAppProxy.cs -out:gtkapp.exe

Run it, write to valid numbers and click the "Add" button, everything should work and your addition should appear.

Contributors
============

[Mario Carrión](/User:MarioCarrion)

