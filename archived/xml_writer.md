---
layout: obsolete
title: "XML Writer"
lastmodified: '2006-05-20'
permalink: /archived/XML_Writer/
redirect_from:
  - /XML_Writer/
---

XML Writer
==========

Writing XML documents with XmlWriter, by Atsushi Enomoto

XmlTextWriter API is used to write XML document to TextWriter, Stream or text file. There is an abstract XmlWriter class, but possibly you won't ave to make any difference between XmlTextWriter and XmlWriter. There is no other XmlWriter class in System.Xml namespace. If you are interested in another implementation, we have XmlNodeWriter in monodoc module.

XmlWriter is used widely in several XML classes.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#writer-methods">1 Writer Methods</a>
<ul>
<li><a href="#writing-elements">1.1 Writing Elements</a></li>
<li><a href="#writing-attributes">1.2 Writing Attributes</a></li>
<li><a href="#writing-content-strings">1.3 Writing Content Strings</a></li>
<li><a href="#writing-nodes-directly">1.4 Writing Nodes Directly</a></li>
<li><a href="#dont-forget-to-close">1.5 Don't Forget to Close</a></li>
</ul></li>
<li><a href="#xmlwriter-tips">2 XmlWriter Tips</a>
<ul>
<li><a href="#indentation">2.1 Indentation</a></li>
<li><a href="#namespace-handling">2.2 Namespace Handling</a></li>
<li><a href="#specifying-arbitrary-encoding-declaration">2.3 Specifying Arbitrary Encoding Declaration</a></li>
<li><a href="#allowing-multiple-top-level-element-content">2.4 Allowing multiple top-level element content</a></li>
<li><a href="#writestring-and-writecdata">2.5 WriteString() and WriteCData()</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Writer Methods
==============

Unlike XmlReader, you will use only writer methods.

Writing Elements
----------------

WriteStartElement() writes element start tag. After calling it, write contents subsequently. Finally WriteEndElement() call is required; it writes element end tag.

If you simply want to write only start tag, single content string and end tag, you can use WriteElementString().

When the element is empty, WriteEndElement() writes self-closing empty tag such like \<empty /\>. If you want to write full end tag, you can use WriteFullEndElement() and it writes \<empty\>\</empty\>.

Writing Attributes
------------------

If you want to write attributes inside the start tag, you can use WriteAttributeString() or WriteStartAttribute() after WriteStartElement().

When you called WriteStartAttribute(), write contents, and call WriteEndAttribute() to close attribute. Otherwise, you cannot write any content string anymore. The writer regards those method arguments as attribute value.

Writing Content Strings
-----------------------

WriteString() writes content string. If you want to write CDATA section, you can use WriteCData() instead. But note that WriteCData() throws an error when the argument string contains "\\]\\]\\\>", while WriteString() always escapes it.

If you want to write an entity reference inside string, you can use WriteEntityRef().

There are some useful methods:

-   WriteName() writes name string. It raises an error if the argument is not a valid name. WriteNmToken() is similar (checks if the argument is a valid NMTOKEN).
-   WriteChars() writes character array to the output. Usually you can do it by creating new string instance, but if you don't lose any performance for creating extraneous objects, it is convenient.
-   WriteQualifiedName() receives an XmlQualifiedName object and writes prefixed name to the output, where the prefix is mapped to the namespace which the argument indicates.

(How are namespaces mapped to prefixes? It is done when you called WriteStartElement() or WriteStartAttribute() with certain prefix and namespace URI, or when used WriteStartAttribute() to write xmlns attributes.)

Writing Nodes Directly
----------------------

If you want to save node to XmlWriter, there are some ways to do:

-   As for XmlNode instances, you can use WriteTo() method of the target node object, which takes an XmlWriter attribute.
-   As for XmlReader instances, you can use WriteNode() method of the XmlWriter. You can also take this way for XmlNodes, by creating XmlNodeReader.

(As for XPathNavigator, there is no standard way, but you can try my [XPathDocumentNavigator](http://www24.brinkster.com/ginga/XPathDocumentReader.cs.txt) . Note that it is an experimental implementation and not ready to stable use.

Don't Forget to Close
---------------------

When you finished all writing jobs, maybe you have to call Close() to close the text writer.

XmlWriter Tips
==============

Firstly, is should be warned that since there is no other public implementation than XmlTextWriter, we cannot distinguish if the behavior is XmlTextWriter specific, or common to XmlWriter interface (for example, what if we call WriteStartAttribute() with the same names? XmlTextWriter simply emits not well-formed XML).

Indentation
-----------

To specify indentation, you can set three properties:

-   Formatting property is an enumeration that specifies if the writer should indent or not. By default it never does indentation, so set Formatting = Formatting.Indented if you want to do.
-   IndentChar property is used to get or set the character which is used to indent.
-   Indentation property is used to get or set the amount of the indentation characters per one level depth.

Namespace Handling
------------------

Since some WriteStartElement() and WriteStartAttribute() overrides accept namespace URI, it stores in-scope namespaces internally (you can use LookupPrefix() to check if a namespace is bound to any prefixes). When WriteStartElement() is called with namespace URI, this XmlTextWriter stores the URI as in-effect namespace URI.

However, when you call WriteStartAttribute() (or WriteAttributeString() as well) with the same prefix and different namespace, it causes inconsistent result. The writer emits the attribute's namespace URI, while it internally treats the element's namespace as in-effect (so it will result in inconsistent namespace output for the element's contents, and inconsistent return value for LookupPrefix() ). It should be strongly avoided.

To make it worse, when you use these WriteStartElement() method with null namespace (or omitting namespace URI argument), it **does not**mean that the element belongs to the default namespace. When you use WriteStartElement() with String.Empty namespace, it **does**mean that the element belongs to the default namespace. This fact brings the result that WriteStartElement() with String.Empty also emits `xmlns="" `(default namespace removal), white WriteStartElement() with null never emits that.

Finally, you can write the element's namespace attribute at your favorite timing. When the same name attribute is already written, xmlns will be never written. When the writer is going to write the element's content or the end of the element, it writes the missing xmlns attribute (if any).

Specifying Arbitrary Encoding Declaration
-----------------------------------------

Since WriteStartDocument() only takes boolean "standalone" argument, there is no way to specify the nominal encoding. Encoding declaration is automatically set by the actual Encoding of the input TextReader, or never specified when you use Stream to create the XmlTextWriter instance. For example, you cannot specify arbitrary encoding when you use StringWriter (it returns UnicodeEncoding as its Encoding property) and call WriteStartDocument().

In that case, you can use WriteProcessingInstruction() like this:

    writer.WriteProcessingInstruction ("xml", "version='1.0' encoding='shift_jis'");

Since the name "xml" is prohibited for XML processing instruction, such method invokation should raise an error, but in fact XmlTextWriter actually passes this. And in fact, such way is used in some places such as WriteNode() (to copy the corresponding XmlDeclaration node) and XSLT outputter (to apply "encoding" attribute in "xsl:output" element).

(So this behavior should be documented clearly, otherwise another XmlWriter implementors might implement WriteProcessingInstruction() to reject PI nodes **conformantly**.

Allowing multiple top-level element content
-------------------------------------------

XML document entity must have exactly one element. However, sometimes we need to write more than one elements as output. In fact this "document element" check only works when you call WriteStartDocument(). So if you don't want to reject such XML, simply do not call that method.

But also wanted to write XML declaration (for example, write exteernal entity)? Then WriteProcessingInstruction() solution also applies here.

WriteString() and WriteCData()
------------------------------

For text content of an element, I would recommend to use WriteString() rather than WriteCData(), because WriteCData() throws an exception if the argument string contains "]]\>", while WriteString() has no "taboo".

