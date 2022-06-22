---
title: "CGI"
lastmodified: '2009-09-20'
redirect_from:
  - /CGI/
---

CGI
===

 [CGI](http://hoohoo.ncsa.illinois.edu/cgi/) is the most widely supported web server application interface. [ASP.NET](/ASP.NET) (and [Mono](/Main_Page)) has a relatively long startup time and requires a relatively large amount of initial memory that makes it unsuitable to be used as a CGI application in the traditional way because CGI requires the web server to create a new application process for each request.

Both [mod_mono](/Mod_mono) and [fastcgi-mono-server](/FastCGI) are using a persistent separate process that is processing the requests thus eliminating the performance impact of long startup time and reducing overall memory requirements.

Shared hosing environments usually use [Apache](http://httpd.apache.org) that only has support for CGI out of the box. Both mod_mono and FastCGI support require installing modules that can only be done by server administrators.

[cgi-fcgi](http://www.fastcgi.com/) is a CGI to FastCGI bridge also capable of starting a FastCGI application that has support for a wide range of platforms. **cgi-fcgi** along with **fastcgi-mono-server** enables **ASP.NET** on any web server that has support for CGI without noticeable performance impact.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#installing-mono-and-cgi-fcgi">1 Installing Mono and cgi-fcgi</a></li>
<li><a href="#script-files">2 Script files</a></li>
<li><a href="#recycling-the-fastcgi-server">3 Recycling the FastCGI server</a></li>
<li><a href="#aspnet-configuration">4 ASP.NET configuration</a></li>
<li><a href="#apache-configuration">5 Apache configuration</a></li>
</ul></td>
</tr>
</tbody>
</table>

Installing Mono and cgi-fcgi
----------------------------

For more detailed instructions on installing Mono see our [Getting Mono](/Obtaining_Mono) and [Compiling Mono](/Compiling_Mono) pages. cgi-fcgi is available for download from the [FastCGI](http://www.fastcgi.com/drupal/node/5) site as part of the **Development Kit**.

The following sample configuration assumes installation prefixes used here to configure cgi-fcgi and mono. If you use different prefixes you also will have to modify the sample files:

``` bash
$ tar xzf fcgi-2.4.0.tar.gz
$ cd fcgi-2.4.0
$ ./configure --prefix=/home/username/fcgi
$ make
$ make install
...
$ tar xjf mono-2.4.tar.bz2
$ cd mono-2.4
$ ./configure --prefix=/home/username/mono
$ make
$ make install
...
$ tar xjf xsp-2.4.tar.bz2
$ cd xsp-2.4
$ export PATH=/home/username/mono/bin:$PATH
$ export PKG_CONFIG_PATH=/home/username/mono/lib/pkgconfig:$PKG_CONFIG_PATH
$ ./configure --prefix=/home/username/mono
$ make
$ make install
```

You also may compile them on a compatible development machine using the same installation prefixes and upload the binaries to the web server.

If you have no shell access to the web server you can use [PHP Shell](http://phpshell.sourceforge.net/) that is a lightweight remote shell wrapper to extract compressed files, monitor or kill your processes or execute arbitrary commands.

Script files
------------

Handler CGI script (*/home/username/public_html/cgi-bin/mono-cgi*):

``` bash
#!/home/username/fcgi/bin/cgi-fcgi -f
-connect /home/username/tmp/mono-fcgi.sock /home/username/bin/mono-fcgi
```

Using this configuration cgi-fcgi will create a listening socket and pass it to a new mono-fcgi process when unable to connect to the socket that will avoid race conditions and will result in less overhead than using a shell script. For more information see [cgi-fcgi documentation](http://www.fastcgi.com/devkit/doc/fcgi-devel-kit.htm#S4.2).

 A separate shell script (*/home/username/bin/mono-fcgi*) is required to start fastcgi-mono-server because cgi-fcgi has no support for setting environment variables or passing arguments to the FastCGI application. CGI variables also have to be removed to avoid falling back to them:

``` bash
#!/bin/sh
umask 0077
exec >>/home/username/tmp/mono-fcgi.log
exec 2>>/home/username/tmp/mono-fcgi.err
 
echo $(date +"[%F %T]") Starting fastcgi-mono-server2
 
cd /
chmod 0700 /home/username/tmp/mono-fcgi.sock
echo $$>/home/username/tmp/mono-fcgi.pid
# stdin is the socket handle
exec env -i \
PATH="/home/username/mono/bin:$PATH" \
LD_LIBRARY_PATH="/home/username/mono/lib:$LD_LIBRARY_PATH" \
TMP="/home/username/tmp" \
MONO_SHARED_DIR="/home/username/tmp" \
/home/username/mono/bin/fastcgi-mono-server2 \
/root=/home/username/public_html /applications=/:/home/username/public_html
```

This script also logs stdout and stderr and creates a pid file.

You may want to use name based virtual hosts or define more applications on command line. For more information see [How Applications are Handled](/docs/web/fastcgi/#how-applications-are-handled-and-how-to-configure-them).

Recycling the FastCGI server
----------------------------

The FastCGI server can be recycled by removing the socket file that will allow pending requests to be processed by the existing server process while new requests will be routed to a new server process created by cgi-fcgi.

The following script (*/home/username/bin/recycle-mono-fcgi*) can be used in a cron job to recycle the FastCGI server periodically:

``` bash
#!/bin/sh
SOCKETFILE=/home/username/tmp/mono-fcgi.sock
PIDFILE=/home/username/tmp/mono-fcgi.pid
PID=0
 
if [ -e $PIDFILE ]; then
    PID=$(cat $PIDFILE 2>/dev/null)
    if [ -z "$PID" -o -z "$(ps --pid $PID -o pid=)" ]; then
        PID=0
    fi
fi
 
if [ $PID -ne 0 ]; then
    # New requests will be routed to a new server process
    rm -f $PIDFILE
    rm -f $SOCKETFILE
    # Wait for pending requests
    sleep 2
    kill $PID
    # Wait for graceful shutdown
    sleep 2
    if [ -n "$(ps --pid $PID -o pid=)" ]; then
        # Kill if failed to terminate
        kill -9 $PID
    fi
fi
```

For security reasons you should execute this script using the user account of the FastCGI server to avoid terminating processes of other users.

ASP.NET configuration
---------------------

To improve security you should disable access to CGI script source code (*/home/username/public_html/cgi-bin/Web.config*):

``` xml
<configuration>
  <system.web>
    <httpHandlers>
      <add verb="*" path="mono-cgi" type="System.Web.HttpForbiddenHandler" validate="true"/>
    </httpHandlers>
  </system.web>
</configuration>
```

Apache configuration
--------------------

A simple Apache configuration file (*/home/username/public_html/.htaccess*):

    Action mono-cgi /cgi-bin/mono-cgi
    AddHandler mono-cgi .aspx .asmx .ashx .ascx .asax .axd .config .cs

You may want to handle other extensions with ASP.NET. For more examples on configuration see [Manual Mod_Mono Configuration](/docs/web/mod_mono/#manual-mod_mono-configuration).

 To improve security you should protect ASP.NET Application Folders:

    Redirect 404 /bin
    Redirect 404 /App_Browsers
    Redirect 404 /App_Code
    Redirect 404 /App_Data
    Redirect 404 /App_GlobalResources
    Redirect 404 /App_LocalResources
    Redirect 404 /App_WebReferences

 Non-existent files can also be handled with Apache 2.2:

    Action mono-cgi /cgi-bin/mono-cgi virtual
    AddHandler mono-cgi .aspx .asmx .ashx .ascx .asax .axd .config .cs

 Or handle all requests with ASP.NET:

    Action mono-cgi /cgi-bin/mono-cgi
    SetHandler mono-cgi

You also will have to create a configuration file (*/home/username/public_html/cgi-bin/.htaccess*) to avoid server error resulting from circular dependency:

    <Files mono-cgi>
      Options +ExecCGI
      SetHandler cgi-script
    </Files>

You also may have to use this to enable CGI script execution.

 *Author: Kornél Pál \<[http://www.kornelpal.com/](http://www.kornelpal.com/)\>*
