---
layout: obsolete
title: "Publishing Websites From Visual Studio"
permalink: /old_site/Publishing_Websites_From_Visual_Studio/
redirect_from:
  - /Publishing_Websites_From_Visual_Studio/
---

Publishing Websites From Visual Studio
======================================

**This article is incomplete, please add to it.**

The easiest way to test your ASP.Net website running on Mono on Linux is to download the Mono VMWare image. It comes preconfigured with a running instance of Apache and mod\_mono. These directions describe how to publish to this image from Visual Studio 2008, however they also apply to any similarly setup instance of Linux/Mono/Apache.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#Example">1 Example</a></li>
<li><a href="#Web_Site_vs_Web_Application">2 Web Site vs Web Application</a></li>
<li><a href="#Publishing_a_Web_Site_Project">3 Publishing a Web Site Project</a></li>
<li><a href="#Publishing_a_Web_Application_Project">4 Publishing a Web Application Project</a></li>
<li><a href="#Setting_up_Applications">5 Setting up Applications</a></li>
</ul></td>
</tr>
</tbody>
</table>

Example
-------

Suppose we have a nifty little ASP.Net website that asks for two numbers, and returns them added together. Currently, we know our site works great on .Net, as we can tell from Visual Studio's built-in development web server:

[![Aspexample1.png]({{site.github.url}}/old_site/images/8/8d/Aspexample1.png)]({{site.github.url}}/old_site/images/8/8d/Aspexample1.png)

Now we want to run our website on Mono/Apache.

Web Site vs Web Application
---------------------------

Visual Studio makes a distinction between "Web Site Projects" and "Web Application Projects". The differences are described [here](http://msdn.microsoft.com/en-us/library/aa730880(VS.80).aspx#wapp_topic5) on MSDN. The difference that affects deploying to Mono is that web *application* projects are precompiled, which Mono does not support. Therefore, you need to know which type of project you are deploying so you can follow the correct steps.

Publishing a Web Site Project
-----------------------------

Publishing a web site project is easy.

-   Choose Build-\>Publish \<website\>
-   In the Publish Web Site wizard:
    -   Fill in the path to your linux instance: \\\\linux\\htdocs\\MyWebsite\\
        -   (Replace MyWebsite with whatever path you want.)
    -   You can replace or delete existing files.
    -   Copy "All files in the source project folder".
    -   Select "Include files from the App\_Data folder.

[![Asppublish1.png]({{site.github.url}}/old_site/images/5/5b/Asppublish1.png)]({{site.github.url}}/old_site/images/5/5b/Asppublish1.png)

-   Click Publish
-   If you are prompted for a username/password, enter them.
    -   For the Mono 2.2 VMWare image, this is mono/mono.
-   When it completes, you should be able to test your website by browsing to it:
    -   <http://linux/MyWebsite/>

[![Asppublish2.png]({{site.github.url}}/old_site/images/1/1f/Asppublish2.png)]({{site.github.url}}/old_site/images/1/1f/Asppublish2.png)

Publishing a Web Application Project
------------------------------------

-   Choose Website-\>Copy Web Site
-   On the Copy Web Site dialog, choose Connect
    -   Choose File System
    -   Enter the path to your linux instance: \\\\linux\\htdocs\\MyWebsite\\
        -   (Replace MyWebsite with whatever path you want.)
    -   Choose Open

[![Aspcopy1.png]({{site.github.url}}/old_site/images/e/e3/Aspcopy1.png)]({{site.github.url}}/old_site/images/e/e3/Aspcopy1.png)

-   Select all the files to your website, and click the right arrow to copy them to the Linux image.

[![Aspcopy2.png]({{site.github.url}}/old_site/images/6/6d/Aspcopy2.png)]({{site.github.url}}/old_site/images/6/6d/Aspcopy2.png)

-   When it completes, you should be able to test your website by browsing to it:
    -   <http://linux/MyWebsite/>

Setting up Applications
-----------------------

When you try to run your site, you may get an error like this:

[![Aspcopy4.png]({{site.github.url}}/old_site/images/d/da/Aspcopy4.png)]({{site.github.url}}/old_site/images/d/da/Aspcopy4.png)

This means you need to setup an ASP.Net application for your site, just like you would on IIS.

To do this:

-   TODO


