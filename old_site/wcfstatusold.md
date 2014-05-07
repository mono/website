---
layout: obsolete
title: "WCFStatusOld"
permalink: /old_site/WCFStatusOld/
redirect_from:
  - /WCFStatusOld/
---

WCFStatusOld
============

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#This_page_is_OLD">1 This page is OLD</a></li>
<li><a href="#Communication_Foundation">2 Communication Foundation</a></li>
<li><a href="#High_level_status">3 High level status</a>
<ul>
<li><a href="#Features">3.1 Features</a>
<ul>
<li><a href="#Serialization">3.1.1 Serialization</a></li>
<li><a href="#Service_contracts">3.1.2 Service contracts</a></li>
<li><a href="#Service_features">3.1.3 Service features</a></li>
<li><a href="#Channels">3.1.4 Channels</a></li>
<li><a href="#Configuration">3.1.5 Configuration</a></li>
<li><a href="#Bindings">3.1.6 Bindings</a></li>
</ul></li>
<li><a href="#Milestones">3.2 Milestones</a>
<ul>
<li><a href="#Milestone_1_-_Basic_connection_establishment_-_achieved">3.2.1 Milestone 1 - Basic connection establishment - achieved</a></li>
<li><a href="#Milestone_2_-_Web_Services_support">3.2.2 Milestone 2 - Web Services support</a></li>
<li><a href="#Milestone_3_-_WS-Security_and_all_relevant_stuff">3.2.3 Milestone 3 - WS-Security and all relevant stuff</a></li>
<li><a href="#Milestone_4_-_Infocard_implementation">3.2.4 Milestone 4 - Infocard implementation</a></li>
<li><a href="#Milestone_5_-_everything_else">3.2.5 Milestone 5 - everything else</a></li>
<li><a href="#Not_on_the_list">3.2.6 Not on the list</a></li>
</ul></li>
</ul></li>
<li><a href="#Detailed_Status">4 Detailed Status</a>
<ul>
<li><a href="#Core_Compare">4.1 Core Compare</a></li>
</ul></li>
<li><a href="#Configuration_2">5 Configuration</a></li>
<li><a href="#Contracts">6 Contracts</a>
<ul>
<li><a href="#Serialization_2">6.1 Serialization</a>
<ul>
<li><a href="#Data_Contract">6.1.1 Data Contract</a></li>
<li><a href="#Message_Contract">6.1.2 Message Contract</a>
<ul>
<li><a href="#Typed_Messages">6.1.2.1 Typed Messages</a></li>
</ul></li>
<li><a href="#Using_Streams">6.1.3 Using Streams</a></li>
</ul></li>
<li><a href="#Service_Contract">6.2 Service Contract</a>
<ul>
<li><a href="#Proxy_Generator">6.2.1 Proxy Generator</a></li>
</ul></li>
<li><a href="#Policy_.26_Binding">6.3 Policy &amp; Binding</a>
<ul>
<li><a href="#Binding_Element_Types">6.3.1 Binding Element Types</a>
<ul>
<li><a href="#Basic">6.3.1.1 Basic</a></li>
<li><a href="#TransportBindingElement">6.3.1.2 TransportBindingElement</a></li>
<li><a href="#StreamUpgradBindingElement">6.3.1.3 StreamUpgradBindingElement</a></li>
<li><a href="#SecurityBindingElement">6.3.1.4 SecurityBindingElement</a></li>
<li><a href="#MessageEncodingBindingElement">6.3.1.5 MessageEncodingBindingElement</a></li>
<li><a href="#PeerResolverBindingElement">6.3.1.6 PeerResolverBindingElement</a></li>
</ul></li>
<li><a href="#Binding_Types">6.3.2 Binding Types</a>
<ul>
<li><a href="#BasicHttpBinding">6.3.2.1 BasicHttpBinding</a></li>
<li><a href="#WSHttpBinding">6.3.2.2 WSHttpBinding</a></li>
<li><a href="#WebHttpBinding">6.3.2.3 WebHttpBinding</a></li>
<li><a href="#NetPeerTcpBinding">6.3.2.4 NetPeerTcpBinding</a></li>
<li><a href="#NetTcpBinding">6.3.2.5 NetTcpBinding</a></li>
<li><a href="#WSDualHttpBinding">6.3.2.6 WSDualHttpBinding</a></li>
<li><a href="#CustomBinding">6.3.2.7 CustomBinding</a></li>
<li><a href="#MsmqBindingBase">6.3.2.8 MsmqBindingBase</a></li>
<li><a href="#NetNamedPipeBinding">6.3.2.9 NetNamedPipeBinding</a></li>
</ul></li>
</ul></li>
</ul></li>
<li><a href="#Service_Runtime_Behavior">7 Service Runtime Behavior</a>
<ul>
<li><a href="#Transaction_Behavior">7.1 Transaction Behavior</a></li>
<li><a href="#Dispatch_Behavior">7.2 Dispatch Behavior</a></li>
<li><a href="#Concurrency_Behavior">7.3 Concurrency Behavior</a></li>
<li><a href="#Error_Behavior">7.4 Error Behavior</a></li>
<li><a href="#Throttling_Behavior">7.5 Throttling Behavior</a></li>
<li><a href="#Metadata_Behavior">7.6 Metadata Behavior</a></li>
<li><a href="#Instance_Behavior">7.7 Instance Behavior</a></li>
<li><a href="#Message_Inspection">7.8 Message Inspection</a></li>
<li><a href="#Parameter_Filtering">7.9 Parameter Filtering</a></li>
</ul></li>
<li><a href="#Message_Encoding">8 Message Encoding</a>
<ul>
<li><a href="#Binary">8.1 Binary</a></li>
<li><a href="#Text">8.2 Text</a></li>
<li><a href="#Mtom">8.3 Mtom</a></li>
<li><a href="#Web">8.4 Web</a></li>
</ul></li>
<li><a href="#Activation_and_hosting">9 Activation and hosting</a>
<ul>
<li><a href="#EXE">9.1 EXE</a></li>
<li><a href="#IIS">9.2 IIS</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

This page is OLD
================

This page had not been maintained for years, and it has been obsoleted a lot. It will be rewritten with the latest status, with updated milestones to achieve rational milestones and need. Check the new status at [WCF Development]({{site.github.url}}/old_site/WCF_Development "WCF Development").

We used to write WCF code in "Olive" module and hence there is a lot of lines that mention it in the following sections. But the WCF module is moved to mcs tree like other class libraries.

Communication Foundation
========================

Olive comprises Windows Communication Foundation (WCF) stack for building SOA-based applications. Its development is in early stages, but you can read [*Mono Olive: Introducing Windows Communication Foundation* notebook](http://www.youcannoteatbits.org/Files/Documents/Mono%20Olive%20Notebook%20-%2018-09-07.pdf) for further help on building, fundamentals and contributing (**building steps are outdated**; please, check [mono-olive](http://groups.google.com/group/mono-olive) for further help).

Some of the WS-\* specifications that the Communications Foundation uses are available [here](http://www.microsoft.com/interop/osp/default.mspx).

WCF is also used in Moonlight, but it cuts down huge parts of .NET 3.0 features and our implementation in Moonlight should be almost feature complete.

High level status
=================

The following status is gathered based on execution of samples in [http://msdn2.microsoft.com/en-us/library/ms756478.aspx](http://msdn2.microsoft.com/en-us/library/ms756478.aspx)

The initial goals focus on basicHttpBinding, so the samples were converted to use basicHttpBinding.

Many blocking bugs were fixed in order to achieve an initial status.

At this point almost none of the samples work out of the box.

Each non working sample was analyzed in order to understand the source of the failure.

Features
--------

### Serialization

-   XML Serialization (XmlSerializerFormatAttribute) - supported
-   MTOM not supported
-   DataContract serialization - supported. Tested and works with some simple scenarios. Fails on ICalculatorService and other data contract types. Deserializer creates new instance using reflection instead of GetUninitializedObject so can't deserialize types that don't have default constructor.
-   NetDataContract serialization - not supported
-   Incorrect Soap version in untyped messages.
-   ServiceKnownTypes attribute is not supported.

### Service contracts

-   Problems with metadata generation.
-   Typed messages not working well.
-   MessageContract - partially supported

### Service features

-   Sessions not supported.
-   Aborting requests is not supported.
-   Asynchronous WS not supported.

### Channels

-   TCP transport not supported.
-   Reliable session not supported.
-   Security token authenticator not supported.

### Configuration

-   Behavior configuration elements not supported.
    -   TextMessageEncoding
    -   HttpTransport

### Bindings

-   wsHttpBinding not supported. The only working binding is basicHttpBinding.

Milestones
----------

### Milestone 1 - Basic connection establishment - achieved

-   Basic ServiceHost side logic : hacked
-   Connect via HTTP and process messages : hacked
-   Support message from/to service method invocation : hacked
-   Support client native method invocation proxy : hacked
-   Optionally configuration support : hacked

### Milestone 2 - Web Services support

The purpose of this milestone is to achieve roughly fully functional WCF API, although many of the new WCF features will not be working. Our hopes are that after achieving this milestone, many WCF applications will be able to run by modifying the configuration files to remove those unsupported features.

In order to achieve this milestone we need to support the following:

-   Binding
    -   BasicHttpBinding without security, things to take into considerations:
        -   ASP.NET integration - which is currently is partially implemented and:
            1.  Has a bug with loading configuration from web.config.
            2.  The handler is not integrated into System.Web.
        -   **Not** supporting Security which includes: HTTPS & AuthenticationScheme.
        -   Support Only TextMessageEncoder (Without the MTOM Encoder).
        -   Support Configuration Properties:
            1.  AllowCookies
            2.  BypassProxyOnLocal
            3.  HostNameComparisonMode
            4.  MaxBufferPoolSize
            5.  MaxBufferSize
            6.  MaxReceivedMessageSize
            7.  MessageEncoding
            8.  ProxyAddress
            9.  ReaderQuotas
            10. TextEncoding
            11. EnvelopeVersion
            12. TransferMode
            13. UseDefaultWebProxy
-   Contracts
    -   Support the MessageContract
    -   Support the DataContractSerializer.
-   Encoders
    -   Support the TextEncoder
-   Behaviors
    -   Support the MetadataBehavior
-   Client
    -   Develop the GH Proxy
-   Configuration
    -   Complete the Configuration Infrastructure (without applying the configuration to the runtime objects)
    -   Achive ability to configure the above supported elements through configuration file.

### Milestone 3 - WS-Security and all relevant stuff

-   MessageProperty support (HttpRequest-, Security- etc): partly
-   MessageBuffer implementation for its internal use: done
-   xmlenc/xmldsig support for WSS: done, based on Sys.Security.dll
-   basic X509SecurityToken based communication: done
-   basic WSSecurityTokenSerializer support: done
-   support asymmetric binding elements: done
-   support symmetric binding elements: done
-   Timestamp support: done
-   token authentication: only at recipient (though it would be enough so far)
-   handle supporting tokens: done
-   retrieve correct tokens and use correct parameters
-   DetectReplays support
-   key derivation support: done
-   WS-SecureConversation support: it includes
-   SecureConversationSecurityTokenParameters
-   SecurityContextSecurityToken : largely done.
-   SslSecurityTokenParameters: it includes
-   connection-based token retrieval: largely done
-   SSL token processing : largely done
-   Binary XmlDictionary reader/writer for dnse:Cookie
-   SAML implementation
-   IssuedSecurityTokenProvider : it includes
    -   analysis on its behavior: largely done
    -   WS-Trust request processing (especially at service side)
-   ServiceAuthorizationManager implementation

### Milestone 4 - Infocard implementation

-   infocard selector/manager GUI
-   System.IdentityModel.Selectors.dll to invoke infocard.exe.
-   sts.exe

### Milestone 5 - everything else

-   some of Filter and FilterTables
-   NetTcpBinding
-   NetPeerTcpBinding
-   NetNamedPipeBinding
-   P2P
-   Transactions
-   SAML support
-   XmlSerializer in Messages
-   InstanceContext
-   Duplex channels and client base.
-   Sessions
-   Behaviors : some are done
-   Extensions
-   MetadataResolver
-   Policy[Import|Export]Extension implementation

### Not on the list

-   Msmq support
-   ComContract support

Detailed Status
===============

Core Compare
------------

The class status for WCF is now included in the \<a href="[http://go-mono.com/status/](http://go-mono.com/status/)"\>class status pages\</a\>.

Configuration
=============

Contracts
=========

Serialization
-------------

### Data Contract

DataContract serialization - supported. Tested and works with some simple scenarios. Fails on ICalculatorService and other data contract types

### Message Contract

#### Typed Messages

Not working well.

### Using Streams

Service Contract
----------------

### Proxy Generator

This generator is a runtime generator for creating the proxy type. Mono has an implementation that uses CodDom, which Mainsoft can’t use. (Their solution is probably will be based on Java Dynamic Proxies.)

Policy & Binding
----------------

### Binding Element Types

#### Basic

<table>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
<tbody>
<tr class="odd">
<td align="left"><p>Binding Element</p></td>
<td align="left"><p>Description</p></td>
<td align="left"><p>Mono Status</p></td>
<td align="left"><p>Relevant to GH</p></td>
</tr>
<tr class="even">
<td align="left"><p>OneWayBindingElement</p></td>
<td align="left"><p>A binding that supplies a one-way conversion layer</p></td>
<td align="left"><p>Implemented</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="odd">
<td align="left"><p>TransportBindingElement</p></td>
<td align="left"><p>The base of all of the transport binding elements provided</p></td>
<td align="left"><p>For now, only HttpTransportBindingElement is implemented, probably TcpTransportBindingElement is the next one. for detail see bellow on TransportBindingElements</p>
<p> </p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="even">
<td align="left"><p>CompositeDuplexBindingElement</p></td>
<td align="left"><p>Represents the binding element that is used when the client must expose an endpoint for the service to send messages back to the client</p></td>
<td align="left"><p>Not Implemented</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="odd">
<td align="left"><p>StreamUpgradeBindingElement</p></td>
<td align="left"><p>Indicate that a custom stream upgrade provider should be used, for example when adding a compression to a text stream</p></td>
<td align="left"><p>Implemented, Abstract.</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="even">
<td align="left"><p>PrivacyNoticeBindingElement</p></td>
<td align="left"><p>Represents the binding element that contains the privacy policy for the WS-Federation binding</p></td>
<td align="left"><p> </p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="odd">
<td align="left"><p>UseManagedPresentationBindingElement</p></td>
<td align="left"><p>used to communicate with a CardSpace Security Token Service that supports the CardSpace profile of WS-Trust</p></td>
<td align="left"><p>Not Implemented</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="even">
<td align="left"><p>ReliableSessionBindingElement</p></td>
<td align="left"><p>Supports reliable session between endpoints</p></td>
<td align="left"><p>Not Implemented</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="odd">
<td align="left"><p>SecurityBindingElement</p></td>
<td align="left"><p>An abstract class that, when implemented, represents a binding element that supports channel SOAP message security</p></td>
<td align="left"><p>Seems to be implemented as an abstract class</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="even">
<td align="left"><p>MessageEncodingBindingElement</p></td>
<td align="left"><p>The base of all Encoding Elements such as ‘TextMessageEncodingElement’, used to encode and decode messages between endpoints.</p></td>
<td align="left"><p>Partially implemented only to get the text encoder work.</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="odd">
<td align="left"><p>PeerResolverBindingElement</p></td>
<td align="left"><p>Defines the abstract base class for binding elements used to create peer resolver objects</p></td>
<td align="left"><p>Not Implemented</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="even">
<td align="left"><p>TransactionFlowBindingElement</p></td>
<td align="left"><p>This element allows you to enable or disable incoming transaction flow in an endpoint’s binding settings, as well as to specify the desired protocol format for incoming transactions</p></td>
<td align="left"><p>Partially implemented</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="odd">
<td align="left"><p>ContextBindingElement</p></td>
<td align="left"><p> </p></td>
<td align="left"><p> </p></td>
<td align="left"><p> </p></td>
</tr>
</tbody>
</table>

#### TransportBindingElement

<table>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
<tbody>
<tr class="odd">
<td align="left"><p>Binding Element</p></td>
<td align="left"><p>Description</p></td>
<td align="left"><p>Mono Status</p></td>
<td align="left"><p>Relevant to GH</p></td>
</tr>
<tr class="even">
<td align="left"><p>PeerTransportBindingElement</p>
<p> </p></td>
<td align="left"><p> </p></td>
<td align="left"><p>Not Implemented</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="odd">
<td align="left"><p>HttpTransportBindingElement</p>
<p> </p></td>
<td align="left"><p>used to specify an HTTP transport for transmitting messages</p></td>
<td align="left"><p>Implemented</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="even">
<td align="left"><p>HttpsTransportBindingElement</p>
<p> </p></td>
<td align="left"><p>used to specify an HTTPS transport for transmitting messages</p></td>
<td align="left"><p>Not Implemented</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="odd">
<td align="left"><p>TcpTransportBindingElement</p>
<p> </p></td>
<td align="left"><p>used to specify an TCP transport for transmitting messages</p></td>
<td align="left"><p>Implemented</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="even">
<td align="left"><p>NamedPipeTransportBindingElement</p>
<p> </p></td>
<td align="left"><p>Named Pipe transport</p></td>
<td align="left"><p>Not Implemented</p></td>
<td align="left"><p>Not relevant</p></td>
</tr>
<tr class="odd">
<td align="left"><p>MsmqTransportBindingElement</p>
<p>MsmqIntegrationBindingElement</p>
<p> </p></td>
<td align="left"><p>Integration with ms.net message queue</p></td>
<td align="left"><p>Not Implemented</p></td>
<td align="left"><p>Not relevant</p></td>
</tr>
<tr class="even">
<td align="left"><p>ConnectionOrientedTransportBindingElement</p>
<p> </p></td>
<td align="left"><p>Base of TcpTransportBindingElement</p></td>
<td align="left"><p>Implemented, Abstract</p></td>
<td align="left"><p> </p></td>
</tr>
</tbody>
</table>

#### StreamUpgradBindingElement

<table>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
<tbody>
<tr class="odd">
<td align="left"><p>Binding Element</p></td>
<td align="left"><p>Description</p></td>
<td align="left"><p>Mono Status</p></td>
<td align="left"><p>Relevant to GH</p></td>
</tr>
<tr class="even">
<td align="left"><p>SslStreamSecurityBindingElement</p></td>
<td align="left"><p>supports channel security using an SSL stream</p></td>
<td align="left"><p>Not Implemented</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="odd">
<td align="left"><p>WindowsStreamSecurityBindingElement</p></td>
<td align="left"><p> </p></td>
<td align="left"><p>Not Implemented</p></td>
<td align="left"><p>Not relevant</p></td>
</tr>
</tbody>
</table>

#### SecurityBindingElement

<table>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
<tbody>
<tr class="odd">
<td align="left"><p>Binding Element</p></td>
<td align="left"><p>Description</p></td>
<td align="left"><p>Mono Status</p></td>
<td align="left"><p>Relevant to GH</p></td>
</tr>
<tr class="even">
<td align="left"><p>AsymmetricSecurityBindingElement</p></td>
<td align="left"><p>Supports public key encryption</p></td>
<td align="left"><p>Implemented</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="odd">
<td align="left"><p>SymmetricSecurityBindingElement</p></td>
<td align="left"><p>Supports shared key encryption</p></td>
<td align="left"><p>Implemented</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="even">
<td align="left"><p>TransportSecurityBindingElement</p></td>
<td align="left"><p>Base class of security elements</p></td>
<td align="left"><p>Implemented</p></td>
<td align="left"><p> </p></td>
</tr>
</tbody>
</table>

#### MessageEncodingBindingElement

<table>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
<tbody>
<tr class="odd">
<td align="left"><p>Binding Element</p></td>
<td align="left"><p>Description</p></td>
<td align="left"><p>Mono Status</p></td>
<td align="left"><p>Relevant to GH</p></td>
</tr>
<tr class="even">
<td align="left"><p>BinaryMessageEncodingBindingElement</p></td>
<td align="left"><p>Binary format</p></td>
<td align="left"><p>Implemented</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="odd">
<td align="left"><p>MtomMessageEncodingBindingElement</p></td>
<td align="left">Binary optimized format, Microsoft specific</td>
<td align="left"><p>Not Implemented in System.Runtime.Serialization</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="even">
<td align="left"><p>TextMessageEncodingBindingElement</p></td>
<td align="left"><p>Text format</p></td>
<td align="left"><p>Implemented</p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="odd">
<td align="left"><p>WebMessageEncodingBindingElement</p></td>
<td align="left"><p> </p></td>
<td align="left"><p>Implemented</p></td>
<td align="left"><p> </p></td>
</tr>
</tbody>
</table>

#### PeerResolverBindingElement

<table>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
<tbody>
<tr class="odd">
<td align="left"><p>Binding Element</p></td>
<td align="left"><p>Description</p></td>
<td align="left"><p>Mono Status</p></td>
<td align="left"><p>Relevant to GH</p></td>
</tr>
<tr class="even">
<td align="left"><p>PeerCustomResolverBindingElement</p></td>
<td align="left"><p> </p></td>
<td align="left"><p> </p></td>
<td align="left"><p> </p></td>
</tr>
<tr class="odd">
<td align="left"><p>PnrpPeerResolverBindingElement</p></td>
<td align="left"><p> </p></td>
<td align="left"><p> </p></td>
<td align="left"><p> </p></td>
</tr>
</tbody>
</table>

### Binding Types

#### BasicHttpBinding

Is the only built in binding that has a reasonable status, and can be used to host a service. This binding supports two TransportBindingElements:

1.  HttpTransportBindingElement – This is not fully implelmented, main aspects are:
    1.  Stand Alone executable - On the hosting side seems to be implemented with a stand alone http listener, the client seems to be implemented via WebRequest & WebResponse.
    2.  IIS hosting - A handler for System.Web is basically implemented, but need to be integrated into ASP.NET, I have seen a bug right now that the configuration is not taken from Web.Config.

2.  HttpsTransportBindingElement – This element is not implemented due to missing implementation of the corresponding IChannelListener.

In addition it supports two MessageEncodingBindingElements

1.  TextMessageEncodingBindingElement – which is supported
2.  MtomMessageEncodingBindingElements – which is missing because of lack of encoder implementation in System.Runtime.Serialization dll.

When security is on this Binding uses the AsymetricSecurityBindingElement using certificate validation (https).

#### WSHttpBinding

Represents an interoperable binding that supports distributed transactions and secure, reliable sessions Note: The WSHttpBinding implementes a number of WS-\* specifications such as:

-   WS-MetadataExchange
-   WS-RelliableMessaging
-   WS-AtomicTransactions
-   WS-Security

These specifications are also implemented and sun project name 'Tango', and sun claims to be interoperable with .NET WCF implementation. The existance of the stack in an open source java project may be very helpfull for us.

**Current Status: not impelmented**

#### WebHttpBinding

expose WCF Web services through HTTP requests that use “plain old XML” (POX) style messaging instead of SOAP-based messaging

#### NetPeerTcpBinding

A secure tcp based Binding for peer to peer network application.

#### NetTcpBinding

A Binding that uses Tcp as the transport layer This binding by default uses the following elements:

1.  TcpTransportBindingElement
2.  BinaryMessageEncodingBindingElement
3.  SymetricSecurityBindingElement

#### WSDualHttpBinding

A WS interoperable binding that is used with duplex service contracts.

#### CustomBinding

#### MsmqBindingBase

#### NetNamedPipeBinding

Service Runtime Behavior
========================

The behaviors controlls the runtime behavior of the service. There are some built in behaviors as detailed bellow, and the user can add custom behavior. A behavior can be achieved either by inheriting from IServiceBehavior interface or by applying the ServiceBehavior attribute to a service contract. If inheriting from IServiceBehavior then applying the behavior to the service is gained by implementing the method:

    void IServiceBehavior.ApplyDispatchBehavior ( ServiceDescription description,ServiceHostBase serviceHostBase)

The ServiceBehavior Attribute contains serveral properties that referrs to different behaviors as detailed bellow.

Transaction Behavior
--------------------

Defines the behavior of the transaction in terms of timeout, isolation and commit policy. This behavior is reached by applying the ServiceBehavior attribute to a service contract, and definning the following properties:

-   TransactionTimeout
-   TransactionIsolationLevel
-   ReleaseServiceInstanceOnTransactionComplete
-   TransactionAutoCompleteOnSessionClose
-   TransactionAutoComplete

**Status: Not Implemented**

Dispatch Behavior
-----------------

Concurrency Behavior
--------------------

This behavior is applied using the ServiceBehaviorAttribute with the ConcurrencyMode enumeration, which controls whether an instance of a service processes messages sequentially or concurrently

-   Single: Each service instance processes one message at a time. This is the default concurrency mode.
-   Multiple: Each service instance processes multiple messages concurrently. The service implementation must be thread-safe to use this concurrency mode.
-   Reentrant: Each service instance processes one message at a time, but accepts reentrant calls. The service only accepts these calls when it is calling out

**Status: Not Implemented**

Error Behavior
--------------

Throttling Behavior
-------------------

Basically controls how many messages are processed. The configuration parameters are:

-   MaxConcurrentCalls
-   MaxConnections
-   MaxInstances

**Status: Not Implemented**

Metadata Behavior
-----------------

This behavior enables/disables MetadataExchange of a service. It achieved by an instance of 'ServiceMetadataBehavior' that is applied to a service host.

Status: It seems to be that some work on this exist, but i can't get a good status here. In practice I could not retrieve the metadata from a mono based service.

Instance Behavior
-----------------

This behavior specifies how many instances of the service can be run. This behavior is applied by the ServiceBehavior attribute. The options are defined by the InstanceContextMode enumeration:

-   InstanceContextMode.PerSession
-   InstanceContextMode.PerCall
-   InstanceContextMode.Single

**Status: Only InstanceContextMode.Single is implemented.**

Message Inspection
------------------

Parameter Filtering
-------------------

Message Encoding
================

Binary
------

Implemented.

Text
----

Implemented

Mtom
----

Not Implemented

Web
---

Implemented

Activation and hosting
======================

EXE
---

IIS
---

