---
title: Versioning
redirect_from:
  - /Mono%3AVersioning/
---

Mono's version numbering policy follows the Gnome and the Linux Kernel versioning policies. Mono *does not* follow or mimic .NET versioning in any way.

Mono's Version Policy Explained
-------------------------------

For an X.Y.Z tuple:

-   *X* is the major version number
-   *Y* is the minor version number
-   *Z* is a revision number

The major version number is used to indicate which ABI/API version Mono uses. When it changes, there is *no guarantee* that existing code will continue to work (though the utmost effort will be made to maintain compatibility). The major version changes infrequently.

The Minor version number consists of two sets: even numbers (stable releases) and odd numbers (development releases). The only improvements that stable releases receive are bug fixes; all new feature work is done in development releases. Features *may* be backported from a development release to a stable release, if appropriate. Stable releases are API and ABI stable, and can be expected to have minimal changes.

Development releases *may* break ABI/API compatibility, especially if the stable release they lead up to will change the Major version number. In particular, development releases are likely to add new API, and the use of new API can change between development releases. When a development release is converted into a stable release, we will maintain the API/ABI, and the new stable release should be fully compatible with the previous stable series having the same major number.

Revision numbers signify the release of a Major/Minor pair. Within a stable series, ABI/API compatibility should not be broken when the revision changes.

### Examples

Mono 1.0.6 is the 7th stable release of the 1.0 series (version 1.0.0 ... 1.0.6 is 7 releases).

Mono 1.1.6 is the 7th development release of the 1.1 development series. When finished, it will result in the Mono 1.2 stable series. Mono 1.1.x is the current development tree. Mono 1.2 will be backward compatible with Mono 1.0 (old apps should continue to run), but will not be forward compatible with 1.0 (apps using 1.2-specific functionality won't work under 1.0).

After Mono 1.2 is released, a Mono 1.3 development branch will be started. The 1.3.x series will lead up to the future Mono 2.0 release.

## .NET Versioning

Microsoft .NET's version policy is similar to Mono's, in that a major version number change indicates an API/ABI break. That's where the similarities stop. .NET does not have a stable/development split; .NET 1.0 and 1.1 were both stable releases.

Furthermore, there is no mapping between Mono's version numbers and .NET's version numbers. Mono 1.0 implemented *parts* of the .NET 1.0/1.1 API; in particular, it lacked System.Windows.Forms support. Mono 1.1 (a *development* branch) also implements parts of the .NET 1.0/1.1 API; in particular, it will support System.Windows.Forms. Mono 1.1 also implements parts of the .NET 2.0 API. Other parts of the .NET API are not implemented at all, such as System.EnterpriseServices.

## Framework Versioning

For compatibility reasons, Mono's `System.Environment.Version` property returns the version of the .NET profile that Mono targets, *not* the version of Mono that is being used. This should be the same version number that .NET would return. As such, it will return 2.0.X.Y when running under the 2.0 profile, even though it's running under Mono 1.1. :-)

## Application Versioning

`mono --version` returns the version of the Mono distribution.

## Mono Source Versioning

Before Mono version 5.0 each release had its own matching branch using the following schema: `mono-X.Y.Z-branch`. For example the Mono 3.12 release branch can be found at [https://github.com/mono/mono/tree/mono-3.12.0-branch](https://github.com/mono/mono/tree/mono-3.12.0-branch).

Starting with Mono 5.0 regular bi-monthly branching started and the version is no longer included in the branch name. For easier decoding which version matched to which branch the following table can be used:

| Mono version    | GitHub branch name
|-----------------|-------------------
| 5.0             | [2017-02](https://github.com/mono/mono/tree/2017-02)
| 5.2             | [d15-3](https://github.com/mono/mono/tree/d15-3) (special branch based on 2017-04)
| 5.4             | [2017-06](https://github.com/mono/mono/tree/2017-06)
| ~~5.6~~           | ~~[2017-08](https://github.com/mono/mono/tree/2017-08)~~ (skipped)
| 5.8             | [2017-10](https://github.com/mono/mono/tree/2017-10)
| 5.10            | [2017-12](https://github.com/mono/mono/tree/2017-12)
| 5.12            | [2018-02](https://github.com/mono/mono/tree/2018-02)
| 5.14            | [2018-04](https://github.com/mono/mono/tree/2018-04)
| 5.16            | [2018-06](https://github.com/mono/mono/tree/2018-06)
| 5.18            | [2018-08](https://github.com/mono/mono/tree/2018-08)
