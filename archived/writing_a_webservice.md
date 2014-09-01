---
title: "Writing a WebService"
lastmodified: '2007-11-16'
redirect_from:
  - /Writing_a_WebService/
---

Writing a WebService
====================

Mono makes it very easy to write a web service that can be consumed by any application written in any programming language that understands web services. In many cases, it is as simple as adding the [WebMethod] attribute to a method.

Here is a simple web service called MathService that provides two methods: AddNumbers and SubtractNumbers. The following shows the contents of a sample file NumberService.asmx:

``` csharp
<%@ WebService Language="C#" Class="MathService.MathService" %>
 
using System;
using System.Web.Services;
 
namespace MathService
{
    [WebService (Namespace = "http://tempuri.org/NumberService")]
    public class MathService : WebService
    {
        [WebMethod]
        public int AddNumbers (int number1, int number2)
        {
            return number1 + number2;
        }
 
        [WebMethod]
        public int SubtractNumbers (int number1, int number2)
        {
            return number1 - number2;
        }
    }
}
```

If you put this file on your web server directory, or if you run the command xsp on the same directory as this file is located your web service will be up and running.

For example, if you used **xsp** from the shell, you can contact [http://localhost:8080/NumberService.asmx](http://localhost:8080/NumberService.asmx) to access the test page that is automatically generated for your web service. In that page you can also get WSDL descriptions for the web service, and you can test your web service directly.

If you deployed this to your web server (say, with [Mod_mono](/Mod_mono "Mod mono")) you should be able to access it at [http://localhost/NumberService.asmx](http://localhost/NumberService.asmx)

(Cool screenshot goes here!)

To use this web service or any other web service in your application, see [Consuming Web Services](/Web_Services "Web Services").

