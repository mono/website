---
title: "IssuesIOLayer"
lastmodified: '2007-04-20'
permalink: /archived/IssuesIOLayer/
redirect_from:
  - /IssuesIOLayer/
---

IssuesIOLayer
=============

This page documents some of the issues with the IO-Layer for use in embedded devices.

One of the issues that people might run into with embedded devices and Mono is that the io-layer implementation by default uses shared memory to implement some of its functionality and falls back to private mappings otherwise.

The shared memory is used to keep track of information that must be made available to other Mono processes. It is a rare feature, but one that certain applications depend on (cross process mutexes, events, and other handles).

Shared information like thread handles is kept in this page and this page can grow up to NNN megabytes.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#disabling-shm-features">1 Disabling SHM features</a></li>
<li><a href="#needs-test-suite-for-io-layer">2 Needs: Test Suite for IO-Layer</a></li>
<li><a href="#questions-for-dick">3 Questions for Dick</a></li>
<li><a href="#request">4 Request</a>
<ul>
<li><a href="#documentation">4.1 Documentation</a></li>
<li><a href="#timeouts">4.2 Timeouts</a></li>
<li><a href="#tuning-of-the-non-shm-case">4.3 Tuning of the non-SHM case</a></li>
<li><a href="#tuning-for-embedded-systems">4.4 Tuning for embedded systems</a></li>
<li><a href="#challenges-for-embedded-systems">4.5 Challenges for Embedded Systems</a></li>
</ul></li>
<li><a href="#proposals">5 Proposals</a>
<ul>
<li><a href="#process-id-storage">5.1 Process ID storage</a></li>
<li><a href="#reducing-the-size-of-the-table">5.2 Reducing the size of the table</a></li>
<li><a href="#mono-modes">5.3 Mono Modes</a></li>
<li><a href="#write-read-operations">5.4 _write, _read operations</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Disabling SHM features
======================

Mono supports running without the SHM features enabled, but some of its features are disabled in that case.

Needs: Test Suite for IO-Layer
==============================

We need a complete test suite to exercise the various features that the io-layer exposes with the shared memory to understand what exactly stops working in the SHM-less setup, but also to ensure that we do not introduce regressions over time on it.

This test suite does not exist today.

Questions for Dick
==================

If waiting for another process is something that is no longer supported, why do we have processes listed on the shared memory table?

Could we reduce the size of the table if we decided to remove by default support for the file sharing/file modes information?

Request
=======

Documentation
-------------

Our [Documentation]({{ site.github.url }}/Article:IOChanges "Article:IOChanges") needs to be improved:

-   The documentation is based on some conversations with Dick.
-   It is not up-to-date.
-   It needs more technical information than it has today
-   Copy-pasting from the mono/docs there is fine.

Timeouts
--------

We currently have a system that basically wakes up Mono every N milliseconds to ensure that we can implement Interrupt/Abort, and this seems suboptimal.

I got the impression that we could use a signal, and the signal should interrupt the pthread primitives and that would be all that we need. Why can we not do this?

Tuning of the non-SHM case
--------------------------

If the SHM is disable, we should work without allocating a large table, this would help for example the embedded system case.

Tuning for embedded systems
---------------------------

Challenges for Embedded Systems
-------------------------------

Flash file systems do not allow the MAP\_SHARED flag to share memory in the first place.

On embedded systems we end up allocating the whole table to with MAP\_PRIVATE (Nokia) which is wasteful.

We could fall back on those devices to use SysV shared memory (there is the chance of collisions).

Proposals
=========

### Process ID storage

When mono exists, it could store the exit code in the \~/.wapi directory in a special file (probably deal with stale files).

This was discussed at the Boston 2006 Mono Summit.

### Reducing the size of the table

For embedded applications, the need for some of the shared features is probably not necessary.

### Mono Modes

Maybe have two Mono Modes: the Windows emulation mode which would allow things like named mutexes, events, threads, file sharing and a Unix-mode, in which none of those Windows-isms are exposed or supported.

A more "native" implementation of Mono, which would be lighter in many scenarios.

### \_write, \_read operations

Handle validation happens in ReadFile, WriteFile, aren't the tests in each one of the \_write, \_read operations redundant? Could we remove them?

