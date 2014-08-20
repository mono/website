---
title: "Consuming a WebService"
lastmodified: '2007-11-08'
redirect_from:
  - /Consuming_a_WebService/
---

Consuming a WebService
======================

A web service makes it easy to access data and services offered by other people or running on a different machine. For example, Google provides a web service that allows your application to access many of the services it provides.

One capability provided by Google is the spell checker they use when you enter a search term. By consuming the web service, you can add a spell check function to your own application.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#first-steps-creating-the-local-stub">1 First Steps: Creating the Local Stub</a></li>
<li><a href="#google-license-key">2 Google License key</a></li>
<li><a href="#example-1-a-console-application">3 Example 1: A Console Application</a></li>
<li><a href="#example-2-a-webpage">4 Example 2: A Webpage</a></li>
<li><a href="#documentation">5 Documentation</a></li>
<li><a href="#contributors">6 Contributors</a></li>
</ul></td>
</tr>
</tbody>
</table>

First Steps: Creating the Local Stub
------------------------------------

To create the local library that will invoke Google's web service, we'll use their WSDL file. You can get the Google WSDL files at [http://api.google.com/GoogleSearch.wsdl](http://api.google.com/GoogleSearch.wsdl). To generate the C\# stub source type:

``` bash
wsdl http://api.google.com/GoogleSearch.wsdl
```

This will create a file called `GoogleSearchService.cs`, which contains the behind the scenes code needed to access the web service. Compile this file with:

``` bash
mcs /target:library GoogleSearchService.cs -r:System.Web.Services
```

The above command line instructs the compiler to generate a library, and to reference (-r:) the System.Web.Services library.

Now you have the final stub assembly: `GoogleSearchService.dll`

Google License key
------------------

Google locks the web service with a special key to prevent misuse. You can obtain a key at [https://www.google.com/accounts/NewAccount](https://www.google.com/accounts/NewAccount). This key allows \~50 actions per day. You must replace the sample key with yours.

Example 1: A Console Application
--------------------------------

Now that you have an assembly for the web service, you can use it just like any other assembly.

The Code:

``` csharp
using System;
 
class SpellChecker
{
    public static void Main (string [] args)
    {
        // Your license key
        const string licensekey = "FCszK/FQFHJWQE1n5OkeGmZAWzCFY5+7";
 
        // Create a Google Search object
        GoogleSearchService Service1 = new GoogleSearchService ();
 
        // Ask for spelling suggestion
        // The first argument is your key
        // The second one, the text the user should enter.
 
        String suggestion = Service1.doSpellingSuggestion (licensekey, args[0]);
 
        // Display the suggestion, if any
        if (suggestion == null)
            Console.WriteLine("[No suggestion]");
        else
            Console.WriteLine(suggestion);
    }
}
```

Compile it like this:

``` bash
mcs /r:GoogleSearchService.dll spellchecker.cs
```

Run it like this:

``` bash
mono spellchecker.exe pupy
```

And it should print out the corrected word:

``` bash
puppy
```

Example 2: A Webpage
--------------------

You can also call a web service from a web page. First you will have to drop the stub GoogleSearchService.dll in your ASP.Net bin directory. The example is very simple to understand.

    <%@ Page Language="C#" %>
    <script runat="Server">

    void Page_Load (object sender, EventArgs e) {

        // Put your license key here
        const string licensekey = "FCszK/FQFHJWQE1n5OkeGmZAWzCFY5+7";

        // Create a Google Search object
        GoogleSearchService Service1 = new GoogleSearchService ();

        // Ask for spelling suggestion
        // The first argument is your key
        // The second one, the text the user should enter.

        String suggestion = Service1.doSpellingSuggestion (licensekey, TextBox1.Text);

        // Display the suggestion, if any
        if (suggestion == null)
            Label1.Text = "[No suggestion]";
        else
            Label1.Text = suggestion;
    }
    </script>

    <html>
    <body>
    <h2>Hello WebService!</h2>
    <form runat="server">
    <p><asp:TextBox id="TextBox1" runat="server"></asp:TextBox></p>
    <p><asp:Label id="Label1" runat="server"></asp:Label></p>
    <p><input type="submit" value="Submit" runat="server"></input></p>
    </form>
    </body>
    </html>

This will look like this:

[Image:google.png]

The code where the web service is accessed is marked red. To test the service enter "spelll checker" for example, and watch it correct your spelling.

Documentation
-------------

If you want to do more, you will require documentation of the web service. For Google's API, one place to look is in the comments of the WSDL file. Individual web service providers are responsible for providing good documentation, though you may be able to use the C\# introspection tools or read the source generated by `wsdl` for a slightly better idea of how any given web service works.

Contributors
============

Johannes Roith, Shane Landrum

