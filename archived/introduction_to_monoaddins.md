---
title: "Introduction to Mono.Addins"
lastmodified: '2009-06-15'
redirect_from:
  - /Introduction_to_Mono.Addins/
---

Introduction to Mono.Addins
===========================

Mono.Addins is a generic framework for creating extensible applications, and for creating libraries which extend those applications.

This framework is derived from the add-in engine used by MonoDevelop, although it has been completely rewritten and improved in many ways to make it more generic and easier to use. The MonoDevelop add-in engine was an improvement over the SharpDevelop engine, which took many ideas from the Eclipse add-in engine.

Mono.Addins has been designed to be useful for a wide range of applications: from simple applications with small extensibility needs, to complex applications (such as MonoDevelop itself) which need support for large add-in structures.

This document explains the basic concepts behind Mono.Addins, so you can get an idea of what the library is able to do. If you are interested in a more detailed explanation of all features see the document [Mono.Addins](/Mono.Addins "Mono.Addins").

If you have questions or suggestions about Mono.Addins, please subscribe to the [Mono.Addins mailing list](http://groups.google.com/group/mono-addins).

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#the-extension-model">1 The Extension Model</a></li>
<li><a href="#a-simple-example">2 A simple example</a></li>
<li><a href="#description-of-an-add-in">3 Description of an add-in</a></li>
<li><a href="#extension-paths">4 Extension Paths</a></li>
<li><a href="#querying-extension-points">5 Querying Extension Points</a></li>
<li><a href="#custom-extension-node-types">6 Custom Extension Node Types</a></li>
<li><a href="#conditions">7 Conditions</a></li>
<li><a href="#loading-add-ins">8 Loading Add-ins</a></li>
<li><a href="#add-in-discovery">9 Add-in Discovery</a></li>
<li><a href="#creating-extensible-libraries">10 Creating Extensible Libraries</a></li>
<li><a href="#add-in-management-tools">11 Add-in Management Tools</a></li>
<li><a href="#licensing">12 Licensing</a></li>
</ul></td>
</tr>
</tbody>
</table>

The Extension Model
===================

The extension model used by Mono.Addins is based on four concepts:

-   **Add-in host**: an application or library which can be extended by add-ins. Extension possibilities are declared using extension points.
-   **Extension point**: a placeholder where add-ins can register extension nodes to provide extra functionality. Extension points are identified using extension paths.
-   **Extension node**: an attribute-decorated element that describes an extension. Extension nodes are *typed*. Extension points may declare which types of extension nodes do they accept.
-   **Add-in**: A set of files which register new nodes in one or several extension points defined by add-in hosts. An add-in can also act as an add-in host, and as such it can be extended by other add-ins.

Mono.Addins also defines an **Add-in Description Model**, which is used by add-ins and add-in hosts to declare all extensibility information. Add-in descriptions can be represented either using an XML manifest, or by applying custom attributes to assemblies and types.

Finally, Mono.Addins provides an **API** (implemented in Mono.Addins.dll) which can be used at run-time to query and handle add-in extensions. The API is composed by three assemblies:

-   **Mono.Addins.dll**: implements the add-in engine.
-   **Mono.Addins.Setup.dll**: provides classes for managing add-in repositories. Needed only if applications want to offer add-in management options to users.
-   **Mono.Addins.Gui.dll**: GTK\# frontend for Mono.Addins.Setup.

In order to clarify all those concepts, let's see a very simple example of an application based on Mono.Addins.

A simple example
================

The idea is to implement a Text Editor which can be extended by add-ins. The following diagram shows the extension points that the editor will offer, and how they are extended by several add-ins:

[![Mono-addins-sample.png](/archived/images/e/e3/Mono-addins-sample.png)](/archived/images/e/e3/Mono-addins-sample.png)

A complete description of how this extensible editor could be implemented is out of the scope of this document, but this example will be used to explain how Mono.Addins works and which features does it provide.

Now let's start with the skeleton of the application and a very simple extension. We want to allow add-ins to run a custom command at application startup. Add-ins could use it, for example, to subscribe to editor events so they will perform custom actions when something happens, or to do any other kind of initialization work.

The Text Editor application is composed by two assemblies:

-   TextEditor.exe is the editor application.
-   TextEditorLib.dll will define several interfaces to be implemented by extensions

We'll also implement an add-in which will extend the application:

-   SampleAddin.dll

Let's see a basic implementation of those:

**ICommand library (TextEditorLib.dll)**

``` csharp
[assembly:AddinRoot ("TextEditor", "1.0")]
 
[TypeExtensionPoint]
public interface ICommand
{
    void Run ();
}
```

**An add-in (SampleAddin.dll)**

``` csharp
[assembly:Addin]
[assembly:AddinDependency ("TextEditor", "1.0")]
 
[Extension]
class HelloWorldExtension: ICommand
{
    public void Run ()
    {
        Console.WriteLine ("Hello World");
    }
}
```

**The host application (TextEditor.exe)**

``` csharp
public class Application
{
    public static void Main ()
    {
        // Initialize the add-in engine
        AddinManager.Initialize ();
 
        // Detect changes in add-ins
        AddinManager.Registry.Update (null);
 
        foreach (ICommand cmd in AddinManager.GetExtensionObjects (typeof(ICommand)))
            cmd.Run ();
    }
}
```

Some comments about the example:

-   The **AddinRoot** attribute can be used to mark an assembly as being an add-in host. Add-in roots must specify an identifier and a version.
-   The **TypeExtensionPoint** marks a class as being an extension point, that is, that add-ins can create new implementations of this class.
-   The **Addin** attribute indicates that an assembly is an add-in.
-   The **AddinDependency** attribute specifies which add-in root is being extended.
-   The **Extension** attribute marks a class as being an extension. This class will be registered in the extension point defined by the library.
-   The **AddinManager.Initialize()** method must be called by any host application to initialize the add-in engine.
-   The **AddinManager.Registry.Update()** can be called to detect changes in add-ins. It will detect and include new add-ins, exclude deleted add-ins and will regenerate the add-in relations if there is any other change.
-   The **AddinManager.GetExtensionObjects()** method can be used to get the objects of a given type implemented in any of the add-ins. The type must be registered as an extension point.

Description of an add-in
========================

Mono.Addins's extension system is based on a tree of extension points. Applications define which extension points are available, and add-ins specify which extension points do they extend. An extension point is just a placeholder where add-ins can add new items to provide extra functionality. Add-ins which extend applications can at the same time define new extension points, so add-ins can be extended by other add-ins.

Every add-in and add-in host has to declare which extensions (or extension points) does it provide. There are two ways of doing this:

-   **Using custom attributes**: as shown in the first example, Mono.Addins provides several attributes which can be used to mark classes as extensions or extension points. Attributes can also be used to declare add-in information and dependencies.
-   **Using an add-in manifest**: a manifest is an XML description of an add-in. Attributes are very easy to use, but not all extensibility features that Mono.Addins provides can be expressed using attributes. Any declaration that can be done using custom attributes can also be done in a manifest, but not everything that can be declared in a manifest can also be expressed using custom attributes. Manifests can be deployed as standalone files, or they can be embedded as a resource in assemblies.

It is allowed to use a mix of both approaches to describe an add-in. That is, an add-in could declare simple extensions using attributes, and more complex extensions in a manifest embedded as a resource.

The ICommand example shown in the previous section could also be implemented using manifests. This is what the manifest for the TextEditor host would look like:

``` xml
<Addin id="TextEditor" version="1.0" isroot="true">
 
    <Runtime>
        <Import assembly="TextEditor.exe"/>
        <Import assembly="TextEditorLib.dll"/>
    </Runtime>
 
    <ExtensionPoint path = "/TextEditor/TypeExtensions/ICommand">
        <ExtensionNode objectType="ICommand"/>
    </ExtensionPoint>
</Addin>
```

And this could be the manifest for the add-in:

``` xml
<Addin>
    <Runtime>
        <Import assembly="SampleAddin.dll"/>
    </Runtime>
 
    <Dependencies>
        <Addin id="TextEditor" version="1.0" />
    </Dependencies>
 
    <Extension path = "/TextEditor/TypeExtensions/ICommand">
        <Type type="HelloWorldExtension" />
    </Extension>
</Addin>
```

Extension Paths
===============

Extension points are defined by hosts or add-ins, so other add-ins can register extensions on them. Every extension point is identified using a **path**. The add-in ecosystem of an application can be seen as a tree of extension points, each of which can be reached using a path, like a file path in a file system.

Mono.Addins can assign a default path in some cases, such as in the initial example, where the ICommand extension point was assigned to the "/TextEditor/TypeExtensions/ICommand" path.

However, in general extension points will have an explicit path since it helps developers understand what's goal of the extension point. The TypeExtensionPoint attribute allows specifying a path in the constructor:

``` csharp
[TypeExtensionPoint ("/TextEditor/StartupCommands")]
public interface ICommand
{
    void Run ();
}
```

This attribute declaration is equivalent to:

``` xml
    ...
    <ExtensionPoint path = "/TextEditor/StartupCommands">
        <ExtensionNode type="Mono.Addins.TypeExtensionNode"/>
    </ExtensionPoint>
    ...
```

In this case, add-ins would need to specify the extension path in their extensions. For example, the following declaration registers a new extension in that extension point:

``` csharp
[Extension ("/TextEditor/StartupCommands")]
class HelloWorldExtension: ICommand
{
    public void Run ()
    {
        Console.WriteLine ("Hello World");
    }
}
```

Querying Extension Points
=========================

Add-ins extend applications by registering new extension nodes in extension points. An **extension node** is the most basic extensibility element that an add-in can provide. In the initial example, extension nodes are used to declare new ICommand implementations. However, extension nodes are not limited to describing *types*. An extension node can be used to describe any kind of extensible element, such as a menu item, a document template, or whatever. It is up to the host application to define the kind of elements that each extension point accepts.

The **AddinManager** class offers several methods for getting nodes registered in an extension point. One of them is **GetExtensionNodes**, which can be used like this:

``` csharp
foreach (ExtensionNode node in AddinManager.GetExtensionNodes ("/some/path")) {
    Console.WriteLine ("Node: " + node.Id);
}
```

The **Mono.Addins.ExtensionNode** class is the base class for all kinds of extension nodes. Hosts applications can create new types of nodes to which describe application extensible specific elements.

There is a kind of extension node which is the most commonly used by applications: **Mono.Addins.TypeExtensionNode**. This ExtensionNode subclass can be used to specify a type, and it is the default extension node type used when none is specified, so, that's the type being used under the hoods in the ICommand example. For example, the initial example application could be rewritten like this:

``` csharp
...
foreach (TypeExtensionNode node in AddinManager.GetExtensionNodes ("/TextEditor/StartupCommands")) {
    ICommand cmd = (ICommand) node.CreateInstance ();
    cmd.Run ();
}
...
```

Since type extensions are very common, AddinManager offers several method overloads for getting objects created out of TypeExtensionNode nodes, such as GetExtensionObjects(). Those methods avoid the work of getting the node and explicitly creating the instance.

Custom Extension Node Types
===========================

Every extension point has to declare the type of extension node that it accepts. Add-ins can register new extension nodes to that extension point. At run-time, extension nodes are represented by instances of the class **Mono.Addins.ExtensionNode** or instances of a subclass of it. Hosts can query extension points and get instances of ExtensionNode to extract whatever extension information is needed from them.

The class Mono.Addins.TypeExtensionNode allows specifying a type, and it may be enough for simple applications, but more complex applications will need to define new extension node types, so more complex extension information can be declared in extension points. Also, extension nodes don't always need to represent type implementations. In those cases, a host will need to implement custom extension node types.

Creating extension node types is very simple. Let's see an example:

``` csharp
namespace TextEditor
{
    public class FileTemplateNode: ExtensionNode
    {
        [NodeAttribute]
        string resource;
 
        [NodeAttribute]
        string name;
 
        public string Name {
            get { return name != null ? name : Id; }
        }
 
        public virtual string GetContent ()
        {
            using (StreamReader sr = new StreamReader(Addin.GetResource (resource))) {
                return sr.ReadToEnd ();
            }
        }
    }
}
```

This extension node type would be used in the Text Editor example to register file templates. When creating a new file, the user would choose a file template, so the new file would include the content provided by the template.

This class does several interesing things:

-   It inherits from Mono.Addins.ExtensionNode. All extension node types must be a subclass of this type.
-   It declares a field named **resource** and marks it with the **NodeAttribute** custom attribute. When creating a node instance, all fields marked with this attribute will be initialized using attribute values taken from the node.
-   It implements a **GetContent** method which gets the content of a template using Addin.GetResource. The **Addin** property is declared in ExtensionNode and provides access to add-in resources and types.

This node type might be used by an extension point like this:

``` xml
<Addin     id="TextEditor" version="1.0" isroot="true">
    ...
    <ExtensionPoint path="/TextEditor/Templates" name="...">
        <Description>Templates that allow creating files with a default content</Description>
        <ExtensionNode name="FileTemplate" type="TextEditor.FileTemplateNode">
    </ExtensionPoint>
    ...
</Addin>
```

Add-ins might be able to register new nodes to this extension like this:

``` xml
<Addin ...>
    ...
    <Extension path="/TextEditor/Templates">
        <FileTemplate name="README" resource="readme-template.txt" />
        <FileTemplate name="ChangeLog" resource="changelog-template.txt" />
    </Extension>
    ...
</Addin>
```

When calling AddinManager.GetExtensionNodes(), the add-in engine will read all registered elements and will create the corresponding ExtensionNode subclass instance for each of them. It will also transfer attribute values to fields marked with [NodeAttribute].

Extension nodes are not just data containers, but they can also implement some logic. In this example the host application doesn't need to know where does a FileTemplateNode get the template content from. This logic is hidden in FileTemplateNode. FileTemplateNode happens to get the content from a resource, but it might allow getting it from other places in the future.

Conditions
==========

Add-ins may use *conditions* to register nodes in an extension point which are only visible under some contexts.

For example, an add-in registering a custom menu option to the main menu of our sample text editor might want to make that option visible only for some kind of files. To allow add-ins to do this kind of check, the host application needs to define a new condition. Conditions are defined like this:

``` xml
<Addin id="TextEditor" version="1.0">
    ...
    <ConditionType id="Openfile" type="TextEditor.OpenFileCondition" />
    ...
</Addin>
```

**id**is the identifier of the condition type, the ID to be used in extensions to reference this condition. **type** is the CLR type that implements the condition.

This condition defined in the add-in host can be referenced by add-ins like this:

``` xml
<Addin>
    ...
    <Extension path = "/TextEditor/MainMenu/Edit">
        <Condition id="OpenFile" extension="xml,config">
            <MenuSeparator insertafter="Paste" />
            <MenuItem label="Format XML" commandType="TextEditor.Xml.FormatXmlCommand" />
        </Condition>
    </Extension>
    ...
</Addin>
```

Meaning that a separator and new "Format XML" command will be added after the "Paste" command, but only if the current open file has the extension ".xml" or ".config".

Extension points are dynamically updated when the status of a condition changes. Nodes matching the new condition status will be added, and nodes which do not match the condition will be removed.

Conditions are implemented using a subclass of Mono.Addins.ConditionType. For example, OpenFileCondition might be implemented like this:

``` csharp
namespace TextEditor
{
    public class OpenFileCondition: ConditionType
    {
        public OpenFileCondition ()
        {
            // It's important to notify changes in the status of a condition,
            // to make sure the extension points are properly updated.
            TextEditorApp.OpenFileChanged += delegate {
                // The NotifyChanged method must be called when the status
                // of a condition changes.
                NotifyChanged ();
            };
        }
 
        public override bool Evaluate (NodeElement conditionNode)
        {
            // Get the required extension value from an attribute,
            // and check againts the extension of the currently open document
            string val = conditionNode.GetAttribute ("extension");
            if (val.Length > 0) {
                string ext = Path.GetExtension (TextEditorApp.OpenFileName);
                foreach (string requiredExtension in val.Split (','))
                    if (ext == "." + requiredExtension)
                        return true;
            }
            return false;
        }
    }
}
```

The add-in engine will create an instance of OpenFileCondition when needed, and will call **Evaluate** to get the result for a specific condition node.

Loading Add-ins
===============

Mono.Addins supports lazy loading of add-ins. In fact, add-ins are never explicitly loaded. The add-in engine takes care of loading add-ins, and will only do it when strictly necessary.

For example, the following code:

``` csharp
foreach (TypeExtensionNode node in AddinManager.GetExtensionNodes ("/TextEditor/StartupCommands")) {
    Console.WriteLine (node.Id);
}
```

will not load any add-in in memory. In general add-ins don't need to be loaded to get the extension nodes they declare (the add-in registry can provide the information needed to create the nodes). Add-ins will only be loaded when an assembly resource or type has to be used, for example when calling node.CreateInstance ().

Add-in Discovery
================

An application can define which directories should be scanned when looking for add-ins. However, add-ins copied to those directories won't be detected until an explicit add-in scan is requested to the add-in engine. That's because Mono.Addins keeps all add-in information in a **registry** which needs to be updated if there is any change. The registry can be updated by an application by calling **AddinManager.Registry.Update()**, or by a user by running the add-in setup tool.

The registry has information about the location of every add-in and a timestamp of the last check, so the Update method will only scan new or modified add-ins. An application might add a call to AddinManager.Registry.Update() in the Main method to detect all new add-ins every time the app is started.

Every add-in added to the registry is parsed and validated, and if there is any error it will be rejected. The registry is also in charge of scanning the add-in assemblies and look for extensions and other information declared using custom attributes. That information is merged with the manifest information (if there is one) to create a complete add-in description ready to be used at run-time.

It's important to notice that Mono.Addins allows **sharing an add-in registry among several applications**. In this context, all applications sharing the registry share the same extension point tree, and it is possible to implement add-ins which extend several hosts.

Creating Extensible Libraries
=============================

Using Mono.Addins it is possible to create not only extensible applications, but also extensible libraries.

For example, let's say somebody implements a generic library for parsing source code files called NParser. NParser would provide:

-   A common API for parsing files.
-   An extension point to be used by add-ins to add support for new languages.

Any application might be able to use NParser by just linking to it and distributing it as a private assembly, or using it from the GAC. In this case, add-ins for the library would be loaded from the global registry, unless the application specified a different add-in registry.

Add-in Management Tools
=======================

In addition to the add-in engine, Mono.Addins provides an API which applications can use to offer basic add-in setup tools to users. This API is implemented in the Mono.Addins.Setup assembly, and provides the following features:

-   Installing/uninstalling add-in packages.
-   Subscribing to on-line add-in repositories.
-   Downloading and installing add-ins from repositories.
-   Creating add-in packages, to be published in on-line repositories.
-   Creating the files needed to publish add-ins on-line.

Mono.Addins also provides the tool **mautil** which can be used to perform all those operations.

Licensing
=========

Mono.Addins is open source available under the terms of the [MIT X11](http://www.opensource.org/osi3.0/licenses/mit-license.php) license.

