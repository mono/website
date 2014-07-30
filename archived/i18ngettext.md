---
title: "I18nGettext"
lastmodified: '2006-05-17'
permalink: /archived/I18nGettext/
redirect_from:
  - /I18nGettext/
---

I18nGettext
===========

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#requirements">2 Requirements</a></li>
<li><a href="#using-gettext">3 Using GetText#</a>
<ul>
<li><a href="#installation">3.1 Installation</a></li>
<li><a href="#using-gettext-with-console-based-applications">3.2 Using GetText# with console-based applications</a></li>
<li><a href="#using-gettext-with-window-based-applications">3.3 Using GetText# with window-based applications</a></li>
</ul></li>
<li><a href="#conclusions">4 Conclusions</a></li>
<li><a href="#frequently-asked-questions">5 Frequently Asked Questions</a></li>
</ul></td>
</tr>
</tbody>
</table>

### Introduction

While the Gettext\# library allows you to internationalize your code, we advise you to use our [Mono.Posix assembly]({{ site.github.url }}/Internationalization) to do so.

### Requirements

For running the samples you need the following:

-   mono (\>= 1.0) for translating console-based aplications.
-   Gtk\# (\>= 1.0) for translating window-based aplications.
-   Glade2 for creating the GUI, not really needed but very usefull

All the examples were tested using mono 1.1.6, Gtk\# 1.9.3 and Gettext\# 0.14.

### Using GetText\#

#### Installation

You can download the current version from [here](http://ftp.gnu.org/gnu/gettext/gettext-0.14.tar.gz). The older version can the downloaded from [this](http://ftp.gnu.org/gnu/gettext/) site. Older versions of Gettext doesn't support C\#, so older versions doesn't work.

After downloading the package you need to uncompress it.

``` bash
 $ tar xvfz gettext-0.14.tar.gz
```

then

``` bash
 $ ./configure && make
```

within the created folder, by default the configure script allows the C\# language so you don't need any extra parameter, and finally, install using the root user

``` bash
 # make install
```

Now we can use the GetText\# library for translating our application.

#### Using GetText\# with console-based applications

For using GetText\# we need to add the following namespace to our code: *GNU.Gettext*, then declare a variable that allows GetText\# to set translatable strings and finally begin to replace all the strings that we need to translate using a method from GetText\#.

For example, lets see the following code from a source file called **Example.cs**:

``` csharp
public class Example
{
    public static void Main (string[] args)
    {
        System.Console.WriteLine ("Hello world!");
    }
}
```

we should modify it in this way:

``` csharp
using GNU.Gettext; //Required namespace for i18n
 
public class Example
{
    //This variable will allow us to set which strings are translatable
    //"my_class" is a catalog identifier, used in the next section
    private static GettextResourceManager _catalog = new GettextResourceManager ("my_class");
    public static void Main (string[] args)
    {
        //This string is modified adding the method GetString() from the catalog variable
        System.Console.WriteLine (_catalog.GetString ("Hello world!"));
    }
}
```

There is only one string marked as translatable: "*Hello world!*"

``` csharp
_catalog.GetString ("Hello world!")
```

using the method *GetString* we mark any string as translatable, we need to repeat the process of marking-the-string in all the string that we need to translate. Lets compile our example.

``` bash
 $ mcs -r GNU.Gettext Example.cs
```

then lets run it

``` bash
 $ mono Example.exe
```

You'll see that the output is still *Hello world!*, Why? Because we haven't translated the string, we marked it as translatable, now we need to translate it. For doing that we need to **get** the strings from our source code using this statement:

``` bash
 $ xgettext --from-code=UTF-8 Example.cs -o es.po
```

Using the **--from-code=UTF-8** parameter sets the source file format, and *es.po* will be the file which contain all the strings to translate. We will translate this sample from english to spanish. The stament used above creates a file called es.po, and its content is something like the following:

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
    "POT-Creation-Date: 2004-08-13 04:08-0500\n"
    "PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\n"
    "Last-Translator: FULL NAME <EMAIL@ADDRESS>\n"
    "Language-Team: LANGUAGE <LL@li.org>\n"
    "MIME-Version: 1.0\n"
    "Content-Type: text/plain; charset=CHARSET\n"
    "Content-Transfer-Encoding: 8bit\n"

    #: Example.cs:11
    msgid "Hello world!"
    msgstr "" 

Do not forget to change the *CHARSET* from this line

    "Content-Type: text/plain; charset=CHARSET\n"

to something like this

    "Content-Type: text/plain; charset=UTF-8\n"

See the following lines

    #: Example.cs:11
    msgid "Hello world!"
    msgstr "" 

You will notice three important sections:

-   *line number and source file*: name where the translatable string exists
-   *translatable string*: must not be changed
-   *translated string*: empty by default, represents the new string which will be showed when running the translation.

After translating the file might look something like this:

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
    "POT-Creation-Date: 2004-08-13 04:08-0500\n"
    "PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE\n"
    "Last-Translator: FULL NAME <EMAIL@ADDRESS>\n"
    "Language-Team: LANGUAGE <LL@li.org>\n"
    "MIME-Version: 1.0\n"
    "Content-Type: text/plain; charset=UTF-8\n"
    "Content-Transfer-Encoding: 8bit\n"

    #: Example.cs:11
    msgid "Hello world!"
    msgstr "¡Hola mundo!" 

Now we need to create the catalog, we use the following command for creating it

``` bash
 $ msgfmt --csharp -r my_class -l es es.po -d .
```

The stament used above generates a C\# assembly due to the **--csharp** parameter, in the current directory, due to the parameter **-d .**, which is called automatically when the locale is es, due to the parameter **-l es**, the parameter *-r my\_class* calls the catalog identifier which previouslly was defined in the source code. The library is within ./es/ and is called my\_class.resources.dll.

Lets try again

``` bash
 $ LANG=es mono Example.exe
```

Warning: be sure to use LANG=es and not LANGUAGE=es for some reason with gettext-0.14.5 LANGUAGE=es will not work!

the output will be:

    ¡Hola mundo!

#### Using GetText\# with window-based applications

TODO

### Conclusions

TODO

### Frequently Asked Questions

TODO

