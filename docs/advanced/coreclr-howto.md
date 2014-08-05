---
title: CoreCLR HowTo
redirect_from:
  - /CoreClrHowTo/
---

This *how to* is intended for people who have read about **coreclr** on [MSDN]({{ site.github.url }}/docs/advanced/coreclr/#references "Moonlight2CoreCLR"), [MS employees blogs]({{ site.github.url }}/docs/advanced/coreclr/#references), Mono's [wiki]({{ site.github.url }}/docs/advanced/coreclr/) and how this applies to [Moonlight]({{ site.github.url }}/docs/web/moonlight/). Once the concepts are understood then you're ready to learn *how to* enable this feature for your own needs.

So what's needed ? Simply a host (full trusted), some platform assemblies (partially trusted code) and applications (untrusted).

Host
====

Hosting sounds scary ? It's not, at least **coreclr**-wise and it is likely your simplest step.

1.  [Embed Mono]({{ site.github.url }}/docs/advanced/embedding/) into your application;
2.  Enable CoreCLR (which also enables the verifier) with a call to **mono\_security\_enable\_core\_clr**; and
3.  Provide your own callback to **mono\_security\_set\_core\_clr\_platform\_callback** to determine if an assembly is to be considered as platform code (return **TRUE**) or not (return **FALSE**).

<!-- -->

    static gboolean
    is_platform_code (const char *image_name)
    {
       // insert your own logic, returning TRUE
       // will allow everything as platform code
       return TRUE;
    }

    void enable_core_clr ()
    {
       mono_security_enable_core_clr ();
       mono_security_set_core_clr_platform_callback (is_platform_code);
    }

However the usefulness of a **coreclr** host is limited by your own platform assemblies (just like a JIT would not be helpful without class libraries) and your applications. Also keep in mind that access to some features (e.g. cross-domain web access, sockets...) are not related to **coreclr**.

Examples
--------

You can find both a very (i.e. too) simple and very (i.e. totally) complete samples in Mono's GIT repositories.

### Mono

If you look at **mono** command-line options (i.e. 'man mono') you'll notice a **--security** option that accept a **core-clr** parameter. So it's there (feature wise) and it's not (what you likely want). Still you can see **coreclr** being enabled in [driver.c](https://github.com/mono/mono/raw/master/mono/mini/driver.c) and the default platform code detection, allowing only **mscorlib.dll**, in [security-core-clr.c](https://github.com/mono/mono/blob/master/mono/metadata/security-core-clr.c).

This means **mscorlib.dll** is the only assembly that can do **critical** stuff (and that includes defining **safe critical** methods). You can guess that this is severely limited with the default framework profiles. Remember that no FX profile, even 4.0, is designed to work with **only** coreclr/transparency.

As such this host, unless you provide your own **mscorlib.dll** or wish to hack a custom mono, is not really usable in real-life scenarios. However it does show that creating a host and enabled coreclr are not difficult tasks. Also this **mono** option is very useful to test the runtime under coreclr (e.g. it's used daily for running fuzz-ed code).

### Moonlight

[Moonlight]({{ site.github.url }}/docs/web/moonlight/), Mono's open source Silverlight implemention, is a complete, real-life and usable, **coreclr** host.

Being a web browser plugin this may looks like a very different hosting scenario - and it is in many cases. But from a **coreclr** point of view things are very similar the earlier, generic code sample.

In the following [source code](https://github.com/mono/moon/raw/master/src/security.cpp) you can see:

1.  **coreclr** being enabled; and
2.  platform assemblies being defined as specific assembly names inside a specific directory under the plugin installation directory;

Note that this is the most complete *sample* you can get and it comes with a set of platform assemblies that is being periodically [audited](https://github.com/mono/moon/tree/master/class/tuning/SecurityAttributes/audit).

Platform Assemblies
===================

The usefulness of any platform is what it allow you to do. This is why **mono** as a host is very not useful (with the existing profiles) while Moonlight is for web applications.

But what are they ? Simply they are the only assemblies that can do **critical** operations, e.g. unsafe code, pinvoke... so this is where you'll end up providing **safe** conduits to **critical** operations, policy decisions...

Note that all platform assemblies are running under **partial** trust. This means that **all code is transparent** (untrusted) unless it is decorated with either [SecurityCritical] or [SecuritySafeCritical] attributes.

### Profiles

So what kind of profile should/can be provided ? Here's a few, simple to complex, suggestions:

1.  Use the Moonlight profile *as-is*. It is well tested, supported and [audited](https://github.com/mono/moon/tree/master/class/tuning/SecurityAttributes/audit);
2.  Use a **subset** of Moonlight. With a little extra work you can all the benefits of the above and a smaller footprint (which likely improves your security since it reduce the surface); or
3.  Define your own profile from scratch. You're not totally on your own since Moonlight provides several [tools](https://github.com/mono/moon/tree/master/class/tuning/SecurityAttributes/) and [guidance]({{ site.github.url }}/archived/securityvalidation "SecurityValidation"). However this can be a huge undertaking since you'll need to ensure your profile is secure and does not open doors that would circumvent **coreclr**.

Applications
============

This is the user, untrusted, code on which **coreclr** will enforce the transparency model. No compromise, from the **verifier** then **coreclr**, will be made. Note that [SecurityCritical] or [SecuritySafeCritical] attributes will be **ignored** inside application code.

Any failure to provide the right attributes (or policies) from platform code can lead to vulnerabilities.

Advanced
========

The above describe how the transparency model is applied in **coreclr**. However it's hard to define a complete, useful profile using only attributes that allow/disallow code execution.

Policies
--------

How can **coreclr** be used to allow opening TCP sockets between 4502-4534 ?

Short answer: it cannot.

Long answer: Such checks are done by code based on policies (not coreclr). This means the socket code must be transparent (or safe critical) and provide it's own policy decision (e.g. a range check on the requested port). While [CAS]({{ site.github.url }}/docs/advanced/cas/) allowed complex policies to be defined, the one used by [Moonlight]({{ site.github.url }}/docs/web/moonlight/) are more strictly defined (e.g. TCP and a subset between 4502-4534). Of course your own host can define it's own policy.

Policy-driven examples (from Moonlight):

-   socket port restrictions
-   cross domain restrictions (scheme, ports, ...)

FAQ
===

Q: Is CoreCLR new in [Moon|Silver]light 2+ ?

A: Somewhat. CoreCLR is heavily based on the transparency model which was introduced in .NET 2.0. However in the *regular* framework the transparency model is used in conjunction with [CAS]({{ site.github.url }}/docs/advanced/cas/) (and the later is not supported on Mono).

Q: Does CoreCLR provides all the security for [Moon|Silver]light ?

A: Not quite. It's a bit like saying "CAS == stack walk". Stack walks are an important part of [CAS]({{ site.github.url }}/docs/advanced/cas/) but, without all the other parts, would not provide any security. In this case **coreclr** enforce the security attributes in the platform code (along with a few other rules) but some other features are policy-based (e.g. cross-domain web access, socket support...)

