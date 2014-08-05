---
title: "Accessibility: UIATest Library Introduction"
lastmodified: '2009-09-17'
redirect_from:
  - /Accessibility:_UIATest_Library_Introduction/
---

Accessibility: UIATest Library Introduction
===========================================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#what">1 What</a></li>
<li><a href="#sample-usage">2 Sample Usage</a></li>
<li><a href="#how-visual-uia-verify-uses-uia-test-library">3 How Visual UIA Verify uses UIA Test Library</a></li>
<li><a href="#how-to-define-test-cases">4 How to Define Test Cases</a>
<ul>
<li><a href="#test-cases-by-type">4.1 Test Cases by Type</a></li>
<li><a href="#the-inheritance-relationship-of-test-case-classes">4.2 The Inheritance Relationship of Test Case Classes</a></li>
<li><a href="#testcaseattribute">4.3 TestCaseAttribute</a></li>
<li><a href="#making-assertion">4.4 Making Assertion</a></li>
<li><a href="#logging">4.5 Logging</a></li>
</ul></li>
<li><a href="#sample-tests">5 Sample Tests</a>
<ul>
<li><a href="#sample-1-titlebarcontroltests">5.1 Sample 1: TitleBarControlTests</a></li>
<li><a href="#sample-2-valuetests">5.2 Sample 2: ValueTests</a>
<ul>
<li><a href="#valuewrapper">5.2.1 ValueWrapper</a></li>
<li><a href="#valuetests-test-steps">5.2.2 ValueTests Test Steps</a></li>
<li><a href="#valuetests-test-cases">5.2.3 ValueTests Test Cases</a></li>
</ul></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

What
====

UIATest library is a sub-project of [UI Automation Verify](http://www.codeplex.com/UIAutomationVerify) project.

The following description is quoted from the project page:

*UIA Verify is a test automation framework that features the User Interface Automation Test Library (UIA Test Library) and Visual UI Automation Verify (Visual UIA Verify), the graphical user interface tool. The framework facilitates manual and automated testing of the Microsoft (R) User Interface (UI) Automation Provider implementation of a control or application. The majority of the UIA Verify functionality is provided through a dynamic link library (e.g., UIATestLibrary.dll) that contains the code for testing specific UI Automation functionality and supports logging of the test results.*

Sample Usage
============

SampleDriver is a simple console application which will start the Microsoft Notepad application and run all priority \#0 tests on Notepad’s main window and all its decedent controls. You may find the SampleDriver project in the UIA Automation Verify solution. In Programs.cs, the TestMain.StartApplication is defined to launch Notepad.exe and return the AutomationElement object for the Notepad’s main window control. Then in TestMain.Main, after StartApplication is called:

    AutomationElement element = StartApplication("NOTEPAD.EXE", null);

The program will use the following line of code to run all the priority \#0 tests:

    TestRuns.RunAllTests(element, true, TestPriorities.Pri0, TestCaseType.Generic, false, true, null);

Then use the returned element’s WindowPattern to close the main window and quit:

    ((WindowPattern)element.GetCurrentPattern(WindowPattern.Pattern)).Close();

Actually we can consider TestRun as the entry class of UIA Test Library, since another real driver application - Visual UIA Verify, also use the members of TestRun class to launch the tests (We may find related code in AutomationTestManager.RunTest).

How Visual UIA Verify uses UIA Test Library
===========================================

With the Visual UIA Verify, users can quickly find and select any UI element anywhere on the desktop. Based on the specific control type and the supported control patterns, UIA Verify provides the built-in test scenarios prioritized for the particular UI element.

Just like the Sample Driver project, Visual UIA Verify also uses UIA Test Library to perform the UI Automation tests, and the following is the procedure of how Visual UIA Verify invokes UIA Test Library:

In AutomationTestManager.cs

    testWindow.ShowAndRunTests(manager, parentWindow);

Then in RunningTestWindow.cs

    internal void ShowAndRunTests(AutomationTestManager manager, IWin32Window parentWindow)

Then call:

    private void RunTests()

Then the following method is called in another thread (i.e. as a background task):

    private void _backgroundWorker_DoWork(object sender, DoWorkEventArgs e)

Then back to AutomationTestManager.cs, this method is called:

    public TestResults PerformTest(AutomationTest test, AutomationElement element)

Then according to test.Type, one of following methods will be called:

-   TestRuns.RunAutomationElementTest
-   TestRuns.RunControlTests
-   TestRuns.RunPatternTests

How to Define Test Cases
========================

Like x-unit, UIA Test Library groups test cases into test suites. Each test suites inherits TestObject class (directly or indirectly), and defines each test case as a member method with has one TestCaseAttribute attached.

We shall place the test suite class in right namespace so that they can be found and loaded by TestRuns class (i.e. the entry class for the UIA Test Library as we mentioned before). UIA Test Library defines three types of test cases: AutomationElement tests, control tests and pattern tests.

In current UIA Test Library code base, test suites are already defined for each control type and control pattern. All of these test suites are placed under the Tests directory of the UIATestLibrary project.

Test Cases by Type
------------------

|Type|Class/Namespace|Description|
|:---|:--------------|:----------|
|AutomationElement|***Microsoft.Test.UIAutomation.
Tests.Patterns.AutomationElementTests***|Test the [common properties of an AutomationElement](http://msdn.microsoft.com/en-us/library/system.windows.automation.automationelement.automationelementinformation_properties.aspx) and corresponding PropertyValueChangedEvent|
|Control|Placed in the ***Microsoft.Test.UIAutomation.
Tests.Controls*** namespace|Test the behaviors that a certain type of control shall provide.|
|Pattern|Placed in the ***Microsoft.Tes'UIAutomation.
Tests.Pattern*** namespace|Test the properties, methods and events exposed by each UIA pattern.|

The Inheritance Relationship of Test Case Classes
-------------------------------------------------

-   TestObject
    -   ControlObject
        -   **Control Test Suites**
    -   PatternObject
        -   **Pattern Test Suites**
        -   AutomationElementWrapper
            -   **AutomationElementTests**

TestCaseAttribute
-----------------

The TestCaseAttribute can mark a method to be a test case. Also this class defines some public properties to give detailed infomartion of the test case, in which some important proerties are:

-   Priority: defines the test priority, in Visual UIA Verify you can specify to run the test cases of some certain prioity, or of all the priorities.
-   TestName: the name of the test case.
-   TestSummary: the summary of the test usually indicates the goal or purpose of the test.
-   Description: the description of the test usually indicates the procedure (i.e. the action/expected results of each step) performed by the test.

Making Assertion
----------------

All test suite classes inherit TestObject and use TestObject.[ThrowMe|ThrowMeAssert] to verify states and testing results (ThrowMeAssert calls ThrowMe internally).

In case that the condition argument of ThrowMe method is evaluated as false，if the checkType argument of ThrowMe method is CheckType.Warning, then related information will be dumped to the logging output and the testing procedure won't be broken, otherwise an exception will be thrown and the test case will fail.

Logging
-------

In UIA Test Library, we can use UIAVerifyLogger to log information. We may use following member methods of UIAVerifyLogger to perform the logging action:

-   public static void LogError(Exception exception)
-   public static void LogUnexpectedError(Exception exception)
-   public static void LogComment(object comment)
-   public static void LogComment(string format, params object[] args)

And we may use following member methods of UIAVerifyLogger to set where the logging output is redirected to:

-   public static void SetLogger(string filename)
-   public static void SetLogger(ILogger logger)

Unlike log4net, we can set only one logger to the UIAVerifyLogger class, however we can manually implement a composite logger if we need multiple logger attached.

Finally we also have a method to close the logging output stream:

-   public static void CloseLog()

TestObject class also defined a short-cut method named Comment to log a quick comment, in which UIAVerifyLogger.LogComment is called internally.

Sample Tests
============

We'll take several test suites in UIA Test Library as examples in this section, and demonstrate how the tests are implemented.

Sample 1: TitleBarControlTests
------------------------------

The TitleBarControlTests class is written to test the sepcial behavior provided by a functional TitleBar control. Apparently this class is a control test suite, therefore TitleBarControlTests inherits ControlObject class, and is defined in Microsoft.Test.UIAutomation.Tests.Controls namepsace.

Generally a test suite class need to define two things:

-   public const string TestSuite
-   Test cases, i.e. the method marked by TestCaseAttribute

TestSuite shall always be the same as the full name of the suite class, and it's the key point for the library to find the test suite class for a certain AutomationElement. The related code is defined in **TestObject.GetControlTestObject**.

TitleBarControlTests only defines one test case named "GetBoundingRect1", where the "1" at the end of the name indicates the test case is of priority 1. As the TestSummary of the test case indicates, this test case "Verify that the immediate children return actual BoundingRectangles and are withing the parents BoundingRectangle". (Actually there is a typo here: "withing" shall be "within")

By reviewing the method body, we may find out that how the bounding rectangles of the titlbar control and its immediate children are retrieved and verified, and how an exception is thrown with "ThrowMe" when a verification fails.

At the end of the this method, we have this line of code:

    m_TestStep++;

**m\_TestStep** is inherited from TestObject class, which stores the count of performed testing steps of a test suite object. For simple test cases like TitleBarControlTests.GetBoundingRect1, which contains only one testing step, will only increase m\_TestStep for once; while for some more complicate test case like AutomationElementTest.HwndWindowRect1MSAA, which have multiple testing steps, will increase m\_TestStep for multiple times. Usually we can query how many steps a test case have by viewing the Desciption property of its attached TestCaseAttribute object. Testing step can help us to get more precise position of a found bug.

Sample 2: ValueTests
--------------------

ValueTests class is written to test the properties, methods and events provided by ValuePattern. This class is a control test suite, therefore ValueTests inherits PatternObject class, and is defined in Microsoft.Test.UIAutomation.Tests.Patterns namepsace. We can run this test on any AutomationElement supports ValuePattern.

Just like TitleBarControlTests, ValueTests defines a TestSuite const string member to store the class's full type name. Then UIA Test Library can find the pattern test suites for a certain AutomationElement with "TestSuite". The related code is defined in **Helpers.GetPatternSuitesForAutomationElement**.

### ValueWrapper

Instead of directly inherit PatternObject, ValueTests inherits ValueWrapper class, which then inherits PatternObject. We may find this kind of \*Wrapper class for each control pattern test in the code base. Usually the \*Wapper class will define members to invoke each method/property provided by the pattern. E.g. ValueWrapper defines pattern\_SetValue method to call ValuePattern.SetValue method, and defines pattern\_IsReadOnly and pattern\_Value property to retrieve ValuePattern.IsReadOnlyProperty and ValuePattern.ValueProperty respectively.

### ValueTests Test Steps

ValueTests defines some test steps in the "Test Steps" code region. Each test step is a method whose name starts with "TS\_" or "TSC\_", performs a simple verification or action, and will increase m\_TestStep for once. Many ValueTests's test cases are consitituted by those defined test steps.

### ValueTests Test Cases

ValueTests's test cases are defined in the "Tests: Pattern Specific" code region in ValueTests.cs. Each test case is a member method with one TestCaseAttribute attached. All the test cases are clearly self-explained by the TestCaseAttribute's Description property. Taking **TestSetValue116** as the example, its description is:

    "Precondition: Verify that control is read only",
    "Precondition: Verify that this control supports 'String' types",
    "Step: Get a random valid value",
    "Step: Add event that will catch PropertyChangeEvent",
    "Step: Set the pattern to this value", 
    "Step: Step: Wait for event", 
    "Verify the pattern is set to this value",
    "Verify that the PropertyChangeEvent event is not fired"

Then when we review the "SetValue\_SetToRandomValue" method used by this test case, we'll find that each check/step in the description turns out an invocation to the corresponding test step method.

And another thing: in the last step of **TestSetValue116**, actually whether the PropertyChangeEvent event is fired **is not** checked at all (EventFired.Undetermined is passed to the TSC\_VerifyPropertyChangedListener method), since the UIAutomation spec didn't mention whether an PropertyChangeEvent shall be fired if the **Value** is modified by calling ValuePattern.SetValue. However, if the **Value** is modified by non-UIA methods, such as by sending native mouse/keyboard messages or by manually inputs, we should verify that a PropertyChangeEvent is fired.

