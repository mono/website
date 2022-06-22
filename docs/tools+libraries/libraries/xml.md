---
title: XML
redirect_from:
  - /XML/
  - /XML_Classes/
---

## Introduction

The XML library is used in several areas of Mono such as ADO.NET and XML Digital Signature (xmldsig). In this document we discuss System.Xml.dll and related tools.

This page does not include any ADO.NET classes which are available in other assemblies such as XmlDataDocument. Also, note that current corlib has its own XML parser class (Mono.Xml.MiniParser).

The System.XML.dll assembly is feature complete, this document tracks bugs or ideas for improving it.

## Mono 1.0 Features

### System.Xml namespace

#### Document Object Model (Core)

The DOM implementation is complete and our DOM implementation scores better than MS.NET as to the NIST DOM test results (which was ported by the Mainsoft hackers and is part of our unit tests).

#### Xml Writer

In System.Xml.dll, XmlWriter is almost equivalent to XmlTextWriter. If you want to see another implementation, check XmlNodeWriter.cs and DTMXPathDocumentWriter.cs in System.XML sources. XmlTextWriter is completed, though it looks a bit slower than MS.NET (I tried 1.1).

#### XmlResolver

XmlUrlResolver is implemented. XmlSecureResolver, which is introduced in MS .NET Framework 1.1 is basically implemented, but it requires [CAS (code access security)](/docs/advanced/cas/) feature. We need to fixup this class after ongoing CAS effort works. You might also be interested in some improved implementations which resides in Mono.Xml.Ext.dll.

#### XmlNameTable

NameTable is implemented, but also needs performance improvement. Optimization hackings are welcome.

#### XML Reader

XmlTextReader, XmlNodeReader and XmlValidatingReader are almost finished.

-   All OASIS conformance test passes as Microsoft does. Some W3C tests fail, but it looks better than Microsoft.

-   Entity expansion and its well-formedness check is incomplete. It incorrectly allows divided content models. It incorrectly treats its Base URI, so some dtd parse fails.

-   I won't add any XDR support on XmlValidatingReader. (I haven't ever seen XDR used other than Microsoft's BizTalk Server 2000, and Now they have 2002 with XML Schema support). If anyone contributes an implementation, it would be still nice. XmlTextReader and XmlValidatingReader should be faster than now. Currently XmlTextReader looks nearly twice as slow as MS.NET, and XmlValidatingReader (which uses this slow XmlTextReader) looks nearly three times slower. (Note that XmlValidatingReader wouldn't be so slow as itself. It uses schema validating reader and dtd validating reader.)

#### Some Advantages

The design of Mono's XmlValidatingReader is radically different from that of Microsoft's implementation. Under MS.NET, DTD content validation engine is in fact simple replacement of XML Schema validation engine. Mono's DTD validation is designed fully separate and does validation as normal XML parser does. For example, Mono allows non-deterministic DTD. Another advantage of this XmlValidatingReader is support for *any* XmlReader. Microsoft supports only XmlTextReader (this bug is fixed in .NET 2.0, taking shape of XmlReader.Create()). ~~I added extra support interface named "IHasXmlParserContext", which is considered in XmlValidatingReader.ResolveEntity().~~This is now made as internal interface. Microsoft failed to design XmlReader so that XmlReader cannot be subtree-pluggable (i.e. wrapping use of other XmlReader) since XmlParserContext shoud be supplied for DTD information support (e.g. entity references cannot be expanded) and namespace manager. This design bug seems fixed in XmlDictionaryReader in WinFX (In .NET 2.0, Microsoft also supported similar to IHasXmlParserContext, named IXmlNamespaceResolver, but it still does not provide DTD information.)

We also have RELAX NG validating reader (described later).

### System.Xml.Schema namespace

Basically it is completed. You can test how current schema validation engine is complete (incomplete) by using standalone test module (see mcs/class/System.XML/Test/System.Xml.Schema/standalone_tests). At least in my box, msxsdtest fails only 30 cases with bugfixed catalog - this score is better than that of Microsoft implementation. But instead, we need performance boost. There should be many points to improve schema compilation and validation.

#### Schema Object Model

Completed, except for some things to be fixed:

-   ContentTypeParticle for pointless xs:choice is incomplete (fixing this arose another bugs in compilation. Interestingly, MS.NET also fails around here, so it might be nature of ContentTypeParticle design)

-   Some derivation by restriction (DBR) handling is incorrect.

#### Validating Reader

Basically this is implemented and actually its feature is complete, but I have only did validation feature testing. So we have to write more tests on properties, methods, and events (validation errors).

### System.Xml.Serialization namespace

Lluis Sanchez is the maintainer of this namespace (as well as System.Web.Services). XmlSerializer is almost finished and is on bugfix phase. However, we appreciate more tests.

-   System.Web.Services to invoke SOAP services.

-   xsd.exe and wsdl.exe to create classes.

If you find any problems, please file a [bug report](/community/bugs/)

Lluis also has built an interesting standalone system test. It is located in mcs/class/System.Web.Services/Test/standalone.

You might also interested in "genxs", which enables you to create custom XML serializer. See "tools" section discussed later. There is also "sgen" that is introduced in .NET 2.0.

### System.Xml.XPath and System.Xml.Xsl namespaces

XslTransform is finished work. Historically we had "unmanaged XSLT" which used libxslt, but now we only have managed implementation.

msxsl:script is supported. It would be nice if we can support [EXSLT](http://www.exslt.org/). [Microsoft has tried to do some of them](http://msdn.microsoft.com/WebServices/default.aspx?pull=/library/en-us/dnexxml/html/xml05192003.asp), but it is not successful because of System.Xml.Xsl design problem:

-   In general, .NET's "extension objects" (including msxsl:script) is not useful to return node-sets. (MS XSLT implementation rejects just overriden XPathNodeIterator, but accepts only their hidden classes. And the same thing applies to Mono though classes are different.)

-   In .NET's extension object design, extension function name is a valid method name that cannot contain some characters such as '-'. That is, implementing EXSLT in C# is impossible. So if we support EXSLT, it has to be done inside our System.XML.dll. Microsoft developers are also aware of this problem and some of them wish to have EXSLT support in WinFX (not whidbey). If anyone is interested in it, it would be nice.

Our managed XSLT implementation is slower than MS XSLT for some kind of stylesheets, and faster for some.

### RELAX NG

Atsushi implemented an experimental RelaxngValidatingReader. It is completed, except for some remaining simplification bugs. See mcs/class/Commons.Xml.Relaxng/README for details. Currently we have:

-   Custom datatype support. Right now, you can use XML schema datatypes ( [<http://www.w3.org/2001/XMLSchema-datatypes>](http://www.w3.org/2001/XMLSchema-datatypes) ) as well as RELAX NG default datatypes (as used in relaxng.rng).

-   RELAX NG Compact Syntax support, though not solid yet. See Commons.Xml.Relaxng.Rnc.RncParser class.

## Forthcoming Mono 1.2 Features

### Summary

NOTE: some of the description is now obsoleted.

Microsoft released the RTM version of .NET Framework 2.0, so we are catching up with the latest API.

System.Xml 2.0 contains several features such as:

-   new XPathNavigator members that supports editing XmlDocument

-   XmlReaderSettings, XmlWriterSettings and factory methods

-   Strongly typed XmlReader, XmlWriter and XPathNavigator.

-   XML Schema design changes

-   XSD Inference

-   Well-documented and improved XmlSerializer.

-   Compiled XSLT transformer

### System.Xml 2.0

#### XmlReader and XmlWrier

In .NET 2.0, XmlTextReader and XmlValidatingReader are obsolete and XmlReader.Create() is recommended. Similarly, there are XmlWriter.Create() overloads. They are mostly done.

XmlReader is supposed to support strongly-typed data reading. They are based on W3C "XML Schema Datatypes" Recommendation and "XQuery 1.0 and XPath 2.0 Data Model" Working Draft.

Note that this W3C specification is just a Working Draft and there might be incompatible changes for those strongly-typed API. For example, in the latest version of the spec (as of November 2004), xs:QName is specified as to have prefix, local name and namespace URI, while .NET XML classes just treat it as XmlQualifiedName which does not contain prefix. So this part of API might become obsolete or useless.

Most of XmlReader.ReadContentAsXxx() and XmlWriter.WriteValue() overloads are implemented, based on internal XQueryConvert (it is a historical implementation in 2.0 beta versions).

XmlReader.ReadSubtree(), XmlWriter.WriteSubtree() and XPathNavigator.ReadSubtree() are implemented, though not well-tested. They are based on Mono.Xml.SubtreeXmlReader and Mono.Xml.XPath.XPathNavigatorReader classes.

### System.Xml.Schema 2.0

Since .NET 1.x is not so compliant with W3C XML Schema specification, Microsoft had to redesign System.Xml.Schema classes. We also have to change many things.

-   There are ElementSchemaType and AttributeSchemaType. They do not expose XmlSchemaDatatype unlike ElementType and AttributeType. Primitive types are represented as XmlSchemaSimpleType instances. Similarly, there is BaseXmlSchemaType instead of BaseSchemaType. Note that XmlSchemaDatatype itself is not deprecated.

-   "XQuery 1.0 and XPath 2.0 Data Model" datatypes (such as xdt:dayTimeDuration) are newly supported. They are partially implemented.

-   schema structures are now bound in parent-child relationship. With related to it, there seems bunch of schema compilation bugfixes.

-   XmlSchemaCollection is not used anymore to represent effective set of schemas. Instead, new XmlSchemaSet class is used. It should affect on schema compilation design.

In .NET 2.0, there is an XML Schema inference implementation. The API (or implementation design) is not cool and Microsoft will make changes in later version of beta or .NET Framework.

It is (somewhat) exposed XML Schema validation functionality. It enables developers to get expected particles and attributes. Actually it is internally used to implement XmlReader.Create() with XmlSchemaSet.

### System.Xml.XPath and System.Xml.Xsl 2.0

In System.Xml 2.0, XPathNavigator has many editing API. It enables developers to edit XmlDocument (not for XPathDocument; it is read-only).

In .NET 2.0 Microsoft brought a fresh XSLT implementation named XslCompiledTransform. It is almost the same as System.Xml.Xsl.XslTransform from the API aspect, but this class transforms documents faster than XslTransform. Instead, stylesheet compilation is slower, because it generates compiled stylesheet dynamically.

We don't have XslCompiledTransform, and will not be available in Mono 1.2.

### Mono.Xml.Ext

(**IMPORTANT**: There used to be System.Xml.Query.XQueryCommand class that implemented XQuery, but now Microsoft dropped it for .NET 2.0. So we moved them out to external assembly named Mono.Xml.Ext.dll, but I haven't changed thing so much when I just extracted them. Thus, this section is kept as is, and basically old stuff.) Mono.Xml.Ext.dll contains mainly XQuery implementation, and some utility classes. XQueryCommand implements XQuery. XQuery is a new face XML document manipulation language (at least new face in .NET world). It is similar to XSLT 1.0, but extended to support XML Schema based datatypes (and it is not XML based language). It is similar to XPath 1.0, but it can construct XML nodes. It has no complicated template resolution, but works like functional languages. Under MS.NET, XQuery implementation is mainly in System.Xml.Query and MS.Internal.Xml.

-   namespaces. The implementation is mostly in System.Xml.dll. It is also true to our System.Xml.dll. Our XQueryCommand in System.Data.SqlXml.dll just invokes the actual XQuery processor (Mono.Xml.XPath2.XQueryCommandImpl) which resides in System.Xml.dll via reflection. Currently we are not implementing MS.Internal.Xml.

-   classes. MS implementation is based on an old version of the W3C specification, and our implementation is currently based on [23 July 2004 version](http://www.w3.org/TR/2004/WD-xquery-20040723/) (latest as of now) of the working draft.

XQuery implementation tasks are:

-   XQuery syntax parser that parses xquery string to AST (abstract syntax tree). -> partly not done.

-   XQuery AST compiler into static context -> partly not done.

-   XQuery (dynamic context) runtime = XQuery expression evaluator + sequence iterator. -> partly not done.

-   XPathItem data model and (mainly) conversion support. -> partly done.

-   Applied expression classes for XQuery/XPath 2.0 functions and operators. -> partly done.

-   Optimization, and design per-query assembly code generator (later)

It already handles some queries, while major part implementation is missing or buggy (like FLWOR, expressions for sequence type handling, built-in function support etc.).

### Relax NG and DSDL in Mono 1.2

Currently we support those ISO DSDL effort:

-   Part 2: RELAX NG (Structures/Compact Syntax)
-   Part 4: Namespace-based Validation Dispatch Language (NVDL)

There is existing Schematron implementation, namely [NMatrix Project](http://sourceforge.net/projects/dotnetopensrc/). With a few changes, it can be used with mono.

In Mono 2.0, there are some improvements:

-   RelaxngPattern.Compile() now provides error location.

-   RelaxngValidatingReader now supports "expected label collector" API; You can get name list of expected element names and attribute names by simulating validation. In Mono 2.0, there might be improvements on Commons.Xml.Relaxng.

-   We now supports NVDL, multi-schema based validation support. The final committee draft of NVDL is [here](http://www.asahi-net.or.jp/~eb2m-mrt/dsdl/). Thre are some discussions related to NVDL on [W3C public-schemata-users](http://lists.w3.org/Archives/Public/public-schemata-users/) mailing list.

There are still missing bits:

-   The type of simplification error should be kind of RelaxngGrammarException.

-   Right now there is no ambiguity detection implementation that would be useful for RelaxngPattern based xml serialization (if there is need).

-   Because of lack of ambiguity detection, there is no way to provide XmlMapping XmlTypeMapping/XmlMemberMapping). But If anyone is interested in such effort, integration with XmlSerializer would be interesting task.

## Tools

### xsd.exe

See [ADO.NET page](/docs/database-access/adonet/). Note that xsd.exe does not support XmlSchemaInference in System.Xml 2.0.

### genxs.exe

genxs.exe is a custom XmlSerializer code generator. This is Mono exclusive advantage. See [Lluis's description](http://primates.ximian.com/~lluis/blog/pivot/entry.php?id=6) and manpages for details. Code files are in mcs/tools/genxs.

### sgen.exe

sgen.exe is an alternative XmlSerializer code generator which is based on XmlSerializer.GenerateSerializer() introduced in .NET 2.0, written by Lluis. Code files are in mcs/tools/sgen.

### dtd2xsd.exe / dtd2rng.exe

It is a tiny tool that enables conversion from DTD structure to XML Schema. It runs only under mono, since it depends on our XmlTextReader internals.

Based on dtd2xsd internal, we also support conversion from DTD to RELAX NG.

## Beyond Mono 1.2

### XML functionality in WinFX

There seems some improved XML libraries in WinFX, taking shape of System.Runtime.Serialization.dll. The functionality seems mainly for Windows Communication Foundation (Indigo). We have almost-stubbed sources of this library, but it is not actively developed yet.

### XLinq

In C# 3.0, the next development version of C#, includes a new feature named "Linq". Linq brings language-integrated data query functionality to C#. The bindings are "DLinq" for databases and "XLinq" for XML documents.

We have a simple hacky XLinq implementation, but since the core of Linq (such as Sequence) are not implemented, it is practically not working. This development might resume when the related class libraries got documented.

Though C# 3.0 is the most related language to Linq, there are other languages (for example, Nemerle has own macro functionality) that would be useful to realize Linq feature.

You might also want to learn about PHP5 simpleXML API for its automatic structure inference.

## Miscellaneous

### Mutual assembly dependency

Sometimes I hear complain about System.dll and System.Xml.dll mutual dependency: System.dll references to System.Xml.dll (e.g. System.Configuration.ConfigXmlDocument extended from XmlDocument), while System.Xml.dll vice versa (e.g. XmlUrlResolver.ResolveUri takes System.Uri). Since they are in public method signatures, so at least we cannot get rid of these mutual references. Nowadays System.Xml.dll is built using incomplete System.dll (lacking System.Xml dependent classes such as ConfigXmlDocument). Full System.dll is built after System.Xml.dll is done. Note that you still need System.dll to run mcs.

Atsushi Eno (<atsushi@ximian.com>) latest update: 12/22/2005
