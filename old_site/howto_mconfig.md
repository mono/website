---
layout: obsolete
title: "Howto Mconfig"
lastmodified: '2007-11-13'
permalink: /old_site/Howto_Mconfig/
redirect_from:
  - /Howto_Mconfig/
---

Howto Mconfig
=============

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#command-line-usage">2 Command line usage</a>
<ul>
<li><a href="#options">2.1 Options</a></li>
<li><a href="#commands">2.2 Commands</a></li>
</ul></li>
<li><a href="#configuration-files">3 Configuration files</a>
<ul>
<li><a href="#file-locations">3.1 File locations</a></li>
<li><a href="#configuration-file-syntax">3.2 Configuration file syntax</a>
<ul>
<li><a href="#configuration">3.2.1 &lt;configuration&gt;</a>
<ul>
<li><a href="#handlers">3.2.1.1 &lt;handlers&gt;</a>
<ul>
<li><a href="#handler">3.2.1.1.1 &lt;handler&gt;</a></li>
</ul></li>
</ul></li>
<li><a href="#feature">3.2.2 &lt;feature&gt;</a>
<ul>
<li><a href="#description">3.2.2.1 &lt;description&gt;</a></li>
<li><a href="#blocks">3.2.2.2 &lt;blocks&gt;</a>
<ul>
<li><a href="#block">3.2.2.2.1 &lt;block&gt;</a></li>
</ul></li>
</ul></li>
<li><a href="#section">3.2.3 &lt;section&gt;</a></li>
<li><a href="#configblock">3.2.4 &lt;configBlock&gt;</a>
<ul>
<li><a href="#requires">3.2.4.1 &lt;requires&gt;</a></li>
<li><a href="#contents">3.2.4.2 &lt;contents&gt;</a></li>
</ul></li>
<li><a href="#default">3.2.5 &lt;default&gt;</a></li>
<li><a href="#defaultconfigfile">3.2.6 &lt;defaultConfigFile&gt;</a></li>
</ul></li>
</ul></li>
<li><a href="#examples">4 Examples</a>
<ul>
<li><a href="#defining-a-new-feature">4.1 Defining a new feature</a>
<ul>
<li><a href="#first-steps">4.1.1 First steps</a></li>
<li><a href="#creating-the-mconfigxml-file">4.1.2 Creating the mconfig.xml file</a>
<ul>
<li><a href="#basic-file-structure">4.1.2.1 Basic file structure</a></li>
<li><a href="#adding-a-feature-block">4.1.2.2 Adding a feature block</a></li>
<li><a href="#defining-configuration-blocks">4.1.2.3 Defining configuration blocks</a></li>
<li><a href="#defining-default-section-contents">4.1.2.4 Defining default section contents</a></li>
</ul></li>
<li><a href="#the-final-mconfigxml-file">4.1.3 The final mconfig.xml file</a></li>
</ul></li>
<li><a href="#example-configuration-file">4.2 Example configuration file</a></li>
</ul></li>
<li><a href="#usage-as-a-library">5 Usage as a library</a></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
------------

`mconfig` can be used to edit .NET configuration files, by adding "features" (that is sets of xml statements) defined in one of the config files read by mconfig. The config file can also define layouts of default configuration files, which may be useful for bootstrapping your .NET projects.

Command line usage
------------------

`mconfig [options] command [command_parameters]`

### Options

`-c <config_file>, --config=<config_file>`

Read the specified config file after reading the other, preconfigured, config files for the utility. Settings in the specified file override those found in the other configuration locations.

`-t {any | web | application}, --target={any | web | application}`

Features and default configuration files defined in the mconfig config file(s) can be assigned to one of the three targets (defaults to **any**):

-   **web** - for ASP.NET features/config files
-   **application** - for .NET applications
-   **any** - applicable in both of the previous targets.

`-C, --list-configs`

List all the default configuration file names that are defined in the mconfig configuration files.

`-F, --list-features`

List all the features that are defined in the mconfig configuration files and which can be added to your existing (or new) .NET configuration files.

`-?, -h, --help`

Show a summary usage screen.

`-v, --version`

Show the mconfig version

### Commands

`{addfeature, af} <feature_name> [config_file_path]`

Adds the feature named *\<feature\_name\>* to the specified config file. If *config\_file\_path* is omitted, the name of the output configuration file will be chosen based on the selected target (see the `-t` option). If the specified config file exists, the feature will be injected into it at the locations specified by mconfig configuration. If the target config file does not exist, it will be created and will contain only the specified feature and all its dependencies. Default output filenames for the targets are:

-   **web** - `Web.config`
-   **application** - `application.exe.config`.
-   **any** - no default output file name.

`{defaultconfig, dc} [config_name [target_directory]]`

Generates a default config file using the configuration entry named *[config\_name]* and outputs the resulting configuration file to the directory given by the *[target\_directory]* option. If *[config\_name]* is omitted, it defaults to to the names described above in the documentation for the `addfeature` command. If the *[target\_directory]* parameter is omitted, it defaults to the current directory.

Name of the output config file created in *[target\_directory]* is given in the config file layout definition.

Configuration files
-------------------

`mconfig` can use several configuration files to define the features and default config files. Each subsequent config file may override features/defaults specified in any of the files read before it. This allows for maximum flexibility when customizing the `mconfig` shipped defaults to your needs.

### File locations

-   `$prefix/etc/mono/mconfig/config.xml`
    The default configuration file, distributed with mconfig. *\$prefix* is the mconfig installation prefix specified on the compilation time.
-   `$config_dir/mconfig/config.xml`
    *\$config\_dir* is the directory specified in the `XDG_CONFIG_HOME` environment variable or, if it is empty, in the `.config` directory located in the user's home directory. This file is not distributed with Mono.
-   `./mconfig.xml`
    Local configuration file which can contain per-directory settings. This may be useful when shipping new versions of an application to avoid overwriting the config files possibly modified by the application user. By adding appropriate mconfig calls to your setup sequence, you can safely modify the existing config files to add the new required entries.

### Configuration file syntax

All files must be well-formed XML and the mconfig configuration directives must be contained within the `<mconfig>` element.

#### \<configuration\>

This element contains the mconfig configuration settings. The following child elements are supported:

##### \<handlers\>

Contains a collection of the *\<handler\>* elements, each of which describes a handler for a single section which may be contained in the configuration files.

###### \<handler\>

Each `<handler>` element introduces a new parsable config file section into mconfig. If handler for the same section name is defined more than once, the later definition overrides the newer one. That way you can modify handling of the sections if your application uses `mconfig` as a library of classes. Attributes accepted by *\<handler\>* element are:

-   **section** (required)
-   **storageType** (required)
-   **type** (required)

#### \<feature\>

This element defines a single feature. Accepted attributes are:

-   **name** (required)
    Unique feature name. If the name is used more than once, the later feature blocks will silently override the earlier ones.
-   **target** (required)
    Specifies the target with which the feature can be used.

The following child elements are supported:

##### \<description\>

Contains a short description of the feature. All the child text nodes (that is plain text and CDATA blocks) are concatenated to form the feature description when listing the features with the `-F` option described earlier. You should not worry about line breaking, indenting and formatting - the text will be shaped to fit the console window width, adding line breaks wherever necessary.

##### \<blocks\>

Contains a collection of block defnitions that together create the contents of the feature. Construction of a feature text is divided into blocks in order to enable block sharing between features. The feature elements are inserted into the target file in order they are given in the mconfig configuration file.

###### \<block\>

Names a single feature block. The following attributes are supported:

-   **name** (required)
    Gives name of a `<configBlock>` instance to form part of the feature.

#### \<section\>

This is a shared element supported as a child of several elements defined below. It is **not** a child element of the root node. `<section>` elements can be nested within each other, which forms the hierarchy of the sections as required by the containing element. If an existing configuration file has been read by mconfig for modification, then a check is made whether the original file contains the named section and, if not, the section and all of its children are inserted using their default definitions. The accepted attributes are:

-   **name** (required)
    Gives name of a config file section that is required by the ocntaining element. If the section doesn't exist in the target configuration file, the name is used to reference a `<default>` tag instance which contains the default contents of the section.
-   **attachPoint** (optional)
    Defines the place in the section hierarchy where the contents of the parent [\<configBlock\>](#configblock) is inserted.
-   **defaultBlockName** (optional)
    Specifies the alternative name by which to look for the appropriate *\<default\>* block. This is useful if several sections found in different places of the XML element hierarchy have the same name and it would be impossible to define two *\<default\>* blocks sharing the same name. If this attribute is absent, it defaults to the value of the **name** attribute above.

#### \<configBlock\>

Defines a single feature block for use in the `<feature>` elements. The accepted attributes are:

-   **name** (required)
    Assigns a unique name to the block

##### \<requires\>

Contains a collection of nested [\<section\>](#section) elements which form the hierarchy of sections required by the config block.

##### \<contents\>

All the child text nodes of this element are contanated to form the config block contents.

#### \<default\>

Defines contents of a section should it be missing from the target file, or to be used when generating a default config file. Child text nodes of the element are treated as an XML document, parsed and injected into the target document's DOM at the locations specified by other elements described above. Since the contents should be read verbatim, you must enclose it in the CDATA container. The accepted attributes are:

-   **section** (required)
    Assigns a unique name to the section definition. Used by the [\<section\>](#section) element.
-   **target** (required)
    Specifies for wich target the section definition is valid.

#### \<defaultConfigFile\>

Defines the contents and structure of a default configuration file, to be used with the `defaultconfig` command. Contains a nested list of the `<section>` elements. The accepted attributes are:

-   **name** (required)
    Assigns a unique name to the entry, to be used with the `defaultconfig` command.
-   **fileName** (optional)
    Sets the output file name when this configuration is requested with the `defaultconfig` command. Defaults to the value of the *name* attribute
-   **target** (required)
    Sets the target for which this definition is valid.

Examples
--------

### Defining a new feature

#### First steps

In this example we will add a feature to a `Web.config` file that consists of three blocks, an application settings section, a dummy connection string and a section which adds a definition of the IronPython compiler to your application's `Web.config` file. We will start with an empty directory in which we will put an mconfig configuration file named `mconfig.xml`. I will describe the file section by section. Starting with no `Web.config` file we have two options to choose in order to create the file. First, we can have `mconfig` generate a default config file from one of the predefined templates. To see the templates your mconfig knows, issue the following command:

    $ mconfig -C
    Default config files
     web.config (Target: Web; Output file: Web.config)

The output shows that our instance of mconfig knows one default configuration file template - `web.config`. We can use this template to generate the file by issuing the following command:

    $ mconfig dc web.config

A basic configuration file is created in the current directory. The output file name for this template was set to `Web.config`, and that's the file that has just been created. The other option to create the new configuration file is to simply add any feature for it without pre-generating a default file. Adding a feature if a file does not exist will create the elements required by the feature and write them to the file.

#### Creating the mconfig.xml file

`mconfig` can use a configuration file named `mconfig.xml` found in the current directory. This file is read as the third one in the sequence of config files (after the global configuration file, shipped with Mono, and the local configuration file found in the personal configuration directory) and thus can override or agument any defaults, features, configuration blocks defined in the previous configuration files.

##### Basic file structure

Start with opening the `mconfig.xml` file in your favorite editor, and put the following basic structure inside:

``` xml
<?xml version="1.0" encoding="utf-8"?>
<mconfig>
</mconfig>
```

All the `mconfig` configuration settings have to be contained within the root element named **mconfig**.

##### Adding a feature block

Since our goal is to define a new feature (we could just restrict ourselves to overriding several **\<default\>** blocks, for instance, to affect the creation of default configuration files or modify the contents of some sections forming part of other features), we need to define it in the configuration file. Our new feature will be adding support for using IronPython in ASP.NET applications, using the Mono distribution of IronPyton (available for several distributions from [http://mono-project.com/Downloads]({{site.github.url}}/Downloads) in the IPCE package), therefore we will name it *IronPython-Mono*. Let's modify the freshly created `mconfig.xml` file by adding the following XML code just below the **\<mconfig\>** element at the top of the file:

``` xml
<feature name="IronPython-Mono" target="Web">
    <blocks>
        <block name="My AppSettings"/>
        <block name="My IronPython"/>
    </blocks>
</feature>
```

The new feature will be valid only for the **Web** target and will consist of two blocks named *My AppSettings* and *My IronPython*. At this point you can check that mconfig does indeed know the new feature:

    $ mconfig -F
    Available features
     AJAX (Target: Web)

       Adds entries to your Web.config file which are required by any AJAX.NET application.
       

     IronPython-Mono (Target: Web)

If you attempted to add the feature to our configuration fire at this point, however, you would end up with an error message:

    $ mconfig af IronPython-Mono Web.config
    Failed to add feature 'IronPython-Mono' to config file 'Web.config'.
      Config block 'My AppSettings' cannot be found

The error is signalled because no configuration file contains a [\<configBlock\>](#configblock) which describes the block requested by our feature.

##### Defining configuration blocks

In this step we will define both configuration blocks required by the feature - *My AppSettings* and *My IronPython*. To make the blocks known to mconfig, insert the following XML just below the feature block created in the previous step:

``` xml
<configBlock name="My AppSettings">
        <requires>
            <section name="configuration">
                <section name="appSettings" attachPoint="true"/>
                <section name="connectionStrings"/>
            </section>
        </requires>
 
        <contents><![CDATA[
<add key="Application Version" value="1.0.0"/>
<add key="Application Name" value="MyApplication"/>
]]>
        </contents>
    </configBlock>
 
    <configBlock name="My IronPython">
        <requires>
            <section name="configuration">
                <section name="system.web">
                    <section name="compilation">
                        <section name="compilers"/>
                    </section>
                </section>
            </section>
        </requires>
    </configBlock>
```

Each **\<configBlock\>** instance requires a *name* attribute which must match the name of the corresponding **\<block\>** instance inside the feature definition block. Configuration blocks, as seen above, consist of two parts. First part is the **\<requires\>** collection which defines the XML structure required as a prerequisite by the configuration block being defined. In the case of the *My AppSettings* block, the required hierarchy is as follows:

    configuration
       appSettings
       connectionStrings

Each **\<section\>** instance inside contains a *name* attribute which is used to look up the section in the target file and, if it doesn't exist, a **\<default\>** container within the mconfig configuration file which defines the default contents of the section in question. The *connectionStrings* section could be defined by a separate configuration block as it is not strictly required by the *appSettings* section, but I've put it here to demonstrate usage of another **\<section\>** attribute, *attachPoint*. The attribute is used to mark the place where the configuration block contents will be inserted in the XML DOM hierarchy defined by the config block's *requires* element. If no \<section\> element contains the attribute, the last (depth first) section will become the default attachment point. The second part of a \<configBlock\> instance is the **\<contents\>** container. The contents of this container must be (after concatenating all the text child nodes - that is plain text and CDATA elements) a well-formed XML document, as it will be parsed to create a DOM tree to be attached to the attachment point defined above. It is strongly recommended that you use a single CDATA block as shown above. It is very important to remember that the \<contents\> container defines the **contents** of the block, not the surrounding container element. At this point we may try to add the feature to our configuration file once again:

    $ mconfig af IronPython-Mono Web.config
    Failed to add feature 'IronPython-Mono' to config file 'Web.config'.
      Document doesn't contain node '//configuration/appSettings' and no default can be found

The reason for this error is that our *My AppSettings* configuration blocks requires that the target file contains the **appSettings** section to be present, which requirement isn't satisfied by our target configuration file. In such cases, mconfig attempts to find a **\<default\>** block which matches the section in name and use its contents to inject the required XML fragment into the target file.

##### Defining default section contents

Each **\<default\>** element instance defines a uniquely named block, which will be used by mconfig to define contents of sections which are missing from the target file. Let us define the default sections required by both of our configuration blocks. Insert the XML below just after the last **configBlock** element in our `mconfig.xml` file:

``` xml
<default section="appSettings" target="any">
        <![CDATA[
<appSettings>
</appSettings>
]]>
</default>
 
<default section="connectionStrings" target="any">
<![CDATA[
<connectionStrings>
    <add name="MyDB"
         providerName="System.Data.SqlClient"
         connectionString="" />
</connectionStrings>
]]>
</default>
 
<default section="compilers" target="web">
<![CDATA[
<compilers>
<compiler language="python;ironpython" extension=".py" warningLevel="1" compilerOptions=""
          type="IronPython.CodeDom.PythonGenerator, IronPython, Version=1.1.0.0, Culture=neutral, PublicKeyToken=null" />
</compilers>
]]>
</default>
```

This fragment defines all three sections required by our configuration blocks. The other sections required by them (*system.web*, *configuration* etc.) are defined in the default configuration file shipped with Mono, so there is no need to override them unless you want to change something in their definition, in which case adding an appropriate *default* container will override the default definition. Out of the three default entries, the *connectionStrings* and *appSettings* will be valid for any feature defined in the configuration files and the *compilers* one is valid only for the web configuration files. Usually, it is a good practice for the *default* blocks to define only empty sections they are supposed to add, but in the case of our *connectionStrings* definition we can create a populated section, since it will be specific to our application anyway and is not very likely to be reused outside our context. As was the case with the *\<contents\>* element described before, it is required that the contents of concatenated child text nodes (plain text and CDATA elements) results in a well-formed XML document, which will be parsed into an XML DOM and added to the target config file at the location in the hierarchy where it is necessary. At this point, we can retry adding the newly defined feature to our target configuration file:

    $ mconfig af IronPython-Mono Web.config

The command completes without error, and you can look at the generated `Web.config` file:

``` xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
        <appSettings>
                <add key="Application Version" value="1.0.0" />
                <add key="Application Name" value="MyApplication" />
        </appSettings>
        <connectionStrings>
                <add name="MyDB" providerName="System.Data.SqlClient" connectionString="" />
        </connectionStrings>
        <system.web>
                <customErrors mode="RemoteOnly" />
                <compilation debug="true">
                        <compilers>
                                <compiler language="python;ironpython" extension=".py" warningLevel="1" compilerOptions="" type="IronPython.CodeDom.PythonGenerator, IronPython, Version=1.1.0.0, Culture=neutral, PublicKeyToken=null" />
                        </compilers>
                </compilation>
        </system.web>
</configuration>
```

#### The final mconfig.xml file

The mconfig.xml file in your editor should now look like this:

``` xml
<?xml version="1.0" encoding="utf-8"?>
<mconfig>
    <feature name="IronPython-Mono" target="Web">
    <blocks>
        <block name="My AppSettings"/>
        <block name="My IronPython"/>
    </blocks>
    </feature>
 
    <configBlock name="My AppSettings">
    <requires>
        <section name="configuration">
        <section name="appSettings" attachPoint="true"/>
        <section name="connectionStrings"/>
        </section>
    </requires>
 
    <contents><![CDATA[
<add key="Application Version" value="1.0.0"/>
<add key="Application Name" value="MyApplication"/>
]]>
    </contents>
    </configBlock>
 
    <configBlock name="My IronPython">
    <requires>
        <section name="configuration">
        <section name="system.web">
            <section name="compilation">
            <section name="compilers"/>
            </section>
        </section>
        </section>
    </requires>
    </configBlock>
 
    <default section="appSettings" target="any">
    <![CDATA[
<appSettings>
</appSettings>
]]>
    </default>
 
    <default section="connectionStrings" target="any">
<![CDATA[
<connectionStrings>
    <add name="MyDB"
   providerName="System.Data.SqlClient"
   connectionString="" />
</connectionStrings>
]]>
    </default>
 
    <default section="compilers" target="web">
<![CDATA[
<compilers>
<compiler language="python;ironpython" extension=".py" warningLevel="1" compilerOptions=""
    type="IronPython.CodeDom.PythonGenerator, IronPython, Version=1.1.0.0, Culture=neutral, PublicKeyToken=null" />
</compilers>
]]>
    </default>
</mconfig>
```

### Example configuration file

This is the default configuration file as shipped with Mono.

``` xml
<?xml version="1.0" encoding="utf-8"?>
<mconfig>
  <configuration>
    <handlers>
      <handler section="feature" 
         type="Mono.MonoConfig.FeatureNodeHandler, mconfig, Version=0.1.0.0, Culture=neutral, PublicKeyToken=null"
         storageType="System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[Mono.MonoConfig.FeatureNode, mconfig, Version=0.1.0.0, Culture=neutral, PublicKeyToken=null]], mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"/>
      <handler section="configBlock"
         type="Mono.MonoConfig.ConfigBlockNodeHandler, mconfig, Version=0.1.0.0, Culture=neutral, PublicKeyToken=null"
         storageType="System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[Mono.MonoConfig.ConfigBlockBlock, mconfig, Version=0.1.0.0, Culture=neutral, PublicKeyToken=null]], mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"/>
      <handler section="default"
         type="Mono.MonoConfig.DefaultNodeHandler, mconfig, Version=0.1.0.0, Culture=neutral, PublicKeyToken=null"
         storageType="System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[Mono.MonoConfig.DefaultNode, mconfig, Version=0.1.0.0, Culture=neutral, PublicKeyToken=null]], mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"/>
      <handler section="defaultConfigFile"
         type="Mono.MonoConfig.DefaultConfigFileNodeHandler, mconfig, Version=0.1.0.0, Culture=neutral, PublicKeyToken=null"
         storageType="System.Collections.Generic.Dictionary`2[[System.String, mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089],[Mono.MonoConfig.DefaultConfigFile, mconfig, Version=0.1.0.0, Culture=neutral, PublicKeyToken=null]], mscorlib, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"/>
    </handlers>
  </configuration>
 
  <feature name="AJAX" target="web">
    <description><![CDATA[
      Adds entries to your Web.config file which are required by any AJAX.NET application.
    ]]></description>
    <blocks>
      <block name="AJAX config sections"/>
      <block name="AJAX controls registration"/>
      <block name="AJAX compilation"/>
      <block name="AJAX HTTP handlers"/>
      <block name="AJAX HTTP modules"/>
      <block name="AJAX system.web.extensions"/>
      <block name="AJAX system.webServer"/>
      <block name="" />
    </blocks>
  </feature>
 
  <!-- configuration blocks required by the features -->
  <configBlock name="AJAX config sections">
    <requires>
      <section name="configuration">
    <section name="configSections" attachPoint="true"/>
      </section>
    </requires>
 
    <contents>
      <![CDATA[
<sectionGroup name="system.web.extensions" type="System.Web.Configuration.SystemWebExtensionsSectionGroup, System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35">
      <sectionGroup name="scripting" type="System.Web.Configuration.ScriptingSectionGroup, System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35">
          <section name="scriptResourceHandler" type="System.Web.Configuration.ScriptingScriptResourceHandlerSection, System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" requirePermission="false" allowDefinition="MachineToApplication"/>
        <sectionGroup name="webServices" type="System.Web.Configuration.ScriptingWebServicesSectionGroup, System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35">
          <section name="jsonSerialization" type="System.Web.Configuration.ScriptingJsonSerializationSection, System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" requirePermission="false" allowDefinition="Everywhere" />
          <section name="profileService" type="System.Web.Configuration.ScriptingProfileServiceSection, System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" requirePermission="false" allowDefinition="MachineToApplication" />
          <section name="authenticationService" type="System.Web.Configuration.ScriptingAuthenticationServiceSection, System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" requirePermission="false" allowDefinition="MachineToApplication" />
        </sectionGroup>
      </sectionGroup>
    </sectionGroup>
      ]]>
    </contents>
  </configBlock>
 
  <configBlock name="AJAX controls registration">
    <requires>
      <section name="configuration">
    <section name="system.web">
      <section name="pages" defaultBlockName="system.web.pages">
        <section name="controls" defaultBlockName="system.web.pages.controls"/>
      </section>
    </section>
      </section>
    </requires>
 
    <contents>
      <![CDATA[
<add tagPrefix="asp" namespace="System.Web.UI" assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"/>
]]>
    </contents>
  </configBlock>
 
  <configBlock name="AJAX compilation">
    <requires>
      <section name="configuration">
    <section name="system.web">
      <section name="compilation" defaultBlockName="system.web.compilation">
        <section name="assemblies" defaultBlockName="system.web.compilation.assemblies"/>
      </section>
    </section>
      </section>
    </requires>
 
    <contents>
      <![CDATA[
<add assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"/>
]]>
    </contents>
  </configBlock>
 
  <configBlock name="AJAX HTTP handlers">
    <requires>
      <section name="configuration">
    <section name="system.web">
      <section name="httpHandlers" defaultBlockName="system.web.httpHandlers"/>
    </section>
      </section>
    </requires>
 
    <contents>
      <![CDATA[
<remove verb="*" path="*.asmx"/>
      <add verb="*" path="*.asmx" validate="false" type="System.Web.Script.Services.ScriptHandlerFactory, System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"/>
      <add verb="*" path="*_AppService.axd" validate="false" type="System.Web.Script.Services.ScriptHandlerFactory, System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"/>
      <add verb="GET,HEAD" path="ScriptResource.axd" type="System.Web.Handlers.ScriptResourceHandler, System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" validate="false"/>
]]>
    </contents>
  </configBlock>
 
  <configBlock name="AJAX HTTP modules">
    <requires>
      <section name="configuration">
    <section name="system.web">
      <section name="httpModules" defaultBlockName="system.web.httpModules"/>
    </section>
      </section>
    </requires>
 
    <contents>
      <![CDATA[
<add name="ScriptModule" type="System.Web.Handlers.ScriptModule, System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"/>
]]>
    </contents>
  </configBlock>
 
  <configBlock name="AJAX system.web.extensions">
    <requires>
      <section name="configuration">
    <section name="system.web.extensions"/>
      </section>
    </requires>
 
    <contents>
      <![CDATA[
<scripting>
      <webServices>
      <!-- Uncomment this line to customize maxJsonLength and add a custom converter -->
      <!--
      <jsonSerialization maxJsonLength="500">
        <converters>
          <add name="ConvertMe" type="Acme.SubAcme.ConvertMeTypeConverter"/>
        </converters>
      </jsonSerialization>
      -->
      <!-- Uncomment this line to enable the authentication service. Include requireSSL="true" if appropriate. -->
      <!--
        <authenticationService enabled="true" requireSSL = "true|false"/>
      -->
 
      <!-- Uncomment these lines to enable the profile service. To allow profile properties to be retrieved
           and modified in ASP.NET AJAX applications, you need to add each property name to the readAccessProperties and
           writeAccessProperties attributes. -->
      <!--
      <profileService enabled="true"
                      readAccessProperties="propertyname1,propertyname2"
                      writeAccessProperties="propertyname1,propertyname2" />
      -->
      </webServices>
      <!--
      <scriptResourceHandler enableCompression="true" enableCaching="true" />
      -->
    </scripting>
]]>
    </contents>
  </configBlock>
 
  <configBlock name="AJAX system.webServer">
    <requires>
      <section name="configuration">
    <section name="system.webServer"/>
      </section>
    </requires>
 
    <contents>
      <![CDATA[
<validation validateIntegratedModeConfiguration="false"/>
    <modules>
      <add name="ScriptModule" preCondition="integratedMode" type="System.Web.Handlers.ScriptModule, System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"/>
    </modules>
    <handlers>
      <remove name="WebServiceHandlerFactory-Integrated" />
      <add name="ScriptHandlerFactory" verb="*" path="*.asmx" preCondition="integratedMode"
           type="System.Web.Script.Services.ScriptHandlerFactory, System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"/>
      <add name="ScriptHandlerFactoryAppServices" verb="*" path="*_AppService.axd" preCondition="integratedMode"
           type="System.Web.Script.Services.ScriptHandlerFactory, System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"/>
      <add name="ScriptResource" preCondition="integratedMode" verb="GET,HEAD" path="ScriptResource.axd" type="System.Web.Handlers.ScriptResourceHandler, System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" />
    </handlers>
]]>
    </contents>
  </configBlock>
 
  <!-- default contents for missing sections -->
  <default section="configuration" target="any">
    <![CDATA[
    <configuration>
    </configuration>
    ]]>
  </default>
 
  <default section="configSections" target="any">
    <![CDATA[
    <configSections>
    </configSections>
    ]]>
  </default>
 
  <default section="system.web" target="web">
    <![CDATA[
    <system.web>
    </system.web>
    ]]>
  </default>
 
  <default section="system.web.pages" target="web">
    <![CDATA[
<pages>
</pages>
]]>
  </default>
 
  <default section="system.web.pages.controls" target="web">
    <![CDATA[
<controls>
</controls>
]]>
  </default>
 
  <default section="system.web.compilation" target="web">
    <![CDATA[
<compilation debug="true">
</compilation>
]]>
  </default>
 
  <default section="system.web.compilation.assemblies" target="web">
    <![CDATA[
<assemblies>
</assemblies>
]]>
  </default>
 
  <default section="system.web.httpHandlers" target="web">
    <![CDATA[
<httpHandlers>
</httpHandlers>
]]>
  </default>
 
  <default section="system.web.httpModules" target="web">
    <![CDATA[
<httpModules>
</httpModules>
]]>
  </default>
 
  <default section="system.web.extensions" target="web">
    <![CDATA[
<system.web.extensions>
</system.web.extensions>
]]>
  </default>
 
  <default section="system.webServer" target="web">
    <![CDATA[
<system.webServer>
</system.webServer>
]]>
  </default>
 
  <default section="system.web.customErrors" target="web">
    <![CDATA[
<customErrors mode="RemoteOnly"/>
]]>
  </default>
 
  <!-- default config file definitions -->
  <defaultConfigFile name="web.config" fileName="Web.config" target="web">
    <section name="configuration">
      <section name="system.web">
    <section name="compilation" defaultBlockName="system.web.compilation"/>
    <section name="customErrors" defaultBlockName="system.web.customErrors"/>
      </section>
    </section>
  </defaultConfigFile>
</mconfig>
```

Usage as a library
------------------

`mconfig` can also be used as a library. This section will contain documentation of the public API once it is considered stable.

