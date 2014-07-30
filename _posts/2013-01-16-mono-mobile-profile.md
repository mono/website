---
layout: blog
title: "Mono Mobile Profile"
author: Miguel de Icaza
tags: [mobile]
---

When Mono for iOS was launched, we designed a new lightweight API profile.  This lightweight profile was designed to deliver all of the major features that developers needed and remove things that did not make sense on iOS or caused binaries to bloat too much on an environment where everything would have to be included.

This mobile profile was based on Silverlight, because Silverlight also had those requirements: small downloads and a good set of features.    The major difference for a developer between the Silverlight profile and the standard desktop profile is that System.Configuration and Microsoft.Win32.Registry have been eradicated.

We took the Silverlight API and extended it to add things that Silverlight had dropped.  We called this the Mobile profile.

This mobile profile is the foundation for Mono on iOS, Android and other mobile efforts.

We are currently in the process of turning this mobile profile into a general purpose solution.   Instead of being based on the old Silverlight 4/Silverlight 5 profile, we are doing this based on the .NET 4.5 API, and removing the same bits we removed in the past: System.Configuration and the Registry.
