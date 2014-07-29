---
layout: docpage
navgroup: docs
title: AutoConfiguration
redirect_from:
  - /AutoConfiguration/
  - /AutoHosting/
---

Automatic configuration of ASP.NET applications with [mod\_mono]({{ site.github.url }}/docs/web/mod_mono/)

Motivation
----------

In the past mod\_mono required each application deployed to be configured on the Apache configuration files, this followed closely the model from Windows where applications exposed to the public are manually registered.

The auto-configuration capability is a mechanism to minimize the configuration required and to have a simple experience in deploying ASP.NET based applications on Apache systems with Mono.

Deploying an application does not require any special sysadmin intervention to register the known applications with mod\_mono, it only requires the data to be exposed with any of the Apache directives.

With autohosting it is possible to allow all the accounts on a machine to deploy an ASP.NET application without having to do any manual configuration. Just having the ASP.NET pages will automatically serve them (.aspx, .ashx, .ascx, .asmx files).

What is it?
-----------

Before version 1.1.10, the user was required to manually configure apache for each ASP.NET application that was going to be hosted. Usually this was just a matter of adding a few lines (see [mod\_mono]({{ site.github.url }}/docs/web/mod_mono/)), but still, it would be better if you could just copy your application and it worked without further action required.

This is what mod\_mono automatic hosting provides: zero configuration for your applications.

How do I enable it?
-------------------

If you've never configured mod\_mono before, **just loading mod\_mono.conf will do**.

            Include /etc/apache2/mod_mono.conf

The actual path to mod\_mono.conf might vary depending on the distribution you use or the path where you installed apache.

**Note:** Firefox typically caches a request, so you might need to restart your firefox if you are experiencing problems when aspx pages are not recognized. Try testing with curl or another cache-less http client.

The configuration defaults to running the 1.0 runtime for applications, if you want to use the 2.0 runtime, you can just use the MonoServerPath directive to point to the 2.0 server, like this:

            MonoServerPath "/usr/bin/mod-mono-server2"

For those of you that have an existing configuration, you'll have to enable the feature by adding

            MonoAutoApplication enabled

Be aware that if the application is handling any file extension not present in the list of *AddType*s in mod\_mono.conf, you have to add those extension to mod\_mono.conf manually. Ie., if the application has something like:

    <httpHandlers>
       <add verb="*" path="*.m" type="Maverick.Dispatcher, Maverick" />
     </httpHandlers>

you need to add:

     AddType application/x-asp-net .m

to your mod\_mono.conf.

Uses
----

### Deploying an application

This new functionality means that you can unpack on your web root various applications, for example:

``` bash
  $ cd /var/www/
  $ unzip CommunityServer.zip
  $ unzip nGallery.zip
  $ unzip MyPage.zip
```

and, assuming some simple names and a default Apache configuration, the applications would be available at:

    http://localhost/CommunityServer/
    http://localhost/nGallery/
    http://localhost/MyPage/

without having to register them with mod\_mono in any way. Three ASP.NET application will be created with the proper physical and virtual paths.

### Standalone pages

As a user this means that you can now easily use ASP.NET in your account by just creating files with any of the ASP.NET extensions (.aspx, .ashx, .asmx,...). It makes writing ASP.NET applications as easy as authoring a PHP script.

For example:

``` bash
  $ echo $USER
  rupert
  $ cd
  $ cd public_html
  $ mkdir demo
  $ cd demo
  $ edit hello.aspx
```

And then

    http://localhost/~rupert/demo/hello.aspx

will just work.

ASP.NET MVC and AutoConfiguration
---------------------------------

Because ASP.NET MVC’s routing URLs avoid file name extensions, AutoConfiguration is not a good solution for hosting ASP.NET MVC solutions. For simple configuration of Apache [mod\_mono]({{ site.github.url }}/docs/web/mod_mono/), consider using the [Apache mod\_mono configuration tool](http://go-mono.com/config-mod-mono/).

That said, if you absolutely must use AutoConfiguration, you could add the following to your mod\_mono.conf file to set all content for the server to be served as x-asp-net content:

        ForceType application/x-asp-net

Internals of AutoConfiguration
------------------------------

There is a small but important difference between the packaged applications and a trivial sample that we showed: the prepackaged applications have a *global.asax* and/or a *bin* directory, while our *demo* directory has none of those.

For the prepackaged applications, the physical base directory will be set to the directory that contains the *global.asax* (or *Global.asax*) file and the virtual path will be /CommunityServer/, /nGallery/...

For the standalone file, the physical path will be determined comparing the physical and virtual paths, starting from the last directory and going up. The first non-matching path will determine the virtual and physical base paths. So, in our case, the application created would map the virtual path /\~rupert/ to /home/rupert/public\_html/.

The information about the physical root path of an application is important because ASP.NET will load your libraries from the "bin" directory at the base of the application, which is where you would have any third-party controls or assemblies required by your application.

### Detailed examples

When no configured ASP.NET application is found, mod\_mono will guess the physical and virtual paths base on the presence or not of a *bin* directory or *global.asax* file.

Here are some examples of how it is done when there's no *global.asax* or *bin*directory:

        Request: /~gonzalo/Gallery/index.aspx
        Virtual directory:  /~gonzalo/Gallery/
        Physical directory: /home/gonzalo/public_html/Gallery/
        Global.asax or bin: no
        ASP.NET application virtual path: /~gonzalo/
        ASP.NET application physical path: /home/gonzalo/public_html/

 XSP will compare the directories in the virtual and physical paths starting from the end until they stop matching or until it finds a *bin* directory or a *global.asax* file, whichever happens first.

For the same request, but this time we have a *global.asax* in the Gallery directory:

        Request: /~gonzalo/Gallery/index.aspx
        Virtual directory:  /~gonzalo/Gallery/
        Physical directory: /home/gonzalo/public_html/Gallery/
        Global.asax or bin: yes
        ASP.NET application virtual path: /~gonzalo/Gallery/
        ASP.NET application physical path: /home/gonzalo/public_html/Gallery/

Automatic hosting and virtual hosts
-----------------------------------

As of today, all the virtual hosts hosted in the server share the same instance of mod-mono-server. You can enable/disable automatic hosting for every virtual host.

