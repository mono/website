---
title: "MonoDevelop C/C++ Extension (Anubhav Singh)"
---

Author:  [Anubhav Singh](https://github.com/gitexperience)

The MonoDevelop IDE is built around the concept of an extension tree. An extension package is a set of extensions that plug into extension points to add functionality to the IDE. The whole IDE is built this way.

The CBinding extension package enables developers to write C/C++ solutions in the IDE. However, there were many features missing in it. My project was about writing some of those features and make changes to existing ones.

I have been working in this over past 4 months as part of Google Summer of Code 2017 student and there are still lot of things that are yet to be done! The very first feature I worked on was implementing support to be able to use compilers present on Windows (GCC, MSVC, mingw32 etc..). This was done via CMake as that's the only project format currently supported.

In Windows, the CBinding supports the following toolchains:

- MinGW32
- CLang
- Visual Studio 15 2017
- Visual Studio 14 2015
- Visual Studio 12 2013

Users can easily switch between these toolchains using **Tools > Options**. It currently lists available toolchains based upon the platform (Windows, Linux, Mac) but I plan to write an additional check to load only the toolchains installed on that particular platform.

The old "MD1" project system and templates are removed from the CBinding and now it only supports CMake. For code completion, CLangManager now targets CMake project system.

Since the inception of CBinding, MonoDevelop's codebase has changed a lot and the extensions still use some of the APIs of MonoDevelop that are no longer public, so enabling some functionality required changing the MonoDevelop codebase and upstreaming these changes, this is in progress :)

Apart from this, the CMake projects subclass _SolutionItem_ but it needs some functionality from the Project base class which is quite specific to MSBuild project system, so I have done some chaining between the _Project_ and _SolutionItem/WorkspaceObject_ in the MonoDevelop source code to allow CBinding to use those properties.

The code can be found here:

- [Changes to MonoDevelop source code](https://github.com/mono/monodevelop/pull/2870/commits)
- [Changes to CBinding Addin](https://gist.github.com/gitexperience/c7d4ab8546e55da88675bfc641e763ea)

Overall it was a great learning experience which I would like to continue further. I would like to thank the entire Mono organisation specially Mikayla Hutchinson for being a constant support for me. Understanding and working on such a large codebase was an ultimate experience. I had a lot of fun this summer!
