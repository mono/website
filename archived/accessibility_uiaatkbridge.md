---
title: "Accessibility: UiaAtkBridge"
lastmodified: '2008-11-21'
redirect_from:
  - /Accessibility:_UiaAtkBridge/
---

Accessibility: UiaAtkBridge
===========================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#scope">2 Scope</a></li>
<li><a href="#approach">3 Approach</a></li>
<li><a href="#mapping-infrastructure">4 Mapping infrastructure</a></li>
<li><a href="#acceptance-tests">5 Acceptance tests</a></li>
<li><a href="#case-study-gtk">6 Case study: GTK</a></li>
<li><a href="#problems-found">7 Problems found</a></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
------------

This bridge is going to be implemented to allow existing AT applications using open source technologies (Atk, AT-SPI) access accessibility information from programs that implement their Accessibility features using Microsoft UIAutomation API.

Scope
-----

We will split the work in different phases:

-   System.Windows.Forms applications.
-   Moonlight applications

Approach
--------

Existing technologies that use Atk and AT-SPI currently use the following components:

-   Atk: a C library which contains all the accessibility API's and infrastructure.
-   Atk-bridge: which is a C module (launched by demand depending if it's enabled in the environment variable GTK_MODULES) that connects the Atk domain model to the AT-SPI daemon.
-   AT-SPI: which runs on Bonobo (CORBA) but is likely to be migrated to DBUS.

These components represent the server side of the accessibility technology. For a screen reader or inspector (such as ORCA or Accerciser) to connect to these components, they need to use an AT-SPI connector (for example, Python applications use the library [pyatspi](http://live.gnome.org/GAP/PythonATSPI)).

Then, we need to implement a bridge which receives accessibility information from a .NET application (through a UIA provider) to the Atk component and send it via the Atk-bridge. The implementation will be coded in the managed world, so the translator between the unmanaged and managed layers will be held by a binding called Atk# (AtkSharp).

The bridge will be in its own assembly, which will talk to Atk# directly and will receive information from the provider it's connected to, either directly from it or via the UIA Core.

[![Uia-atk bridge.png](/archived/images/2/28/Uia-atk_bridge.png)](/archived/images/2/28/Uia-atk_bridge.png)

Mapping infrastructure
----------------------

We will need to map UIA structures to ATK structures. More info:

-   ATK roles: Refer to our [table of Atk.Roles](/Accessibility:_Mapping_UIA_to_ATK#roles "Accessibility: Mapping UIA to ATK"), or directly from the [ATK sources](http://svn.gnome.org/viewvc/atk/trunk/atk/atkobject.h?view=markup).
-   [Mapping UIA to ATK](/Accessibility:_Mapping_UIA_to_ATK "Accessibility: Mapping UIA to ATK"): [UiaControlType-\>Atk mapping draft](/Accessibility:_Mapping_UIA_to_ATK#uia-control-types "Accessibility: Mapping UIA to ATK").
-   [MWF-\>UiaControlType-\>UiaProvider mappings](/Accessibility:_Control_Status "Accessibility: Control Status").
-   From the GTK Case study: [Gtk-\>Gail-\>Atk-\>UiaControlType](#case-study-gtk).
-   For historic reference: [Mapping MSAA to ATK](http://developer.mozilla.org/en/docs/ARIA_UA_Best_Practices#11.3.5_Role).

NOTE!: All this work may be mergeable in a general-purpose table that wraps GtkClass-\>GailClass-\>AtkUsage(Role,GInterface,State)-\>BridgeClass-\>UiaProvider-\>UiaControlType-\>MwfClass|MoonlightWidget??

Acceptance tests
----------------

We have a Q1 deadline (March the 31st) in which we should have a basic test of the bridge working. We can show the progress here by just passing these acceptance tests:

1.  Have accerciser see an unmanaged test application that uses Atk: **PASSED**.
2.  Have accerciser see a managed test application that uses Atk#: **PASSED**.
3.  Have accerciser see an unmanaged test application that uses Atk with at least a children component: **PASSED**.
4.  Have accerciser see a managed test application that uses Atk# with at least a children component: **PASSED**.
5.  Have a minimal Bridge that exposes this functionality with public methods: **FINISHED**
6.  Have a basic MWF application (which holds just a window) that, thanks to the UIAProvider now, is seen by accerciser as an application and a window child (GOAL for Q1): **PASSED**

The list of steps to make this work is:

-   Create a folder in your computer for downloading code, e.g. /home/me/code
-   Place yourself there in a console and download Gtk#/Glib#/Atk# bindings:

<!-- -->

    svn co svn://anonsvn.mono-project.com/source/trunk/gtk-sharp/

-   Now download uia2atk module:

<!-- -->

    svn co svn://anonsvn.mono-project.com/source/trunk/uia2atk/

-   Change to Atk# dir:

<!-- -->

    cd gtk-sharp/

-   Compile the bindings:

<!-- -->

    ./bootstrap-2.12
    make

-   Ok, now we have some bleeding edge DLLs in our gtk-sharp dir, let's go back:

<!-- -->

    cd ..

-   Open a MonoDevelop solution (yeah we could use **mdtool** but I'm not sure the whole solution builds, and we need only a very small part):

<!-- -->

    monodevelop uia2atk/Uia2Atk.mds &

-   Try to build the project Uia2Atk\>tests\>ManagedTests\>TestUiaAtkBridge: you will get a compilation error telling you that you're missing glib-sharp.dll in a directory (wierd MonoDevelop bug because it's already referenced).
-   Go back to the console and copy the dll in the same dir as atkSharp:

<!-- -->

    cp gtk-sharp/glib/glib-sharp.dll gtk-sharp/atk/

-   Try to compile again and you will get a brand new exe.
-   Now copy the atk-bridge native lib into the path that will be our LD_LIBRARY_PATH:

<!-- -->

    cp /usr/lib/gtk-2.0/modules/libatk-bridge.so gtk-sharp/atk/glue/.libs/

-   Now we can launch our managed test:

<!-- -->

    cd uia2atk/UiaAtkBridge/samples/managed/TestUiaAtkBridge/bin/Debug/
    LD_LIBRARY_PATH=/path/to/our/own/gtk-sharp/atk/glue/.libs/ mono TestUiaAtkBridge.exe

-   Now run accerciser in a separate thread (for example press CTRL+SHIFT+T and launch it), and you will see a beautiful toplevel element called TestUiaAtkBridge.exe, with two windows below it.

We are now working on:

-   Have Mono.UIAutomation.Winforms assembly link to the UiaAtkBridge (maybe you will have to do the same thing about missing managed and unmanaged libs, but with other projects).
-   Have current Mono WindowsForms codebase call this provider by Reflection in order to get the bridge notified and complete whole chain.

Case study: GTK
---------------

GTK is a toolkit which is already mapped to ATK by the Gail module. We will maintain here a list of mappings for the GTK widgets as an example for our implementation for MWF widgets:

Gtk class

Gail class

Atk usage

UiaAtkBridge class

UIA Provider

[UiaControlType](/Accessibility:_Mapping_UIA_to_ATK#uia-control-types "Accessibility: Mapping UIA to ATK")

Hierarchy (children?)

Role

GInterfaces

States

[Gtk# only]Application

Toplevel (:AtkObject)

Parent of all

ATK_ROLE_APPLICATION

n/a

n/a

 ??

 ??

ComboBox (:Bin)

ComboBox (:Container)

Contains a child with a menu role

ATK_ROLE_COMBO_BOX

Action, Selection, (Inherited:) Component

n/a

 ??

ComboBoxProvider (ISelectionProvider)

 ?? (a comboBox with DropDownStyle == DropDownList)

ComboBoxEntry (:ComboBox)

 ??

contains two children: a menu role, and a text role

ATK_ROLE_COMBO_BOX

Action, Selection, (Inherited:) Component

 ??

 ??

ComboBoxProvider (ISelectionProvider, IValueProvider)

 ?? (a comboBox with DropDownStyle == DropDown)

Combo (:HBox)

Combo (:Container)

 ??

ATK_ROLE_COMBO_BOX

Action, Selection, (Inherited:) Component

n/a

 ??

 ??

 ?? (maybe a comboBox with DropDownStyle == Single?)

HBox (:Box)

 ??

 ??

 ??

 ??

 ??

 ??

 ??

 ??

VBox (:Box)

 ??

 ??

 ??

 ??

 ??

 ??

 ??

 ??

Window (:Bin)

Window (:Container)

contains all the children widgets

ATK_ROLE_FRAME

Component

ATK_STATE_SHOWING, ATK_STATE_ACTIVE, ATK_STATE_ICONIFIED, ATK_STATE_MODAL, ATK_STATE_RESIZABLE

Window

WindowProvider (IRawElementProviderSimple)

Window

Label (:Misc)

Label (:Widget)

 ??

ATK_ROLE_LABEL or ATK_ROLE_ACCEL_LABEL

Component, Text

ATK_STATE_MULTI_LINE

TextLabel

LabelProvider (IRawElementProviderSimple)

Text

Button (:Bin)

Button (:Container)

 ??

ATK_ROLE_PUSH_BUTTON

Action, Component, Image, Text

ATK_STATE_ARMED, ATK_STATE_SELECTABLE

Button

ButtonProvider (IInvokeProvider)

Button

CheckButton (:ToggleButton)

ToggleButton (:Button)

 ??

ATK_ROLE_CHECK_BOX

(Inherited:) Action, Component, Image, Text

ATK_STATE_CHECKED, ATK_STATE_ENABLED

CheckBox

CheckBoxProvider (IToggleProvider)

CheckBox

ToggleButton (:Button)

ToggleButton (:Button)

 ??

ATK_ROLE_TOGGLE_BUTTON

(Inherited:) Action, Component, Image, Text

ATK_STATE_CHECKED, ATK_STATE_ENABLED

 ??

(IToggleProvider)

 ??

RadioButton (:CheckButton)

RadioButton (:ToggleButton)

 ??

ATK_ROLE_RADIO_BUTTON

(Inherited: Action, Component, Image, Text)

(Inherited?:) ATK_STATE_CHECKED, ATK_STATE_ENABLED

RadioButton

RadioButtonProvider (ISelectionItemProvider)

RadioButton

Statusbar (:HBox)

Statusbar (:Container)

 ??

ATK_ROLE_STATUSBAR

Text

n/a

 ??

 ??

StatusBar

SpinButton (:Entry)

SpinButton (:Entry)

 ??

ATK_ROLE_SPIN_BUTTON

Value

n/a

 ??

 ??

Spinner

Image (:Misc)

Image (:Widget)

 ??

ATK_ROLE_ICON

Image

n/a

 ??

 ??

Image

Entry (:Widget)

Entry (:Widget)

 ??

ATK_ROLE_TEXT or ATK_ROLE_PASSWORD_TEXT

Action, Text, EditableText

ATK_STATE_EDITABLE, ATK_STATE_SINGLE_LINE

EditableTextBoxEntry

TextBoxProvider

Edit

MenuBar (:MenuShell)

MenuShell (:Container)

container of menu role children

ATK_ROLE_MENU_BAR or ATK_ROLE_UNKNOWN

Selection

n/a

 ??

 ??

MenuBar

Menu (:MenuShell)

Menu (:MenuShell)

container of children roles: a tear off menu item, and n menu items

ATK_ROLE_MENU

Selection

n/a

 ??

 ??

Menu

ImageMenuItem (:Menuitem)

SubMenuItem (:MenuItem)

container of children roles: a tear off menu item, and n menu items

ATK_ROLE_MENU

Selection

n/a

 ??

 ??

Menu

Menuitem (:Item)

MenuItem (:Item) (note the difference between Menuitem and MenuItem!)

 ??

ATK_ROLE_TEAR_OFF_MENU_ITEM or ATK_ROLE_SEPARATOR or ATK_ROLE_MENU_ITEM

Action

ATK_STATE_SELECTED

 ??

 ??

MenuItem

HSeparator (:Separator)

Separator (:Widget)

 ??

ATK_ROLE_SEPARATOR

n/a

ATK_STATE_HORIZONTAL

 ??

 ??

 ??

VSeparator (:Separator)

Separator (:Widget)

 ??

ATK_ROLE_SEPARATOR

n/a

ATK_STATE_VERTICAL

 ??

 ??

 ??

Expander (:Bin)

Expander (:Container)

 ??

ATK_ROLE_TOGGLE_BUTTON

Action, Text

ATK_STATE_CHECKED, ATK_STATE_EXPANDED

 ??

 ??

 ??

Frame (:Bin)

Frame (:Container)

 ??

ATK_ROLE_PANEL

n/a

ATK_STATE_DEFUNCT, ATK_STATE_VISIBLE, ATK_STATE_SHOWING

 ??

 ??

 ??

GtkHtml?

HtmlBox (:AtkGObject)

 ??

ATK_ROLE_UNKNOWN

Component

ATK_STATE_DEFUNCT, ATK_STATE_VISIBLE, ATK_STATE_SHOWING

 ??

 ??

WebControl??

ViewPort (:Bin)

Container (:Widget)

 ??

ATK_ROLE_VIEWPORT

(Inherited:) Component

n/a

 ??

 ??

 ??

ToolBar (:Container)

Container (:Widget)

 ??

ATK_ROLE_TOOL_BAR

(Inherited:) Component

n/a

 ??

 ??

ToolBar??

[abs] Item (:Bin)

 ??

 ??

 ??

 ??

 ??

 ??

 ??

 ??

[abs] MenuShell (:Container)

 ??

 ??

 ??

 ??

 ??

 ??

 ??

 ??

[abs] Bin (:Container)

 ??

 ??

 ??

 ??

 ??

 ??

 ??

 ??

[abs] Box (:Container)

 ??

 ??

 ??

 ??

 ??

 ??

 ??

 ??

[abs] Separator (:Widget)

 ??

 ??

 ??

 ??

 ??

 ??

 ??

 ??

[abs] Misc (:Widget)

 ??

 ??

 ??

 ??

 ??

 ??

 ??

 ??

[abs] Accessible (:AtkObject)

 ??

 ??

 ??

 ??

 ??

 ??

 ??

 ??

[abs] Container (:Widget)

Container (:Widget)

 ??

ATK_ROLE_PANEL

(Inherited:) Component

n/a

ParentAdapter

 ??

 ??

[abs] Widget (:Object)

Widget (:GtkAccessible)

 ??

ATK_ROLE_UNKNOWN

Component

ATK_STATE_DEFUNCT, ATK_STATE_SENSITIVE, ATK_STATE_ENABLED, ATK_STATE_FOCUSABLE, ATK_STATE_VISIBLE, ATK_STATE_SHOWING, ATK_STATE_FOCUSED, ATK_STATE_DEFAULT

Adapter

 ??

 ??

Problems found
--------------

1.  It would be interesting to change the C API of ATK to reflect interfaces with the 'I' prefix to mimic the managed notation. Not sure if the unmanaged community will want this change (but if yes, anyway it will take time because it breaks API). **Severity: Minor**
2.  Many ATK documentation states that it exposes (along with AT-SPI) a set of interfaces that are toolkit independent ([example](http://blogs.sun.com/wwalker/entry/gail_migrated_into_gtk)). As a result, we should push changes in these frameworks that remove magic keywords or specific names from GTK or Gnome. These changes may have some impact (because some may break API/ABI) but should be pushed upstream in order to drop the barrier for other vendors/toolkit to use these components. **Severity: Minor** Examples:
    1.  Since GTK# is a non desirable dependency (because you may launch a MWF application from KDE) it's contradictory to have the atk-bridge module inside a path that belongs to Gtk (/usr/lib/gtk-2.0/modules) and to have it specified in an environment variable called GTK_MODULES. We should push the change of the name of this variable to G_MODULES(?) and use other path for the installation, upstream.
    2.  Module atk-bridge should not have an external symbol with the name *gnome_accessibility_module_init*, but rather something without the name 'gnome' in it. The source code of atk-bridge is part of [AT-SPI SVN](http://svn.gnome.org/svn/at-spi/trunk/).

3.  According to Atk philosophy, each widget type (class) is associated with a particular custom AtkObject, and both types must derive from GLib.Object (GObject) to be GType's, so maybe we'll have some incompatibility between this concept and the current MWF implementation: should we modify the base class of MWF widgets to be Glib.Object? **Severity: Minor (for now)**
4.  To prevent breaking API we currently haven't done these interesting changes in ATK#:
    1.  Change virtual methods to abstract methods (OnGetNChildren and OnRefChild).
    2.  Make both methods OnGetNChildren and OnRefChild be implemented in just one property that is more managed-friendly: Atk.Object[] Children.

5.  Accerciser has a tab called 'Interfaces View' in which you can see the interfaces (**atk interfaces**) that a particular object (selected on the left pane) implements. In ATK terminology, there are two kinds of concept: interfaces and roles. And it's somewhat confusing to see the 'Application' interface in that tab while, in ATK, Application is a role. It turns out that on AT-SPI the name 'Application' is also an interface. We should change this overlap upstream if possible (use Program in replace to Application?).
6.  The system of using properties setters for stablishing the AtkUtil handlers like GetRoot/GetToolkitName/GetToolkitVersion is comfortable but:
    1.  It's a different way as the one used in the unmanaged world (different API), where you have to subclass AtkUtil and implement their methods.
    2.  Following the subclassing methods, we could make the overriding mandatory (by abstract methods) in order to prevent crashes (for example if someone stablishes GetRoot method without stablishing GetToolkit\* methods, accerciser will crash when navigating through the application).

7.  We call the atk-bridge unmanaged module from the UiaAtkBridge managed library. Maybe it's better to put this call in Atk# in order for other people to benefit from it. In the end, who is going to use ATK without GTK and without calling this module?
8.  The unmanaged module atk-bridge seems to call n times the function hello_util_add_global_event_listener (well, the equivalent to gail_util_add_global_event_listener in Gail) with parameters that include the keyword "Gtk" in the event_type (examples: Gtk:AtkHypertext:link-selected, Gtk:AtkObject:children-changed, Gtk:AtkComponent:bounds-changed...). This should be changed to a toolkit-agnostic methodology.


