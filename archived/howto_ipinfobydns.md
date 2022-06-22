---
title: "Howto IpInfobyDns"
lastmodified: '2008-03-23'
redirect_from:
  - /Howto_IpInfobyDns/
---

Howto IpInfobyDns
=================

This sample shows how to get the local system ip information using a Dns Class.

networkDNSIP.cs

``` csharp
using System;
using System.Collections;
using System.Net;
 
public class ClsDnsIp {
 
    //declare hostname variable to save the machine hostname
    private string hostname;
 
    //declare iparraylist variable to save the ip addresses
    //this is a ArrayList Collection object
    private ArrayList iparraylist;
 
    //we define a constructor class
    public ClsDnsIp()
    {
        //assign a string empty value
        this.hostname = string.Empty;
 
        //to create arraylist object
        this.iparraylist = new ArrayList();
 
        //call the private method to determine the hostname and ip address
        this.getHostnameIpAdress();
    }
 
    //define a string property to get the hostname
    public string Hostname
    {
        get
        {
            return this.hostname;
        }
    }
 
    //define a Arraylist property to get a ip address list
    public ArrayList IpAddress
    {
        get
        {
            return this.iparraylist;
        }
    }
 
    //define the private method that to determine hostname and ip address
    private void getHostnameIpAdress()
    {
        //call Dns's GetHostName method to get the computer hostname
        this.hostname = Dns.GetHostName();
 
        //to create IPHostEntry object that contain
        //Internet host address information by Dns's GetHotsByName method
        IPHostEntry iphost = Dns.GetHostByName(this.hostname);
 
        //we use a try-catch instructions for posible runtime errors
        try {
            //we add every ip address founded to arraylist collection
            foreach (IPAddress someip in iphost.AddressList)
                this.iparraylist.Add(someip.ToString());
        }
        catch (Exception e){
            ;
        }
    }
}
 
//this class is used to test ClsDnsIp class
public class TestClsDnsIp {
    public static void Main(string[] args)
    {
        ClsDnsIp objtest = new ClsDnsIp();
        Console.WriteLine("Hostname-->" + objtest.Hostname);
        for (int i = 0; i < objtest.IpAddress.Count; i++)
            Console.WriteLine("Ip Adresses-->" + objtest.IpAddress[i]);
    }
 
}
```

now compile with:

    mcs networkDNSIP.cs

and run:

    mono networkDNSIP.exe
