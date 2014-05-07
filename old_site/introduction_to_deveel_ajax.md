---
layout: obsolete
title: "Introduction to Deveel AJAX"
permalink: /old_site/Introduction_to_Deveel_AJAX/
redirect_from:
  - /Introduction_to_Deveel_AJAX/
---

Introduction to Deveel AJAX
===========================

Deveel AJAX is a library used to generate stubs for types (either classes or enumerations) designed under .NET environment to JavaScript, issuing AJAX requests to the back-end code from the client-side of the project. The idea behind the project is to give developers the same OO development pattern used on the original *imported* code, providing at the same time the possibility to develop rich web front-ends for applications.

The objective of the project is not to replace existing enterprise frameworks, such as [Microsoft AJAX.NET](http://ajax.asp.net), or give the same behavior of other frameworks running under fifferent platforms, such as [RubyOnRails](http://www.rubyonrails.org), that are designed and developed with another approach. In fact, Deveel AJAX aims to be a small and fast tool for *bridging* .NET web applications to the JavaScript layer, enriching the user interfaces following the AJAX concept.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#Basic_Concepts">1 Basic Concepts</a></li>
<li><a href="#Application_Contexts">2 Application Contexts</a>
<ul>
<li><a href="#Is_this_project_useful_for_my_scope.3F">2.1 Is this project useful for my scope?</a></li>
<li><a href="#How_can_I_use_this_project.3F">2.2 How can I use this project?</a></li>
</ul></li>
<li><a href="#Security">3 Security</a></li>
<li><a href="#Performances">4 Performances</a>
<ul>
<li><a href="#Configuring_the_Application">4.1 Configuring the Application</a></li>
<li><a href="#Configuring_the_Code">4.2 Configuring the Code</a>
<ul>
<li><a href="#AjaxMethod">4.2.1 AjaxMethod</a>
<ul>
<li><a href="#Duration">4.2.1.1 Duration</a></li>
<li><a href="#MethodName">4.2.1.2 MethodName</a></li>
<li><a href="#ResponseFormat">4.2.1.3 ResponseFormat</a></li>
</ul></li>
<li><a href="#AjaxType">4.2.2 AjaxType</a></li>
<li><a href="#Require">4.2.3 Require</a></li>
</ul></li>
</ul></li>
<li><a href="#Advanced_Features">5 Advanced Features</a>
<ul>
<li><a href="#Custom_Script_Rendering">5.1 Custom Script Rendering</a></li>
</ul></li>
<li><a href="#A_Basic_Example">6 A Basic Example</a></li>
<li><a href="#External_References">7 External References</a></li>
<li><a href="#Licensing">8 Licensing</a></li>
</ul></td>
</tr>
</tbody>
</table>

Basic Concepts
==============

Importing a type in a Page context makes the system generating a JavaScript stub for the type that will be included automatically as reference among the script links of the page itself (no need to tag the **\<head\>** element as *runat=server*: the system will identify it).

Deveel AJAX is designed to be as easy as possible for developers: the only call needed to import a given class or enumeration to the page is to static method **AjaxImporter.Import** at Init or Load time in the page life-cycle.

Application Contexts
====================

The first question a developer should ask to himself when evaluating a project should be *Is this project useful for my scope?* and the second one should be *How can I use this project?*.

*Is this project useful for my scope?*
--------------------------------------

As said above, Deveel AJAX aims to provide developers with a tool for interfacing their web front-ends with the application back-end, issuing AJAX calls to given methods that computes even complex operations not possible in a JavaScript restricted context (such as the connection to a database or IO operations over a file in the host system).

By default, the concept upon which AJAX technology was built on was to allow such this kind of complex operations without having to make a compiled *page class* (such as an ASP, ASP.NET, PHP, JSP, etc.) to enter in the life-cycle after a post-back, or anyway to hide the process lifting up performances on the server and interface stability.

To reach this goal the developer has to write down some specific code each time to distinguish between a normal call (eg. the simple *GET* request for the load of the page) and an AJAX call (eg. the post-back of a value from a field in a form) or in some cases write an entire script (eg. [Perl](http://www.perlo.org) or [Python](http://www.python.org)) to handle the request.

Deveel AJAX lets the developer write just once the code and does a distinction between the different kind of calls by itself.

*How can I use this project?*
-----------------------------

Using Deveel AJAX is particularly simple, as you will see in a brief introduction below: what is needed is a small configuration (really basilar if custom extensions are not wanted) and an application context where to make it run.

The first step is to have an application to export that computes an operation (lets say a *Data Access Layer* or *DAL* class), signing the methods wanted in an AJAX context.

Then, in the ASP.NET page that requires the access to the class import a reference using Deveel AJAX specific tool (*AjaxImporter*) during the *Load* or *Init* life-cycle step.

At this point the developer would be able to write down JavaScript code referencing the imported class (the *DAL* in this case) and operating with the dynamic returned results of the calls to the imported method.

Security
========

AJAX is an astonishing technology that solved a problem web developers had for a long time: providing a rich and stable interface, without affecting the performances of both client and server side.

Technologies like *Java Applets* or ActiveX tried to answer the demand by providing rich interfaces with a lot of memory usage and huge security issues. Macromedia Flash was a better solution, furthermore for its graphical design, but it was too hard to extend for common web developers.

But AJAX took with itself another issue concerning security as calls could be issued from external sources infecting the system providing the service (*cross-site scripting calls*) or the JavaScript source code of applications not intended to be visible was widely shown to users.

Deveel AJAX implements features for code obfuscation and prevention of cross-site scripting calls, enhancing the security of the application and the source code itself.

Performances
============

In some cases referencing a JavaScript framework (eg. [Dojo](http://dojotoolkit.org) or [GWT](http://code.google.com/webtoolkit/)) could slow down the load time of a page, since they could reach hundreds of kilobytes each.

Deveel AJAX makes use of [prototype](http://www.prototypejs.org) framework for generating the stub classes and methods and includes the whole script into every page, plus an additional *deveel.ajax.js* file that contains the base functionalities for interfacing the generated code with the JavaScript framework (prototype as said).

To avoid the affection of the performances in load time Deveel AJAX implements a special function to compress the output scripts, that removes comments and spaces from the sources, reducing from 5% to 40% (avg.) the size of the output.

The system also caches a script for a configurable amount of time (default is 30 minutes) not to affect the re-rendering of the whole source script.

Configuring the Application
---------------------------

To enable Deveel AJAX on a web application, using the default settings, the only needed configuration to be provided into '*web.config* is the following:

``` xml
<configuration>
    ...
    <httpHandlers>
        ...
        <add verb="*" path="*/ajax/*.jsx" type="Deveel.Ajax.AjaxHttpHadler, Deveel.Ajax" />
        ...
    </httpHandlers>
    ...
</configuration>
```

As you can see, the default extension for a Deveel AJAX script is **\*.jsx**: you can define another extension (specially if you are on hosted environment where you cannot modify the MIME table) with an additional setting like this:

``` xml
<configuration>
    ...
    <httpHandlers>
        ...
        <add verb="*" path="*/ajax/*.ashx" type="Deveel.Ajax.AjaxHttpHadler, Deveel.Ajax" />
        ...
    </httpHandlers>
    ...
    ...
    <ajax>
        <settings extension="ashx" />
    </ajax>
    ...
</configuration>
```

Configuring the Code
--------------------

It is possible to configure the behavior of the methods and types to import through specific attributes.

### AjaxMethod

This is the main attribute of the whole project, since it gives the user the way to define the behavior for the response and operations of the given signed method in the HTTP context.

The property allowed by this attributes are:

#### Duration

The time (expressed in seconds) the response of the method will be cached before the method is called again.

#### MethodName

An optional name to assign to the method to identify it differently on the clien-side.

#### ResponseFormat

Defines the format of the response of the method (either JSON or XML). **This is still under development**.

### AjaxType

This attribute lets the user to define a custom name or namespace for the imported code, as it will be shown to the client side.

For instance, if the user defines the type **PersonSelector** that belongs to the namespace **Deveel.Web.Security.Users** and he wants to be rendered under the namespace **Deveel.Users**, what will be needed will be applying this attribute to the type.

### Require

Signing a type with this attribute will make the system to import the required type before the type itself. It is important to notice that the required type could even not belong to the assembly defining the type imported, but it is important that the system has access to its information.

Advanced Features
=================

The system also provide the possibility to customize the behavior of the import and operational process. In fact it provides configuration options or API interfaces for extending the basic functionalities provided by the system natively.

Custom Script Rendering
-----------------------

All the dynamic scripts rendered by the system are handled by implementations of the interface **IScriptHandler**, that is responsible for the identification and rendering of a given script. The behavior of the interface is the following:

``` csharp
using System;
using System.IO;
 
namespace Deveel.Ajax {
    public interface IScriptHandler {
        string Name { get; }
 
        void Render(TextWriter writer, string requestUrl, bool compressed);
    }
}
```

The most common one between the implementations of this interface is **EmbeddedScriptHandler** that gives the possibility to the developer to define an embedded resource as the source for the handler. For instance, Deveel AJAX uses an internal implementation of **IScriptHandler** to render the assemblies into scripts.

A Basic Example
===============

Assuming we have the class *PesonSelector* as the following:

``` csharp
using System;
using System.Collections;
 
using Deveel.Ajax;
using Deveel.JSON;
 
namespace Deveel.Web.Security.Users {
    public class Person {
        public Person(string name, string surname, PersonType type) {
            Name = name;
            Surname = surname;
            Type = type;
        }
 
        public string Name;
        public string Surname;
        [JSONField("type")]
        public PersonType Type;
    }
 
    public enum PersonType {
        MySelf,
        Friend,
        Colleague,
        Unknown
    }
 
    [Require(typeof(PersonType))]
    public class PersonSelector {
        static PersonSelector() {
            AddPerson("Antonello", "Provenzano", PersonType.MySelf);
            AddPerson("Sravanthi", "Agrawal", PersonType.Friend);
            AddPerson("Miguel", "de Icaza", PersonType.Friend);
            AddPerson("Gabriele", "Tazzari", PersonType.Friend);
            AddPerson("Mart", "Roosmaa", PersonType.Colleague);
            AddPerson("Hanna", "Lteif", PersonType.Colleague);
        }
 
        private static ArrayList list;
 
        private static void AddPerson(string name, string surname, PersonType type) {
            if (list == null)
                list = new ArrayList();
 
            list.Add(new Person(name, surname, type));
        }
 
        public static Person SelectPerson(string name) {
            foreach(Person person in list)
                if (String.Compare(person.Name, name, true, CultureInfo.InvariantCulture) == 0 ||
                    String.Compare(person.Surname, name, true, CultureInfo.InvariantCulture) == 0)
                    return person;
            return null;
        }
    }
}
```

In the page we want to use the given type **PersonSelector** do the following:

``` csharp
using Deveel.Ajax;
 
public partial class Default {
    void Page_Load(object sender, EventArgs e) {
        AjaxImporter.Import(typeof(PersonSelector));
    }
}
```

Inspecting the HTML code of your page you will now find:

``` xml
<html>
    <head>
        ...
        <script type="text/javascript" src="/ajax/prototype.jsx"></script>
        <script type="text/javascript" src="/ajax/deveel.ajax.jsx"></script>
        <script type="text/javascript" src="/ajax/App_Code.eg35a7d.jsx"></script>
       ...
    </head>
</html>
```

if you go in deep and view at the code the dynamic JavaScript **App\_Code.eg35a7d.jsx** you will see this:

``` javascript
Deveel.addNamespace("Deveel.Web.Security.Users")
 
Deveel.Web.Security.Users.PersonSelector = {
    SelectPerson : function(name) {
        Deveel.AjaxClass.invokeMethod('/ajax/App_Code.eg35a7d.jsx', 'PersonSelector', 'SelectPerson', this.SelectPerson.arguments);
    }
}
 
Deveel.Web.Security.Users.PersonType = {
    MySelf : 0,
    Friend : 1,
    Colleague : 2,
    Unknown : 3
}
```

The proxy method will issue a request to the static method **SelectPerson** will return a [JSON](http://www.json.org) or XML (depending on the configuration of the method) response representing the type **Person**:

``` javascript
// synchronous call...
var person = Deveel.Web.Security Users.PersonSelector.SelectPerson("Provenzano");
 
...
 
// asyncronous call...
Deveel.Web.Security Users.PersonSelector.SelectPerson("Provenzano", onSelectPersonComplete);
 
function onSelectPersonComplete(person) {
    ...
}
```

This means the *person* variable returned by the call to *SelectPerson* method (or the argument of the async call *onSelectPersonComplete*) will contain the elements *Name*, *Surname* and *type* (since we choose to give the field **Type** a different name on response by signing it with **JSONField** attribute).

External References
===================

[Deveel AJAX @ SourceForge.net](http://sourceforge.net/projects/deveel-ajax) [Prototype Framework](http://www.prototypejs.org)

Licensing
=========

Deveel AJAX is released under the terms of [LGPL license](http://www.gnu.org/licenses/lgpl.html) for the source code of the application and the [BSD license](http://www.opensource.org/licenses/bsd-license.html) for the source code of the scripts.

