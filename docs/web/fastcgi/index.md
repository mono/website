---
layout: docpage
navgroup: docs
title: FastCGI
---

Introduction
------------

The FastCGI Mono Server was developed as part of the 2007 [Google Summer of Code](http://code.google.com/soc/2007/) with the goal of increasing the availablity of ASP.NET and simplifying configuration. Requiring as little as zero command line options and supporting a large number of servers, the FastCGI Mono Server makes it simple to include ASP.NET on your server.

This documentation contains configuration instructions for serveral web servers on Linux, with plans to expand support to Windows and Macintosh in the future. Please take the time to read all the information below before configuring your server.

### How Does It Work?

[![Request.png]({{ site.github.url }}/old_site/images/3/38/Request.png)]({{ site.github.url }}/old_site/images/3/38/Request.png)

FastCGI is an interprocess communcation mechanism available

in many web servers. A web server will receive and respond to a request in the following manner corresponding to the diagram on the right:

1.  The browser tries accessing a page. It finds the host and sends it HTTP GET request.
2.  The web server receives the request, recognizes that it is supposted to send it to a given socket, in this case `"/tmp/fastcgi-mono-server-0"`, connects to it, and sends the request in the CGI format using FastCGI records.
3.  `fastcgi-mono-server receives` the request and creates a `Mono.WebServer.FastCgi.WorkerRequest` (a subclass of [System.Web.Hosting.SimpleWorkerRequest](http://docs.go-mono.com/index.aspx?link=T:System.Web.Hosting.SimpleWorkerRequest) and processes the request.
4.  [SimpleWorkerRequest](http://docs.go-mono.com/index.aspx?link=T:System.Web.Hosting.SimpleWorkerRequest) checks for an existing compiled version of the requested page. If it does not exist, the page is converted into C\# (or the specified language) and compiled. It then invokes Render on the compiled representation of the page.
5.  The page is rendered and sent back to the [SimpleWorkerRequest](http://docs.go-mono.com/index.aspx?link=T:System.Web.Hosting.SimpleWorkerRequest)
6.  Overwritten method calls in the FastCGI WorkerRequest send the response back to the web server using FastCGI records.
7.  The web server sends the response back to the browser.
8.  The browser displays the page.

Installation Basics
-------------------

Download and install the "xsp" package from [our downloads page]({{ site.github.url }}/download/) or get the source code for xsp from [the source repository](http://go-mono.com/sources-stable/).

If you obtained packages, you already have everything you need, otherwise you need to use the usual Linux source code configuration setup:

``` bash
$ tar xzvf xsp-1.2.6.tar.gz
...
$ cd xsp-1.2.6
$ ./configure --prefix=/usr
$ make 
$ make install
```

To install the FastCGI on Unix, follow the instructions on the FastCGI Linux page. Once you have installed the Mono FastCGI support, you have to configure your web server to use it, detailed instructions are available for the following servers:

-   [Abyss Web Server]({{ site.github.url }}/docs/web/fastcgi/abyss/)
-   [Cherokee HTTP Server]({{ site.github.url }}/docs/web/fastcgi/cherokee/)
-   [Lighttpd]({{ site.github.url }}/docs/web/fastcgi/lighttpd/)
-   [Nginx]({{ site.github.url }}/docs/web/fastcgi/nginx/)
-   [CGI]({{ site.github.url }}/old_site/CGI "CGI") via cgi-fcgi

The following servers support FastCGI, but we currently do not have per-server configuration information:

-   Apache HTTP Server
-   Caudium
-   Hiawatha
-   IBM HTTP Server
-   LiteSpeed Web Server
-   MyServer
-   Roxen
-   Sun Java System Web Server
-   Zeus Web Server

Important Information
---------------------

### Paths vs. Extensions

Most programming languages used for web sites contain all their information within a single file format, for example, PHP uses the `.php` extension and Python uses the `.py` extension. ASP.NET, on the other hand, uses a combination of file types, combined with programming paradigms like session objects, sandboxed environments, and private directories. This makes configuring ASP.NET unique when compared to other FastCGI handlers you may have configured.

You could easily configure FastCGI to simply pass the 11 standard extensions to the FastCGI Mono Server and have all remaining files processed by standard methods, but you will suffer the following negative consequences:

-   **Exposed files.** Some files that would normally be hidden will be exposed. This is typically any file that appears in an `App_Data` directory. Additionally, you may miss some files that should be private. As ASP.NET was origianally written for the Windows operating system, many applications use case insensitive formatting (`.CONFIG == .config == .Config`) which you may miss when specifying the extensions to block. This can pose a **security risk**
-   **Missing features.** When an ASP.NET application is recognized by the FastCGI Mono Server, it loads configuration details that would affect how the site is displayed. For example, an application may register `index.py` as its index page and for the `.py` extension to be handled by IronPython within the Mono Server. The web server can't keep up with these kinds of changes and would just show an error page, directory listing, or whatever the default configuration may be.

To overcome these problems, the **recommended method** for processing files is to send all requests directly to the FastCGI Mono Server. This way, features and security are preserved. The negative consequence is that all files are then processed by the Mono Server and you suffer a decrease in performance. There are methods for overcoming this on a server-by-server basis. For example, directories could be excluded from ASP.NET and serve strictly static files, but this is a topic to be discussed in server configuration pages.

### What are ASP.NET Applications?

If you've programmed with other web language even dabbled in ASP.NET on another hosting solution, you may be unfamiliar with what ASP.NET applications actually are, how they are used, and why this matters. The most important thing to know, is that every ASP.NET page belongs to an application and that they need to be configured properly for your application to load. That said, relax, because the FastCGI Mono Server does most of the work for you and odds are you won't have to worry about how to configure them. They're be more information on this in [How Applications are Handled](#how-applications-are-handled-and-how-to-configure-them).

Applications are, in short, directories on a website which behave just like a traditional application or program, with pages just being different UI's in the same program. This is managed by having all ASP.NET pages handled by a continuously running server which keeps the application alive, and keeping these separate pages in their own Application Domains as to stop one application from messing with another. This yields some very powerful features.

-   Applications can handle and understand starting up (the first time a page is called) and shutting down (the server shuts down). This means you can maintain objects or connections through the life of your server.
-   Because all pages are just parts of the same application, you can share objects between them. When a user logs in with `login.aspx`, you can store all their information in your custom object, and access it again on `editprofile.aspx`. Not only does this simplify your work, it reduces the number of database calls you have to make.
-   Applications can define how to handle files and settings. You can add, `Welcome.aspx` as an index page, you make all files with a `.cs` extension show up as highlighted code, you could even register `.rb` with IronRuby so you can write your webpage is Ruby.
-   Applications get all the perks of being their own program. They can load libraries (DLL's) placed in their `bin` directory. This is how you can share custom objects between one page and the next. In addition, it allows you to write code for your web application, and then move it to your desktop application, cutting out hours of work.

### How Applications are Handled (and how to configure them)

By default, the FastCGI Mono Server detects applications for you with information it detects from the web server. As discussed in the last section, applications are unique directories. On a server, though, there are four different parts to a directory:

-   **The Host.** The host is the part of the URL that identifies the site. `blog.mysite.com` and `www.mysite.com` may both be on the same server, but you don't want them returning the same content.

-   **The Port.** The port not often seen because the browser assumes `80` if not specified. You may have a server running on port 80 and another running on port 8080, as above, you don't want them to be the same.
-   **The Path.** The path is the part following the host in the URL. This part actually looks like a directory in the file system.
-   **The Physical Path.** The physical path contains the actual directory on your computer containing the web site. For example, the virtual path `/path/to/file.aspx` would have a physical path `C:\Inetpub\wwwroot\path\to\file.aspx`.

 The FastCGI Mono Server detects applications by taking the their virtual and physical paths and recursing up the paths until A) the path names differ or B) the directory contains a `bin` directory. In the case of A, as soon as the names differ you've reached the point where a virtual directory has been applied, and in the case of B, a `bin` directory is a strong indicator of an application, and it is safest to assume that it is. In other word, for the paths `/path/to/file.aspx` and `C:\Inetpub\wwwroot\path\to\file.aspx`, `/` would be assumed as the directory unless `/path/to/bin` or `/path/bin` exists, in which case `/path/to` or `/path` would be the application. This should work for virtual paths, virtual hosts, and user directories without any problem.

**However**, you may want to register your own applications or turn off automatic mapping for whatever reason.

Sample application specifications:

|Applications|Description|
|:-----------|:----------|
|/:.|The virtual root directory, "/", is mapped to the current directory or "root" if specified.|
|/blog:../myblog|The virtual /blog is mapped to ../myblog|
|myhost.someprovider.net:/blog:../myblog|The virtual /blog at myhost.someprovider.net is mapped to ../myblog. This means that other host names, like "localhost" will not be mapped.|
|/:.,/blog:../myblog|Two applications like the above ones are handled.|
|\*:80:/:standard,\*:433:/:secure|The server uses different applications on the unsecure and secure ports.|

### Running the Mono Server and Web Server on Different Machines

Many web servers will let you connect to the FastCGI Mono Server on another machine over TCP. If you are using automatic application mapping, the paths it uses come from the web server and where it thinks the files should be. If you are your web server has a document root of `C:\Inetpub\wwwroot` and the machine running the Mono Server stores the files on `D:\Inetpub\wwwroot`, `C:\Mirror\Inetpub\wwwroot`, or anything other that `C:\Inetpub\wwwroot`, it will be unable to find or serve the files. Some servers will let you specify the document root to use, but **it is recommended that you have an identical directory structure on both machines**.

