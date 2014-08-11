---
title: "Using XML"
lastmodified: '2011-07-27'
redirect_from:
  - /Using_XML/
---

Using XML
=========

What is XML?
============

[XML](http://www.w3.org/XML/) (e **X**tensible **M**arkup **L**anguage) is a Web Standard formed by the W3C ( [the World Wide Web Consortium](http://www.w3.org/) ). It is widely used for several purposes, including as data files, document files, or for message transfer. For example XHTML is one use of XML, and all OpenOffice.org files use XML. There are lots of tools and APIs available to deal with xml. XML can be easily edited by hand. XML is so semi-structured data format that it is flexible enough to be convertible to another system.

Programming with XML in Mono
============================

Mono provides a rich library of classes for using XML.

We support all that the Microsoft.NET Framework provides in the System.XML.dll assembly, this has three main ways of processing XML:

-   Pull reader (XmlReader)
-   DOM reader (XmlDocument)
-   LINQ (XDocument)

The following are links to discussions of the XmlReader and XmlDocument:

-   Read and validate XML documents using [XML Reader](/XML_Reader "XML Reader")
-   Write XML documents using [XML Writer](/XML_Writer "XML Writer")
-   Manipulate XML document sutucture with Document Object Model
-   Build XML document sutucture with [XML Schema](/XML_Schema "XML Schema")
-   Convert structured XML documents into CLR Types with XML Serializer
-   Traverse XML documents with XPath and [XPathNavigator](/XPathNavigator "XPathNavigator"), a very powerful Query language.
-   Transform XML documents into another XML document, with an XSLT stylesheet and XslTransform

Mono also supports the entire [LINQ to XML](http://msdn.microsoft.com/en-us/library/bb387098.aspx) stack. This stack provides a much simpler set of abstractions for querying and constructing XML documents.

We also support many ADO.NET classes as well.

-   Treat XML documents as a set of data tables with ADO.NET


