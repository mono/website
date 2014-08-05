---
title: "Config system.web authentication"
lastmodified: '2008-06-25'
redirect_from:
  - /Config_system.web_authentication/
  - /System.web_authentication/
---

Config system.web authentication
================================

The \<authentication\> directive appears inside the [\<system.web\>]({{ site.github.url }}/Config_system.web "Config system.web") section of Web.config and has the following format:

``` xml
<authentication mode="[None|Forms]">
    <forms name="cookiename" 
           path="path" 
           loginUrl="url" 
           protection="All|Encryption|Validation|None" 
           timeout="MM"
           requireSSL="[true|false]"
           slidingExpiration="[true|false]">
        <credentials passwordFormat="[Clear|SHA1|MD5]">
            <user name="user1" password="password1"/>
            <user name="user2" password="password2"/>
            ...
        </credentials> 
    </forms>
    <passport>
       <!-- Although passport is allowed in the config file, it is 
       not supported in Mono and will be ignored -->
    </passport>
</authentication>
```

Mono only supports the "None" and "Forms" authentication modes. "Forms" is the authentication used by ASP.NET forms. "None" means that no authentication is necessary. The unsupported options are "Windows" and "Passport".

If you choose "Forms", you can customize the authentication by introducing the \<forms\> element into your configuration.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#forms-authentication">1 Forms Authentication</a>
<ul>
<li><a href="#name">1.1 &quot;name&quot;</a></li>
<li><a href="#path">1.2 &quot;path&quot;</a></li>
<li><a href="#loginurl">1.3 &quot;loginUrl&quot;</a></li>
<li><a href="#protection">1.4 &quot;protection&quot;</a></li>
<li><a href="#timeout">1.5 &quot;timeout&quot;</a></li>
<li><a href="#requiressl">1.6 &quot;requireSSL&quot;</a></li>
<li><a href="#slidingexpiration">1.7 &quot;slidingExpiration&quot;</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Forms Authentication
--------------------

### "name"

This defines the cookie name to be used for the authentication for this application.

You should specify this cookie on a per-application basis since cookies are shared across multiple applications on a host/domain.

**Default value:** ".MONOAUTH"

### "path"

This is the path that will be set on the cookie used for authentication.

**Default value:** "/"

### "loginUrl"

This is used to specify the name of the login page that will perform the authentication when access to a page is restricted.

**Default value:** "login.aspx"

### "protection"

"Validation" stores the value in the cookie along with a validation key that will be used by the server to verify that the cookie value has not been modified. "Encryption" will encrypt the value of the cookie using DES or 3DES. "All" will do both, "Validation" and "Encryption". This is the default option and the recommended one. "None" will do no transformation to the cookie value.

**Default value:** "All"

### "timeout"

The timeout for the cookie to expire expressed in minutes.

**Default value:** "30"

### "requireSSL"

Set to true when the cookie is to be sent through SSL connections only.

**Default value:** "false"

### "slidingExpiration"

When set to 'true', the cookie expiration time is updated is extended from the last request using the cookie until 'timeout' more minutes.

**Default value:** "true"

