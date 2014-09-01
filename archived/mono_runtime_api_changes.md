---
title: "Mono Runtime API Changes"
lastmodified: '2009-08-18'
redirect_from:
  - /Mono_Runtime_API_Changes/
---

Mono Runtime API Changes
========================

API changes that we need to make to the Mono Runtime for Mono 2.8:

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#tasks">1 Tasks</a></li>
<li><a href="#api-incompatibilities">2 API incompatibilities</a></li>
<li><a href="#api-improvements">3 API improvements</a></li>
<li><a href="#api-additions">4 API Additions</a></li>
<li><a href="#open-for-debate">5 Open for debate</a>
<ul>
<li><a href="#open-questions">5.1 Open questions</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Tasks
=====

Drop the MONO_ZERO_LEN_ARRAY from the public header files currently based on the \_\_GNUC\_\_.

-   Instead use a mono-configuration.h for the system where MOno is compiled.

-   or, define MONO_ZERO_LEN_ARRAY to be the empty string so as to depend on the C99 flexible array feature. This avoids the issues with installing a build-time header mono-configuration.h (see shenanigans with glib-config.h in the glib package, not to mention the issues with having an installed header customized for a particular compiler). Note that GCC claim support for C99 flexible arrays since at least GCC 3.0, and C99 is a 10 year old standard already

Drop the current verifier API and make it saner. On its current form it is not very usable and it returns a GList, which is not very helpful.

Drop all uses of glib on public API. This will make the transition to eglib possible.

Make use of the upcoming error handling API in all functions that mutate the runtime state. This is a pretty wide change as a huge number of functions will change signature.

API incompatibilities
=====================

|API/ABI issue|Solution/workaround|
|:------------|:------------------|
|libmono will have a different soname and the mono header files will be in a different place.|Use pkg-config --cflags mono2 and pkg-config --libs mono2 to compile and link, respectively, instead of using the old "mono" package name.|
|The GLib header will no longer be included in mono header files, since no GLib type will be used in the public functions.|Include glib.h in your own files if you use GLib functionality. You'll also need to use pkg-config --cflags glib-2.0 and pkg-config --libs glib-2.0 to compile and link, respectively|
|The MonoType struct will become opaque.|Use the existing accessor functions instead of peeking inside the fields directly.|
|The MonoMethodSignature struct will become opaque.|Use the existing accessor functions instead of peeking inside the fields directly.|
|The MonoMarshalSpec struct will be hidden and all the public functions using it will become private.|If you need to access the marshal info you'll have to decode from the metadata tables.|
|The MonoRemoteClass struct will be removed along with the mono_remote_class() function.|Embedders should have no need to access this struct.|
|Managed structs and classes containing references cannot be freely manipulated any longer, to take into consideration the moving GC.|Every time a reference field (or a valuetype containing in any way a reference field) is set, it must be done using one of the mono_gc_wbarrie\*() set of funtcions. This applies also to arrays containing references.|
|The MonoObject, MonoArray and MonoString structs may become opaque.|Use only the existing accessor macros and functions to access their internals.|
|The MonoAssemblyName struct will become opaque.|Ways to allocate it and access it will be provided.|
|The mono_image_add_to_name_cache() functions will be removed.|There is no use for it for embedders.|
|The MonoCustomAttrInfo and MonoCustomAttrEntry structs will become opaque|Appropriate accessors will be available.|
|The MonoReflectionMethodAux struct will e removed|There is no use for it for embedders.|
|The sizes and lobounds fields in MonoArrayType will change type to a pointer-sized integer.|Don't make assumptions about the fields (in particular that you could create large arrays on 64 bit systems) until the ABI break point.|
|The current verify interface will be removed. It's use is debatable so we need feedback from use about it's need.|The right solution for most users is to enable CoreCLR security.|
|The current loader error system will disappear together with it's API. This is a semantic change that is an implicit part of the API.|The new way will be more reliable and less forgiving, so it should be a clean win for users.|

API improvements
================

Extend the runtime API to handle generics. This is often requested on MDL.

Change functions like mono_method_get_param_names and mono_method_get_marshal_info to return failure.

API Additions
=============

Add functions to retrieve all parameter information such as flags. Maybe a single function that return a [name, flags, marshal_info?] tuple.

Open for debate
===============

Make most, if not all, Mono\* types opaque so we can more easily change their internals. Some structs are used as input and the user is supposed to fill them so they have to remain there.

Most functions will take an extra MonoError struct to provide better error handling. If we do that, this will break a huge ammount of functions. Should we keep the old unsafe equivalents?

### Open questions

Should we provide some sort of backward compatibility with the V1 API using symbol renaming and linker tricks such as the one libc uses?

