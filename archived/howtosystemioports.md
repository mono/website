---
title: "HowToSystemIOPorts"
lastmodified: '2011-09-16'
redirect_from:
  - /HowToSystemIOPorts/
---

HowToSystemIOPorts
==================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#introduction">1 Introduction</a></li>
<li><a href="#limitations">2 Limitations</a></li>
<li><a href="#example-code">3 Example Code</a></li>
<li><a href="#related-links">4 Related Links</a></li>
<li><a href="#further-questions">5 Further Questions</a></li>
</ul></td>
</tr>
</tbody>
</table>

Introduction
------------

This is to show people how to use System.IO.Ports in older versions of Mono, such as 1.2.x. It \*is\* possible to read and write to a serial port (RS-232) with Mono.

Limitations
-----------

At the time of this writing, there are a a few limitations that one must take note:

1) **There is no event notification for received serial data**. If you want to receive data, one must set a timeout and watch for received data by polling ReadByte() when you think there might be data.

2) **One must Read data in *byte[]* format only -- there is no *char[]* support**. You must do your own reading of bytes and translate that into your encoding.

3) **DiscardNull, ParityReplace, ReceivedBytesThreshold** are not implemented.

Example Code
------------

This example code can be used to test a connection with a serial modem connected to /dev/ttyS0

``` csharp
using System;
using System.IO.Ports;
 
public class SerialPortTest
{
    public static void Main(string[] args)
    {
        SerialPortTest myTest = new SerialPortTest();
        myTest.Test();
    }
 
    private SerialPort mySerial;
 
    // Constructor
    public SerialPortTest()
    {
    }
 
    public void Test()
    {
        if (mySerial != null)
            if (mySerial.IsOpen)
                mySerial.Close();
 
        mySerial = new SerialPort("/dev/ttyS0", 38400);
        mySerial.Open();
        mySerial.ReadTimeout = 400;
        SendData("ATI3\r");
 
                // Should output some information about your modem firmware
        Console.WriteLine(ReadData());
    }
 
    public string ReadData()
    {
        byte tmpByte;
        string rxString = "";
 
        tmpByte = (byte) mySerial.ReadByte();
 
        while (tmpByte != 255) {
            rxString += ((char) tmpByte);
            tmpByte = (byte) mySerial.ReadByte();
        }
 
        return rxString;
    }
 
    public bool SendData(string Data)
    {
        mySerial.Write(Data);
        return true;
    }
}
```

Save this code to a file (such as SerialExample.cs).

Then, you can type:

``` bash
gmcs SerialExample.cs
```

and then

``` bash
mono SerialExample.exe
```

Provided you are properly connected to an active serial modem, you should see output similar to the following:

``` bash
$ mono SerialExample.exe
 
Sportster 14,400/FAX RS Rev. 1.5
 
OK
```

Congratulations! You have now accessed your first serial device on Linux with Mono!

Related Links
-------------

Here are some links that I have found helpful, and you might as well.

[.NET Serial Port Library](http://sourceforge.net/projects/serialportnet/) This project aims to implement the complete System.IO.Ports namespace for .NET 1.1. Note: currently it doesn't play very nicely with Mono, but it may be worth checking out. I think Yurocheck has a great thing going with this.

Further Questions
-----------------

I spent a fair bit of time learning how to do this and collecting little bits of information. I'm by no means an expert, but if you need further help, you can sometimes find me (HanClinto) hanging out on the chatroom \#mono on ircd.gimp.org. Cheers!

