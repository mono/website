---
title: WPF
redirect_from:
  - /WPF/
  - /WPF_ImplementationNotes/
---

At this point, no group in the Mono project has plans to implement Windows Presentation Foundation APIs as part of the project.

We do not have any plans because the project is too large and there has not been any serious interest from the community to make this effort move forward.

Some bits were implemented for WindowsBase and they are distributed with Mono (mostly because System.IO.Packaging is part of WindowsBase). Various classes and stubs were developed and live in the [Olive](/archived/olive) module.

At this point, we strongly suggest that users interested in WPF adopt Xamarin.Forms instead as it offers a rich set of cross platform APIs and features (and has a WPF driver too).

Alternatives
============

Currently [AvaloniaUI](https://avaloniaui.net/) is an initiative that is focused to mirror the WPF project but is multi-platform and a dialect.

In addition, [Uno Platform](https://github.com/unoplatform/uno) is an open source initiative focused on bringing UWP / WinUI to run multi-platform on Web, mobile and non-Windows desktops, as well as Windows 7.

Silverlight implemented a subset of the WPF APIs and was available on Windows, macOS; and through our own open source effort [Moonlight](/docs/web/moonlight/) it was available on Linux and other Unix systems. Silverlight does not have all the capabilities of WPF, but both technologies are converging API-wise. Silverlight could be used outside of the browser, and Moonlight can be configured to be used with the full .NET API outside of the browser. These days, there's a project that is trying to resurrect Silverlight using WebAssembly: it's called [OpenSilver](https://opensilver.net/).

[WPF_Notes](/docs/gui/wpf/)

