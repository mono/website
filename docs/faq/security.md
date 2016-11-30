---
title: "FAQ: Security"
redirect_from:
  - /FAQ%3A_Security/
---

Secure Socket Layer (SSL) / Transport Layer Security (TLS)
----------------------------------------------------------

### WebRequest.Create ("[https://www.anywhere.com](https://www.anywhere.com)"); throws an exception

That's probably because you do not trust the site you are connecting to. Note that a default installation of Mono doesn't trust anyone!

You can confirm this by using the [tlstest](https://raw.github.com/mono/mono/master/mcs/class/Mono.Security/Test/tools/tlstest/tlstest.cs) tool (needs Mono >= 3.4.0). It prints an error if something is wrong.

``` bash
mcs tlstest.cs /r:System.dll /r:Mono.Security.dll
mono tlstest.exe https://www.anywhere.com
```

There are four alternatives to solve this problem:

-   Starting with Mono 3.12.0 a new tool called `cert-sync` is [included](/docs/about-mono/releases/3.12.0/#cert-sync) which syncs Mono's certificate store with the system certificate store. It should run automatically when you install the official Mono packages. Make sure the `ca-certificates-mono` package is installed.

-   Implement a `ICertificatePolicy` class. By doing this you can override the normal results of the certificate validation (e.g. accepting an untrusted certificate). However you are now responsible of applying your own trust rules for your application. Further suggestions and source code are available in the [UsingTrustedRootsRespectfully](/archived/usingtrustedrootsrespectfully) article.

-   Use the `certmgr.exe` tool (included in Mono) to add the root certificates into the Mono **Trust** store. Every SSL certificate signed from this root will then be accepted (i.e. no exception will be thrown) for SSL usage (for all Mono applications running for the user or the computer - depending on the certificate store where the certificate was installed).

-   Use the `mozroots.exe` tool (included in Mono 1.1.10 and later) to download and install **all** Mozilla's root certificates (i.e. the ones used in FireFox and other Mozilla's softwares). It's easier than finding a specific root but it's also less granular to make a decision about which one(s) you install or not.

Additionally, starting with Mono 4.8 if you are using BoringSSL as your SSL stack, you will need to convert the existing certificates into a format suitable to be consumed by BTLS, to do this, use the `btls-cert-sync` tool.

### I imported the root certificate but it still doesn't work

[HTTPS](http://www.ietf.org/rfc/rfc2818.txt), like many protocols using [SSL](http://wp.netscape.com/eng/ssl3/)/[TLS](http://www.ietf.org/rfc/rfc2246.txt), doesn't requires the server to send its root certificate when negotiating the handshake. In this case it won't be possible to use `certmgr --ssl` to download automatically the root certificate into Mono's certificate stores.

You'll need to either:

-   find the root certificate and install it manually with `certmgr`; **or**
-   use the `mozroots` tool to install all (or part of) Mozilla's root certificates. This has a high probability to install the required root certificate - but will also install a lot of extra roots (about 100 of them).

### How can I debug https traffic?

Use the webscarab tool and set the http_proxy environment variable to the address of the webscarab server, this will allow you to watch the traffic unencrypted.

### I got the root certificate but it doesn't install

Some Certificate Authorities (CA) still use *very old* root certificates signed with the [MD2](http://www.ietf.org/rfc/rfc1319.txt) digest algorithm. MD2 is old enough not to be part of the standard .NET framework. This makes it impossible to validate the root certificate digital signature.

To correct this you must enabled MD2 support in your `machine.config` file. This is possible because the `Mono.Security.dll` assembly contains a managed MD2 implementation to ensure compatibility with older certificates. The following XML snippet must be added, inside the inside the `<configuration>` element of your `machine.config` file in order to associate the MD2 OID (object identifier) with the hash algorithm implementation.

``` xml
<mscorlib>
    <cryptographySettings>
        <cryptoNameMapping>
            <cryptoClasses>
                <cryptoClass monoMD2="Mono.Security.Cryptography.MD2Managed, Mono.Security,
                    Version=1.0.5000.0, Culture=neutral, PublicKeyToken=0738eb9f132ed756" />
            </cryptoClasses>
            <nameEntry name="MD2" class="monoMD2" />
        </cryptoNameMapping>
        <oidMap>
            <oidEntry OID="1.2.840.113549.2.2" name="MD2" />
        </oidMap>
    </cryptographySettings>
</mscorlib>
```

### Why does SSL use certificates ?

1.  SSL encrypts data - but encrypting data to an untrusted server doesn't improve much security. You need to know who is on the other side of the socket! (e.g. think about a man-in-the-middle attack between you and your bank).
2.  SSL use X.509 certificates for the purpose of binding a public key with an entity (in this case the web server). The server gets its certificate from a certificate authority (CA) who certify that the key belongs to its owner. Finally you must **trust** that CA to do its job properly.

### Are SSL client certificates supported ?

Both SslClientStream and SslServerStream, in Mono.Security.dll, support client certificates, however HttpWebRequest doesn't due to a strange design/relationship between the 1.x framework and Windows/CryptoAPI (i.e. there is no managed API to associate a certificate with a private key). This should be fixed in the 2.0 profile as the X509Certificate class has been extended to provide this association.

Also recent versions of [XSP](/docs/web/aspnet/) do support SSL/TLS and client certificates. See the [UsingClientCertificatesWithXSP](/docs/web/using-clientcertificates-with-xsp/) article for more details.

### Does SSL work for SMTP, like GMail ?

Yes it does. First you must import the root certificates using the `mozroots` tool:

``` bash
mozroots --import --ask-remove
```

Note that if you are using a web application (i.e. not the current user) you must add the `--machine` option like this:

``` bash
mozroots --import --ask-remove --machine
```

Next you need to import the intermediate certificates. You can do this by using the `certmgr` tool to connect to the SSL server. E.g.

``` bash
certmgr -ssl smtps://smtp.gmail.com:465
```

Use the `-m` option to import the certificates into the machine store if required.

Finally you need to make sure to use the SSL-enabled port in your application. This is generally 465 or 587 instead of port 25.

FIPS Certification
------------------

### What is the status of FIPS 140 certification?

The Mono cryptographic stack is not FIPS 140 certified and there are currently no plans on doing so as it is both a time consuming and expensive certification to go through.

If you absolutely must use FIPS 140 certified code, you should be able to call a native library that has been FIPS 140 certified from managed code (say, wrapping NSS).

Alternatively, if you have a certified implementation and the wrapper, you can instruct Mono to automatically use your new implementation by using the machine.config mapping.

### Are there any efforts to bind external libraries that are FIPS certified?

There is an ongoing effort part of Mono called the [Crimson](/archived/crimson) project, you might want to contribute to that effort.

Authenticode(r) Code Signing
----------------------------

### Does Mono support Authenticode(r) signatures ?

Yes. Mono supports Authenticode signatures for **assemblies**. As assemblies are **PE** files this also means that Mono support signing any kind of PE file, e.g. EXE, DLL, OCX, SCR ...

### Does Mono support Authenticode(r) signatures on CAB file ?

No. CAB files aren't **PE** file. While the signature mechanim is probably much alike the CAB format is very different from the PE format. Mono doesn't requires CAB files at this time (and may never will) so support for signing/verifying CAB files is unlikely to appear (unless someone feel likes contributing it).

### What does "*signature can't be traced back to a trusted root!*" means ?

The default installation of Mono doesn't trust any root certificate authority (CA). While verifying a signed PE file the `chktrust` utility will try to find a **trusted root** and if it cannot will display the following error.

    Mono CheckTrust 1.1.4.0

    Verifying file sample.exe for Authenticode(tm) signatures...

    WARNING! sample.exe is not timestamped!

    ERROR! sample.exe signature can't be traced back to a trusted root!

You can use the `certmgr` tool to add the code signing root certificate in the Mono trust certificate store.

Public Key Infrastructure (PKI)
-------------------------------

### Is Mono fully compatible with RFC2459 or RFC3280 ?

No. Mono support a limited subset of PKIX certificate path building and validation. This is enough to support **simple** cases like SSL/TLS and Authenticode(r). Version 2.0 of the .NET framework includes improved support for PKI, e.g. a new `X509Chain` class, so better support for PKI is on the Mono roadmap.

### Why doesn't Mono includes root certificates from X, Y and Z ?

There are two main reasons not to include "defaults" root certificates in Mono.

1.  Digital certificates are, like many digital files, copyrightable. This means that **there are** restrictions on how the roots certificates can be distributed.
2.  We aren't in the business to decide on **who you are going to trust**. Certificates Authorities exists all around the world. The ones best suited to you aren't necessarily the ones best suited for everybody else and having a terribly long list of "trusted" roots isn't a very secure solution.

### So where can I download them ?

Too many CA, too many places. The most common ones are (in alphabetical order):

-   [CAcert.org](http://www.cacert.org/index.php?id=3)
-   [Entrust](http://www.entrust.net/developer/index.cfm)
-   [GeoTrust](http://www.geotrust.com/resources/root_certificates/index.htm)
-   [Thawte](http://www.thawte.com/roots/)
-   [VeriSign](http://www.verisign.com/support/roots.html)

An easier alternative is to use the `mozroots` tool to download and install all Mozilla's root certificates. The downside is that it's more difficult to handpick only the one you really require.

### Can I make my own certificates ?

Mono includes the `makecert` tool that can be used to create **test** (i.e. untrusted) certificates. The tool is generally used to create code-signing (i.e. Authenticode) certificates but can also be used to create both server and client SSL certificates.

-   Creating a SSL server **test** certificate

<!-- -->

    makecert -r -eku 1.3.6.1.5.5.7.3.1 -n "CN=pollux" -sv pollux.pvk pollux.cer

where **1.3.6.1.5.5.7.3.1** is the OID for server-side authentication and **pollux** is your host name. The private key is stored in the PVK file and **isn't** password protected.

-   Creating a SSL client **test** certificate

<!-- -->

    makecert -eku 1.3.6.1.5.5.7.3.2 -n "CN=poupou" -p12 poupou.p12 s3kr3t

where **1.3.6.1.5.5.7.3.2** is the OID for client-side authentication and **poupou** is your name. The `-p12` option is **mono specific** and creates a PKCS#12 file protected with the supplied password.

Many more options are available from `makecert`. Consult the tool's [man page](https://github.com/mono/mono/blob/master/man/makecert.1) (i.e. `man makecert`) for more details.

Code Access Security (CAS)
--------------------------

### Does Mono support CAS ?

Mono 1.0.x **doesn't** support [Code Access Security](/docs/advanced/cas/). Mono 1.2 has an experimental preview of the technology (turned **off** by default) with partial (and unaudited) class library support.

In addition, Mono currently does not have a complete verifier, which means that invalid assemblies will produce an assertion in the runtime.

### How can I activate CAS ?

By default [Code Access Security](/docs/advanced/cas/) is turned **off** in Mono. On Mono 1.1.4 and later you can turn on the security manager by using the `--security` option. E.g.

    mono --security sample.exe

### Will Mono have a complete verifier?

Mono 2.0 already has an IL verifier while the metadata verifier will be complete by the time that [Moonlight](/docs/web/moonlight/) 2.0 ships.

In the meantime, you can invoke Mono from the command line to test whether the metadata and code will be processed successfully by Mono, by calling Mono like this:

``` bash
   $ mono --compile-all myAssembly
```

If this succeeds, it means that Mono will not assert at runtime due to invalid metadata or invalid code (sometimes produced by obfuscators, which break the ECMA requirements for valid code).

### How many checks are missing to have a full verifier?

There are many checks that need to be performed, it's not as simple as doing opcode checks as someone could believe. The only way to know which are missing is to review all the code. Of course the review needs to be done independently by multiple people with the right skills and mindset (and time)...

Security related compilation issues
-----------------------------------

### Compiling Mono's mscorlib.dll with CSC 7.x (Fx 1.x)

With the CLR 1.x a security permission object (implementing [IPermission](http://www.go-mono.com/docs/monodoc.ashx?link=T%3aSystem.Security.IPermission)) must be created, from its security attribute (inherited from [SecurityAttribute](http://www.go-mono.com/docs/monodoc.ashx?link=T%3aSystem.Security.Permissions.SecurityAttribute)), to generate the XML output that is embedded in the assembly. This means that the compiler cannot accept the use of *PermissionX* if *PermissionX* is defined in the assembly being compiled. This cause a problem for some assemblies, like `mscorlib.dll` which consume its own permission.

In order to bootstrap such assemblies CSC 7.x looks for the environment variable `__SECURITY_BOOTSTRAP_DB` to create a security database. The information within (format unknown) enables CSC to compile them.

From the [/mcs/class/corlib/Makefile](https://github.com/mono/mono/blob/master/mcs/class/corlib/Makefile) file:

    export __SECURITY_BOOTSTRAP_DB=$(topdir)/class/corlib

**Notes**

-   The results of using `__SECURITY_BOOTSTRAP_DB` for other assemblies is unknown (i.e. we don't know what else in CSC may be affected by the environment variable) so it should only be used when necessary;
-   The CLR 2.x supports a new binary format for security attributes (very much like serialization) that is make directly from the security attribute (i.e. doesn't involve the permission class).

### System.Security.SecurityException : Failure decoding embedded permission set object

This exception can occurs when using a path/file in a declarative [FileIOPermission](http://www.go-mono.com/docs/monodoc.ashx?link=T%3aSystem.Security.Permissions.FileIOPermissionAttribute) attribute (or any other security attribute accepting filenames). The Mono runtime supports UNIX-style filename when compiling (e.g. MCS) but the Microsoft runtime won't be able to decode them. The solution is to use imperative security when dealing with filenames.

 **Note**: You can see this problem if you compile corlib's unit tests under Linux then try to execute the tests under the MS runtime.

### How are Windows roles mapped into Unix roles?

We map roles from WindowsPrincipal.IsInRole to Unix groups.

### How can I make calls to WindowsPrincipal.IsInRole () work on Linux?

If you have an application that makes a call like this:

``` csharp
bool allowed = WindowsPrincipal.IsInRole ("USAGNT\\UGR_RBP");
```

To make this work on Unix, you have to add a Unix group to the system, and list all the users that are to participate in this role, this can be done by adding the following line to /etc/group:

``` bash
USAGNT\UGR_RBP:x:300:miguel,don,jon,julia
```

Where each of the users that belong to the group are added there.

Other resources on this site
----------------------------

### Known Vulnerabilities

A list of known [vulnerabilities](/docs/about-mono/vulnerabilities/) affecting older versions of Mono is available.

