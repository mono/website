---
layout: docpage
navgroup: docs
title: Nginx
---

### What is Nginx

[Nginx](http://wiki.nginx.org/) ("engine x") is a high-performance HTTP server and reverse proxy. Designed not just as a typical web server but also to proxy requests, proxying to FastCGI is second nature to Nginx and can be done in just a few short lines of configuration.

### Installing Nginx on Ubuntu

Nginx web server installation (with root):

    apt-get install nginx

### Nginx configuration

Nginx configuration (as of version 0.7.63) is located in **/etc/nginx/nginx.conf** (which contains http configuration) and in **/etc/nginx/sites-available/default** (where is configuration of particular virtual host or hosts). In order to setup ASP.NET or ASP.NET MVC web application, you need to modify virtual host configuration.

     server {
             listen   80;
             server_name  www.domain1.xyz;
             access_log   /var/log/nginx/your.domain1.xyz.access.log;
     
             location / {
                     root /var/www/www.domain1.xyz/;
                     index index.html index.htm default.aspx Default.aspx;
                     fastcgi_index Default.aspx;
                     fastcgi_pass 127.0.0.1:9000;
                     include /etc/nginx/fastcgi_params;
             }
     }

ASP.NET and ASP.NET MVC web applications runs on Nginx through [FastCGI](http://en.wikipedia.org/wiki/Fastcgi) protocol, therefore you need to add few lines into **/etc/nginx/fastcgi\_params**.

     fastcgi_param  PATH_INFO          "";
     fastcgi_param  SCRIPT_FILENAME    $document_root$fastcgi_script_name;

Now the Nginx part is complete, but to finish the whole thing Mono FastCGI server needs to be started.

     fastcgi-mono-server2 /applications=www.domain1.xyz:/:/var/www/www.domain1.xyz/ /socket=tcp:127.0.0.1:9000

Now when Mono FastCGI server is up and running, Nginx configuration is complete and your application is in place (located in /var/www/www.domain1.xyz/) you can run the web server.

     /etc/init.d/nginx start

### Useful resources

[http://wiki.nginx.org/NginxConfiguration](http://wiki.nginx.org/NginxConfiguration)
 [http://wiki.nginx.org/NginxVirtualHostExample](http://wiki.nginx.org/NginxVirtualHostExample)
 [Linux startup script for mono FastCGI server](http://tomi.developmententity.sk/Blog/Post/2)


