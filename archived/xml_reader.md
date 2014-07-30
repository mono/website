---
title: "XML Reader"
lastmodified: '2006-05-20'
permalink: /archived/XML_Reader/
redirect_from:
  - /XML_Reader/
---

XML Reader
==========

Reading XML Documents with XMLReader, by Atsushi Enomoto

Here I start XML guide from "XML Reader" interface. It is used to read XML and to provide XML information set. And then? It depends on you what could be done.

If you just want to look into document structure easily, this "XML reader" won't be convenient. You can use XmlDocument or XPathNavigator. They are much easier to use. XmlReader is used widely as an XML input, so you will have to create these instances, but you won't have to "use" it unless you need good performance related to XML processing. XmlReader leaves behind almost all information what it has read, so it is suitable if you would like to handle huge XML documents.

Well, to understand why I don't recommend XmlReader for easy usage, let's dive into some live code. Here is an example case that gets the latest RSS entry from Mono Website. (Note that the code might not in sync with the latest web site.)

    XmlTextReader reader = new XmlTextReader ("http://www.mono-project.com/news/index.rss2");
    reader.Read ();
    Console.WriteLine (reader.NodeType); // It prints "XmlDeclaration"

    reader.MoveToContent ();
    Console.WriteLine (reader.NodeType); // It prints "Element"
    Console.WriteLine (reader.Name); // "rss"
    Console.WriteLine (reader.GetAttribute ("version")); // Maybe "0.92"

    // proceed content until we reach "item" element
    while (!reader.EOF && reader.Name != "item")
        reader.Read ();

    reader.Read (); // Move from "item" to "title"
    while (reader.NodeType == XmlNodeType.Whitespace)
        reader.Read ();
    Console.WriteLine ("Title : " + reader.ReadString ());

    reader.Read (); // from "</title>" to whitespace
    reader.Read (); // from whitespace to <link>
    Console.WriteLine ("Link  : " + reader.ReadString ());

    reader.Read (); // from "</link>" to whitespace
    reader.Read (); // from whitespace to <pubDate>
    Console.WriteLine ("Date  : " + reader.ReadString ());

    reader.Read (); // from "</pubDate>" to whitespace
    reader.Read (); // from whitespace to <description>
    Console.WriteLine ("Description : " + reader.ReadString ());

Such long?? Should I really write such long code for that simple task?? No, you don't have to write such long code if you simply want to get the summary without any resouce constraints. Use XmlDocument or XPathNavigator. And yes - if you want to use XmlReader.

(Well, this code is only an example and in fact it is bad code, so don't mimick it. For example, you should not rely on whitespaces existence.)

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#the-xmlreader-classes">1 The XmlReader Classes</a>
<ul>
<li><a href="#xmltextreader">1.1 XmlTextReader</a></li>
<li><a href="#xmlnodereader">1.2 XmlNodeReader</a></li>
<li><a href="#xmlvalidatingreader">1.3 XmlValidatingReader</a></li>
</ul></li>
<li><a href="#using-xmlreader">2 Using XmlReader</a>
<ul>
<li><a href="#node-information-properties">2.1 Node information properties</a></li>
<li><a href="#reader-methods">2.2 Reader methods</a></li>
<li><a href="#attribute-handling">2.3 Attribute handling</a></li>
<li><a href="#important-note">2.4 Important Note</a></li>
</ul></li>
<li><a href="#xml-reader-tips">3 XML Reader Tips</a>
<ul>
<li><a href="#parsing-documents-without-namespaces">3.1 Parsing documents without namespaces</a></li>
<li><a href="#constructors">3.2 Constructors</a></li>
<li><a href="#xmlreader-and-dtd">3.3 XmlReader and DTD</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

The XmlReader Classes
=====================

XmlReader is an abstract class, so you can't use it directly. There are a few classes that extend XmlReader to provide reading functionality over streams, and over already-read documents.

XmlTextReader
-------------

XML is tagged text markup language. You can write your custom text parser to read the content, but there is much more easy way to parse XML. You can use XmlTextReader to parse XML text data.

Possible you can understand what XmlTextReader is, if you know some keywords I list here: SAX, XMLPull and StAX. XmlTextReader is kind of "pull parser."

It is constructed with a file name or URI string, a Stream or a TextReader. When we haven't ever met any errors yet, it holds "current node." You can get node information from several properties such as Name, Prefix, NamespaceURI and Value. When you call Read() method, it proceeds current node to the next node.

XmlNodeReader
-------------

You don't have to "read" XML documents from its text representation. It is natural that once we parsed an XML document into the document object (XmlDocument), we don't have to parse the same XML infoset again. If you want to do the similar task like such one for XmlTextReader over XmlDocument, you can use XmlNodeReader. It is created with an XmlNode, and you can get Name, Prefix, NamespaceURI and Value the same as XmlTextReader (of course, they are already available by each node's properties).

XmlValidatingReader
-------------------

Mono and Microsoft.NET supports some XML "validation" feature. Mono supports DTD, XML Schema and RELAX NG as validation languages. Microsoft.NET supports DTD, XML Schema and XDR (XML Data Reduced). As for DTD and XML Schema (and XDR in Microsoft.NET), the validation feature is implemented in XmlValidatingReader. If you want to validate with RELAX NG grammar, find about RelaxngValidatingReader.

== XmlReader as a common XML Reading API

Since these classes are very common at infoset properties and reading methods, they have common base class named XmlReader. Once you mastered XmlTextReader, you will be able to use XmlNodeReader and XmlValidatingReader.

Using XmlReader
===============

Node information properties
---------------------------

This section starts with its node infoset properties (somewhat boring, but it needs to be described).

These properties are available for current node:

-   Name: markup name (e.g. "xsl:template")
-   LocalName: local part of the name (e.g. "template")
-   Prefix: namespace prefix ("xsl")
-   NamespaceURI: namespace URI declared or premised in the document ("[http://www.w3.org/1999/XSL/Transform](http://www.w3.org/1999/XSL/Transform)")
-   NodeType: one of the enumerated node kind. It is described immediate below.

Note that they are somewhat different from the W3C DOM API. For example, it never returns "\#document" for the Value of a document node.

Since CLI supports enum types, so node type is represented as an enum type, not likely W3C Document Object Model represents as integer. The type name is XmlNodeType. (Note that there is another XML node type named XPathNodeType.)

The enumerated values are:

-   None
-   Element
-   Attribute
-   Text
-   CDATA
-   EntityReference
-   Entity (document type definition content)
-   ProcessingInstruction
-   Comment
-   Document
-   DocumentType
-   DocumentFragment
-   Notation
-   Whitespace
-   SignificantWhitespace
-   EndElement
-   EndEntity
-   XmlDeclaration

(Looks curious? Yes, it is not compatible with W3C DOM - DOM does not contain EndElement, XmlDeclaration, Whitespace nor SignificantWhitespace. And also, it is not "Infoset" - XML Infoset is not aware of difference between Text and CDATA section.)

Reader methods
--------------

Read() moves to the next node. Here the "next node" means:

-   If current node is either a document or an element and there are one or more child nodes, then moves to the first child.
-   Otherwise when it just reached the end of an element, then it moves to the EndElement of the node.
-   Otherwise when it just reached the end of an expanded entity, then it moves to the EndEntity of the node.
-   Otherwise if there is a next sibling nodes, then it moves to the next sibling.
-   Otherwise if it is on the end of an element and there is a parent node, then it moves to the parent and goes two steps of this list back and go on.
-   Otherwise it does not proceed.

Note that attribute nodes are not children of the owner element node, so it never moves to attributes by Read(). If the reader is on attributes, then first it moves to the owner element and then moves to the next node above. As for how to move to attributes, it is described later.

If the reader is on the Element, or on the text content, ReadString() reads its content up and return it as a string value (on the other kind of node, it does nothing). It proceeds the reader to the next node (for text content) or to the next node excluding the matching EndElement if any (for Element).

ReadInnerXml() returns the markup string which represents the current node's content. ReadOuterXml() returns the markup string which represents the current node and its content.

MoveToContent() is a shortcut method to reach Element, Text, CDATA, or EndElement. Skip() skips to the next node (skipping the matching EndElement of current element node if any) of the current node.

Attribute handling
------------------

We left attributes behind in the previous chapter. Here I describe how attributes are handled.

Before starting introducing several methods, we have to describe how attributes are structured. An element node contains zero ore more attribute nodes. an attribute node contains zero or more attribute value nodes.

To access attributes, there are two ways in general:

-   Get attribute value string from the owner element.
-   Navigate to an attribute node and use properties on the reader, and read attribute value string by attribue value token.

For the first category, they simply handle attributes as containing one string value. For the second ones, they access attributes more in depth.

Speaking more concretely, there are four ways to access attributes:

-   Use GetAttribute() to get attribute value string from the owner element.
-   Use indexer for XmlReader. It returns the same as GetAttribute()
-   Use MoveToFirstAttribute() or MoveToNextAttribute() to navigate attributes in order
-   Use MoveToAttribute() to navigate directly to the specified attribute.

With MoveToXXX() methods, we can get several properties from XmlReader itself. And it can read each attribute value node with ReadAttributeValue() method. Actually, ReadAttributeValue() just moves to attribute value nodes, like other MoveToXXX() methods.

Only Text, and EntityReference are possible to be a value node of an attribute. Inside attributes, Whitespaces are merely treated as Text. Even an empty attribute is also treated as it contains an empty string Text node.

GetAttribute(), indexer and MoveToAttribute() are overloaded as to take three set of arguments.

-   int index to specify ordered attribute items. (Yes, attributes are "unordered" in XML Infoset Recommendation, but XmlReader has its mandatory "order" between attributes.)
-   a string name to specify an attribute whose markup name is identical to the argument.
-   a pair of two string to specify local part of the name and mapped namespace URI.

When the attribute specified by name(s) was not found, then GetAttribute() and indexer returns null, and MoveToXXX() returns false (they return a boolean value). As for int argument, they throws an exception.

Important Note
--------------

After using the reader, you have to call Close(). Especially, when you created XmlTextReader and XmlValidatingReader with file name argument, don't forget doing this.

XML Reader Tips
===============

Parsing documents without namespaces
------------------------------------

Sometimes (mainly for legacy documents), you might want to parse XML documents without correct namespaces. In such case, you can specify Namespaces = false on XmlTextReader.

Constructors
------------

There are many constructor overroads for XmlTextReader. As for entire XML document, it can be created from string URI, Stream or TextReader, with optional XmlNameTable and optional BaseURI (it is mainly useful with Stream or TextReader).

Alternatively, it can be created from XML content string, with NodeType and XmlParserContext arguments. XmlTextReader can be used to parse XML fragments. This constructor provides easy ways to parse an attribute or element content. It is actually used internally for DOM value setters.

XmlReader and DTD
-----------------

DTD (Document Type Definition) is used to constrain xml structure. It is not namespace-aware so it is not so recommended way to use it, but it had been commonly-used (since SGML, one of the ancestor of XML, have required DTD by design).

You might not know, but DTD does not only affect to "validity", but also to "well-formedness", so XmlTextReader which only supports well formedness check also consumes DTD.

If you don't want to read external DTD resources which might affect to the parser performance, you can set XmlResolver = null.

If you don't want to be reported any validation errors, you can specify ValidationEventHandler to XmlValidatingReader, or ValidationType = ValidationType.None. When you set the handler, it will never throw more validation errors unless you re-throw that error in your delegated method. Note that you cannot recover from any well-formedness errors.

