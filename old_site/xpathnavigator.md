---
layout: obsolete
title: "XPathNavigator"
permalink: /old_site/XPathNavigator/
redirect_from:
  - /XPathNavigator/
---

XPathNavigator
==============

Traversing XML documents using XPathNavigator, by Atsushi Enomoto

XPathNavigator enables you to navigate XML document using XPath, but it is more than that. It holds its own XPath data model, which is more simplified than XmlDocument. XPathNavigator is mainly for input to XSL Transformation, but it might be useful for general purpose document navigation.

XPathNavigator and related classes are in System.Xml.XPath namespace.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#using-xpathnavigator">2 Using XPathNavigator</a>
<ul>
<li><a href="#xpathnavigator-and-xpath-data-model">2.1 XPathNavigator and XPath Data Model</a></li>
<li><a href="#primitive-navigation-methods">2.2 Primitive Navigation Methods</a></li>
<li><a href="#xpathnodeiterator-and-selection-methods">2.3 XPathNodeIterator and Selection methods</a></li>
<li><a href="#evaluation-methods">2.4 Evaluation Methods</a></li>
<li><a href="#comparison-methods">2.5 Comparison Methods</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
============

XPathNavigator is an abstract class. It can be created by classes that implements IXPathNavigable interface. There are two concrete implementation classes : XPathDocument and XmlDocument.

You can extend XPathNavigator and create your own implementation. Some members are virtual, so you don't have to implement such members. Some members are abstract, so you will have to implement them by yourself.

Usually XPathNavigator loads the entire document into the memory, while XmlReader does not. XPathNavigator is not a part of ECMA CLI specification, nor any standard API. Some Microsoft people says that they are going XPathNavigator way.

Using XPathNavigator
====================

XPathNavigator and XPath Data Model
-----------------------------------

XPathNavigator is based on its own data model. It is based on the data model specified in XPath W3C Recommendation. It is closer to XMLInfoset than literal xml document structure. For example, There is no difference between normal text and CDATA section. Note that XPath data model is not XML Infoset, however. For example, it has no document type node.

XPathNavigator's programming model is not similar to that of XmlDocument. When we use XmlDocument and XmlNode, we usually let a variable to point to a certain XmlNode. When we use XPathNavigator, there is no class that represents an XPath node.

So the node's property is indirectly shown by XPathNavigator's properties. The properties are similar to XmlDocument or XmlReader: Name, LocalName, NamespaceURI, Value and NodeType.

Node types are defined in XPathNodeType enumerator:

-   All
-   Attribute
-   Comment
-   Element
-   Namespace
-   ProcessingInstruction
-   Root
-   SignificantWhitespace
-   Text
-   Whitespace

Node type "Namespace" is to represent "namespace node" as used in XPath (e.g. represented in such XPath like "namespace::\*"). Note that attribute "xmlns" and "xmlns:\*" are not regarded as attribute nodes, unlike XmlDocument.

Node type "Root" is to represent document node (In XPath expression it is "/"). Node type "All" is not to represent a node.

You can use some similar functionality to those of XmlReader: GetAttribute(), GetNamespace(), BaseURI, XmlLang and IsEmptyElement. GetNamepace() is similar to GetAttribute() but returns the namespace URI.

It always indicates only one node. It can be cloned using Clone() method. You will have to use this method for example when you would like to compare two nodes.

Primitive Navigation Methods
----------------------------

There are several navigation methods. Most of them return boolean result indicating the operation succeeded or not.

-   MoveToRoot() always moves to the document root. It never fails.
-   MoveToFirstChild() tries to move to its first child node.
-   MoveToFirstAttribute() tries to move to its first attribute node
-   MoveToFirstNamespace() tries to move to its first namespace node
-   MoveToPrevious () tries to move its previous sibling. It failes if the navigator is positioned at the first of its sibling nodes.
-   MoveToNext() tries to move its next sibling. It failes if the navigator is positioned at the last of its sibling nodes.
-   MoveToNextAttribute() tries to move to its next attribute node. It always fails when the navigator is not positioned at an attribute node.
-   MoveToNextNamespace() tries to move to its next namespace node. It always fails when the navigator is not positioned at a namespace node.
-   MoveToFirst() tries to move to the first sibling node. It fails if the navigator is already positioned at the first node.
-   MoveToParent() tries to move to the parent node.
-   MoveToId() tries to move to the element which contains the specified ID .
-   MoveTo() tries to move to the argument XPathNavigator (it may fail because the argument XPathNavigator might be different document).

When moving to namespace nodes, you can specify the optional parameter "XPathNamespaceScope" to limit the navigation target. For example, "ExcludeXml" means that it will never be navigated to "xml" namespace node.

XPathNodeIterator and Selection methods
---------------------------------------

When we handle XPath "node-set", we use XPathNodeIterator class. The design of this class is simple; Once you get an XPathNodeIterator, firstly you will have to call MoveNext() to iterate the next node, and use Current property (of type XPathNavigator) that points to the iterated nodes. MoveNext() returns false if there is no more matched nodes.

    XPathNavigator nav = 
        new XPathDocument ("my_document.xml").CreateNavigator ();
    XPathNodeIterator links = nav.Select ("//a[@href]");
    while (links.MoveNext ()) {
        Console.WriteLine (links.Current.Value);
    }

Note that XPathNodeIterator is one-way iterator. You cannot move back.

-   SelectChildren() returns its children filtered by the argument node type or qualified name.
-   SelectDescendants() returns its descendants similarly.
-   SelectAncestors() returns its ancestors similarly.
-   Select() returns the resulting node-set for the specified XPath expression.

When specifying XPath for Select() method, you can use either an expression string or compiled XPathExpression object. XPathExpression object can be created through Compile() method. XPath compilation is somewhat slow (at least slower than using pre-compiled XPathExpression), so using XPathExpression might improve the performance.

Evaluation Methods
------------------

Other than these methods above, sometimes you might want to compare positions, or evaluate value based on the XPath type such as number, boolean, string, node-set and result tree fragment. These types are represented in XPathResultType enumeration and mapped to CLR types as follows:

|XPath type|XPathResultType|CLR type|
|:---------|:--------------|:-------|
|any type|Any|System.Object|
|boolean|Boolean|System.Boolean|
|(no equivalent)|Error|(no equivalent)|
|result tree fragment|Navigator|System.Xml.XPath.XPathNavigator|
|node-set|NodeSet|System.Xml.XPath.XPathNodeIterator|
|number|Number|System.Double|
|string|String|System.String|

To evaluate an XPath expression against a node, navigate to the target node and use Evaluate() with the xpath argument.

Comparison Methods
------------------

The last pieces of XPathNavigator are tree node comparison methods.

-   IsDescendant() checks if the node pointed by the argument XPathNavigator is its descendant or not.
-   IsSamePosition() checks if the node pointed by the argument XPathNavigator also points the same node.
-   ComparePosition() returns the position represented as an enumeration type of XmlNodeOrder. It the argument node (pointed by XPathNavigator) is located after this node, it returns "After". If it is before this node then "Before", and "Same" if they are on the same position. If those document sources are different, then it returns "Unknown".

Note that XML (and of course XPath) data model is not aware of the order of attributes. So you should not rely on these "order". However, you can rely on the fact that MoveToNextAttribute() iterates all attributes anyways.

