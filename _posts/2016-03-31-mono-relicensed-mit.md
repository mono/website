---
layout: blog
title: "Mono Relicensed MIT"
author: Miguel de Icaza
tags: [releases]
---

At Microsoft Build today, we announced that we are re-releasing Mono under the [MIT license](https://opensource.org/licenses/mit-license.html) and have contributed it to the [.NET Foundation](http://www.dotnetfoundation.org/).  These are major news for Mono developers and contributors, and I am incredibly excited about the opportunities that this will create for the Mono project, and for other projects that will be able to benefit from this.

## Mono Runtime Released under MIT License

While Mono’s class libraries have always been available under the MIT license, the Mono runtime was dual-licensed.  Most developers could run their apps on Windows, Linux or Mac OS X on the LGPL version of the runtime, but we also offered Mono’s runtime under commercial terms for scenarios where the LGPL was not suitable.

Moving the Mono runtime to the MIT license removes barriers to the adoption of C# and .NET in a large number of scenarios, embedded applications, including embedding Mono as a scripting engine in game engines or other applications.

## Open Sourcing Proprietary Mono Extensions

Over the past 5 years, Xamarin has developed a number of proprietary extensions to Mono, including:

- ARM64 port of the Mono runtime
- Workarounds for bugs in some ARM chips
- Use of Apple's CommonCrypto to implement the crypto classes in the .NET API
- Integration with X509 certificates on Apple platforms
- Support for “Native Types” on Apple platforms
- Generic Value Type Sharing
- Offset tool to maintain the cross compiler

These have been integrated with the main Mono codebase, contributed along with Mono to the .NET Foundation, and are being released under the MIT license today.
