---
title: Code Access Security
redirect_from:
  - /CAS/
---

Code Access Security (CAS) is a new **experimental** (i.e. unsupported) feature in the Mono 1.2 release. It is complete enough to play with it but **should not be used** in production (incomplete and unaudited). The security manager is **off** by default.

There is no planned release date to support **CAS** in Mono, see [roadmap](/docs/about-mono/roadmap/) for details. Security efforts are now oriented to support the Silverlight security model in [Moonlight](/docs/web/moonlight/).

Security Manager
----------------

The security manager is a collection of security features to implement every security actions defined in the .NET framework. The security manager resides in the JIT (e.g. code generation for Demands, security checks for `LinkDemand`, stack walk), the runtime (e.g. security checks for `InheritanceDemand` in the class loader) and in the class library (mscorlib.dll).

### Testing

Sadly not every parts of the security manager cannot be tested using [NUnit](/community/contributing/test-suite/). In particular some security actions, like `LinkDemand` and `InheritanceDemand`, throws unhandled exceptions. While it is possible to promote `LinkDemand` into full `Demand` by using reflection, `InheritanceDemand` are still not testable using [NUnit](/community/contributing/test-suite/).

Some tests for those hard-to-test features are present in directories under [/mono/mono/tests/cas/](http://anonsvn.mono-project.com/viewvc/trunk/mono/mono/tests/cas/) in [SVN](/community/contributing/source-code-repository/). They can be executed by doing a `make test` in each directory.

### Status

Since version 1.1.4 Mono supports the --security option to enable it's security manager. E.g.

    mono --security sample.exe

New features in [SVN](/community/contributing/source-code-repository/) (unreleased as of 1.1.10) includes:

-   none;

Previously supported (released as of 1.1.10) features includes:

-   System.Drawing.dll doesn't require UnmanagedCode permission to execute;
-   Support for FullTrustAssemblies in policy resolution;
-   IsolatedStorage now supports user quotas (when the security manager is enabled);
-   PermissionRequestEvidence is now part of the evidences during policy resolution;
-   Stack propagation for Threads, ThreadPool, Async operations, SWF's `Control.BeginInvoke` using `CompressedStack`;
-   Cross-AppDomain support enabling appdomain based sandboxes (limited by #74411);
-   Unification (policies, permissions) between framework version numbers;
-   more security permissions present in `mscorlib.dll` (still unaudited);
-   `Demand` for unmanaged code for P/Invoke including support for [SuppressUnmanagedCodeSecurity](http://www.go-mono.com/docs/monodoc.ashx?link=T%3aSystem.Security.SuppressUnmanagedCodeSecurityAttribute) attribute;
-   `LinkDemand` (JIT time) and it's special cases:
    -   internal calls (into the runtime);
    -   P/Invoke to unmanaged libraries; and
    -   [AllowPartiallyTrustedCallers](http://www.go-mono.com/docs/monodoc.ashx?link=T%3aSystem.Security.AllowPartiallyTrustedCallersAttribute) attribute;
-   `InheritanceDemand` (load time) for class inheritance, method overriding and interface implementations;
-   Support for the new 2.0 security actions. Note that the Mono runtime doesn't (yet) encode them properly.
    -   `DemandChoice`;
    -   `LinkDemandChoice`; and
    -   `InheritanceDemandChoice`.
-   Policy resolution - including `RequestMinimum`, `RequestOptional` and `RequestRefuse` [SecurityAction](http://www.go-mono.com/docs/monodoc.ashx?link=T%3aSystem.Security.Permissions.SecurityAction)s;
-   Declarative/Imperative demands;
-   Declarative stack modifiers (`Assert`, `Deny` and `PermitOnly`);

 What's not (yet) supported:

-   Imperative stack modifiers (`Assert`, `Deny` and `PermitOnly`);
-   `RequestMinimum` is only evaluated at policy resolution - not at assembly load time;
-   Runtime encoding of the declarative security attributes in the new binary metadata format present in 2.0;
-   Special code groups in security policies;
-   Lots of small fixes/TODO;

Class libraries
---------------

The class librairies plays a dual role in **CAS**. First they supply the basic security objects (i.e. evidences, policies, permissions) and, second, they also represents *resources* (e.g. files, sockets...) that requires protection.

Adding the required security protections to an existing class can be tricky as it will often requires some refactoring (e.g. to avoid looping over security checks). It's much easier to do when there are existing unit tests (i.e. refactoring can lead to mistakes). Be extra careful if no unit tests exists (or if their coverage is incomplete) and don't hesitate to add *normal* unit tests before protecting the resources. Also adding any code (resource protection or not) should be reviewed by the maintainer of the class/namespace/assembly.

### ClassLib Testing

Testing each class, security related or not, is done with *classic* [unit tests](/community/contributing/test-suite/). However testing the security of each class (again security related or not) is done differently (althrough very similar). The rules differences are:

-   The unit test namespace starts with `MonoCasTests` instead of `MonoTests`;

<!-- -->

    namespace MonoCas.Namespaces {

-   All CAS unit tests classes must have the **"CAS"** category so they can be excluded from the default test execution (e.g. when mono is being used without `--security`.

<!-- -->

    [Category ("CAS")]

-   The unit test class name ends with `Cas` instead of `Test`;

<!-- -->

    public class ClassNameCas {

-   As a safeguard (from manual execution of `nunit`) a `SetUp` method/attribute is also used to **ignore** all tests if the security manager isn't enabled.

<!-- -->

``` csharp
 namespace MonoCasTests.System {
 
    [TestFixture]
    [Category ("CAS")]
    public class EnvironmentCas {
 
        [SetUp]
        public void SetUp ()
        {
            if (!SecurityManager.SecurityEnabled)
                Assert.Ignore ("SecurityManager.SecurityEnabled is OFF");
        }
```

You can see a complete example in the [EnvironmentCas.cs](http://anonsvn.mono-project.com/viewvc/trunk/mcs/class/corlib/Test/System/EnvironmentCas.cs?view=markup) file.

### ClassLib Status

-   Most of the security classes required by the runtime (e.g. evidences, policies) and to express security conditions (e.g. permissions) are complete and have their normal (e.g. not CAS) unit tests. This includes most classes under the namespaces:
    -   `System.Security`;
    -   `System.Security.Permissions`; and
    -   `System.Security.Policy`.
-   Current priority is to test the security manager by creating partial trust unit tests for the class libraries;
-   Further testing, in particular real-life complex security policies, are welcome;

Tools
-----

The framework supplies some basic tools to configure, inspect and manage **CAS**.

### caspol

Caspol is a tool to manage security policy files that affects the security manager (i.e. the policy resolution step done for each assembly loaded in an appdomain). There are different policy levels for:

-   Enterprise;
-   Machine;
-   User; and
-   AppDomain.

All but the last one (AppDomain) keeps it's configuration in an XML file that can be configured using `caspol`.

The tool itself is a thin wrapper on top of the security classes in both [System.Security.Permissions](http://www.go-mono.com/docs/monodoc.ashx?link=N%3aSystem.Security.Permissions) and [System.Security.Policy](http://www.go-mono.com/docs/monodoc.ashx?link=N%3aSystem.Security.Policy) namespaces.

**Status**

-   Caspol is fairly complete. Any missing feature is probably a bug in one of the security classes;
-   It would be nice to have a GUI version of the tool;

### permview

Permview is a tool that can extract the declarative security permission sets from a compiled assembly. This is handy for developers to know what are the minimum security permissions requirements for loading an assembly, creating a class or calling a method. Note that before Fx 2.0 there was no managed API to obtain those informations.

**Status**

-   The current version (i.e. the one part of the Mono 1.1.x releases) is limited to show the assembly-level permissions (e.g. `RequestMinimum`, `RequestOptional` and `RequestRefuse`) and works only on the Mono runtime;
-   A new version, based on [Mono.Cecil](/docs/tools+libraries/libraries/Mono.Cecil/), is feature complete and runtime agnostic. This version also has an extra option to output the data in XML format (so it can easily be consumed by other tools). It will replace the current version when the Cecil code joins the **mcs** [SVN](/community/contributing/source-code-repository/) trunk. Until then the source code is available [here](http://anonsvn.mono-project.com/viewvc/trunk/cecil/permview/permview.cs?view=markup).

### storeadm

Storeadm is a tool to manage isolated storage on a computer. It's handly for sysadmins to manage (and reclaim) disk space used for isolated storage. The tool is mainly built on top of the [System.IO.IsolatedStorage](http://www.go-mono.com/docs/monodoc.ashx?link=N%3aSystem.IO.IsolatedStorage) classes;

**Status**

-   This tool doesn't yet exists;
-   It would be nice to have both a CLI and GUI versions of the tool;


