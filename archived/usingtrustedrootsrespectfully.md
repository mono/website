---
title: "UsingTrustedRootsRespectfully"
lastmodified: '2010-09-15'
permalink: /archived/UsingTrustedRootsRespectfully/
redirect_from:
  - /UsingTrustedRootsRespectfully/
  - /UsingTrustedRootsRespectfully_trust/
---

UsingTrustedRootsRespectfully
=============================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#approaches">2 Approaches</a>
<ul>
<li><a href="#approach--1-actively-ignore-security-concerns">2.1 Approach #-1: Actively ignore security concerns</a></li>
<li><a href="#approach-0-ignore-the-problem">2.2 Approach #0: Ignore the problem</a></li>
<li><a href="#approach-1-minimalist">2.3 Approach #1: Minimalist</a></li>
<li><a href="#approach-2-warn-and-offer-the-possibility-to-continue">2.4 Approach #2: Warn and offer the possibility to continue</a></li>
<li><a href="#approach-3-application-centric-trust">2.5 Approach #3: Application centric trust</a></li>
<li><a href="#approach-4-offer-to-trust-the-new-root-certificate">2.6 Approach #4: Offer to trust the new root certificate</a></li>
<li><a href="#approach-5-application-or-global-trust">2.7 Approach #5: Application or global trust</a></li>
<li><a href="#random-notes">2.8 Random Notes</a></li>
</ul></li>
<li><a href="#conclusion">3 Conclusion</a></li>
<li><a href="#appendix---source-code">4 Appendix - Source code</a></li>
<li><a href="#approach--1-actively-ignore-security-concerns-">5 Approach #-1: Actively ignore security concerns =</a>
<ul>
<li><a href="#approach-0-ignore-the-problem_2">5.1 Approach #0: Ignore the problem</a></li>
<li><a href="#approach-1-minimalist_2">5.2 Approach #1: Minimalist</a></li>
<li><a href="#approach-2-warn-and-offer-the-possibility-to-continue_2">5.3 Approach #2: Warn and offer the possibility to continue</a></li>
<li><a href="#approach-3-application-centric-trust_2">5.4 Approach #3: Application centric trust</a></li>
<li><a href="#approach-4-offer-to-trust-the-new-root-certificate_2">5.5 Approach #4: Offer to trust the new root certificate</a></li>
<li><a href="#approach-5-application-or-global-trust_2">5.6 Approach #5: Application or global trust</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
============

You may have never heard of public-key infrastructures (PKI) and X.509 but you probably used them, most likely today. This is part of how (most) SSL/TLS secure sessions are established over HTTP (i.e. HTTPS) using HttpWebRequest.

In order to use X.509 certificates you must be able to link it back to a trusted source. This is process is generally known as chaining and the trusted source is often a self-signed certificate which is specially identified (e.g. by being stored in a specific location).

From a application developer point of view you should never assume that a particular trusted root certificate is present on the user's computer. Why? Simply because they changes. The most common changes are:

1.  new roots certificates are added (i.e. you are trusting new sources);
2.  new certificates are used to replace older ones (like extending the validity period of the certificate authority).
3.  existing roots certificates are removed (i.e. you stop trusting them);

So it's important for applications to check for any trust problem, on any platform, but it's even more important on Mono because it doesn't ship with any trusted root by default (see the [FAQ:\_Security]({{ site.github.url }}/FAQ:_Security "FAQ: Security") for more details).

Approaches
==========

This articles goes over several approaches an application may take to solve, or even ignore, this situation. Source code for each case can be found at the end of the article.

Approach \#-1: Actively ignore security concerns
------------------------------------------------

You believe that security is for the weak and/or that SSL is encrypting anyway (so why should you have to trust the other end?) and that your application has the divine right to choose what's secure, or not, for its end users.

End User Choices

-   N/A (nothing to see, move along)

Pros

-   Users won't ever see a trust error from your application.

Cons

-   Users are much likely to see and/or suffer from your application (anyway).

Note: This approach is different than using custom, i.e. application specific, rules to determine if the trust error should be ignored. E.g. the `tlstest` application in Mono's SVN is a test tool that reports (prints) errors but will continue downloading a web page no matter what error occurs.

Approach \#0: Ignore the problem
--------------------------------

Many existing application totally ignore the trust problem. This is a sad situation because they are simply dumping the problem on end-users - which probably have even less information and knowledge about the problem and how it can be solved.

End User Choices

-   N/A (unformatted information only)

Pros

-   Works on both Mono and MS runtimes;
-   Easy (nothing to do) and (sadly) popular;

Cons

-   Application is unusable until the end-user figures out how to add the required certificate to its trusted list. Depending on the hints available (e.g. stacktrace) it may be impossible for the user to reach that conclusion. It's a good way to royally piss off a potential user about your application.

    Unhandled Exception: System.Net.WebException: Error getting response stream (Trust failure): TrustFailure
    ---> System.IO.IOException: The authentication or decryption has failed.
    ---> Mono.Security.Protocol.Tls.TlsException: Invalid certificate received form server.

Approach \#1: Minimalist
------------------------

Such an error is easy to trap and report to end-user. You only must catch the `WebException` exception thrown by `HttpWebRequest.GetResponse` and report an informative error and instructions to the end-user. E.g. Why the operation can't work and how this affects the current application.

End User Choices

-   N/A (formatted information only)

Pros

-   Works on both Mono and MS runtimes;

Cons

-   Applications are unusable until the end-user complete the instructions. Bad if/when the user is only testing/reviewing a new application. It's a good way to make a very bad impression the first time a user tries your application.

Approach \#2: Warn and offer the possibility to continue
--------------------------------------------------------

Inform the user about the trust issue and let them continue at their own risk.

End User Choices

-   Don't connect to the untrusted site. This should be the default action.
-   Accept the connection, but only for this session;

Pros

-   Works on both Mono and MS runtimes;
-   Application is usable right-away, without even restarting it, to the end-user. You get to keep the nice first impression;
-   It doesn't requires any changes outside the application unless the user wants to make the trust permanent;

Cons

-   The same choice will be asked, over and over again, each time the application use this feature or, at least, each time the application is restarted and use the feature. You had the first impression right but your users may eventually loose patience over your application.

Approach \#3: Application centric trust
---------------------------------------

This isn't a very common approach but it can be a very good one for most applications. Trust decisions don't have to be global (i.e. for all managed applications) and may make sense only to your application (or to an application group). So keeping an history of the users past decisions is both more secure and more user friendly than the previous approach.

End User Choices

-   Don't connect to the untrusted site. This should be the default action.
-   Accept the connection, only for this session;
-   Always trust the certificate when used in this application;

Pros

-   Works on both Mono and MS runtimes;
-   Application is usable right-away, without even restarting it, to the end-user;
-   It doesn't require any changes outside the application;

Cons

-   The trust is limited to this application (or to an application group). Note that, depending on the application, this can be seen as an advantage;

Approach \#4: Offer to trust the new root certificate
-----------------------------------------------------

This is similar to approach \#3 but it offers to make the trust relationship permanent. This may seem to makes a lot of sense for some applications but it's often hard to predict what other application will "inherit" this new trust.

End User Choices

-   Don't connect to the untrusted site. This should be the default.
-   Accept the connection, only for this session;
-   Trust the new root certificate.

Pros

-   Works only on Mono or only on MS Fx 2.0 (see notes).

Cons

-   Requires different code to work on Mono and MS Fx 2.0.
-   The trust on the new root is "global", i.e. all Mono applications or all MS applications (including non-managed applications).

Approach \#5: Application or global trust
-----------------------------------------

The last approach is to merge \#3 and \#4 to give all possible choice to the end user.

End User Choices

-   Don't connect to the untrusted site. This should be the default.
-   Accept the connection, only for this session;
-   Accept the connection, but only for this application.
-   Trust the new root certificate.

Pros

-   Users gets all the choices (but are they ready for that? or are you just dumping all this on them?)

Cons

-   Complexify the UI. The decision between an application or global trust for a certificate can, in most cases, be an application (i.e. not an end-user) decision.

Random Notes
------------

-   Framework v2.0 introduce some classes to manipulate certificate stores. Before that you'll need to p/invoke into CryptoAPI to get the same results.

Conclusion
==========

Sadly trusting user input for security related question is, at best, a "risky business".

There's no good reason to use approaches like \#-1 (adding code to be less secure), \#0 (doing nothing) and \#1 (only warn). An application should at least propose the user to continue (approach \#2).

Approach \#5 (too many choice) is the most complete. In fact it may be too complete for most (99%) of applications as it will likely confuse the end users more than help them. Also, and like \#4 (global trust), it's more difficult to make it work on all runtimes.

Choosing between \#3 and \#4 is harder as it greatly depends on the type of application you're writing (e.g. a configuration tool doesn't want to have its own trust list) but if interoperability between Mono and MS runtime is a concern then you should consider using \#3.

Appendix - Source code
======================

Here's included some **sample** code for each approach. The code is provided only to show how this could be done (i.e. what's the **minimum** involved). Also don't use my bad English skills as an excuse for your bad UI ;-).

The code is made to work, as much as possible, on every runtime. When this isn't possible (\#4/\#5) then the source code will only works on Mono. All samples use the `ICertificatePolicy`, deprecated in Fx 2.0, to provide users with a choice of options. The same technique can be used with Mono.Security.dll `SslClientStream.ServerCertValidationDelegate` (see tlstest.cs for an example) and Fx 2.0's `ServicePointManager.ServerCertificateValidationCallback`.

Approach \#-1: Actively ignore security concerns =
==================================================

Source code using the .NET 2.0 profile, which gives you better control over the certificates being examined:

``` csharp
using System;
using System.Net;
 
class MainClass
{
    public static bool Validator (object sender, X509Certificate certificate, X509Chain chain, 
                                      SslPolicyErrors sslPolicyErrors)
    {
        return true;
    }
 
    public static void Main (string[] args)
    {
        ServicePointManager.ServerCertificateValidationCallback = Validator;
        WebRequest wr = WebRequest.Create (args [0]);
        Stream stream = wr.GetResponse ().GetResponseStream ();
        Console.WriteLine (new StreamReader (stream).ReadToEnd ());
    }     
}
```

Source code for using the .NET 1.0 profile:

``` csharp
using System;
using System.IO;
using System.Net;
using System.Security.Cryptography.X509Certificates;
 
public class Program : ICertificatePolicy {
 
    public bool CheckValidationResult (ServicePoint sp, 
        X509Certificate certificate, WebRequest request, int error)
    {
        return true;
    }
 
    public static void Main (string[] args) 
    {
        ServicePointManager.CertificatePolicy = new Program ();
        WebRequest wr = WebRequest.Create (args [0]);
        Stream stream = wr.GetResponse ().GetResponseStream ();
        Console.WriteLine (new StreamReader (stream).ReadToEnd ());
    }
}
```

Instructions

    % mcs am1.cs
    % mono am1.exe https://www.some-site.com/

This will show the web page content without any error.

Approach \#0: Ignore the problem
--------------------------------

Source code

``` csharp
using System;
using System.IO;
using System.Net;
 
public class Program {
 
    public static void Main (string[] args) 
    {
        WebRequest wr = WebRequest.Create (args [0]);
        Stream stream = wr.GetResponse ().GetResponseStream ();
        Console.WriteLine (new StreamReader (stream).ReadToEnd ());
    }
}
```

 Instructions

    % mcs a0.cs
    % mono a0.exe https://www.some-site.com/
    Unhandled Exception: System.Net.WebException: Error getting response stream (Trust failure): TrustFailure
    ---> System.IO.IOException: The authentication or decryption has failed.
    ---> Mono.Security.Protocol.Tls.TlsException: Invalid certificate received form server.

Approach \#1: Minimalist
------------------------

Source code

``` csharp
using System;
using System.IO;
using System.Net;
 
public class Program {
 
    public static void Main (string[] args) 
    {
        try {
            WebRequest wr = WebRequest.Create (args [0]);
            Stream stream = wr.GetResponse ().GetResponseStream ();
            Console.WriteLine (new StreamReader (stream).ReadToEnd ());
        }
 
        catch (WebException we) {
            if (we.Status != WebExceptionStatus.TrustFailure)
                throw;
            Console.WriteLine ("You do not trust the people who " + 
                "issued the certificate being used by '{0}'." + 
                " Please see the application help file on " + 
                "the 'trust certificate' subject to learn " + 
                "about how this can be fixed.", args [0]);
        }
    }
}
```

Instructions

    % mcs a1.cs
    % mono a1.exe https://www.some-site.com/
    You do not trust the people who issued the certificate being used by 'https://www.some-site.com'.
    Please see the application help file on the 'trust certificate' subject to learn about how this can be fixed.

Approach \#2: Warn and offer the possibility to continue
--------------------------------------------------------

Source code

``` csharp
using System;
using System.IO;
using System.Net;
using System.Security.Cryptography.X509Certificates;
 
public class Program : ICertificatePolicy {
 
    public bool CheckValidationResult (ServicePoint sp, 
        X509Certificate certificate, WebRequest request, int error)
    {
        if (error == 0)
            return true;
        // only ask for trust failure (you may want to handle more cases)
        if (error != -2146762486)
            return false;
 
        Console.Write ("A trust error occured while attempting to " + 
            "access the web site. Do you wish to continue this " +
            "session even if we couldn't assess its security? ");
        return (Console.ReadLine ().ToLower () == "yes");
    }
 
    public static void Main (string[] args) 
    {
        ServicePointManager.CertificatePolicy = new Program ();
        try {
            WebRequest wr = WebRequest.Create (args [0]);
            Stream stream = wr.GetResponse ().GetResponseStream ();
            Console.WriteLine (new StreamReader (stream).ReadToEnd ());
        }
        catch (WebException we) {
            // don't show the exception for trust failures
            if (we.Status != WebExceptionStatus.TrustFailure)
                throw;
            Console.WriteLine ("Operation aborted by user.");
        }
    }
}
```

Instructions

    % mcs a2.cs
    % mono a2.exe https://www.some-site.com/
    A trust error occured while attempting to access the web site.
    Do you wish to continue this session even if we couldn't assess it's security? no
    Operation aborted by user.

Entering anything but **yes** results in the second message (aborted).

Approach \#3: Application centric trust
---------------------------------------

Source code

``` csharp
using System;
using System.Collections;
using System.IO;
using System.IO.IsolatedStorage;
using System.Net;
using System.Security.Cryptography.X509Certificates;
 
public class Program : ICertificatePolicy {
    private Hashtable ht;
 
    public void Load ()
    {
        if (ht == null) {
            ht = new Hashtable ();
        }
        // TODO - use isolated storage so this will work even with
        // minimal security permissions
    }
 
    public void Save (int error, string thumbprint)
    {
        // TODO
    }
 
    public bool CheckValidationResult (ServicePoint sp, 
        X509Certificate certificate, WebRequest request, int error)
    {
        if (error == 0)
            return true;
        // only ask for trust failure (you may want to handle more cases)
        if (error != -2146762486)
            return false;
 
        Load ();
        string thumbprint = certificate.GetCertHashString ();
        object result = ht [thumbprint];
        if ((result is int) && ((int)result == error))
            return true;
 
        Console.WriteLine ("A trust error occured while attempting " + 
            "to access the web site. Do you wish to:");
        Console.WriteLine ("\ta) abort this untrusted session;");
        Console.WriteLine ("\tb) continue this session (only once);");
        Console.WriteLine ("\tc) trust this certificate with this " +
            "application (forever);");
 
        switch (Console.ReadLine ().ToLower ()) {
            case "b":
                return true;
            case "c":
                Save (error, thumbprint);
                return true;
            case "a":
            default:
                return false;
        }
    }
 
    public static void Main (string[] args) 
    {
        ServicePointManager.CertificatePolicy = new Program ();
        try {
            WebRequest wr = WebRequest.Create (args [0]);
            Stream stream = wr.GetResponse ().GetResponseStream ();
            Console.WriteLine (new StreamReader (stream).ReadToEnd ());
        }
        catch (WebException we) {
            // don't show the exception for trust failures
            if (we.Status != WebExceptionStatus.TrustFailure)
                throw;
            Console.WriteLine ("Operation aborted by user.");
        }
    }
}
```

**note: incomplete (no loading/saving to isolated storage)**

Instructions

    % mcs a3.cs
    % mono a3.exe https://www.some-site.com/
    A trust error occured while attempting to access the web site. Do you wish to:
          a) abort this untrusted session;
          b) continue this session (only once);
          c) trust this certificate with this application (forever);

Entering **a** (or any invalid input) will abort the operation, **b** will allow the web page to be downloaded and printed once (i.e. you'll be asked again next time you try), **c** will download and print the web page but will never ask you again trusting the web site (unless it changes its certificate **and** and the root CA that issued it).

Approach \#4: Offer to trust the new root certificate
-----------------------------------------------------

Source code

**note: missing. check back soon ;-)**

Instructions

    % mcs a4.cs -r:Mono.Security.dll
    % mono a4.exe https://www.some-site.com/
    A trust error occured while attempting to access the web site. Do you wish to:
          a) abort this untrusted session;
          b) continue this session (only once);
          c) add this certificate to your trusted list (all applications, forever);

Note: this sample code will only work using Mono's certificate stores. You can use a similar technique by either p/invoking into CryptoAPI to access the Windows' certificate stores (fx 1.x) or use the new classes introduced in fx 2.0.

Approach \#5: Application or global trust
-----------------------------------------

No source code provided. You can easily merge both \#3 and \#4 source code to obtain a working sample.

