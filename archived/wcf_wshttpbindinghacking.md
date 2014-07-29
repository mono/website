---
layout: obsolete
title: "WCF WSHttpBindingHacking"
lastmodified: '2011-04-18'
permalink: /archived/WCF_WSHttpBindingHacking/
redirect_from:
  - /WCF_WSHttpBindingHacking/
---

WCF WSHttpBindingHacking
========================

On this page I put my hacking notes for WSHttpBinding and relevant stuff which was from 2010. We are not working on this stuff anymore.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#ws-http-bindings">1 WS HTTP Bindings</a>
<ul>
<li><a href="#transactionflowbindingelement">1.1 TransactionFlowBindingElement</a></li>
<li><a href="#reliablesessionbindingelement">1.2 ReliableSessionBindingElement</a></li>
<li><a href="#compositeduplexbindingelement-and-onewaybindingelement">1.3 CompositeDuplexBindingElement and OneWayBindingElement</a></li>
<li><a href="#securitybindingelement">1.4 SecurityBindingElement</a></li>
</ul></li>
<li><a href="#securitybindingelement_2">2 SecurityBindingElement</a>
<ul>
<li><a href="#wshttpbindingsecuritymessage-nondualmessagesecurityoverhttp">2.1 WSHttpBinding.Security.Message (NonDualMessageSecurityOverHttp)</a></li>
</ul></li>
<li><a href="#ws-security-implementation">3 WS-Security implementation</a>
<ul>
<li><a href="#gettoken--authenticatetoken">3.1 GetToken / AuthenticateToken</a></li>
</ul></li>
<li><a href="#ws-trust-implementation">4 WS-Trust implementation</a>
<ul>
<li><a href="#sslnego-implementation">4.1 sslnego implementation</a></li>
</ul></li>
<li><a href="#ws-secureconversation-implementation">5 WS-SecureConversation implementation</a></li>
<li><a href="#issuedtoken">6 IssuedToken</a></li>
</ul></td>
</tr>
</tbody>
</table>

WS HTTP Bindings
================

(Note: this section is mostly based on what I read from msdn, not much from experience.)

There are some classes that are covered by this hacking plan:

-   WSHttpBindingBase
    -   WSHttpBinding
        -   WS2007HttpBinding
    -   WSFederationHttpBinding
        -   WS2007FederationHttpBinding
-   WSDualHttpBinding

Some notes:

-   Binding is just a set of BindingElements, it should rather be understood per BindingElements with several configurable options.
    -   Especially WSHttpSecurity.Message involves complicated set of options. I'll describe it later.
-   WSFederationHttpBinding and WSHttpBinding could differ in that the former may use transport security. See WSFederationHttpBinding.CreateBindingElements() msdn documentation.
-   WS2007HttpBinding and WSHttpBinding differs in the target version of each BindingElements: Security, ReliableSession and Transaction.
-   WS2007FederationHttpBinding and WSFederationHttpBinding differs in the target version of Security.

WSDualHttpBinding is directly derived from Binding, with the following binding elements:

-   TransactionFlow
-   ReliableSession
-   SymmetricSecurity
-   CompositeDuplex
-   OneWay
-   TextMessageEncoding
-   HttpTransport

Here I describe some introductive parts. This document is mostly for SecurityBindingElement and its descendants, so I'll revisit it later.

TransactionFlowBindingElement
-----------------------------

TBD

ReliableSessionBindingElement
-----------------------------

TBD

CompositeDuplexBindingElement and OneWayBindingElement
------------------------------------------------------

TBD

SecurityBindingElement
----------------------

SecurityBindingElement provides several surfaces of the SOAP message security stack.

SecurityBindingElement
======================

SecurityBindingElement covers several security-related WS-\* specifications:

-   WS-Secutity : encryption (xmlenc) and signing (xmldsig) of message parts.
    -   There is a couple of security token profile specifications such as X509, UserName and SAML.
-   WS-Trust : security token issuance, renewal and validation.
-   WS-SecureConversation : establishment of security context.

There are three derived classes of SecurityBindingElement:

SymmetricSecurityBindingElement  
uses symmetric security key, meaning that initiator and recipient use the same security key (like HMAC-SHA1).

AsymmetricSecurityBindingElement  
uses asymmetric security key, meaning that initiator and recipient use different security key for each (like RSA-SHA1).

TransportSecurityBindingElement  
supports custom "mixed mode" securirty.

Message protection requirements are represented as SecurityTokenParameters (actually one of its derived classes) at binding element level.

Implementation wise, SymmetricSecurityBindingElement and AsymmetricSecurityBindingElement implements BuildChannelFactory\<T\>() to return SecurityChannelFactory\<T\>(), and BuildChannelListener\<T\>() to return SecurityChannelListener\<T\>(). Implementation wise, SecurityChannelListener\<T\>() accepts SecurityReplyChannel, which is mostly a wrapper for inner channel. The channel receives SecurityRequestContext, which decodes input Message through RecipientSecureMessageDecryptor which is derived from SecureMessageDecryptor and uses DecryptMessage to decrypt messages.

Initiator and recipient have different roles and different set of security support stack (will describe later) in public API. Namely:

-   ServiceCredentialsManager and SecurityTokenManager:
    -   Initiator's security credentials are configured through ClientCredentials, which is to create ClientCredentialsSecurityTokenManager.
    -   Recipient's security credentials are through ServiceCredentials, which is to create ServiceCredentialsSecurityTokenManager.
    -   In both cases, -Credentials types derive from SecurityCredentialsManager, and -TokenManager derive from SecurityTokenManager.

(Here I mix "initiator" versus "recipient" and "client" versus "service", which might not hold true for WSDualHttpBinding, which involves callbacks. At least [Initiator|Recipient]SecureMessage[Decryptor|Generator] have MessageDirection property whose values are premised request-reply channels.)

WSHttpBinding.Security.Message (NonDualMessageSecurityOverHttp)
---------------------------------------------------------------

The message security property on WSHttpBinding provides several choices for protection and signing tokens, configured by SecurityTokenParameters object:

-   SecurityAlgorithmSuite
-   ClientCredentialType
-   EstablishSecurityContext
-   NegotiateServiceCredential

EstablishSecurityContext is for WS-SecureConversation support. If it is true (which is true by default), then it uses SecureConversationSecurityTokenParameters with security token parameters configured by other properties above.

Other properties configure the security token parameters as follows:

1.  it adds EndpointSupportingTokenParameters depending on ClientCredentialType:
    1.  Certificate: X509SecurityTokenParameters
    2.  IssuedToken: IssuedSecurityTokenParameters
    3.  UserName: UserNameSecurityTokenParameters

2.  it uses ProtectionTokenParameters depending on ClientCredentialType and NegotiateServiceCredential (true by default):
    1.  Windows:
        1.  with negotiation, then SspiSecurityTokenParameters
        2.  no negotiation, then KerberosSecurityTokenParameters

    2.  None:
        1.  with negotiation, then SslSecurityTokenParameters
        2.  no negotiation, then X509SecurityTokenParameters

This is done by WSHttpBinding.CreateMessageSecurity(). WSFederationHttpBinding.CreateMessageSecurity() should be similar, but not done yet.

A bad problem about WSHttpBinding is that it defaults to Windows credential type and hence you can't blindly bring it to linux.

WS-Security implementation
==========================

SecureMessageGenerator and SecureMessageDecryptor do the actual WS-Security work which primarily are:

-   XML signature
-   XML encryption

Since secure messages are not entirely represented as signed and/or encrypted xml but involve SOAP envelope structures, System.Security.Cryptography.Xml features are not directly used:

-   unlike SignedXml class, we need to consider wsu:Id as an xml ID reference. Hence we created WSSignedXml and WSEncryptedXml classes that override GetIdElement() to search for an element with wsu:Id.
-   WS-Security message header is represented as WSSecurityMessageHeader class which is derived from MessageHeader.
-   WSSecurityMessageHeader contains a couple of items, and some are in specialized classes:
    -   WsuTimestamp for wsu:Timestamp element.
    -   Wss11SignatureConfirmation for SignatureConfirmation element in WS-Security 1.1.
-   When searching for KeyInfoClause, we had to write our own SecurityTokenReferenceKeyInfo class which supports security token references in WS-Security and used by SignedXml.

There is a notable issue regarding wsu:Id: this attribute is usually on soap:Body element as well as some SOAP header items, but in System.ServiceModel.Channels.Message there is no explicit way to copy attributes on soap:Body. There is Message.GetBodyAttribute(name,ns) method instead, but there is still no default way to create MessageBuffer copying attributes and back to Message by MessageBuffer.CreateMessage(). We explicitly do it with WSSecurityMessage and WSSecurityMessageBuffer classes.

We have samples at olive/samples/wcf/secure-message repository, samplesvc.cs, samplecli.cs ... samplesvc9.cs and samplecli9.cs.

GetToken / AuthenticateToken
----------------------------

To sign and/or encrypt messages, security keys must be provided. Security keys are privided through SecurityToken, which in turn is provided by SecurityTokenProvider. Also, security tokens needs to be authenticated at message receiver by SecurityTokenAuthenticator.

MessageSecurityOverHttp property on WSHttpBinding turns into SecurityTokenParameters on SecurityBindingElement (either as protection parameters such as ProtectionTokenParameters, InitiatorTokenParameters or RecipientTokenParameters, or as supportting token parameters).

SecurityTokenParameters however still do not directly create SecurityTokenProvider or SecurityTokenAuthenticator. First, those parameters must configure SecurityTokenRequirement (which is actually ServiceModelSecurityTokenRequirement) instance and then SecurityTokenManager.CreateSecurityTokenAuthenticator() or SecurityTokenManager.CreateSecurityTokenProvider() consumes the SecurityTokenRequirement to create each results.

SecurityTokenProvider implementations do not or override GetToken(). Instead, they are designed to override GetTokenCore(). Between GetToken() and GetTokenCore(), SecurityTokenProvider examines if the derived class implements ICommunicationObject, and if it does, then it tries to Open(). It is to handle WS-Trust negotiations.

WS-Trust implementation
=======================

When NegotiateServiceCredential is enabled, the client and server tries to achieve secure communication by WS-Trust protocol as part of the initiator's GetToken() process. (The recipient does not need that; it only gives responses WS-Trust requests, and it authenticates the token once the WST negotiation is done.)

WS-Trust v1.3 specification is available [online](http://docs.oasis-open.org/ws-sx/ws-trust/200512/ws-trust-1.3-spec-cs-01.html).

WS-Trust is enabled when you use either SslSecurityTokenParameters or SspiSecurityTokenParameters [TBD: IssuedSecurityTokenParameters too, but we don't know much about it yet].

Implementation wise, we have ProviderCommunicationObject and AuthenticatorCommunicationObject that become internal basis for token provider and token authenticator that use WS-Trust.

We have samples at olive/samples/wcf/secure-message repository, samplesvc10.cs, samplecli10.cs ... samplesvc12.cs and samplecli12.cs.

sslnego implementation
----------------------

If a SecurityTokenRequirement is confifured with TokenType as [http://schemas.microsoft.com/ws/2006/05/servicemodel/tokens/AnonymousSslnego](http://schemas.microsoft.com/ws/2006/05/servicemodel/tokens/AnonymousSslnego) (which is ServiceModelSecurityTokenTypes.AnonymousSslnego value, and what SslSecurityTokenParameters gives), SecurityTokenManager chooses SSL-based WS-Trust negotiation.

SslSecurityTokenProvider implements ICommunicationObject, and thus before its Open() is called before GetTokenCore() is called. When opened, it processes all the WS-Trust negotiation messages. The actual negotiation is exchanged through a set of binary TLS blobs packaged in wst:BinaryExchange element, and the process flows as follows (C is client, S is server below):

-   C-\>S: wst:RST (RequestSecurityToken) with TLS ClientHello
-   S-\>C: wst:RSTR (RequestSecurityTokenResponse) with TLS ServerHello, TLS \# ServerCertificate, TLS CertificateRequest if mutual negotiation, and TLS ServerHelloDone.
-   C-\>S: wst:RSTR with TLS ClientKeyExchange and TLS Finished.
-   S-\>C: wst:RSTR with TLS ChangeCipherSpec and TLS ServerFinished.

[TBD]

WS-SecureConversation implementation
====================================

By default, WSHttpBinding enables WS-SecureConversation (WS-SC). That is, it uses "established security context" which is a concept in WS-SC and used for managing secure sessions, by default. It is something like TLS for SOAP messaging (but as in message security, not transport).

To turn off WS-SC, WSHttpBinding.Security.Message.EstablishSecurityContext can be set to false.

When WS-SC is enabled the security key used for message encryption and signature for primary messaging (messaging after the channel gets secured under WS-SC) will be acquired after some WS-SC message exchanges.

IssuedToken
===========

TBD

