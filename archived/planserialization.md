---
title: "PlanSerialization"
lastmodified: '2010-07-30'
permalink: /archived/PlanSerialization/
redirect_from:
  - /PlanSerialization/
---

PlanSerialization
=================

This document describes the serialization strategies to provide compatibility across different versions of Mono, and to provide a compatibility bridge between serialized classes across differing class implementations between Mono and other runtimes like the Microsoft .NET runtime

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#background">1 Background</a></li>
<li><a href="#possible-solutions">2 Possible Solutions</a>
<ul>
<li><a href="#private-attributes">2.1 Private Attributes</a></li>
<li><a href="#implementing-iserializable">2.2 Implementing ISerializable</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Background
==========

The serialization infrastructure in the CLI defaults has two modes of serialization: a class-controlled serialization and automatic serialization.

The class-controlled serialization is used when a class implements the System.Runtime.Serialization.ISerializable interface, which exposes the GetObjectData method. These classes also expose a constructor that take two arguments: SerializationInfo and StreamingContext.

Smaller classes opt for automatic serialization, these classes must be flagged with the "Serializable" attribute and the runtime will take care of serializing the private fields.

The second class of serialization has a problem, whatever gets serialized depends on the internal implementation of a class, and this tends to break compatibility between the Mono implementation and the Microsoft implementation.

Sometimes this compatibility problem can be fixed by renaming our internal fields to match the names of the Microsoft code. Sometimes it requires re-architecting our internal code to match the publicly exposed fields and sometimes our implementations are so different that matching the serialization is not possible.

This message has some background:

       But one change which was particularly annoying was one dealing with
    the way that MS Color is serialized.  They have a concept of "Known
    Colors", and if a flag in the serialization is set, the color is
    initialized from a known color index.   

       The idea is fine, but mixed with serialization it means that we do
    not get a chance to compute the color RGB values in advance, but have
    instead to compute the values on demand, the first time the values are
    accessed.   For the current code changes that we had to do, look for the
    "R" property for example:

    http://anonsvn.mono-project.com/viewvc/trunk/mcs/class/System.Drawing/System.Drawing/Color.cs?rev=61426&view=auto

But this problem is not limited to Mono and .NET interoperability with serialized classes. This problem also affects interoperability of code between versions of .NET. As .NET evolves, the internal implementation of .NET classes changes and compatibility across machines running different versions of .NET breaks.

To address this problem, .NET 2.0 introduced version-tolerant serialization (documentation is [here](http://www.codeguru.com/csharp/.net/net_general/netframeworkclasses/article.php/c9297/) and [here](http://msdn2.microsoft.com/en-us/library/ms229752.aspx)).

Version tolerant serialization introduces a few new attributes: OptionalField is applied to fields the OnSerializing and OnDeserializing attributes are applied to methods that will be invoked to serialize a class.

This basically turns classes that were flagged as [Serializable] into classes that will do class-driven serialization for compatibility purposes.

The problem with this approach is that it is only available for 2.0 based applications; 1.0 based applications will not benefit from this.

Possible Solutions
==================

An implementation of the 2.0 support by Robert Jordan is waiting for review to be checked in, and is available [here](http://bugzilla.novell.com/show_bug.cgi?id=MONO78594).

The 2.0 version tolerant serialization will be included in Mono, but the issue is: how can we provide this for the 1.0 profile. There are a couple of alternatives.

Private Attributes
------------------

Since this stuff is genuinely useful, I was considering whether we could make our 1.1 implementation support it, but to avoid exposing a non-existent 1.1 type, we could do a name-based attribute lookup on the methods and if we find that there is such an attribute, we could perform the same tasks that 2.0 does. This means that 1.1 assemblies could get the 2.0 "hooks" by including their own copy of the attribute. The only issue here is whether this would not have a negative performance impact.

The second issue is: how do we cope with deserialization in the future without having to change our internals extensively? And I think that if we extend the serialization framework we can do this.

We could introduce some \*extra\* attributes that are specific to Mono, and that are applied to the type. If such attribute is found, it would instruct the deserializer to not perform the manual deserialization/serialization, but instead use an ISerializable-like approach on that given class, this would give us the control we need.

Implementing ISerializable
--------------------------

We could also sprinkle ISerializable into a number of classes, but this would significantly change the public contract that we expose. An argument has been made that as long as we do not document it, it could be fine, but am not so sure that this is such a great idea.

Alternatively, we could have these classes implement an \_\_ISerializable interface (the double underscore meaning "this is really an internal interface, not something you would implement normally").

In our actual implementation, we could write something like this:

``` csharp
#if !NET_2_0
using ISerializable = __ISerializable;
#endif
 
// A class that implements ISerializable in 2.0, but not in 1.0
class Something : ISerializable {
   ...
}
 
// A class that does not implement ISerializable in 1.0 or 2.0
class Something : __ISerializable {
   ...
}
```

We would have to alter our code in Mono that might check for whether something is ISerializable to also check for \_\_ISerializable (it happens in a few formatters).

This is a problem though, although we can fix our class libraries, the above solution would not work with custom formatters that are not aware of this new \_\_ISerializable framework. Lluis points out that we can encapsulate some of this logic in "ObjectManager", but the use of ObjectManager is not mandatory by formatters, so we might miss a few.

