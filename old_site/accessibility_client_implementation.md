---
layout: obsolete
title: "Accessibility: Client Implementation"
permalink: /old_site/Accessibility:_Client_Implementation/
redirect_from:
  - /Accessibility:_Client_Implementation/
---

Accessibility: Client Implementation
====================================

Draft Description of Client API internal architecture
=====================================================

Relevant Assemblies
-------------------

[![Diagram showing dependencies between assemblies related to UIA Client API implementation]({{site.github.url}}/old_site/images/2/2a/ClientAssemblies.png)]({{site.github.url}}/old_site/images/2/2a/ClientAssemblies.png "Diagram showing dependencies between assemblies related to UIA Client API implementation")

Our work during the client phase will focus mainly on four assemblies:

-   **UIAutomationClient** - This is an implementation of a Microsoft-defined assembly, containing the Client API used by automation and testing tools like UIA Verify and White. Our implementation needs to support loading AutomationElements from multiple a11y sources. Depends on UIAutomationSource, and loads automation sources via reflection (similar to how AutomationInteropProvider loads automation bridges on the provider side).
-   **UIAutomationSource** - This is a custom assembly containing interfaces needed to support our infrastructure. It is similar in purpose to the UIAutomationBridge assembly in the Winforms Provider architecture. For example, a source of AutomationElements will have a bridge-type class that implements IAutomationSource, and each element will implement IElement. UIAutomationClient references this assembly and its interfaces.
-   **AtspiUiaSource** - This is a custom assembly which loads AT-SPI accessibles and wraps them in the interfaces defined in UIAutomationSource so that they can be referenced as AutomationElements from the Client API. Depends on UIAutomationSource and UIAutomationClient. *This will probably represent a significant amount of work (it is basically an inverse of UiaAtkBridge), in addition to the work creating the atspi-sharp DBus binding and ensuring that AT-SPI/DBus is mature enough for our use.*
-   **DbusCoreUiaSource** - This is a custom assembly which loads elements in via our DbusCore API (the DBus interfaces we put on the session bus with UiaDbusCoreBridge), and wraps them in the interfaces defined in UIAutomationSource. Depends on UIAutomationSource and UIAutomationClient. *It should be a fairly thin wrapper.* **NOTE**: DbusCore interfaces should be defined in a common place to avoid duplication. Suggestion making them public in UiaDbusCoreBridge, or separate assembly if there's a good reason.

UIAutomationSource Interfaces
-----------------------------

[![Diagram relation between basic classes from UIAutomationClient, the corresponding interfaces in UIAutomationSource, and a sample implementation from DbusCoreUiaSource]({{site.github.url}}/old_site/images/d/d6/UIASourceInterfaces.png)]({{site.github.url}}/old_site/images/d/d6/UIASourceInterfaces.png "Diagram relation between basic classes from UIAutomationClient, the corresponding interfaces in UIAutomationSource, and a sample implementation from DbusCoreUiaSource")

Our UIAutomationClient implementation supports using multiple a11y infrastructures as UIA Sources. Therefore, many of the basic classes in the Client API like AutomationElement, TreeWalker, and the \*Pattern classes will ultimately be wrappers around some arbitrary UIA Source. So, in our UIAutomationSource assembly, we define several interfaces to abstract this functionality:

**NOTE**: These interfaces are not fully designed at this point, and may very well change within the first few weeks of the new phase.

-   **IAutomationSource** - Only one class in an assembly should implement this interface. UIAutomationClient uses reflection to search specified assemblies for a class implementing this interface, and creates only one instance. It provides a lot of the actual implementation of TreeWalker.
-   **IElement** - This interface provides most of the implementation of the AutomationElement class. Each AutomationElement instance should contain a corresponding IElement instance.
-   **IInvokePattern, etc** - For each \*Pattern class in UIAutomationClient, there is a corresponding I\*Pattern interface in UIAutomationSource. The \*Pattern classes are really just wrappers around the I\*Pattern interface. *It's possible that we could use the existing Provider interfaces to fill this niche, instead. Requires some research.*


