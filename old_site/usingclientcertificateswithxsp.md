---
layout: obsolete
title: "UsingClientCertificatesWithXSP"
lastmodified: '2007-08-09'
permalink: /old_site/UsingClientCertificatesWithXSP/
redirect_from:
  - /UsingClientCertificatesWithXSP/
---

UsingClientCertificatesWithXSP
==============================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#prerequisites">2 Prerequisites</a></li>
<li><a href="#creating-a-test-page">3 Creating a test page</a>
<ul>
<li><a href="#first-test">3.1 First test</a></li>
</ul></li>
<li><a href="#setting-up-xsp-for-ssl-support">4 Setting up XSP for SSL support</a>
<ul>
<li><a href="#creating-the-server-certificate">4.1 Creating the server certificate</a></li>
<li><a href="#testing-the-ssl-connection">4.2 Testing the SSL connection</a></li>
</ul></li>
<li><a href="#client-side-certificates">5 Client side certificates</a>
<ul>
<li><a href="#creating-client-certificates">5.1 Creating client certificates</a></li>
<li><a href="#testing">5.2 Testing</a>
<ul>
<li><a href="#firefox">5.2.1 Firefox</a></li>
<li><a href="#wget">5.2.2 wget</a></li>
<li><a href="#systemnethttpwebrequest">5.2.3 System.Net.HttpWebRequest</a></li>
</ul></li>
</ul></li>
<li><a href="#conclusion">6 Conclusion</a></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
============

This article is based on many of my previous [blog](http://pages.infinit.net/ctech/poupou.html) entries on the subject. While a blog is a fantastic communication tool the fact is that every new entry makes it harder to get a complete view, and understanding, on the same subject. So this article will merge all pertinent information on how to use Secure Socket Layer (SSL) client certificates with Mono XSP.

While this article mostly speaks of SSL everything applies to both SSL3 and Transport Layer Security (TLS - [RFC2246](http://www.ietf.org/rfc/rfc2246.txt)) also sometime known as SSL 3.1/3.01. The older SSL2 is not supported by Mono and anyway didn't support client side certificates.

Prerequisites
=============

In order to start executing the various steps in this article you'll need to have the following software installed:

1.  [Mono 1.1.10](http://www.go-mono.com/archive/1.1.10/) (or later)
2.  [XSP]({{site.github.url}}/ASP.NET#XSP) 1.1.10 (or later)
3.  An SSL enabled client like [FireFox](http://www.mozilla.org/products/firefox/), IE and/or wget
4.  [Wireshark](http://www.wireshark.org/) (optional as a debugging/learning tool)

Note that a lot of those features were available before Mono/XSP 1.1.10, but it just got a lot easier to setup (and I must start somewhere ;-).

Creating a test page
====================

Our goal is to enable the use of SSL with client certificates on XSP. So the first step is to find how we'll test whether this works or not. Using Wireshark to check every SSL records is a 100% sure, but hard, way to validate the results. Still this is an interesting approach if you want to debug or learn more about SSL but I suspect most people want a more direct, and friendly, way to get results.

It turns out that we can make a simple ASP.NET page to:

1.  test if we are, or not, using a secure connection (i.e. https);
2.  test if we are, or not, using a client certificate;
3.  test if our client certificate is valid from the server point of view.

<!-- -->

    <%@ Page language="c#" %>
    <html>
     <head>
       <script runat="server">
       void Page_Load (object sender, EventArgs e)
       {
         // first check is to know if we're using SSL or not
         if (!Request.IsSecureConnection) {
           info.Text = "Hello from an insecure session.";
           return;
         }

         // second check is to see if a client certificate is present
         HttpClientCertificate hcc = Request.ClientCertificate;
         if (hcc.IsPresent) {
           System.Security.Cryptography.X509Certificates.X509Certificate cert =
             new System.Security.Cryptography.X509Certificates.X509Certificate (hcc.Certificate);

           // third check is to ensure that the certificate is valid
           info.Text = String.Format ("Hello {0}, your certificate is{1}valid",
             cert.GetName (), hcc.IsValid ? String.Empty : " NOT");
         } else {
           info.Text = "Hello from an secure session. But who are you ?";
         }
       }
       </script>
     </head>
     <body>
       <form runat="server">
         <asp:Label id="info" runat="server" />
       </form>
     </body>
    </html>

Accessing this page from a web browser will result in either:

-   **Hello from an insecure session.** if you aren't using https to communicate with the server.
-   **Hello from an secure session. But who are you ?** if you are using https but didn't send a client certificate to the server
-   **Hello X, your certificate is NOT valid** if you are using https but your client certificate is either untrusted, outside it's validity period...
-   **Hello X, your certificate is valid** if you are using https but your client certificate is valid (from the server point of view)

First test
----------

Let's try it right now (without SSL). Save the page as **cctest.aspx**, start XSP (without any parameters) in this directory and point your web browser to `http://localhost:8080/cctest.aspx`. You should be seeing "**Hello from an insecure session.**" (or else XSP and/or mono aren't working correctly on your computer).

Setting up XSP for SSL support
==============================

Our next step is to enable SSL on XSP. This requires a few command line options, an SSL certificate and the private key matching the certificate public key.

I assume that most people reading this article don't want to buy a "real" SSL certificate from a "known" CA. Here "real" and "known" implies that the certificate won't require any configuration to enable web browser to "trust" your web site. Luckily both Mono (and the MS framework) comes with an handy utility to create "test" certificates (i.e. untrusted without manual configuration).

Creating the server certificate
-------------------------------

Note that we could make our SSL server certificate a self-signed certificate but this will force us to trust, at least, another root certificate to support client certificates later. So let's create our own trusted root...

    % makecert -r -n "CN=My Own Test CA" -sv root.key root.cer

1.  **-r** Create a self-signed certificate. This will allow us to trust this certificate which, in turn, will transitively imply that every certificate issued (i.e. signed) by this new Certificate Authority (CA), like the SSL server certificate and the client certificates, will also be trusted.
2.  **-n "CN=My Own Test CA"** Common Name (CN) = The name of your certificate authority.
3.  **-sv root.key** The private key file. A 1024 bits RSA key pair will automatically be generated if the specified file name doesn't exists.
4.  **root.cer** The created SSL certificate for your root CA.

You can use `man makecert` to see all the options provided by the makecert tool. Be aware that some options, like generating PKCS\#12 files, is only available on the Mono version of the tool.

Now that we have our own Certificate Authority the next step is, before we forget about it, is to install the root certificate into the current user **Trust** certificate store.

    % certmgr --add -c Trust root.cer

Note that you need to do this on every computer/operating system that you'll use to try the SSL tests in this article. On Windows you can use Explorer to double-click on the root.cer file. This will show a warning dialog (with lot of confusing data) that allow you to install the certificate as a new trusted root.

We can now use our CA certificate to issue a (end-entity) certificate for server-side authentication. SSL clients, like web browsers, expects the Common Name (CN) of the certificate to be the same as it's hostname. Otherwise they will either abort or warn you about the mismatch.

To avoid this problem you can use the `hostname` command to make sure that the name of your host is found in the certificate.

    % hostname
    pollux

And then use the `makecert` tool...

    % makecert -iv root.key -ic root.cer -eku 1.3.6.1.5.5.7.3.1 -n "CN=pollux" -p12 pollux.p12 s3kr3t

The parameters used to build this SSL server certificate are:

1.  **-iv root.key** The issuer's private key. The certificate needs to be signed by the root (issuer) in order to build a signature chain that can be, later, verified by the SSL client.
2.  **-ic root.cer** The issuer's certificate. Some information about the issuer, like it's name, needs to be copied into the issued certificate.
3.  **-eku 1.3.6.1.5.5.7.3.1** Optional (as sadly most client don't require it). This indicates that the certificate is intended for server-side authentication.
4.  **-n "CN=pollux"** Common Name (CN) = Host name. This is verified the SSL client and must match the connected host (or else you'll get a warning or error or \*gasp\* nothing).
5.  **-p12 pollux.p12 s3kr3t** The PKCS\#12 file that contains the SSL certificate and the password encrypted private key.

Testing the SSL connection
--------------------------

We can now start XSP with its SSL support. The syntax is

    % xsp --https --port 4433 --p12file pollux.p12 --pkpwd s3kr3t

Where

1.  **--https** turns on SSL3/TLS (autodetection is enabled by default);
2.  **--port 4433** to set our SSL test port (normally SSL uses port 443);
3.  **--p12file pollux.p12** to read the SSL certificate and private key from the specified PKCS\#12 file;
4.  **--pkpwd s3kr3t** to decrypt the private key so the server can use it to prove it's the real owner of the certificate.

You should be able to point your web browser to `https://pollux:4433/cctest.aspx`. You should be prompted by your web browser because the certificate isn't trusted (i.e. certmgr works only for Mono). A positive answer should results in the "**Hello from an secure session. But who are you ?**" message.

If this doesn't work ensure that:

1.  you used **https** (i.e. not `http`);
2.  you used your own host name (i.e. not `pollux`);
3.  that the port, *4433*, match between XSP and your browser.

Client side certificates
========================

So you now have a "secure" connection. But what does secure means ? Simply that all traffic is encrypted (on both ways) - but not much more. So ? well you're trusting the web server (the browser asked you ;-) but the server doesn't (or shouldn't ;-) "trust" you - because it doesn't know anything about you.

This is a one-way trust relation between you, the (partially) anonymous user and the web server. That's why most servers will (or should) ask you for a username and password before doing anything interesting.

However SSL, since version 3, provides a way to establish a two-way trust relation between clients and a server. This is called client-side certificates.

Creating client certificates
----------------------------

The process of creating client certificates is very similar to creating server certificates. The main change is that we're issuing certificates (from the CA) to individuals, not hosts.

Let's create a certificate for the current user...

    % whoami
    poupou

    % makecert -iv root.key -ic root.cer -eku 1.3.6.1.5.5.7.3.2 -n "CN=poupou" -p12 poupou.p12 s3kr3t

The parameters used to build this test certificate are:

1.  **-iv root.key** The issuer's private key. The certificate needs to be signed by the root (issuer) in order to build a signature chain that can be, later, verified by the SSL server.
2.  **-ic root.cer** The issuer's certificate. Some information about the issuer, like it's name, needs to be copied into the issued certificate.
3.  **-eku 1.3.6.1.5.5.7.3.2** This indicates that your certificate is intended for client-side authentication.
4.  **-n "CN=poupou"** This is generally verified the server against a database of users (if the certificate is accepted).
5.  **-p12 poupou.p12 s3kr3t** The PKCS\#12 file, poupou.p12 will be created and encrypted using the s3kr3t password. This is the new option and isn't compatible with MS version of makecert.

Testing
-------

Stop (if running) and restart XSP with the following parameters.

    % xsp --https-client-accept --port 4433 --p12file pollux.p12 --pkpwd s3kr3t

The difference with the earlier test is that we're using **--https-client-accept** instead of **-https**. This instruct the web server to accept client certificates (if available).

Using a web browser on `https://pollux:4433/cctest.aspx` will still return **Hello from an secure session. But who are you ?**. Why ? because there's nothing "requesting" a client certificate and your web browser doesn't know anything about your PKCS\#12 file.

So the **--https-client-accept** option isn't really interesting for web browsers (i.e. but it can be much more interesting for web services) so let's try another one, **--https-client-require**

    % xsp --https-client-require --port 4433 --p12file pollux.p12 --pkpwd s3kr3t

### Firefox

Now try the URL with Firefox (sorry but every browser is different) and you'll get an error (-12250 in my case). Something has gone wrong, but what ? Well FireFox still doesn't know anything about your PKCS\#12 file.

We'll need to import the file into its own certificate store (Edit, Preferences, Advanced, Manage Certificates, Import) and try again. This time you should see **Hello CN=poupou, your certificate is NOT valid**. So the web server has received, and verified, our client certificate.

### wget

Another way to test this is using a tool that will let use supply the client certificate. **wget** can do this - but not with our PKCS\#12 file so we'll need to convert it to a PEM file using [OpenSSL](http://www.openssl.org).

    % openssl pkcs12 -in poupou.p12 -out poupou.pem -nodes
    Enter Import Password:
    MAC verified OK

**Note:** The -nodes option will generate a PEM file that doesn't requires a password (i.e. the private key **won't be** encrypted).

    % wget --sslcertfile=poupou.pem https://localhost:4433/cctest.aspx

If you look at the downloaded file you should see the same message as we received when using Firefox.

### System.Net.HttpWebRequest

With recent versions of Mono (see note) it is now possible to use the HttpWebRequest class to supply the client certificates to the server. There are restrictions because the API, at least for 1.x, isn't complete enough to supply the required private key (on Windows CryptoAPI keeps, **in some cases**, a match of certificates and private key).

The following source code should work, for fx 2.0, under both Mono and MS runtimes.

``` csharp
using System;
using System.IO;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Text;
 
public class HttpWebRequestClientCertificateTest : ICertificatePolicy {
 
    public bool CheckValidationResult (ServicePoint sp, X509Certificate certificate,
        WebRequest request, int error)
    {
        return true;
    }
 
    static void Main (string[] args)
    {
        string host = "localhost";
        if (args.Length > 0)
            host = args[0];
 
        X509Certificate2 certificate = null;
        if (args.Length > 1) {
            string password = null;
            if (args.Length > 2)
                password = args [2];
            certificate = new X509Certificate2 (args[1], password);
        }
 
        ServicePointManager.CertificatePolicy = new HttpWebRequestClientCertificateTest ();
 
        HttpWebRequest req = (HttpWebRequest) WebRequest.Create (host);
        if (certificate != null)
            req.ClientCertificates.Add (certificate);
 
        WebResponse resp = req.GetResponse ();
        Stream stream = resp.GetResponseStream ();
        StreamReader sr = new StreamReader (stream, Encoding.UTF8);
        Console.WriteLine (sr.ReadToEnd ());
    }
}
```

Compile and execute the sample like this:

    % gmcs hwr2.cs

    % mono hwr2.exe https://localhost:4433/cctest.aspx poupou.p12 s3kr3t

Note: this feature is working only on the 2.0 profile since Mono version 1.2.5. It is mandatory that the new **X509Certificate2** class be used to load a format that contains a private key (e.g. a PKCS\#12 file).

Conclusion
==========

At first glance using a client certificate for authentication to a web server may not seem a big deal but it also has it's share of inconveniences (certificate issuance, authentication is done on the transport level). So it's increased security also comes at increased cost (but be aware that password are also costly ;-) which explain why we rarely see technology this in our everyday lives.

