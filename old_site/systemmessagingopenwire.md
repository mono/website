---
layout: obsolete
title: "SystemMessagingOpenwire"
lastmodified: '2009-07-15'
permalink: /old_site/SystemMessagingOpenwire/
redirect_from:
  - /SystemMessagingOpenwire/
---

SystemMessagingOpenwire
=======================

 At this point Mono has alpha support for the System.Messaging namespace, current (as of release 2.4.2.1) Mono uses [AMQP](http://www.amqp.org) through [RabbitMQ](http://www.rabbitmq.com) to partially implement the messaging APIs.

Some consideration has been given to create a shared substrate that could be used by both an open source EnterpriseServices and an Indigo implementation, but little or no code has been produced.

The following design document is from Atsushi Enomoto.

You might also be interested in [transaction processing in Mono]({{ site.github.url }}/old_site/Transactions "Transactions").

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#implementing-systemmessagingdll-over-activemq-openwirenet">1 Implementing System.Messaging.dll over ActiveMQ OpenWire.NET</a>
<ul>
<li><a href="#abstract">1.1 Abstract</a></li>
<li><a href="#build">1.2 Build</a></li>
<li><a href="#msmq-concepts">1.3 MSMQ Concepts</a>
<ul>
<li><a href="#messagequeue">1.3.1 MessageQueue</a></li>
<li><a href="#imessageformatter">1.3.2 IMessageFormatter</a></li>
</ul></li>
<li><a href="#openwire-concepts">1.4 OpenWire Concepts</a></li>
<li><a href="#concerns">1.5 Concerns</a></li>
<li><a href="#sample-systemmessaging-code">1.6 Sample System.Messaging code</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Implementing System.Messaging.dll over ActiveMQ OpenWire.NET
============================================================

Abstract
--------

This document explains how I am planning to implement System.Messaging.dll on top of OpenWire.NET (OpenWire.Client.dll) in ActiveMQ project ( [http://www.activemq.org/](http://www.activemq.org/) ).

ActiveMQ is part of Apache Geronimo project, an open source J2EE implementation from Apache Software Foundation. It could be understood as an open source implementation of JMS (Java Messaging Services). It also supports native messaging protocol called OpenWire. They provide C\# and C clients other than Java, though still in development.

Actually any message queueing systems that support OpenWire could be a background service (though it is not likely to happen on other messaging services at least sooner).

ActiveMQ supports transactions (of course it does not support MSDTC though), acknowledgement types (though I'm unaware about how equivalent/different AMQ ack and MSMQ ack are), journal queue, and some other required features to support System.Messaging functionality.

Build
-----

OpenWire.Client is fairly unstable, so it is very likely to not work fine.

-   Get ActiveMQ from here: [http://activemq.codehaus.org/Download](http://activemq.codehaus.org/Download) I'm not sure which version strictly works. I used the latest snapshot.
-   Get the OpenWire.Client snapshot and some required files:

<!-- -->

    http://monkey.workarea.jp/tmp/2006/OpenWire.Client.mcs.tar.bz2 

To keep it updated, just svn up. And then, run "make dll-sources" which will update OpenWire.Client.dll.sources.

-   Extract the above under mcs/class.
-   Add the above directory in mcs/class/Makefile, or build and install it manually.
-   get and apply the patch for mcs/class/System.Messaging: [http://monkey.workarea.jp/tmp/2006/system.messaging-x-openwire.patch](http://monkey.workarea.jp/tmp/2006/system.messaging-x-openwire.patch)

Samples are on the bottom of this text.

MSMQ Concepts
-------------

There are some importatnt concepts in System.Messaging (MSMQ):

-   MessageQueue : A message queue manages a set of Messages.

It can represent either a local queue or a remote queue. MessageQueue is identified by a "Path". It could be part of a Transaction. This class also contains several static members to control MessageQueue manipulation such as creation, existence check or removal of a queue.

-   MessageQueueEnumerator: It enumerates a list of available queues.

MS.NET uses MSMQ API to iterate the list, but it seems making a "snapshot" of the list. When Active Directory is enabled, MessageQueue.GetMessageQueueEnumerator() seems to return a meaningful set of MessageQueues (on my box without Active Directory it always raises MessageQueueException so I cannot verify the behavior).

-   IMessageFormatter: MSMQ messages are formatted into a Stream using an implementation of this interface, such as
    -   XmlMessageFormatter: uses XmlSerializer
    -   BinaryMessageFormatter: uses binary serialization formatter
    -   ActiveXMessageFormatter: uses ActiveX.

It is independent of the background messaging services, except that ActiveXMessageFormatter will never be supported by Mono by its nature.

-   Message: It represents a message as you expect. It holds several fields that controls how to deliver it or how it was delivered.

### MessageQueue

Path can be either 1)FormatName, 2)Label or 3)a set of a MachineName, a QueueName and optionally a kind (Private\$, Journal\$, DeadLetter\$ or XactDeadLetter\$).

### IMessageFormatter

IMessageFormatter is used for serializing object into a stream (Message.BodyStream). The design principle of System.Messaging is not clear, since for example XmlMessageFormatter.Write() replaces BodyStream instance in its egoistic way.

OpenWire Concepts
-----------------

OpenWire of course has different concepts than System.Messaging and MSMQ:

- Broker: It represents a message queue host, so it is like an MSMQ service instance. A list of Brokers could consist of MessageQueueEnumerator.

- OpenWire protocol is a set of message commands sent between a broker and a client. For example, even to establish a connection, a client sends "ConnectionInfo" to a broker and then waits for the correlated reply.

- ConnectionFactory: It is used to create connections and transports. Each ConnectionFactory instance holds a host name and a port number to create ITransport, and a user name, a password and a connection ID to create ConnectionInfo.

By default, ConnectionFactory creates a SocketTransport and it connects to localhost:61616 which is default setting of ActiveMQ services.

- Connection: A connection holds a set of Sessions, a Transacted flag, an AcknowledgementMode, ITransport and ConnectionInfo. It can request Commands, but typical users would use MessageConsumer or MessageProducer.

Concerns
--------

OpenWire.NET itself is in very early stage.

There are many implementation differences between MSMQ and ActiveMQ (and/or possible OpenWire protocol implementations).

So far I noticed:

-   In ActiveMQ message queues are automatically created while it must be explicitly created in MSMQ.
-   System.Messaging.MessageQueue.Receive() keeps waiting for a message until anyone sends a message to the queue. With ActiveMQ, OpenWire.Client.MessageConsumer.Receive() immediately raises an error if there is no message in the queue (though it rather looks like coding matter in OpenWire.Client).

Sample System.Messaging code
----------------------------

Send:

``` csharp
        string path = ".\\Private$\\EnoQueue";
        if (!MessageQueue.Exists (path))
                MessageQueue.Create (path);
        MessageQueue q = new MessageQueue (".\\Private$\\EnoQueue");
        q.Send ("Hola");
```

Receive:

``` csharp
        string path = ".\\Private$\\EnoQueue";
        if (!MessageQueue.Exists (path))
                MessageQueue.Create (path);
        MessageQueue q = new MessageQueue (".\\Private$\\EnoQueue");
        Message msg = q.Receive ();
        XmlMessageFormatter f = new XmlMessageFormatter ();
        f.TargetTypes = new Type [] {typeof (string)};
        object o = f.Read (msg);
```

