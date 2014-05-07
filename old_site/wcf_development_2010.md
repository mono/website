---
layout: obsolete
title: "WCF Development 2010"
permalink: /old_site/WCF_Development_2010/
redirect_from:
  - /WCF_Development_2010/
---

WCF Development 2010
====================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#WCF_future_development_tasks">1 WCF future development tasks</a>
<ul>
<li><a href="#Data_transfer_technology">1.1 Data transfer technology</a></li>
<li><a href="#Core_WCF_stack">1.2 Core WCF stack</a></li>
<li><a href="#WCF_3.0.2F3.5_Security_stack">1.3 WCF 3.0/3.5 Security stack</a>
<ul>
<li><a href="#dependency_graph">1.3.1 dependency graph</a></li>
<li><a href="#ServiceAuthorizationManager">1.3.2 ServiceAuthorizationManager</a></li>
<li><a href="#Identity_support">1.3.3 Identity support</a></li>
<li><a href="#SecurityBindingElements">1.3.4 SecurityBindingElements</a></li>
<li><a href="#WSSecurityTokenSerializer">1.3.5 WSSecurityTokenSerializer</a></li>
<li><a href="#WSFederationHttpBinding">1.3.6 WSFederationHttpBinding</a></li>
<li><a href="#WSDualHttpBinding">1.3.7 WSDualHttpBinding</a></li>
<li><a href="#Policy.5BImport.7CExport.5DExtension">1.3.8 Policy[Import|Export]Extension</a></li>
</ul></li>
<li><a href="#Windows_Identity_Foundation_.28Microsoft.IdentityModel.dll.29">1.4 Windows Identity Foundation (Microsoft.IdentityModel.dll)</a></li>
<li><a href="#New_.NET_4.0_stack">1.5 New .NET 4.0 stack</a>
<ul>
<li><a href="#Routing_.28System.ServiceModel.Routing.dll.29">1.5.1 Routing (System.ServiceModel.Routing.dll)</a></li>
<li><a href="#Discovery_.28System.ServiceModel.Discovery.dll.29">1.5.2 Discovery (System.ServiceModel.Discovery.dll)</a></li>
<li><a href="#Default_configuration">1.5.3 Default configuration</a></li>
<li><a href="#More_REST_support">1.5.4 More REST support</a></li>
</ul></li>
<li><a href="#REST_Starter_Kit_.28Microsoft.ServiceModel.Web.dll.29">1.6 REST Starter Kit (Microsoft.ServiceModel.Web.dll)</a></li>
<li><a href="#Management_and_AppFabric">1.7 Management and AppFabric</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

WCF future development tasks
============================

Data transfer technology
------------------------

Regarding entity data model, there is some complicated situation on the technology layers. To list things up, there are:

- Linq to SQL : the first C\# Linq example that achieves data unification with query expressions. SQLServer-only in .NET, while we have dblinq-based implementation which works over any providers. Assembly: System.Data.Linq.dll Status: done. (jonp)

- Linq to Entities : another C\# Linq usage from MS ADO.NET team that achieves almost the same purpose as L2SQL. Includes entity data model, ADO.NET provider over entity client. Assembly: System.Data.Entity.dll Status: no plan to work on it.

- ASP.NET Dynamic Data : ASP.NET libraries that are application for the above. Provides data pager and manager. It does not involve the actual data transfer; it is done at server side. Assembly: System.Web.DynamicData.dll for base and L2SQL, System.Web.Entity.dll for Entities enhancements Status: done. (grendel)

- WCF Data Services (formerly ADO.NET Data Services, Astoria) WCF library that is a REST application for data query and updates. Uses "entity data model", but likely independent from Entities. Provides both client and service functionality. Assembly : System.Data.Services.dll, System.Data.Services.Client.dll Status: only stubbed.

- WCF RIA Services Uses the simplified version of "open data protocol", and has some revised(?) entity data model of its own. Unlike Astoria, some classes overlap Entities. Assembly: System.Windows.Ria.dll Status: no plan. Basically SL xap files include it.

Through the survey, looks like the entity model technology that is bound to databases is different from the entity management client. This could explain that Data Services do not have a reference to Entities assembly.

The entity management protocol seems to be documented in some specifications linked from [http://www.odata.org/](http://www.odata.org/) . The specifications are about 300 pages in PDF.

Core WCF stack
--------------

Here I ambiguously mean "core" by fundamental parts of WCF, that are mandatory to use ClientBase\`1 and ServiceHost with BasicHttpBinding or NetTcpBinding, which are, of client and service framework e.g. ChannelDispatcher, ChannelFactory, IContextChannel implementations, instance contexts, contracts, serializers, Message and message filters.

It does not involve the security stack (huge), other Bindings such as MSMQ bindings, named pipe binding and WSHttpBinding, transaction support, reliable session and other non-mandatory features.

Non-core features may be occasionally implemented.

WCF 3.0/3.5 Security stack
--------------------------

### dependency graph

        WS[2007]HttpBinding
          ReliableMessagingBindingElement : none
            (WS-RM implementation)
          TransactionFlowBindingElement : none
            (WS-AT implementation)
          [Asymmetric|Symmetric|Transport]SecurityBindingElement : broken
            (WS-Security implementation)
            (WS-Trust implementation)
            SignedXml, EncryptedXml : broken usage
            SslSecurityToken[Provider|Authenticator] : incomplete
              (WS-SecureConversation implementation)
            SpnegoSecurityToken[Provider|Authenticator] : incomplete
              (WS-SecureConversation implementation)
              SecurityContextSecurityToken[|Resolver|Authenticator] : incomplete
            WSSecurityTokenSerializer : broken

        WS[2007]FederationHttpBinding
          WS[2007]HttpBinding
          IssuedSecurityTokenProvider : incomplete
            (WS-Federation implementation)

        WSDualHttpBinding
          WSHttpBinding
          CompositeDuplexBindingElement : none

### ServiceAuthorizationManager

status: Nothing is implemented yet.

tasks: implement eveything.

### Identity support

status:

-   Some parts are implemented but limited to WS-Security support.
-   Some SAML parts are implemented but never used.

tasks:

-   Fill remaining parts other than WS-Security required parts.
-   Complete SAML work. SAML support has never been used.

### SecurityBindingElements

status:

-   SymmetricSecurityBindingElement and AsymmetricSecurityBindingElement had been implemented years ago, but it's now broken due to regression in or around xmldsig or xmlenc.
-   TLS-based communication in WS-SecureConversation used to be working but not now (dependent on xmldsig).
-   WS-Trust-based security token handling is not practically done.

tasks:

-   Fix xmldsig/xmlenc usage.
-   Resume WSSC TLS communication work.
-   Resume WST token negotiation work.

### WSSecurityTokenSerializer

status:

-   WS-Security serialization and deserialization is not finished, though it used to work to some extent.

tasks:

-   Fill missing parts when required.

### WSFederationHttpBinding

status:

-   Nothing is implemented yet. It is also required for CardSpace implementation.
-   IssuedSecurityTokenProvider work is almost nothing.

tasks:

-   implement everything.
-   restart IssuedSecurityTokenProvider work.

### WSDualHttpBinding

status

-   It requires ReliableMessagingBindingElement, which is not implemented.
-   TransactionFlowBindingElement, which is not implemented. For transactions I'm not sure if it can be fully supported (as we don't have DTC). But at least WS-AT protocol could be implemented.
-   CompositeDuplexBindingElement is also not implemented.

tasks:

-   implement WS-RM.
-   implement WS-AT and other transaction support stuff.
-   implement CompositeDuplexBindingElement.

### Policy[Import|Export]Extension

status:

-   nothing is implemented.

tasks:

-   implement everything, but low priority. WSDL support improvements may be needed first.

Windows Identity Foundation (Microsoft.IdentityModel.dll)
---------------------------------------------------------

Apart from .NET 4, there will be another set of identity and federation support, Windows Identity Foundation (WIF). It does not seem to overlap existing security and identity stack, but rather to provide foundation for relying service (application) and federation implementation.

The assembly is like 1MB, as huge as System.Web.Extensions or System.Core. To work on it we have to some great amount of hacking resource. Also it does not make sense to implement this one without core consumption layer (which is 3.0).

New .NET 4.0 stack
------------------

It is well explained at [http://msdn.microsoft.com/en-us/library/ee354381.aspx](http://msdn.microsoft.com/en-us/library/ee354381.aspx)

In our class status page, there is about 2400 missings in System.ServiceModel.dll, but they are mostly because it integrates WF support (which used to be System.WorkflowServices.dll in 3.5). I have already integrated those used to be in System.ServiceModel.Web.dll into System.ServiceModel.dll under 4.0 profile.

### Routing (System.ServiceModel.Routing.dll)

It has been implemented, with only a few missing features.

### Discovery (System.ServiceModel.Discovery.dll)

Another service application. Provides WS-Discovery functionality, so that clients can choose one of the services for the same requirement. Involves UDP endpoints. Totally isolated task.

### Default configuration

It is part of configuration framework. Providing common simplified default set is not difficult. While this task is part of 4.0 core, it is also sort of isolated.

### More REST support

Some additions to the REST stack. Automatic help page support, etc.. I assume it can be implemented separately like WSDL support.

REST Starter Kit (Microsoft.ServiceModel.Web.dll)
-------------------------------------------------

It is an extension for wider REST support. It is still preview version, and not sure how it will be distributed, while it seems already used in some projects. TBD.

Management and AppFabric
------------------------

It is not part of any of WxF, but AppFabric provides some advanced administration and configuration utility for WCF (and WF) services. It is looking useful and it might be nice to have for us too. Though large part of AppFabric is looking WF-centric.

The features include: configuration management, call statistics, endpoint management, database monitoring etc.

For now we lack detailed part of configuration support itself, so this component cannot be of an immediate task. On the other hand, things like configuration editor becomes less important once simplified default configuration is implemented.

Regarding management, we actually lack diagnostics (logging) framework that WCF has. Hence things like SvcTraceViewer cannot be implemented. It will be a non-trivial task.

