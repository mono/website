---
layout: obsolete
title: "Internationalization"
permalink: /old_site/Internationalization/
redirect_from:
  - /Internationalization/
  - /GetText/
  - /Gettext/
  - /GetTextSharp/
  - /I18n/
  - /I18N_with_Mono.Unix/
  - /Localization/
---

Internationalization
====================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#requirements">2 Requirements</a></li>
<li><a href="#using-monounix">3 Using Mono.Unix</a></li>
<li><a href="#using-monounix-with-console-based-applications">4 Using Mono.Unix with console-based applications</a>
<ul>
<li><a href="#example-without-internationalization">4.1 Example without internationalization</a></li>
<li><a href="#internationalizing-our-example">4.2 Internationalizing our example</a>
<ul>
<li><a href="#creating-the-message-catalog">4.2.1 Creating the Message Catalog</a></li>
</ul></li>
</ul></li>
<li><a href="#using-monounix-with-glade-applications">5 Using Mono.Unix with Glade# applications</a></li>
<li><a href="#using-monounix-with-gtk-using-stetic-applications">6 Using Mono.Unix with Gtk# using Stetic applications</a>
<ul>
<li><a href="#references">6.1 References</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
============

Using Mono.Unix is the recommended way to work with gettext on Mono to provide translations of your application's strings. An alternative exist with [Gettext\#]({{site.github.url}}/old_site/I18nGettext "I18nGettext") but is no longer a recommended path.

Requirements
============

For running the samples you need the following:

-   mono (\>= 1.0) for translating console-based applications.
-   Gtk\# (\>= 1.0) for translating window-based applications.
-   [Glade](http://glade.gnome.org/) or [Stetic](http://mysterion.org/~danw/blog/2005/03/stetic). for creating the GUI, not really needed but very useful

All the examples were tested using mono 1.1.9, Gtk\# 1.9.3.

Using Mono.Unix
===============

The Mono.Unix namespace in the Mono.Posix assembly is part of the Mono framework and provides an interface to the Posix subsystem, signals, system calls, services and utilities. Here we will leverage the Catalog class, a wrapper for *libintl* to provide Internationalization (I18N) services.

Using Mono.Unix with console-based applications
===============================================

Example without internationalization
------------------------------------

Let's examine the following piece of code

``` csharp
// File: i18n.cs
using System;
 
public class i18n
{
        public static void Main(string[] argv)
        {
            Console.WriteLine("My name is" + " Enzo");
            int i = 20;
            Console.WriteLine("I'm {0} year old.",i);
        }
}
```

This code is written for English speaking users only and doesn't adapt itself to other locales, languages, customs. Today, still, many applications, documentation, GUI are written with American English users in mind. Mono.Posix tries to remedy that.

Internationalizing our example
------------------------------

Let's review the steps to make our little piece of code I18N friendly.

### Creating the Message Catalog

First and in order to use objects within that assembly, we need to add the following to the top of our code:

``` csharp
  using Mono.Unix;
```

First, we'll initialize [http:/monodoc/T:Mono.Unix.Catalog Catalog] so that it will use a "message catalog" located under the *./locale* directory to translate our string. If a given string is not present in this message catalog, it will not be translated.

``` csharp
  Catalog.Init("i18n","./locale");
```

Instead of using statically defined string in our application, we'll use the Catalog object to obtain translations of our strings:

``` csharp
// File: i18n.cs
using System;
using Mono.Unix;
 
public class i18n
{
        public static void Main(string[] argv)
        {
               Catalog.Init("i18n","./locale");
               Console.WriteLine(Catalog.GetString("My name is {0}"), "Enzo");
               int i = 20;
               Console.WriteLine(Catalog.GetPluralString("I'm {0} year old.","I'm {0} years old.",i),i);
        }
}
```

As you can see, the Catalog object will provide us with translations for: "My name is {0}" and "I'm {0} year old."

Lets compile our example.

    $ mcs -r Mono.Posix i18n.cs

and run it:

    $ mono i18n.exe
    My name is Enzo
    I'm 20 years old.

You'll see that the output is untranslated. Why? Because we haven't translated the string, we marked it as translatable, now we need to translate it. For doing that we need to *get* the strings from our source code using **xgettext**:

    $ xgettext -a --from-code=UTF-8 i18n.cs -o es.po

Using the **--from-code=UTF-8** parameter sets the source file format, and *es.po* is the file which contain all the strings to translate. We will translate this sample from English to Spanish. The command used above creates a file called es.po, and its content is something like the following:

    # SOME DESCRIPTIVE TITLE.
    # Copyright (C) YEAR THE PACKAGE'S COPYRIGHT HOLDER
    # This file is distributed under the same license as the PACKAGE package.
    # FIRST AUTHOR <EMAIL@ADDRESS>, YEAR.
    #
    #, fuzzy
    msgid ""
    msgstr ""
    "Project-Id-Version: PACKAGE VERSION\n"
    "Report-Msgid-Bugs-To: \n"
    "POT-Creation-Date: 2005-11-08 20:59-0500\n"
    "PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\n"
    "Last-Translator: FULL NAME <EMAIL@ADDRESS>\n"
    "Language-Team: LANGUAGE <LL@li.org>\n"
    "MIME-Version: 1.0\n"
    "Content-Type: text/plain; charset=CHARSET\n"
    "Content-Transfer-Encoding: 8bit\n"
    "Plural-Forms: nplurals=INTEGER; plural=EXPRESSION;\n"

    #: i18n.cs:9
    msgid "My name is {0}"
    msgstr ""

    #: i18n.cs:11
    #, csharp-format
    msgid "I'm {0} year old."
    msgid_plural "I'm {0} years old."
    msgstr[0] ""
    msgstr[1] ""

Do not forget to change the *CHARSET* from this line

    "Content-Type: text/plain; charset=CHARSET\n"

to something like this

    "Content-Type: text/plain; charset=UTF-8\n"

If you look at the following lines:

    #: i18n.cs:9
    msgid "My name is {0}"
    msgstr ""

    #: i18n.cs:11
    #, csharp-format
    msgid "I'm {0} year old."
    msgid_plural "I'm {0} years old."
    msgstr[0] ""
    msgstr[1] ""

You will notice three important sections:

-   *source file and line number*: file name and location where the translatable string exists.
-   *translatable string* (**msgid** or **msgid\_plural**): the string to be translated. This must not be changed.
-   *translated string*: empty by default, represents the new string which will be showed when running the translation. For plural strings the **msgstr[0]** is associated with **msgid**, while **msgstr[1]** is associated with **msgid\_plural**.

After translation, the file might look something like this:

    # SOME DESCRIPTIVE TITLE.
    # Copyright (C) YEAR THE PACKAGE'S COPYRIGHT HOLDER
    # This file is distributed under the same license as the PACKAGE package.
    # FIRST AUTHOR <EMAIL@ADDRESS>, YEAR.
    #
    #, fuzzy
    msgid ""
    msgstr ""
    "Project-Id-Version: PACKAGE VERSION\n"
    "Report-Msgid-Bugs-To: \n"
    "POT-Creation-Date: 2005-11-08 20:59-0500\n"
    "PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\n"
    "Last-Translator: FULL NAME <EMAIL@ADDRESS>\n"
    "Language-Team: LANGUAGE <LL@li.org>\n"
    "MIME-Version: 1.0\n"
    "Content-Type: text/plain; charset=UTF-8\n"
    "Content-Transfer-Encoding: 8bit\n"
    "Plural-Forms: nplurals=INTEGER; plural=EXPRESSION;\n"

    #: i18n.cs:9
    msgid "My name is {0}"
    msgstr "Mi nombre es {0}"

    #: i18n.cs:11
    #, csharp-format
    msgid "I'm {0} year old."
    msgid_plural "I'm {0} years old."
    msgstr[0] "Soy {0} año de viejo"
    msgstr[1] "Soy {0} años de viejo"

Now we need to create the catalog; let's use the following commands to create it

    $ mkdir -p locale/es/LC_MESSAGES/
    $ msgfmt es.po -o locale/es/LC_MESSAGES/i18n.mo

The **mkdir** command creates the directory where the message catalog will reside. The **msgfmt** command must be in sync with the [http:/monodoc/M:Mono.Unix.Catalog.Init Catalog.Init()] call within your program. The **bindtextdomain**(3) function, which Catalog wraps, requires that message catalogs be located at *localedir/locale/category/domainname.mo*. *domainname* is the first parameter to Catalog.Init(), while *localedir* is the second parameter. *locale* is the language you're providing a translation for, in this case **es**. In general *category* will always be **LC\_MESSAGES**.

Now that we have a message catalog for the Spanish language, let's try again:

    $ LANGUAGE=es mono i18n.exe

The output will be:

    Mi nombre es Enzo
    Soy 20 años de viejo

Using Mono.Unix with Glade\# applications
=========================================

Starting with this Glade\# application

[![Default language]({{site.github.url}}/old_site/images/0/0a/I18n_en.png)]({{site.github.url}}/old_site/images/0/0a/I18n_en.png "Default language")

and based on this Glade definition

``` xml
#File: gui.glade
<?xml version="1.0" standalone="no"?> <!--*- mode: xml -*-->
<!DOCTYPE glade-interface SYSTEM "http://glade.gnome.org/glade-2.0.dtd">
 
<glade-interface>
 
<widget class="GtkWindow" id="window1">
  <property name="visible">True</property>
  <property name="title" translatable="yes">My window</property>
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
  <signal name="delete_event" handler="OnWindowDeleteEvent" last_modification_time="Wed, 21 Sep 2005 04:06:23 GMT"/>
 
  <child>
    <widget class="GtkVBox" id="vbox1">
      <property name="border_width">5</property>
      <property name="visible">True</property>
      <property name="homogeneous">False</property>
      <property name="spacing">3</property>
 
      <child>
    <widget class="GtkHBox" id="hbox1">
      <property name="visible">True</property>
      <property name="homogeneous">False</property>
      <property name="spacing">0</property>
 
      <child>
        <widget class="GtkLabel" id="label1">
          <property name="visible">True</property>
          <property name="label" translatable="yes">Write your name:</property>
          <property name="use_underline">False</property>
          <property name="use_markup">False</property>
          <property name="justify">GTK_JUSTIFY_LEFT</property>
          <property name="wrap">False</property>
          <property name="selectable">False</property>
          <property name="xalign">0.5</property>
          <property name="yalign">0.5</property>
          <property name="xpad">0</property>
          <property name="ypad">0</property>
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
        <widget class="GtkEntry" id="entry1">
          <property name="visible">True</property>
          <property name="can_focus">True</property>
          <property name="editable">True</property>
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
 
      <child>
    <widget class="GtkButton" id="button1">
      <property name="visible">True</property>
      <property name="can_focus">True</property>
      <property name="label">gtk-save</property>
      <property name="use_stock">True</property>
      <property name="relief">GTK_RELIEF_NORMAL</property>
      <property name="focus_on_click">True</property>
    </widget>
    <packing>
      <property name="padding">0</property>
      <property name="expand">False</property>
      <property name="fill">False</property>
      <property name="pack_type">GTK_PACK_END</property>
    </packing>
      </child>
    </widget>
  </child>
</widget>
 
</glade-interface>
```

we will translate it to this

[![En español]({{site.github.url}}/old_site/images/9/9c/I18n_es.png)]({{site.github.url}}/old_site/images/9/9c/I18n_es.png "En español")

using the [Gettext](http://www.gnu.org/software/gettext/) package.

The following C\# code is used for running the Glade\# application, using the glade resource:

``` csharp
#File: Gui.cs
// Compile:
// mcs -pkg:gtk-sharp,glade-sharp -resource:gui.glade Gui.cs
using Gtk;
using Glade;
 
public class gui
{
 
    public static void Main (string[] args)
    {
        Application.Init ();
        new gui ();
        Application.Run();
    }
 
    public gui ()
    {
        XML glade = new XML ("gui.glade", "window1", "myprogram");
        glade.Autoconnect (this);
    }
 
    private void OnWindowDeleteEvent (object o, DeleteEventArgs args) 
    {
        Application.Quit ();
        args.RetVal = true;
    }
}
```

Put attention to the following line:

``` csharp
XML glade = new XML ("gui.glade", "window1", "myprogram");
```

You will notice three parameters in the Glade.XML constructor, the first is the file name, the second is the default node for building the application, the third one is the most important and is called *domain* and will identify our program for translation, we must remember it.

Then, we have

-   Our not-translated program which compiles, runs and works.
-   The Gtk.Window includes: one Gtk.TextEntry, one Gtk.Label and one Gtk.Button (using Gtk.Stock for automatic translation).

We would repeat the step used for translating console-based applications

    $ xgettext --from-code=UTF-8 Gui.cs gui.glade -o en.po

A new file will be created

    # SOME DESCRIPTIVE TITLE.
    # Copyright (C) YEAR THE PACKAGE'S COPYRIGHT HOLDER
    # This file is distributed under the same license as the PACKAGE package.
    # FIRST AUTHOR <EMAIL@ADDRESS>, YEAR.
    #
    #, fuzzy
    msgid ""
    msgstr ""
    "Project-Id-Version: PACKAGE VERSION\n"
    "Report-Msgid-Bugs-To: \n"
    "POT-Creation-Date: 2005-09-20 23:09-0500\n"
    "PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\n"
    "Last-Translator: FULL NAME <EMAIL@ADDRESS>\n"
    "Language-Team: LANGUAGE <LL@li.org>\n"
    "MIME-Version: 1.0\n"
    "Content-Type: text/plain; charset=CHARSET\n"
    "Content-Transfer-Encoding: 8bit\n"

    #: gui.glade:8
    msgid "My window"
    msgstr ""

    #: gui.glade:39
    msgid "Write your name:"
    msgstr ""

    #: gui.glade:132
    msgid "Save"
    msgstr ""

Notice that the format is the same, you need to change it to something like this:

    # Mono samples
    # Copyright (C) 2005 - Mario Carrión
    # This file is distributed under the same license as the mono-samples package.
    # Mario Carrión <mario@monouml.org>, 2005.
    #
    msgid ""
    msgstr ""
    "Project-Id-Version: Mono samples 0.1\n"
    "Report-Msgid-Bugs-To: \n"
    "POT-Creation-Date: 2005-09-20 23:10-0500\n"
    "PO-Revision-Date: 2005-09-20 HO:MI+ZONE\n"
    "Last-Translator: Mario Carrión <mario@monouml.org>\n"
    "Language-Team: ES <es@li.org>\n"
    "MIME-Version: 1.0\n"
    "Content-Type: text/plain; charset=UTF-8\n"
    "Content-Transfer-Encoding: 8bit\n"

    #: gui.glade:8
    msgid "My window"
    msgstr "Mi ventana"

    #: gui.glade:39
    msgid "Write your name:"
    msgstr "Escribe tu nombre:"

Then run

    $ msgfmt en.po -o myprogram.mo

*myprogram* is the same name as we used in the Glade.XML constructor. We have our translated file and we need to move it to

    /usr/share/locale/''LANGUAGE''/LC_MESSAGES/

that (which is usually the default path for locale), in this example we are translating to spanish, so we need to move it the *es-folder*:

    $ cp myprogram.mo /usr/share/locale/es/LC_MESSAGES/

Try

    $ LANG=es mono gui.exe

And you should see the translated Glade\# application.

[![En español]({{site.github.url}}/old_site/images/9/9c/I18n_es.png)]({{site.github.url}}/old_site/images/9/9c/I18n_es.png "En español")

*Note* For some distributions you should install extra packages for seeing the translated stock icons, such as [Ubuntu](http://www.ubuntulinux.org), you need to install the *language-pack* packages. If you want to do this by an automatic way (using autotools), read the [gettext manual](http://www.gnu.org/software/gettext/manual/gettext.html) for learning how to integrate to your Makefile.am file.

Using Mono.Unix with Gtk\# using Stetic applications
====================================================

The current state of translating Mono gui apps made in stetic [is broken](http://bugzilla.ximian.com/show_bug.cgi?id=78883). [A patch](http://bugzilla.ximian.com/showattachment.cgi?attach_id=17307) must be applied to intltools-extract in order for it to work. Here are the steps to make it work:

Enter your home directory.

    $ cd ~

Download the patch, save as *thepatchfile.diff* in your home directory.

    $ wget -O thepatchfile.diff http://bugzilla.ximian.com/showattachment.cgi?attach_id=17307

Copy intltool-extract program to your home directory.

    $ cp /usr/bin/intltool-extract ~

Patch intltool-extract to give it stetic gui capability.

    $ patch -p0 intltool-extract < thepatchfile.diff

Enter your project's source code directory.

    $ cd project_source

Compile stetic.gui into a form that intltools-extract can digest. This will create stetic.gui.h in C format (even if you wrote your code in C\#). *gtk-gui/gui.stetic* is the default location where MonoDevelop puts your stetic file.

    $ ~/intltool-extract --type=gettext/stetic gtk-gui/gui.stetic

Create .po file. Note the language is described as C, even though the code is written in C\# with Gtk\#. This is OK. It will output en.po, or whatever filename you choose after "-o"

    $ xgettext -a -T -o en.po --language=C gui.stetic.h

You now have your .po file! Read above for how to edit this file.

References
----------

[GNOME's Localization guidelines for developers](http://developer.gnome.org/doc/tutorials/gnome-i18n/developer.html)

