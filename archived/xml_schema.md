---
layout: obsolete
title: "XML Schema"
lastmodified: '2006-05-20'
permalink: /archived/XML_Schema/
redirect_from:
  - /XML_Schema/
---

XML Schema
==========

Programming with XML Schema, by Atsushi Enomoto

XML Schema is one kind of the "schema language" such as DTD, RELAX NG, Schematron and so on. XML Schema is useful for "typed XML programming" with less expressiveness than Schematron or RELAX NG (or even DTD in a sense). XML Schema is one of the W3C Recommendation.

There are three parts of the specification: [primer](http://www.w3.org/TR/xmlschema-0/) , [structures](http://www.w3.org/TR/xmlschema-1/) and [datatypes](http://www.w3.org/TR/xmlschema-2/) .

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#using-xml-schema-with-systemxml">1 Using XML Schema with System.Xml</a></li>
<li><a href="#using-xmlschema-and-xmlschemacollection">2 Using XmlSchema and XmlSchemaCollection</a>
<ul>
<li><a href="#reading-writing-and-compiling-xmlschema">2.1 Reading, Writing and Compiling XmlSchema</a></li>
<li><a href="#xmlschemacollection">2.2 XmlSchemaCollection</a></li>
</ul></li>
<li><a href="#validating-xml-using-xml-schema">3 Validating XML using XML Schema</a>
<ul>
<li><a href="#general-purpose-use">3.1 General Purpose Use</a></li>
<li><a href="#handling-validation-errors">3.2 Handling Validation Errors</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Using XML Schema with System.Xml
================================

In System.XML.dll, it is System.Xml.Schema namespace that holds the classes for XML Schema. In that namespace, most of them represents XML Schema element types. For example, XmlSchemaElement represents "xs:element" and XmlSchemaChoice means "xs:choice" (here the prefix "xs" is used as mapped to "[http://www.w3.org/2001/XMLSchema](http://www.w3.org/2001/XMLSchema)" namespace URI).

There are several areas in which XML Schema is used:

-   Validation - We can use XmlValidatingReader to validate XML document against a set of schemas.
-   CLR type mapping - We can use xsd.exe to export CLR Types from XML Schemas.
-   Data column mapping - We can infer DataSet columns and relations from XML Schemas (it is not fully supported yet).

Moreover, note that Web service functionality is heavily dependent on the CLR type mapping.

Using XmlSchema and XmlSchemaCollection
=======================================

Reading, Writing and Compiling XmlSchema
----------------------------------------

In this section, the primary class is XmlSchema (System.Xml.Schema.XmlSchema). With this class, you can read and write an XML schema document for one namespace, using Read() and Write() methods.

(You can use XmlSerializer to read and write XmlSchema, but it is not recommended to use deserialization. Firstly, it does not support LineNumber, LinePosition and SourceUri. Secondly, it brings some namespace scoping problems in identity constraints i.e. XmlSchemaXPath when any prefixes are specified in the "xpath" attributes.)

After reading a schema into XmlSchema, you will have to call Compile() to check if the schema is really valid. Since you can build a schema structure manually, it might be invalid during the read and build process. Once you called Compile(), the Post Schema Compilation Information is set, and it is used for actual validation, type mapping, and so on.

However, note that usually you don't have to call Compile() by yourself. As described below, when you use XmlSchemaCollection, it will automatically compile the schema you would add.

XmlSchemaCollection
-------------------

By the way, XML Schema is designed as to handle one or more namespaces. How about multiple namespaces? XmlSchemaCollection class represents a collection of schemas. (In the forthcoming version of .NET 1.2, it will have the similar class named XmlSchemaSet, that is more conformant to W3C standard.

To add a schema to the collection, use Add() method. When you add a schema, the schema is compiled using Compile() if it is not compiled yet.

Validating XML using XML Schema
===============================

General Purpose Use
-------------------

In the sections above, I described how XML Schema documents can be read into XmlSchema and XmlSchemaCollection classes. Now, it is time to "use" these classes. Firstly this section describes how to validate XML instances against XML Schema.

XML Schema validation is done by XmlValidatingReader. It supports DTD validation and XML Schema validation.

XmlValidatingReader instance can be created from an XmlReader. Note that Microsoft .NET Framework supports only XmlTextReader as its input. Mono can handle any XmlReader.

To specify schemas, use Add() method of the Schemas property (that is type of XmlSchemaCollection).

Handling Validation Errors
--------------------------

Since XmlValidatingReader is represented as to handle many kinds of validation feature, it might be useless when you both have DTD and XML schema (e.g. DTD for entities and XML Schema for document structures).

Another use case is ignoring errors, when you just wanted to add Post Schema Validation Infoset to the document. (However, it is not highly recommended to depend on PSVI, since when you use it the document will become useless against other schemas anymore. That's the primary reason why RELAX NG is specified.)

In such cases, you can specify ValidationType property (type of ValidationType) as DTD, Schema, or None. When you specify "None", no validation errors are thrown.

You can also use ValidationEventHandler event (of type ValidationEventHandler delegate) to catch validation error manually. When you specified it, it also never throws any validation errors unless you rethrow the error in the delegated method.

