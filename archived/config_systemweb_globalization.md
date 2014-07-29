---
layout: obsolete
title: "Config system.web globalization"
lastmodified: '2008-06-25'
permalink: /archived/Config_system.web_globalization/
redirect_from:
  - /Config_system.web_globalization/
---

Config system.web globalization
===============================

An example of this [\<system.web\>]({{ site.github.url }}/Config_system.web "Config system.web") section is:

``` xml
<configuration>
        <system.web>
            <globalization
                        requestEncoding="utf-8"
                        responseEncoding="utf-8"
                        fileEncoding="iso-8859-15"
                />
        </system.web>
</configuration>
```

The \<globalization\> section can not have child nodes, it is only used to configure the following settings

#### Encodings

The encoding is any encoding that can be recognized by [http:/monodoc/M:System.Text.Encoding.GetEncoding(string) System.Text.Encoding.GetEncoding()]. In addition to all the string recognized there, the following shortcuts are recognized:

-   ucs-2, utf-16, utf-16le, unicode, iso-10646-ucs-2: UnicodeEncoding Little Endian.
-   utf-16be, unicodefffe: UnicodeEncoding Big Endian.
-   utf-8, unicode-1-1-utf-8, unicode-2-0-utf-8, x-unicode-1-1-utf-8,

x-unicode-2-0-utf-8: UTF8 Encoding.

*requestEncoding* if set, the encoding for parsing the request.

*responseEncoding* if set, the encoding used to generate the response.

*fileEncoding* if set, the encoding used by the source code.

#### Culture Configurations

*culture*: The culture used during page processing.

*uiCulture* The UI Culture used during page processing.

