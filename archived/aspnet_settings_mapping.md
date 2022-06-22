---
title: "ASP.NET Settings Mapping"
lastmodified: '2008-03-01'
redirect_from:
  - /ASP.NET_Settings_Mapping/
---

ASP.NET Settings Mapping
========================

**by Marek Habersack**

**Note: this document applies to the SVN trunk version of Mono (as of 01 March 2008) and to Mono 1.9 and newer**

**Note: as of svn trunk revision 91160, the application-specific settings mapper configuration file name has changed to settings.map.config**

When developing ASP.NET applications which may be ran by the end user on either MS.NET/ISS or Mono/XSP/mod_mono, one may face a limitation of the .NET configuration system - the lack of conditional configuration constructs. Being unable to use different configuration settings for different operating systems/platforms, means that most of the time it is necessary to provide separate set of config files for every operating environment that differs to the other ones we support.

One example when such need arises is the usage of the WebParts feature of ASP.NET 2.0. As you may know, Mono currently does not support that feature and so applications which can optionally use it (like, e.g. MojoPortal) need to ship with a special configuration for Mono which excludes the WebPart configuration settings. Using settings mapping, it is possible to ignore the configuration sections related (and unsupported) by Mono.

Another, perhaps more common, scenario are file paths used in the Web.config file. Windows and Unix use different directory separator characters, Windows supports drive letters while Unix does not use them, a different character is (by convention) used to separate PATH-style variables under Windows (:) and Unix (;). While all those differencies can be dealt with easily in the application source code, it is not so for configuration files. A custom settings mapper can take care of the adjustments for you, seamlessly modifying "canonical" file paths used in the config file to the operating system the application runs on.

A new Mono-specific feature has landed in the SVN trunk a few days ago which hopes to address the problem - the Settings Mapping Manager. What it does, in short, is to load its own configuration file which describes how to map configuration settings for different operating systems. This is done dynamically on the execution time, so you no longer need to worry about providing separate configuration files - you can make them adjust to the runtime operating system. The feature has been designed so that it has the smallest possible impact on application performance. The feature is available only for the 2.0 profile, that is - it is supported only with ASP.NET 2.0 and newer applications.

This document introduces all the components of the mapping system and shows an example of how to implement your own settings mapper.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#settings-mapping-manager">1 Settings Mapping Manager</a></li>
<li><a href="#inhibiting-the-settings-mapping">2 Inhibiting the settings mapping</a></li>
<li><a href="#the-settingsmap-file">3 The settings.map file</a>
<ul>
<li><a href="#the-global-settingsmap-file">3.1 The global settings.map file</a></li>
<li><a href="#settingsmap-syntax">3.2 settings.map syntax</a></li>
<li><a href="#sample-settingsmap-file">3.3 Sample settings.map file</a></li>
</ul></li>
<li><a href="#creating-a-custom-mapper">4 Creating a custom mapper</a></li>
<li><a href="#example-mapper-code">5 Example mapper code</a>
<ul>
<li><a href="#appsettingsmapper-source-code">5.1 AppSettingsMapper source code</a></li>
<li><a href="#defaultaspx">5.2 default.aspx</a></li>
<li><a href="#webconfig">5.3 Web.config</a></li>
<li><a href="#settingsmapconfig">5.4 settings.map.config</a></li>
</ul></li>
<li><a href="#final-notes">6 Final notes</a></li>
</ul></td>
</tr>
</tbody>
</table>

Settings Mapping Manager
------------------------

SettingsMappingManager is a simple class in the Mono.Web.Util (in the Mono.Web.dll assembly, available only for the 2.0 profile) namespace which loads the settings mapper configuration from the 'settings.map' file found in the global configuration files directory (\$prefix/etc/mono/2.0/ on Unix) and from the application-specific 'settings.map.config' file in the top-level directory of your ASP.NET application. The files are read only during the application startup phase, just after the web configuration system is initialized. It is important to remember that, since uploading a 'settings.map' file to your application root after it has been started will NOT have the desired effect - the uploaded file will be ignored until the next time the application is started. Mapping file in the application directory is loaded after the global one and it can override all the mappings defined in the latter location. After the mapping settings are loaded the Settings Mapping Manager does nothing until a section is requested from the configuration system using code similar to:

``` csharp
MembershipSection ms = WebConfigurationManager ("system.web/membership") as MembershipSection;
```

The returned section, if any, will be mapped by the SettingsMappingManager if any mappers are defined for that particular section type and the operating system the application executes under. The result is cached for performance until configuration file(s) are reloaded and the application is restarted to reflect the configuration changes.

Inhibiting the settings mapping
-------------------------------

If you don't want the mapping to be performed while your application runs, you can turn it off in one of two ways. The first way is to set an environment variable before starting your web server - `MONO_ASPNET_INHIBIT_SETTINGSMAP`. The presence of the variable is checked for during the SettingsMappingManager initialization phase, very early in the application startu process. The other way is to put the following fragment in your ASP.NET application's root Web.config file:

``` xml
<appSettings>
    <add key="MonoAspnetInhibitSettingsMap" value="anything"/>
</appSettings>
```

The settings.map file
---------------------

As described above, the file may be found in two locations - the global configuration directory, as shipped with Mono, and the top-level ASP.NET application directory where the file is named `settings.map.config` (the *.config* extension is protected from downloading on all .NET systems). It is an XML file which assigns settings mappers to configuration section handler types and describes the way in which the mappings are to be performed.

The mappings are described in a very generic way so that the actual mapping steps can be performed by the mapper class in the most flexible way possible. Each mapper is defined for a specific operating system and is not loaded when application doesn't run on that operating system.

### The global settings.map file

Mono ships a default mapping file which, currently, defines two mappings - one for the Membership Section and the other for the Role Manager section. The two mappers change the default provider definitions for, respectively. Membership and Role providers when running under Unix so that they don't use the MS SQL databases/providers (which are unsupported under Unix) but instead use the (also recently added to Mono) respective Sqlite providers. The affected provider definitions are named 'AspNetSqlMembershipProvider' and 'AspNetSqlRoleProvider'.

### settings.map syntax

The root element of the mapping file must be the 'settingsMap' tag:

``` xml
<?xml version="1.0" encoding="utf-8"?>
<settingsMap>
</settingsMap>
```

Only two tags are supported as children of the root node: *clear* and *what*.

The *clear* tag simply clears the collection of mappers collected so far. It takes no attributes and is useful when you want to override/nullify the effect of the global mappers shipped by mono.

The *map* tag defines a mapper for a particular configuration section:

``` xml
<map sectionType="[Full Section Handler Type]"
     mapperType="[Full Mapper Type]"
     platform="[Platform]">
```

The *sectionType* attribute names the assembly-qualified type of the configuration section handler which the mapper will process. The *mapperType* names the assembly-qualified type of the mapper class itself. The *platform* atribute takes the value of one of Windows or Unix to specify which platform the mapper is valid for.

The *map* element can contain any number of the *what* tag instances. Each *what* tag defines a mapper-specific region the mapper will work on:

``` xml
<what value="[anything]">
```

Contents of the *value* attribute is understood only to the mapper and can be any expression supported by it to denote the associated section region to work on. The *what* element can contain any number of instances of several child tags, described below.

-   **clear** - remove all the settings defined by the configuration section region denoted by the 'what' tag
-   **add** - add a new setting to the configuration section region.
-   **replace** - replace the contents of the specified setting inside the configuration section region with a new value (or set of values)
-   **remove** - remove the specified setting from the configuration section contents

All of the tags above take any number of undefined attributes, all of which are read verbatim and stored for mapper use. Their names and values are not processed by the Settings Mapping Manager, as the manager doesn't understand the configuration section being mapped. The mapper is free to interpret the atributes and their values in any way it sees fit to perform the mapping. Even more so, the meanings of the child tags described above can change from mapper to mapper if it is necessary. This approach allows for the maximum flexibility while preserving common configuration syntax for all the mappers.

### Sample settings.map file

This is the global settings.map file as currently shipped with Mono:

``` xml
<?xml version="1.0" encoding="utf-8" ?>
<settingsMap>
  <map sectionType="System.Web.Configuration.MembershipSection, System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
       mapperType="Mono.Web.Util.MembershipSectionMapper, Mono.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a">
 
    <!-- The 'what' tag specifies which region of the section to modify. The 'value' attribute value is mapper-specific and is not defined here. It can be
         any expression understood by the mapper to designate the section region to modify.
    -->
    <what value="providers">
      <!-- 'what' can contain any number of occurrences of any three elements:
              replace - replace the designated region
              add - add a new entry to the region
              clear - clear the region
              remove - remove the designatedregion
 
              The attributes to any of the above are freeform and are not processed by the mapper manager. They are stored verbatim for the
              mapper to peruse.
      -->
      <replace name="AspNetSqlMembershipProvider"
               type="System.Web.Security.SqliteMembershipProvider, System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
               connectionStringName="LocalSqliteServer" />
    </what>
  </map>
 
  <map sectionType="System.Web.Configuration.RoleManagerSection, System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
       mapperType="Mono.Web.Util.RoleManagerSectionMapper, Mono.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
       platform="Unix">
 
    <!-- The 'what' tag specifies which region of the section to modify. The 'value' attribute value is mapper-specific and is not defined here. It can be
         any expression understood by the mapper to designate the section region to modify.
    -->
    <what value="providers">
      <!-- 'what' can contain any number of occurrences of any three elements:
              replace - replace the designated region
              add - add a new entry to the region
              clear - clear the region
              remove - remove the designatedregion
 
              The attributes to any of the above are freeform and are not processed by the mapper manager. They are stored verbatim for the
              mapper to peruse.
      -->
      <replace name="AspNetSqlRoleProvider"
               type="System.Web.Security.SqliteRoleProvider, System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
               connectionStringName="LocalSqliteServer" />
    </what>
  </map>
</settingsMap>
```

Creating a custom mapper
------------------------

Each mapper must implement the `Mono.Web.Util.ISectionSettingsMapper` interface:

``` csharp
interface ISectionSettingsMapper
{
    object MapSection (object section, List <SettingsMappingWhat> whats);
}
```

The MapSection method is called to perform actual mapping. The **section*parameter is the retrieved section to operate on and****whats'* is a list of all the **what** tag instances inside the corresponding mapper section in the settings.map file.

`SettingsMappingWhat` exposes the following public members of interest to the mapper:

-   **string Value** - a read-only property which returns the *value* attribute of the corresponding *what* tag
-   **List \<SettingsMappingWhatContents\> Contents** - a read-only property which returns a collection of objects which describe each of the supported tags within the *what* container.

`SettingsMappingWhatContents` exposes the following public members of interest to the mapper;

-   **SettingsMappingWhatOperation Operation** - a read-only property which specifies what operation the current instance describes (one of: Add, Clear, Replace, Remove)
-   **Dictionary \<string, string\> Attributes** - a read-only property which returns a dictionary of all attributes parsed from the corresponding tag in the settings.map file. The names and values of tags are passed verbatim from the config file to the mapper.

The return value of the MapSection method must be the **section** object - whether or not it is of the type expected by the mapper. The mapper must not create a new section and return it instead of the passed **section** object. It must act upon the passed object (if it is of the expected type) and modify its contents instead.

The only exception to the above rule is when you're mapping the AppSettingsSection. The reason is that this section contains an override of the GetRuntimeObject method and returns a freshly allocated, read-only, NameValueCollection collection of key/value pairs which cannot be modified by the user. In this case, your mapper should allocate a new NameValueCollection, create a copy of the original one, modify it and return the new object. Another peculiarity of the AppSettingsSection is that it is not cacheable, since every time it is requested it returns a new object of the NameValueCollection type. Therefore, the mappings will be performed every time WebConfigurationManager.AppSettings is accessed. You can avoid that by caching the return value of the property in your methods.

MapSection should avoid throwing exceptions, unless it is absolutely necessary, and it must never return a null value.

Example mapper code
-------------------

This example will show you how to implement a simple AppSettings mapper. It will perform two simple operations on the application settings collection: process the value of the *MyFilePath* setting to adjust the path in accordance with the operating system conventions and add another setting - *MyPlatform* - which will contain the name of the platform the application is running on. The remaining files needed for the sample to work can be found below the code of the mapper.

You can either compile the mapper into an assembly and put it in the `bin/` subdirectory of your top-level application directory or you can put the source code of the mapper inside the `App_Code/` subdirectory of the top-level application directory. In this example we're taking the latter approach.

Create a new file, `App_Code/AppSettingsMapper.cs` and paste into it the skeleton code below:

``` csharp
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using Mono.Web.Util;
 
namespace MapperSamples
{
    public class AppSettingsMapper : ISectionSettingsMapper
    {
        public object MapSection (object section, List <SettingsMappingWhat> whats)
        {
 
        }
    }
}
```

The above code declares a class which fullfills all the requirements of a settings mapper. It implements the `ISectionSettingsMapper` interface and is public, so that it can be loaded by `SettingsMappingManager`.

At the very beginning, each mapper should check whether the section object passed to it is actually of the expected type. Let's add code which does just that to the MapSection method:

``` csharp
public object MapSection (object section, List <SettingsMappingWhat> whats)
{
    NameValueCollection nvcOrig = section as NameValueCollection;
    if (nvcOrig == null)
        return section;
}
```

As you may remember from above, the AppSettingsSection configuration section handler is special in that it overrides the GetRuntimeObject method and returns a NameValueCollection instead of itself. That's why we perform a check on whether the passed section is of that type and not of AppSettingsSection. The reality is even more complicated, since the object returned by AppSettingsSecton's GetRuntimeObject is of the internal KeyValueInternalCollection type which is inaccessible to us, but since it derives from the NameValueCollection class, we can use the latter without problems to access the collection.

After making sure that we get what we expect, we need to create a copy of the passed section object (for the reasons described previously):

``` csharp
NameValueCollection nvc = new NameValueCollection ();
foreach (string key in nvcOrig.AllKeys)  {
    string val = nvcOrig [key] as String;
    if (val == null)
        continue;
 
    nvc [key] = val;
}
```

After that's done, we can start executing all the actions defined for us in the settings.map file:

``` csharp
List <SettingsMappingWhatContents> contents;
foreach (SettingsMappingWhat what in whats) {
    contents = what.Contents;
    if (contents == null || contents.Count == 0)
        continue;
 
    foreach (SettingsMappingWhatContents item in contents) {
        switch (item.Operation) {
            case SettingsMappingWhatOperation.Add:
                ProcessAdd (nvc, item);
                break;
 
            case SettingsMappingWhatOperation.Clear:
                // ignore
                break;
 
            case SettingsMappingWhatOperation.Replace:
                ProcessReplace (nvc, item);
                break;
 
            case SettingsMappingWhatOperation.Remove:
                // ignore
                break;
        }
    }
}
 
return nvc;
```

The code traverses the list of whats and for each of them, it looks at the collection of operations to perform and then dispatches the operation to the correct handler. Since our example only replaces a single key in the settings and adds another, we define only the Replace and Add handlers:

``` csharp
void ProcessAdd (NameValueCollection nvc, SettingsMappingWhatContents what)
{
    Dictionary <string, string> attrs = what.Attributes;
 
    string name;
    if (!attrs.TryGetValue ("name", out name))
        return;
 
    if (name != "MyPlatform")
        return;
 
    nvc [name] = SettingsMappingManager.Platform.ToString ();
}
```

This handler simply makes sure that the entry requested to be added is named 'MyPlatform' and uses the SettingsMappingManager.Platform to set the value of that setting.

``` csharp
void ProcessReplace (NameValueCollection nvc, SettingsMappingWhatContents what)
{
    Dictionary <string, string> attrs = what.Attributes;
 
    string name, relativeTo;
    if (!attrs.TryGetValue ("name", out name))
        return;
 
    if (!attrs.TryGetValue ("relativeTo", out relativeTo))
        relativeTo = "UserHome";
 
    switch (relativeTo) {
        case "UserHome":
            MakeRelativeToUserHome (nvc, name);
            break;
    }
}
```

Above you can observe what was described previously, that every operation tag's attrbutes are passed verbatim to the mapper. We specified a 'relativeTo' attribute whose value is to tell the mapper how to replace the path placeholder inside the original setting value. The placeholder value in our case is *@PATH_PLACEHOLDER@* and is replaced with the value of the user's home/private directory.

``` csharp
void MakeRelativeToUserHome (NameValueCollection nvc, string name)
{
    string path = nvc [name];
    if (String.IsNullOrEmpty (path))
        return;
 
    string userDir = Environment.GetFolderPath (Environment.SpecialFolder.Personal) + Path.DirectorySeparatorChar;
    path = path.Replace ("@PATH_PLACEHOLDER@", userDir);
    nvc [name] = path;
}
```

This is the code that performs the actual replacement of the directory path placeholder.

### AppSettingsMapper source code

For your convenience, this is the full code of the AppSettingsMapper class in once piece, paste it into `App_Code/AppSettingsMapper.cs`:

``` csharp
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
using Mono.Web.Util;
 
namespace MapperSamples
{
    public class AppSettingsMapper : ISectionSettingsMapper
    {
        public object MapSection (object section, List <SettingsMappingWhat> whats)
        {
            NameValueCollection nvcOrig = section as NameValueCollection;
            if (nvcOrig == null)
                return section;
 
            NameValueCollection nvc = new NameValueCollection ();
            foreach (string key in nvcOrig.AllKeys)  {
                string val = nvcOrig [key] as String;
                if (val == null)
                    continue;
 
                nvc [key] = val;
            }
 
            List <SettingsMappingWhatContents> contents;
            foreach (SettingsMappingWhat what in whats) {
                contents = what.Contents;
                if (contents == null || contents.Count == 0)
                    continue;
 
                foreach (SettingsMappingWhatContents item in contents) {
                    switch (item.Operation) {
                        case SettingsMappingWhatOperation.Add:
                            ProcessAdd (nvc, item);
                            break;
 
                        case SettingsMappingWhatOperation.Clear:
                            // ignore
                            break;
 
                        case SettingsMappingWhatOperation.Replace:
                            ProcessReplace (nvc, item);
                            break;
 
                        case SettingsMappingWhatOperation.Remove:
                            // ignore
                            break;
                    }
                }
            }
 
            return nvc;
        }
 
        void ProcessAdd (NameValueCollection nvc, SettingsMappingWhatContents what)
        {
            Dictionary <string, string> attrs = what.Attributes;
 
            string name;
            if (!attrs.TryGetValue ("name", out name))
                return;
 
            if (name != "MyPlatform")
                return;
 
            nvc [name] = SettingsMappingManager.Platform.ToString ();
        }
 
        void ProcessReplace (NameValueCollection nvc, SettingsMappingWhatContents what)
        {
            Dictionary <string, string> attrs = what.Attributes;
 
            string name, relativeTo;
            if (!attrs.TryGetValue ("name", out name))
                return;
 
            if (!attrs.TryGetValue ("relativeTo", out relativeTo))
                relativeTo = "UserHome";
 
            switch (relativeTo) {
                case "UserHome":
                    MakeRelativeToUserHome (nvc, name);
                    break;
            }
        }
 
        void MakeRelativeToUserHome (NameValueCollection nvc, string name)
        {
            string path = nvc [name];
            if (String.IsNullOrEmpty (path))
                return;
 
            string userDir = Environment.GetFolderPath (Environment.SpecialFolder.Personal) + Path.DirectorySeparatorChar;
            path = path.Replace ("@PATH_PLACEHOLDER@", userDir);
            nvc [name] = path;
        }
    }
}
```

The remaining files required for the mapper example to work

### default.aspx

    <%@ Page Language="C#" %>
    <%@ Import Namespace="System.Web.Configuration" %>

    <script runat="server">
    public void Page_Load (object sender, EventArgs args)
    {
            NameValueCollection settings = (NameValueCollection) WebConfigurationManager.GetSection ("appSettings");
            myFilePathValue.Text = settings ["MyFilePath"];
            myPlatformValue.Text = settings ["MyPlatform"];
    }
    </script>
    <html><head><title>Modify File Paths Mapper Sample</title></head>
    <body>
    <form runat="server">
        <asp:Label runat="server" Text="AppSettingsSection mapper test:"/><br/>
        MyFilePath value: <asp:Literal runat="server" id="myFilePathValue"/><br/>
        MyPlatform value: <asp:Literal runat="server" id="myPlatformValue"/>
    </form>
    </body>
    </html>

### Web.config

``` xml
<?xml version="1.0"?>
<configuration>
        <appSettings>
                <add key="MyFilePath" value="@PATH_PLACEHOLDER@file.txt" />
        </appSettings>
</configuration>
```

### settings.map.config

``` xml
<?xml version="1.0" encoding="utf-8" ?>
<settingsMap>
  <map sectionType="System.Configuration.KeyValueInternalCollection, System.Configuration, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
       mapperType="MapperSamples.AppSettingsMapper, App_Code"
       platform="Unix">
 
    <what value="ignored">
      <replace name="MyFilePath" relativeTo="UserHome" />
      <add name="MyPlatform" />
    </what>
  </map>
</settingsMap>
```

A word of explanation is required for the above file. You might have noticed that in the mapper we check for the NameValueCollection type of the passed section and in the above file we define a mapper for the System.Configuration.KeyValueInternalCollection type. This is because that's the exact type returned by the AppSettingsSection's GetRuntimeObject and that's what the SettingsMappingManager will see when looking for a mapper for the appSettings section. As already said above, the internal class derives from NameValueCollection. Also, note that the value of the 'mapperType' attribute doesn't specify the App_Code assembly's version, culture and public key token. This is because App_Code is a "virtual" assembly whose real name is different and changes between application runs. ASP.NET resolves the name internally to the real dynamically generated assembly.

Final notes
-----------

It is very important to remember that the settings mapping works ONLY for the ASP.NET applications and ONLY if the sections are requested using the WebConfigurationManager object, as shown below:

``` csharp
SomeSection section = WebConfigurationManager.GetSection ("someSection");
```

Also, when using AppSettings in your application **do not** access them using either `ConfigurationManager.AppSettings` or `WebConfigurationManager.AppSettings` properties since the section will not be mapped. It's because WebConfigurationManager returns the value of `ConfigurationManager.AppSettings` which uses the ConfigurationManager's version of the GetSection method which does not support settings mapping. You should instead use code as follows:

``` csharp
NameValueCollection settings = (NameValueCollection) WebConfigurationManager.GetSection ("appSettings");
```

If you plan to run your application on MS.NET/IIS and Mono, then you should configure it for the Windows/MS.NET target and provide configuration settings mappers for other operating systems.
