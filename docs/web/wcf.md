---
layout: docpage
navgroup: docs
title: WCF Development
redirect_from:
  - /WCF_Development/
  - /WCF/
  - /WCFNewPage/
---

Brief History
=============

WCF in Mono was originally developed as part of the "olive" module in our source repository, which is primarily a collection of early experimental development of .NET compatibility stack. Nowadays **WCF is part of the core Mono**. The WCF stack has been merged to mono module (under mcs/class) and is no longer developed in olive.

WCF development was started in 2005 and has been suspended and resumed various times. These are the four major efforts over the years:

-   Initial development by the time of Mono Summit 2006 in Boston. ([Presentation](http://www.go-mono.com/meeting06/infocard-indigo.pdf))
-   Google Sumemr of Code development for P2P binding development by Marcos Cobena Morian. Seealso: [Mono Olive: Introducing Windows Communication Foundation notebook](http://www.youcannoteatbits.org/Files/Documents/Mono%20Olive%20Notebook%20-%2018-09-07.pdf)
-   Development led by Mainsoft team. See [Noam Lampert's blog](http://noamlampert.blogspot.com/search/label/Mono)
-   Current phase, originally started as part of Moonlight 2.0 effort since 2009.
    -   We were working on WSHttpBinding support, which is mostly for the security stack (WS-Security, WS-Trust, WS-SecureConversation). It is left incomplete. For details, see [WCF\_WSHttpBindingHacking]({{ site.github.url }}/archived/WCF_WSHttpBindingHacking "WCF WSHttpBindingHacking") page.

Status
======

Summary
-------

We continue to fill missing functionality if they are for essential stack such as HTTP channels. There are tons of cosmetic features that were left not-implemented. For other stack such as P2P bindings, we may work on them from time to time, but they are not priority.

For the status details, check out our [class staus pages](http://go-mono.com/status/). System.Runtime.Serialization.dll, System.IdentityModel.dll, System.IdentityModel.Selectors.dll, System.ServiceModel.dll, System.ServiceModel.Web.dll, System.ServiceModel.Routing.dll and System.ServiceModel.Discovery.dll are there. (Other WCF assemblies are not there, mostly because the assemblies are not in our source repository or not supported in any sense.)

Tasks remaining
---------------

-   Bugfixes
    -   ~~WS-SecureConversation: get negotiation based on SecurityContextSecurityToken working.~~ Turned out that it is not a bug but there is insufficient information on negotiation tokens to implement. We'll leave it as is and go on other token support which are well documented and/or open.

-   New features
    -   Diagnostics support, and service trace viewer if possible.
    -   Implement 4.0 stuff: see this [MSDN article](http://msdn.microsoft.com/en-us/library/ee354381.aspx) and [our status entry in Sep. 2010](http://veritas-vos-liberabit.com/monogatari/2010/09/current-wcf-40-status-in-mono.html) for details
        -   discovery and announcements i.e. System.ServiceModel.Discovery.dll : ongoing.
        -   simplified configurations : only a few remains (activation, file-less configuration etc.)
        -   REST enhancements.

-   Improvements
    -   Metadata support (WSDL and MEX)
        -   improved svcutil work (WsdlImporter). Binding export should in general work now. Endpoint export does not yet.
        -   WsdlExporter likely needs better support.
        -   mex and policy support. Will be used in security stack.

Components with no plan to support
==================================

Items listed here are with no plan to support. Though anyone should feel free to hack and contribute in these areas.

-   ComIntegration.

-   WorkflowServices. we have no plan to work on WF3. There are WF4-based WCF stuff in System.ServiceModel, which is in different story (though no plan for this either).

-   RIA Services. Basically there are Silverlight SDK assemblies that are to be embedded in the app, so we don't have to bother much.

-   WSHttpBinding and its dependencies
    -   TransactionFlow
    -   ReliableSession
-   Federation (I'm not sure what it is supposed to do.)
-   Silverlight PollingDuplex binding element.
-   WSDualHttpBinding (post-WSHttpBinding work)
    -   One-way binding and things that depends on it; reliable messaging and composite duplex. channel pool.
-   MSMQ stack: Msmq bindings and MsmqIntegration.
-   Data Services.
-   Net peer channel improvements.

Known issues
============

In general, we keep fixing bugs and bugfixes are (very) often not in the latest release yet. Especially, for Mono 2.8, the branching was done much earlier than the actual release, and even if you reported bugs earlier than the release, it is often not fixed in it. The actual fixes would be available in the future release or you can grab the latest code in our [daily builds](http://mono.ximian.com/daily/).

Based on the premise above, here I list some known issues and workarounds that we don't give priority beyond ongoing work.

-   When you host a service that uses NetTcpBinding or CustomBinding with TcpTransportBinding on a ServiceHost and configure the binding (element) as TransferMode = Buffered, it could result in blocking when it receives more than ServiceThrottle.MaxConcurrentSessions or ServiceThrottle.MaxConcurrentCalls at a time. To avoid this issue, give large number for those ServiceThrottle properties.
-   [Data Contract Names for Generic Types](http://msdn.microsoft.com/en-us/library/ms731045.aspx) is not implemented. The reason is, it does not fully explain \*exactly\* how to compute the hash (hash algorithm, how to concatenate namespace strings, conversion from namespace strings to bytes, and to result string back which must not be base64 as it contains '+' etc.). Since interoperable applications should use explicit xml element names (or do you expose "FooBarxxXxXxxX" in your app?), it is left as is so far.

Status Details
==============

I marked some areas that especially welcome contributions as "contribute" lines.

Other than System.ServiceModel.dll
----------------------------------

-   System.Runtime.Serialization.dll
    -   NetDataContractSerializer is not implemented. (contribute)
-   System.IdentityModel.dll
    -   Windows-only stuff is not really done. (contribute)
    -   System.IdentityModel.Policy namespace is not known to work.
    -   SAML implementation is incomplete, and not implemented as SecurityToken. (contribute)
-   System.IdentityModel.Selectors.dll
    -   On Win32 it should work. The actual implementation is in Mono.IdentityModel.Selectors.dll which P/Invokes cardspaceapi.dll.
    -   On Linux and/or Mac, the entire UI must be implemented. (contribute: write card manager UI (in any form; Gtk\#, WinForms or even CUI). It could be done as part of mono-tools (especially if it depends on Gtk\#) or mcs/tools. There is Mono.IdentityModel.Selectors.dll that holds implementation for win32.)
-   System.ServiceModel.Web.dll
    -   3.5 is mostly done. 4.0 needs more work. (contribute)
-   System.ServiceModel.Routing.dll
    -   Mostly implemented. (needs some real-world usage.)
-   System.ServiceModel.Discovery.dll
    -   Announcement and Discovery Probe is done except for Adhoc Discovery. Discovery Resolve is not implemented yet. (contribute)
-   System.Data.Services.dll
    -   It is not really implemented, but we may start working on it. It is so far stubbed by Eric Maupin for NHibernate build and Marek (Habersack) is planning his hack.

System.ServiceModel.dll
-----------------------

### Binding Elements

Bindings should be regarded as explained here too, as they are almost mere collection of binding elements.

#### Message encodings

All message encoding binding elements are implemented, except for some details. For example, ArraySegment support is not implemented. Message buffering is not always considered.

#### Transports

HTTP, HTTPS (basically), TCP (both streaming and duplex) are implemented. NetPeer is in general implemented, but lacks some details. Named pipe code is written, but not really working yet. For others, it depends.

#### Everything else

are explained at corresponding sections (for example, no point of explaining TransactionFlowBoindingElement beyond Transaction section).

### Communication objects

Client side would work better since they are actually used heavily in Moonlight.

Session support depends on transports (as .NET WCF does), and since only TCP duplex channel is implemented so far, some other requirements may not be filled. (In Moonlight 2.0 compatibility layer, there is no binding element that supports sessions.)

#### Core of IChannelFactory, IChannelListener and ChannelBase

Every basic parts should work: CommunicationObject, ChannelBase, ChannelManagerBase, ChannelFactoryBase, ChannelListenerBase, etc.

The same applies to service side at ServiceHost: ServiceHost(Base), ChannelDispatcher(Base), EndpointDispatcher and DispatchRuntime.

Though note that not \*all\* of the members are ready to work.

(All those derived types of channel factories and listeners depend on each layer.)

### Service and contract description, and proxies

#### ContractDescription

All description types should be working, including typed messages.

Not all behaviors are supported.

#### WSDL support

Binding export and import would work in general. Endpoint export and import don't work.

#### IContextChannel (ChannelFactory and ClientBase)

Basic functionality in client factory should work, including duplex ones: ClientBase\<T\>, DuplexClientBase\<T\>, ChannelFactory\<T\>, DuplexChannelFactory\<T\>.

### Security stack

Incomplete work. WS-Trust authenticator hash was not clear at the development a few years ago (This might have changed by Windows Open Protocols).

### Not supported

-   transactions
-   composite duplex and one way binding
-   reliable messaging (depends on one-way binding element)
-   federation
-   privacy notice (WSDL support is incomplete anyways)
-   SSL stream
-   logging

Old Milestones and status (for reference)
-----------------------------------------

For older status of WCF, see [WCFStatusOld]({{ site.github.url }}/archived/WCFStatusOld "WCFStatusOld").

