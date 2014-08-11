---
title: "Web Services"
lastmodified: '2010-06-22'
redirect_from:
  - /Web_Services/
---

Web Services
============

Web services are basically a modern form of a remote procedure call (RPC) system. They allow applications on one machine to execute operations on another machine. Systems integrators use web services to make widely differing systems talk to one another.

-   [Using WebServices with Gtk\# applications](/Webservices_and_GtkSharp "Webservices and GtkSharp")
-   [See this article with Visual Basic code](/Web_Services_(Visual_Basic) "Web Services (Visual Basic)")

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#an-example">1 An Example</a></li>
<li><a href="#technical-background-soap">2 Technical Background: SOAP</a></li>
<li><a href="#internal-communication">3 Internal Communication</a></li>
<li><a href="#consuming-web-services">4 Consuming Web Services</a>
<ul>
<li><a href="#first-steps-creating-the-local-stub">4.1 First Steps: Creating the Local Stub</a></li>
<li><a href="#google-license-key">4.2 Google License key</a></li>
<li><a href="#application-1-the-google-spell-checker-on-a-webpage">4.3 Application 1: The Google Spell Checker on a Webpage</a></li>
<li><a href="#application-2-a-console-application">4.4 Application 2: A Console Application</a></li>
<li><a href="#documentation">4.5 Documentation</a></li>
</ul></li>
<li><a href="#contributors">5 Contributors</a></li>
</ul></td>
</tr>
</tbody>
</table>

An Example
==========

To understand, let's take a look at a hypothetical example. Imagine a class like this:

``` csharp
NewsTicker ournews = new NewsTicker();
string headline = ournews.GetHeadline(1);
Console.WriteLine(headline);
```

This could be a local function operating on your own machine, or it could be a web service. If it were a web service, the actual code that returns the headline might be running on some other machine somewhere on the internet. You don't have to know what it's doing; there might be a database on the other end of the service, a screen-scraper, or a carrier-pigeon-message translation service. The code on the remote webserver might be PHP, Java, Python, or COBOL. That's the point of web services.

Technical Background: SOAP
==========================

Under the hood, Mono uses a protocol called SOAP to make web services work just like other methods. In the example above, when GetHeadline() is called, Mono generates an XML file that describes an information request. It could look like this:

    <webservice url="http://somenewsservice.com/webservice">
            <function name="GetHeadLine" >
                    <int name="number" value="1" />
            </function>
    </webservice>

In the real world it looks very different and much more complicated, but that's the basic logic. The remote webserver reads the request, interprets it, and runs some business logic. It sends back an XML response packet something like this:

    <webservice url="http://somenewsservice.com/webservice">
            <function name="GetHeadLine" >
                    <int name="return" value="This is some new from CNN" />
            </function>
    </webservice>

Mono knows how to take XML response packets and turn them into data your application can use.

Internal Communication
======================

In order to use a web service, Mono requires a descriptor file written in WSDL (Web Services Description Language). WSDL is an XML description of the API for a given web service. Mono's tool `wsdl `knows how to translate a WSDL file into a C\# library that can run that web service. The local library file is a wrapper around the web service, but it gets installed into the GAC just like any other library.

Consuming Web Services
======================

As an example of what can be done with web services, let's use a part of Google's publicly accessible web services, the Google spell checker. When you enter "spelll checker" in Google, it will ask you if you meant "spell checker". With the Google web service, you can use that function directly from C\#.

First Steps: Creating the Local Stub
------------------------------------

To create the local library that will invoke Google's web service, we'll use their WSDL file. You can get the Google WSDL files at [http://api.google.com/GoogleSearch.wsdl](http://api.google.com/GoogleSearch.wsdl). To generate the C\# stub source type:

``` bash
wsdl GoogleSearch.wsdl
```

This will result in `GoogleSearchService.cs `. Compile with:

``` bash
gmcs /target:library GoogleSearchService.cs -r:System.Web.Services
```

The above command line instructs the compiler to generate a library, and to reference (-r:) the System.Web.Services library.

Now you have the final stub assembly: `GoogleSearchService.dll `

Google License key
------------------

Google does lock the web service with a special key. You can obtain a key at [https://www.google.com/accounts/NewAccount](https://www.google.com/accounts/NewAccount). This key allows \~50 actions per day. You must replace my sample key with yours.

Application 1: The Google Spell Checker on a Webpage
----------------------------------------------------

We will start by using the spell checker on a simple web page. First you will have to drop the stub GoogleSearchService.dll in your ASP.NET bin directory. The example is very simple to understand.

    <%@ Page Language="C#" %>
    <script runat="Server">

    void Page_Load(object sender, EventArgs e) {
        
        // Put your license key here
        const string licensekey = "FCszK/FQFHJWQE1n5OkeGmZAWzCFY5+7";
        
        // Create a Google Search object
        GoogleSearchService Service1 = new GoogleSearchService();
        
        // Ask for spelling suggestion
        // The first argument is your key
        // The second one, the text the user should enter.
        
        String suggestion = Service1.doSpellingSuggestion(licensekey, TextBox1.Text);   
        
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

Application 2: A Console Application
------------------------------------

You can also consume the WebService with a Console or Gtk\# application. You'll need to reference GoogleSearchService.dll when you compile.

``` bash
mcs /r:GoogleSearchService.dll spellchecker.cs
```

The Code:

``` csharp
using System;
 
class SpellChecker {
 
    public static void Main(string [] args) {
 
        // Your license key
        const string licensekey = "FCszK/FQFHJWQE1n5OkeGmZAWzCFY5+7";
 
        // Create a Google Search object
        GoogleSearchService Service1 = new GoogleSearchService();
 
        // Ask for spelling suggestion
        // The first argument is your key
        // The second one, the text the user should enter.
 
        String suggestion = Service1.doSpellingSuggestion(licensekey, args[0]);    
 
        // Display the suggestion, if any
        if (suggestion == null)
            Console.WriteLine("[No suggestion]");
        else    
            Console.WriteLine(suggestion);
    }
}
```

Documentation
-------------

If you want to do more, you will require documentation of the web service. For Google's API, one place to look is in the comments of the WSDL file. Individual web service providers are responsible for providing good documentation, though you may be able to use the C\# introspection tools or read the source generated by `wsdl `for a slightly better idea of how any given web service works.

Contributors
============

Johannes Roith, Shane Landrum

