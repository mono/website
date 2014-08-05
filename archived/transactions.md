---
title: "Transactions"
lastmodified: '2006-11-15'
redirect_from:
  - /Transactions/
---

Transactions
============

This page describes the status of transaction process in Mono as well as plans for future work.

Transactions processing is described in:

-   [Introducing System.Transactions in the Microsoft .NET Framework version 2.0](http://www.microsoft.com/downloads/details.aspx?FamilyID=AAC3D722-444C-4E27-8B2E-C6157ED16B15&displaylang=en)
-   [Transaction Processing, .NET Framework documentation](http://msdn2.microsoft.com/en-us/library/w97s6fw4(en-US,VS.80).aspx)

You might also be interested in [SystemMessaging]({{ site.github.url }}/System.Messaging).

On Microsoft.NET, System.Transactions is a wrapper around Microsoft's distributed transaction manager (MSDTM) with some additional optimizations.

The optimizations are interesting and useful enough that we implemented them without the MSDTM.

A "distributed transaction" is a transaction that has components of the transaction in different places, each place offering a local transaction ability. The key algorithm is the 2-phase commit: a way to conjure up a globally consistent transactional commit out of individual commits in individual pieces. Thus a distributed transaction has a different flavour as compared to an individual database transaction. It is abstract enough that it can be implemented without knowledge of the actual mechanisms of each local transaction -- it only matters that there's a way to prepare for a commit, do the commit, or do a rollback.

However, the notions of "durable" vs. "volatile" are useful to discuss them, since individual pieces of a distributed system can fail independently, and thus the distributed transaction needs to be aware of the failure semantics.

Thus it's not easy to build a practical distributed transaction manager without knowing the actual failure behaviour of the individual pieces.

The MS S.T "confuses" the two issues, since it is somewhat tied to the actual support of the MSDTM in MSSql. It provides only one way for a durable resource manager to register with a distributed transaction -- use the MSDTM. We may still be able to avoid the MSDTM and use an extension of our LTM to run the distributed transaction, but it will be more brittle, and behave differently from the MS implementation. The thing is that the API docs don't seem to offer the possibility of a third type of transaction manager (or maybe they do, but it's well hidden :-)

Using Transactions with Databases
=================================

From a discussion on the mailing list, Ankit said:

[Implementing an Implicit Transaction using Transaction Scope](http://msdn2.microsoft.com/en-us/library/ms172152.aspx)

Transaction.Current property (ambient transaction) refers to the "current" transaction which can be used by DbCommand etc to find out whether it is being used in a transaction.

Implementation Details.
=======================

Volatile and durable resource managers are available, and work with Single Phase Commit (SPC) and 2 Phase Commit (2PC).

Missing Features
================

DependentTransaction is not implemented.

Distributed transactions are not implemented, not because of a limitation in our code, but because we might end up with different behaviour.

We want to implement this anyways.

