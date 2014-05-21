---
layout: obsolete
title: "Gendarme.Rules.Concurrency"
lastmodified: '2009-12-19'
permalink: /old_site/Gendarme.Rules.Concurrency/
redirect_from:
  - /Gendarme.Rules.Concurrency/
---

Gendarme.Rules.Concurrency
==========================

[Gendarme]({{site.github.url}}/old_site/Gendarme "Gendarme")'s concurrency rules are located in the **Gendarme.Rules.Concurrency.dll** assembly. Latest sources are available from [anonymous SVN](http://anonsvn.mono-project.com/viewcvs/trunk/mono-tools/gendarme/rules/Gendarme.Rules.Concurrency/).

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#rules">1 Rules</a>
<ul>
<li><a href="#donotlockonthisortypesrule">1.1 DoNotLockOnThisOrTypesRule</a></li>
<li><a href="#donotlockonweakidentityobjectsrule">1.2 DoNotLockOnWeakIdentityObjectsRule</a></li>
<li><a href="#donotuselockedregionoutsidemethodrule">1.3 DoNotUseLockedRegionOutsideMethodRule</a></li>
<li><a href="#donotusemethodimploptionssynchronizedrule">1.4 DoNotUseMethodImplOptionsSynchronizedRule</a></li>
<li><a href="#donotusethreadstaticwithinstancefieldsrule">1.5 DoNotUseThreadStaticWithInstanceFieldsRule</a></li>
<li><a href="#doublechecklockingrule">1.6 DoubleCheckLockingRule</a></li>
<li><a href="#nonconstantstaticfieldsshouldnotbevisiblerule">1.7 NonConstantStaticFieldsShouldNotBeVisibleRule</a></li>
<li><a href="#protectcalltoeventdelegatesrule">1.8 ProtectCallToEventDelegatesRule</a></li>
<li><a href="#reviewlockusedonlyforoperationsonvariablesrule">1.9 ReviewLockUsedOnlyForOperationsOnVariablesRule</a></li>
<li><a href="#writestaticfieldfrominstancemethodrule">1.10 WriteStaticFieldFromInstanceMethodRule</a></li>
</ul></li>
<li><a href="#feedback">2 Feedback</a></li>
</ul></td>
</tr>
</tbody>
</table>

Rules
=====

### DoNotLockOnThisOrTypesRule

This rule checks if you're using **lock** on the current instance (**this**) or on a **Type**. This can cause problems because anyone can acquire a lock on the instance or type. And if another thread does acquire a lock then deadlocks become a very real possibility. The preferred way to handle this is to create a private **System.Object** instance field and **lock** that. This greatly reduces the scope of the code which may acquire the lock which makes it much easier to ensure that the locking is done correctly.

**Bad** example (this):

``` csharp
public void MethodLockingOnThis ()
{
    lock (this) {
        producer++;
    }
}
```

**Bad** example (type):

``` csharp
public void MethodLockingOnType ()
{
    lock (this.GetType ()) {
        producer++;
    }
}
```

**Good** example:

``` csharp
class ClassWithALocker {
    object locker = new object ();
    int producer = 0;
 
    public void MethodLockingLocker ()
    {
        lock (locker) {
            producer++;
        }
    }
}
```

### DoNotLockOnWeakIdentityObjectsRule

This rule ensures there are no locks on objects with weak identity. An object with weak identity is one that can be directly accessed across different application domains. Because these objects can be accessed by different application domains it is very difficult to ensure that the locking is done correctly so problems such as deadlocks are much more likely. The following types have a weak identities:

-   **System.MarshalByRefObject**
-   **System.OutOfMemoryException**
-   **System.Reflection.MemberInfo**
-   **System.Reflection.ParameterInfo**
-   **System.ExecutionEngineException**
-   **System.StackOverflowException**
-   **System.String**
-   **System.Threading.Thread**

 **Bad** example:

``` csharp
public void WeakIdLocked ()
{
    lock ("CustomString") {
        // ...
    }
}
```

**Good** example:

``` csharp
public void WeakIdNotLocked ()
{
    Phone phone = new Phone ();
    lock (phone) {
        // ...
    }
}
```

### DoNotUseLockedRegionOutsideMethodRule

This rule will fire if a method calls **System.Threading.Monitor.Enter**, but not **System.Threading.Monitor.Exit**. This is a bad idea for public methods because the callers must (indirectly) manage a lock which they do not own. This increases the potential for problems such as dead locks because locking/unlocking may not be done together, the callers must do the unlocking even in the presence of exceptions, and it may not be completely clear that the public method is acquiring a lock without releasing it. This is less of a problem for private methods because the lock is managed by code that owns the lock. So, it's relatively easy to analyze the class to ensure that the lock is locked and unlocked correctly and that any invariants are preserved when the lock is acquired and after it is released. However it is usually simpler and more maintainable if methods unlock whatever they lock.

**Bad** example:

``` csharp
class BadExample {
    int producer = 0;
    object lock = new object();
 
    // This class is meant to be thread safe, but in the interests of
    // performance it requires clients to manage its lock. This allows
    // clients to grab the lock, batch up edits, and release the lock
    // when they are done. But this means that the clients must
    // now (implicitly) manage the lock which is problematic, especially
    // if this object is shared across threads.
    public void BeginEdits ()
    {
        Monitor.Enter (lock);
    }
 
    public void AddProducer ()
    {
        // Real code would either assert or throw if the lock is not held.
        producer++;
    }
 
    public void EndEdits ()
    {
        Monitor.Exit (lock);
    }
}
```

**Good** example:

``` csharp
class GoodExample {
    int producer = 0;
    object mutex = new object();
 
    public void AddProducer ()
    {
        // We need a try block in case the assembly is compiled with
        // checked arithmetic.
        Monitor.Enter (mutex);
        try {
            producer++;
            } finally {
                Monitor.Exit (mutex);
            }
        }
 
        public void AddProducer2 ()
        {
            // Same as the above, but with C# sugar.
            lock (mutex) {
                producer++;
            }
        }
    }
```

### DoNotUseMethodImplOptionsSynchronizedRule

This rule fires if a method is decorated with **[MethodImpl(MethodImplOptions.Synchronized)]**. The runtime synchronizes those methods automatically using a **lock(this)** for instance methods or a **lock(typeof(X))** for static methods. This can cause problems because anyone can acquire a lock on the instance or type. And if another thread does acquire a lock then deadlocks become a very real possibility. The preferred way to handle this is to create a private **System.Object** instance field and **lock** that. This greatly reduces the scope of the code which may acquire the lock which makes it much easier to ensure that the locking is done correctly.

**Bad** example:

``` csharp
[MethodImpl (MethodImplOptions.Synchronized)]
public void SychronizedMethod ()
{
    producer++;
}
```

**Good** example:

``` csharp
public class ClassWithALocker {
    object locker = new object ();
    int producer = 0;
 
    public void MethodLockingLocker ()
    {
        lock (locker) {
            producer++;
        }
    }
}
```

### DoNotUseThreadStaticWithInstanceFieldsRule

This rule will fire if an instance field is decorated with a **[ThreadStatic]** attribute. This is an error because the attribute will only work with static fields.

**Bad** example:

``` csharp
// the field isn't static so this will do nothing
[ThreadStatic]
private List<object> items;
 
public void Add (object item)
{
    // If the field was thread safe this would ensure that each thread had
    // its own copy of the list.
    if (items == null) {
        items = new List<object> ();
    }
 
    items.Add (item);
}
```

**Good** example:

``` csharp
private List<object> items = new List<object> ();
private object mutex = new object ();
 
// Typically some form of locking such as the code below is used to
// serialize access to instance fields. However you can also use
// Threading.Thread.Thread::AllocateNamedDataSlot or AllocateDataSlot.
public void Add (object item)
{
    lock (mutex) {
        items.Add (item);
    }
}
```

**Notes**

-   This rule is available since Gendarme 2.6

### DoubleCheckLockingRule

This rule is used to check for the double-check pattern, often used when implementing the singleton pattern (1), and warns of potential incorrect usage. The original CLR (1.x) could not guarantee that a double-check would work correctly in multithreaded applications. However the technique does work on the x86 architecture, the most common architecture, so the problem is seldom seen (e.g. IA64). The CLR 2 and later introduce a strong memory model (2) where a double check for a **lock** is correct (as long as you assign to a **volatile** variable). This rule won't report a defect for assemblies targetting the 2.0 (and later) runtime.

-   **1. Implementing Singleton in C\#** : [http://msdn.microsoft.com/en-us/library/ms998558.aspx](http://msdn.microsoft.com/en-us/library/ms998558.aspx)
-   **2. Understand the Impact of Low-Lock Techniques in Multithreaded Apps** : [http://msdn.microsoft.com/en-ca/magazine/cc163715.aspx\#S5](http://msdn.microsoft.com/en-ca/magazine/cc163715.aspx#S5)

 **Bad** example:

``` csharp
public class Singleton {
    private static Singleton instance;
    private static object syncRoot = new object ();
 
    public static Singleton Instance {
        get {
            if (instance == null) {
                lock (syncRoot) {
                    if (instance == null) {
                        instance = new Singleton ();
                    }
                }
            }
            return instance;
        }
    }
}
```

**Good** example (for 1.x code avoid using double check):

``` csharp
public class Singleton {
    private static Singleton instance;
    private static object syncRoot = new object ();
 
    public static Singleton Instance {
        get {
            // do not check instance before the lock
            // this will work on all CLRs but will affect
            // performance since the lock is always acquired
            lock (syncRoot) {
                if (instance == null) {
                    instance = new Singleton ();
                }
            }
            return instance;
        }
    }
}
```

**Good** example (for 2.x and later):

``` csharp
public class Singleton {
    // by using 'volatile' the double check will work under CLR 2.x
    private static volatile Singleton instance;
    private static object syncRoot = new object ();
 
    public static Singleton Instance {
        get {
            if (instance == null) {
                lock (syncRoot) {
                    if (instance == null) {
                        instance = new Singleton ();
                    }
                }
            }
            return instance;
        }
    }
}
```

### NonConstantStaticFieldsShouldNotBeVisibleRule

This rule warns if a non-constant public static field is found. In a multi-threaded environment access to those fields must be synchronized.

**Bad** example:

``` csharp
class HasPublicStaticField {
    public static ComplexObject Field;
}
```

**Good** example:

``` csharp
class FieldIsReadonly {
    public readonly static ComplexObject Field = new ComplexObject();
}
```

``` csharp
class UseThreadStatic {
    [ThreadStatic]
    public static ComplexObject Field;
 
    public static InitializeThread ()
    {
        if (Field == null)
        Field = new ComplexObject ();
    }
}
```

### ProtectCallToEventDelegatesRule

This rule checks that event invocations are safely implemented. In particular, the event must be copied into a local to avoid race conditions and it must be checked for null before it is used (events will normally be null until a delegate is added to them).

**Bad** example (no check):

``` csharp
public event EventHandler Loading;
 
protected void OnLoading (EventArgs e)
{
    // Loading field could be null, throwing a NullReferenceException
    Loading (this, e);
}
```

**Bad** example (race condition):

``` csharp
public event EventHandler Loading;
 
protected void OnLoading (EventArgs e)
{
    // Loading could be non-null here
    if (Loading != null) {
        // but be null once we get here :(
        Loading (this, e);
    }
}
```

**Good** example:

``` csharp
public event EventHandler Loading;
protected void OnLoading (EventArgs e)
{
    EventHandler handler = Loading;
    // handler is either null or non-null
    if (handler != null) {
        // and won't change (i.e. safe from a NullReferenceException)
        handler (this, e);
        // however it is still possible, like the original code, that
        // the Loading method will be removed before, or during its
        // execution. Your code should be safe against such occurance.
    }
}
```

### ReviewLockUsedOnlyForOperationsOnVariablesRule

This rule checks if a lock is used only to perform operations on locals or fields. If the only purpose of that critical section is to make sure the variables are modified atomatically then the methods provided by System.Threading.Interlocked class will be more efficient.

**Bad** example:

``` csharp
lock (_lockObject) {
    _counter++;
}
```

**Good** example:

``` csharp
Interlocked.Increment(_counter);
```

**Bad** example:

``` csharp
lock (_lockObject) {
    _someSharedObject = anotherObject;
}
```

**Good** example:

``` csharp
Interlocked.Exchange(_someSharedObject, anotherObject);
```

### WriteStaticFieldFromInstanceMethodRule

This rule is used to check for instance methods which write values to static fields. This may cause problems if multiple instances of the type exist and are used in multithreaded applications.

**Bad** example:

``` csharp
static int default_value;
 
public int Value {
    get {
        if (default_value == 0) {
            default_value = -1;
        }
        return (value > default_value) ? value : 0;
    }
}
```

**Good** example:

``` csharp
static int default_value = -1;
 
public int Value {
    get {
        return (value > default_value) ? value : 0;
    }
}
```

Feedback
========

Please report any documentation errors, typos or suggestions to the [Gendarme Google Group](http://groups.google.com/group/gendarme). Thanks!

