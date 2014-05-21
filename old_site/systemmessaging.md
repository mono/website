---
layout: obsolete
title: "System.Messaging"
lastmodified: '2009-12-20'
permalink: /old_site/System.Messaging/
redirect_from:
  - /System.Messaging/
  - /SystemMessaging/
---

System.Messaging
================

 At this point Mono has alpha support for the System.Messaging namespace, current (as of release 2.4.2.1) Mono uses [AMQP](http://www.amqp.org) through [RabbitMQ](http://www.rabbitmq.com) to partially implement the messaging APIs.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#getting-started">1 Getting Started</a></li>
<li><a href="#whats-supported">2 What's Supported?</a></li>
<li><a href="#whats-in-progress">3 What's In Progress</a></li>
<li><a href="#getting-involved">4 Getting Involved</a></li>
</ul></td>
</tr>
</tbody>
</table>

Getting Started
---------------

To get started with System.Messaging, first you will need an AMQP implementation that will provide the messaging implementation. While in theory any AMQP should work, only RabbitMQ has been tested so far, [binaries](http://www.rabbitmq.com/download.html) are available for Windows and various flavours of GNU/Linux.

To implement a System.Messaging client, you will need to reference the following 4 dlls, available in the 2.4.2.1 release of Mono.

-   System.Messaging.dll (the MS compatible API)
-   Mono.Messaging.dll (The Mono Messaging SPI)
-   Mono.Messaging.RabbitMQ.dll (Bindings from Mono.Messaging to the RabbitMQ server)
-   RabbitMQ.Client.dll (The RabbitMQ supplied .NET client library)

Simply implement a System.Messaging client as you would against the MS APIs.

When running the client it is necessary to define the MONO\_MESSAGING\_PROVIDER environment variable. It should be set to:

Mono.Messaging.RabbitMQ.RabbitMQMessagingProvider,Mono.Messaging.RabbitMQ

Which is the full class name of the messaging provider class that is the entry point for the implementation of the Mono.Messaging SPI. In coming versions of Mono the value for the environment variable will be shortened.

Due to a bug (which will be fixed in a later release), you will also need to add the mono assemblies to the MONO\_PATH environment variable, e.g:

MONO\_PATH=/usr/lib/mono/2.0

Example code:

``` csharp
using System;
using System.Messaging;
 
namespace messagingexample
{
    class MainClass {
 
        public static void Main (string[]args)
        {
            // '.' Represents connecting to localhost.
            // 'private$' Indicates a private queue, not really needed for
            // mono/rabbitmq, but is supported for MS compatibility.
            // 'testq' Is the name of the queue.
            string path = @".\private$\testq";
            MessageQueue queue = MessageQueue.Exists (path) ?
                new MessageQueue (path) : MessageQueue.Create (path);
            queue.Formatter = new BinaryMessageFormatter ();
 
 
            while (true)
            {
                Console.Write ("Please enter a message (empty line to exit): ");
                string input = Console.ReadLine ();
                if (input != null && input.Length > 0)
                {
                    Message m = new Message (input);
                    queue.Send (m);
                    Message response = queue.Receive ();
                    Console.WriteLine ("Received: {0}", response.Body);
                }
                else
                {
                    Console.WriteLine ("Exiting...");
                    break;
                }
            }
        }
    }
}
```

What's Supported?
-----------------

The Microsoft System.Messaging APIs (for better or worse) weren't designed to be a generic messaging API, unlike something like JMS. Therefore some parts of the System.Messaging API are difficult to implement as they tie too closely to the MSMQ server to be reimplemented in a generic fashion. Some of the key areas that can't be supported are:

-   MessageQueue.ReadHandle
-   MessageQueue.WriteHandle
-   MessageQueue security and permissions support.
-   MessageEnumerators are mostly supported, but some of the transactional remove methods can't be implemented.

However most of the key aspects are implemented including Send/Receive, Async Send/Receive, Transactions, Persistence. The current implementation doesn't support authentication against the RabbitMQ server, so relies on using the default guest account.

AMQP version 0.8 (currently supported by RabbitMQ) does not have support for queue discovery, i.e. looking up/finding queues by name. AMQP uses a 'declare' command which creates to queue if it doesn't exist. To support MessageQueue.Exists ("queue name") methods, the Mono/RabbitMQ integration keeps a local cache of the queues that have been created. So the first time MessageQueue.Exists is called for a specific queue after starting it will always return false until MessageQueue.Create is called, at which point the name of the queue is added to the cache.

What's In Progress
------------------

-   Moving the Mono.Messaging.RabbitMQ to .NET 2.0 APIs to support System.Configuration.
-   Use System.Configuration to support authentication and allow different queues to map to different users.
-   Performance and Load testing.

Getting Involved
----------------

What's most needed right now is users and testers. We really need a picture of what Mono users most want to see from its implementation of System.Messaging. Grab the latest release, try it out and raise bugs against the parts that don't work.

