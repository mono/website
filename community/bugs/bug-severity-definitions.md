---
layout: docpage
navgroup: community
title: Bug severity definitions
permalink: /community/bugs/bug-severity-definitions/
---

When filing a bug against Mono, here are the guidelines for determining the severity of a bug.

 **Blocker**

-   Regressions which stop Mono developers from moving forward with trunk development
-   Build breakages
-   This severity should only be added by a developer on the Mono team

 **Critical**

-   All other regressions on supported functionality which are not Blockers

 **Major**

-   Bugs that cause the runtime to crash
-   Bugs that make the runtime unusable
-   Significant bugs what block the next point release

 **Normal**

-   Non-crashing Bugs found in existing supported functionality
-   Memory leaks

 **Minor**

-   Bugs and regressions in features that are not yet supported functionality
-   Nuisances
-   Performance issues that don't meet the "unusable" standard
-   Cosmetic graphical issue
-   Fine tuning

 **Enhancement**

-   "Would be nice to have" Feature requests
-   All functionality that is not currently implemented

