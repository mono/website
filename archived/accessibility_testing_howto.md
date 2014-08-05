---
title: "Accessibility: Testing Howto"
lastmodified: '2010-01-07'
permalink: /archived/Accessibility:_Testing_Howto/
redirect_from:
  - /Accessibility:_Testing_Howto/
---

Accessibility: Testing Howto
============================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#winforms">1 WinForms</a>
<ul>
<li><a href="#strongwind">1.1 Strongwind</a>
<ul>
<li><a href="#introduction">1.1.1 Introduction</a></li>
<li><a href="#requirements">1.1.2 Requirements</a></li>
<li><a href="#strongwind-introduction">1.1.3 Strongwind Introduction</a></li>
<li><a href="#strongwind-test-harness">1.1.4 Strongwind Test Harness</a>
<ul>
<li><a href="#local-runpy">1.1.4.1 local_run.py</a></li>
<li><a href="#remote-runpy">1.1.4.2 remote_run.py</a></li>
<li><a href="#official-tests">1.1.4.3 &quot;Official Tests&quot;</a></li>
<li><a href="#official-test-machine-configuration">1.1.4.4 Official Test Machine Configuration</a></li>
<li><a href="#qa-architecture-diagram">1.1.4.5 QA Architecture Diagram</a></li>
</ul></li>
<li><a href="#example-sample-application">1.1.5 Example Sample Application</a></li>
<li><a href="#example-application-wrapper">1.1.6 Example Application Wrapper</a>
<ul>
<li><a href="#init-py">1.1.6.1 __init__.py</a></li>
<li><a href="#gtktutorialframepy">1.1.6.2 gtktutorialframe.py</a></li>
</ul></li>
<li><a href="#example-test-script">1.1.7 Example Test Script</a></li>
</ul></li>
<li><a href="#orca">1.2 Orca</a>
<ul>
<li><a href="#requirements_2">1.2.1 Requirements</a></li>
<li><a href="#testing">1.2.2 Testing</a></li>
<li><a href="#test-writing">1.2.3 Test Writing</a></li>
</ul></li>
</ul></li>
<li><a href="#moonlight">2 Moonlight</a>
<ul>
<li><a href="#create-moonlight-sample">2.1 Create Moonlight Sample</a></li>
<li><a href="#build-test-environment">2.2 Build Test Environment</a>
<ul>
<li><a href="#install-mono">2.2.1 Install Mono</a></li>
<li><a href="#mxap-to-compile-silverlight-samples">2.2.2 mxap to compile Silverlight samples</a></li>
<li><a href="#manage-firefox">2.2.3 Manage Firefox</a></li>
<li><a href="#install-moonatkbridge-to-make-accessible">2.2.4 Install MoonAtkBridge to Make accessible</a></li>
</ul></li>
</ul></li>
<li><a href="#uiautomation-client-api">3 UIAutomation Client API</a>
<ul>
<li><a href="#white">3.1 White</a>
<ul>
<li><a href="#introduction_2">3.1.1 Introduction</a></li>
<li><a href="#example-of-start-white">3.1.2 Example of start White</a></li>
</ul></li>
<li><a href="#uia-verify">3.2 UIA Verify</a>
<ul>
<li><a href="#introduction_3">3.2.1 Introduction</a></li>
<li><a href="#automation-test-suit">3.2.2 Automation Test Suit</a></li>
</ul></li>
<li><a href="#uia-client-api-testing-how-to">3.3 UIA Client Api Testing How To</a>
<ul>
<li><a href="#what-is-the-ui-automaiton">3.3.1 What is the UI Automaiton?</a></li>
<li><a href="#what-is-the-uiaclient-used-for">3.3.2 What is the uiaclient used for?</a></li>
<li><a href="#requirements_3">3.3.3 Requirements</a>
<ul>
<li><a href="#keepassexe">3.3.3.1 Keepass.exe:</a></li>
<li><a href="#dockpatternproviderexe">3.3.3.2 DockPatternProvider.exe:</a></li>
<li><a href="#windowandtransformpatternproviderexe">3.3.3.3 WindowAndTransformPatternProvider.exe:</a></li>
</ul></li>
<li><a href="#qa-architecture-diagram_2">3.3.4 QA Architecture Diagram</a></li>
<li><a href="#example-application-wrapper_2">3.3.5 Example Application Wrapper</a>
<ul>
<li><a href="#testbasecs">3.3.5.1 TestBase.cs</a></li>
<li><a href="#configcs">3.3.5.2 Config.cs</a></li>
<li><a href="#configxml">3.3.5.3 Config.xml</a></li>
<li><a href="#elementcs">3.3.5.4 Element.cs</a></li>
<li><a href="#scrollbarcs">3.3.5.5 ScrollBar.cs</a></li>
<li><a href="#procedureloggercs">3.3.5.6 ProcedureLogger.cs</a></li>
<li><a href="#utilscs">3.3.5.7 Utils.cs</a></li>
</ul></li>
<li><a href="#example-test-script_2">3.3.6 Example Test script</a>
<ul>
<li><a href="#keepasscs">3.3.6.1 Keepass.cs</a></li>
</ul></li>
<li><a href="#output">3.3.7 OUTPUT</a></li>
</ul></li>
</ul></li>
<li><a href="#logging-bugs">4 Logging Bugs</a>
<ul>
<li><a href="#general-guidelines">4.1 General Guidelines</a></li>
<li><a href="#bug-references">4.2 Bug References</a></li>
</ul></li>
<li><a href="#official-test-machine-setup">5 Official Test Machine Setup</a></li>
<li><a href="#csharp-introduction">6 Csharp Introduction</a></li>
</ul></td>
</tr>
</tbody>
</table>

WinForms
========

The purpose of this Strongwind example is to familiarize the reader with the specific testing practices of the UIA Mono Accessibility team.

This tutorial demonstrates the writing of tests for a Gtk application. In practice, of course, we write our tests for WinForms applications. Using a Gtk application in this tutorial allow us to demonstrate testing techniques effectively, without having to worry about the early stage of the WinForms providers implementation at the time this tutorial was written.

Strongwind
----------

### Introduction

This tutorial will *not* have in-depth explanations about the Strongwind-specific parts of the code in our test. This information is covered in [Getting Started with Strongwind](http://medsphere.org/projects/strongwind/getting_started.html) and [Strongwind Basics]({{ site.github.url }}/Accessibility:_Strongwind_Basics). In this tutorial, our focus will be on how our Mono accessibility tests and environment are unique.

### Requirements

-   [GNOME](http://www.gnome.org)
-   [Python](http://www.python.org) (\>=2.5, \<3.0)
-   Enable "Assistive Technologies" from the GNOME Control Center
-   pyatspi (packaged with [AT-SPI](http://ftp.gnome.org/pub/GNOME/sources/at-spi))
-   [Accerciser](http://live.gnome.org/Accerciser) (1.4.0 or later)
-   [Strongwind](http://medsphere.org/projects/strongwind) (installing from SVN trunk is highly recommended)
-   [IronPython](http://www.codeplex.com/Wiki/View.aspx?ProjectName=IronPython) (the package name in openSUSE is IPCE). Our sample applications are written in IronPython, so it must be installed for them to run successfully.
-   [uia2atk code]({{ site.github.url }}/Accessibility:_Getting_Started_With_Development#getting-the-code "Accessibility: Getting Started With Development"). The QA-related code is in the test directory. There are short README files in the test directory and each of its subdirectories. Read these README files if you are confused about the files and directories you are seeing. The code can also be checked out anonymously (using subversion) by running *svn co [svn://anonsvn.mono-project.com/source/trunk/uia2atk](svn://anonsvn.mono-project.com/source/trunk/uia2atk)*.

### Strongwind Introduction

This tutorial assumes the reader already has at least a basic understanding of Strongwind and can comfortably write non-trivial tests using it. If you are already familiar with writing Strongwind tests, please skip this introduction. Otherwise, a brief introduction to is needed before we can begin.

First of all, read [Getting Started with Strongwind](http://medsphere.org/projects/strongwind/getting_started.html) to get a basic idea of what it's all about. Also notice there are several Gtk tests in uia2atk/test/testers that can be used as additional examples.

Next, read the [Strongwind Basics]({{ site.github.url }}/Accessibility:_Strongwind_Basics) page.

After reading these two documents, you will be ready to proceed with this tutorial.

### Strongwind Test Harness

We have developed a test harness for our Strongwind test harness. The purpose of the test harness is to facilitate the execution and logging of multiple Strongwind tests on multiple machines. Using the Strongwind test harness we are able to execute one command that runs all of our tests--either on your local machine or on all of our test machines simultaneously--and stores all of the logs to their proper locations.

The test harness files are located in uia2atk/test/harness; here is a list of the files with their descriptions:

-   *tests.py*: A list of "enabled tests," that is, tests that should be executed when running *remote\_run.py* or *local\_run.py*.
-   *machines.py*: A dictionary of machines on which the enabled tests should be run. This file also contains the directory where the tests reside on the machines in *machines.py*, directory where logs should be stored on the machines in *machines.py*, and the username for the machines in *machines.py*.
-   *remote\_run.py*: Run the enabled tests on the machines specified in *machines.py*.
-   *local\_run.py*: Run the enabled tests on the local machine.

Here is a brief overview of how tests are executed using our Strongwind test harness:

#### local\_run.py

When using *local\_run.py* to execute tests, the following occurs:

1.  The list of enabled tests is retrieved from *tests.py*
2.  If a test is specified in *tests.py*, but it cannot be found on the machine, a warning is issued and that test will not be run.
3.  Each test from *tests.py* is execute in order
4.  Logs are stored in uia2atk/test/logs unless otherwise specified (by using the [-l|--log=] option.

Information is also printed to the terminal at each step unless the [-q|--quiet] option is used.

#### remote\_run.py

When using *remote\_run.py* to execute tests, the following occurs:

1.  The list of test machines is retrieved from *machines.py*
2.  If a machine is specified in *machines.py*, but it cannot be pinged successfully, a warning is issues and the test(s) will not run on that machine.
3.  *remote\_run.py* is executed via SSH on each available machine from *machines.py*. There are three **important** things to remember:
    1.  *remote\_run.py'*s default log directory is overridden and logs are stored in LOG\_DIR as defined by *machines.py*.
    2.  The user used to perform the SSH operation is defined by USERNAME in *machines.py*
    3.  *remote\_run.py* looks for the *test* directory (i.e., uia2atk/test) in TEST\_DIR as defined by *machines.py*

Information is also printed to the terminal unless the [-q|--quiet] option is used.

The information normally displayed to the terminal by local\_run.py is dumped in /tmp/uiaqa unless otherwise specified using the [-l|--log] option.

#### "Official Tests"

Currently, the "official tests" are run on the "official" test machines, which are located at Novell in Provo. These are the machines that are found in the *machines.py* in our source code and are only available internally to Novell employees.

We encourage anyone to help us write tests! If you want to submit a test to be added to the official tests and you have not received permission from a [QA hacker]({{ site.github.url }}/Accessibility:_Team "Accessibility: Team") to check patches into our Subversion repository, please e-mail our mailing list (mono-a11y@forge.novell.com) and attach a patch with the following:

-   Sample application modifications (recommended) or new sample application. Not applicable if you are writing a test for an already existing application that does not need modified. *NOTE:* If you are modifying a sample application, make sure it doesn't break any of the existing tests.
-   New or modified Application wrapper. Not applicable if you are writing a test for an already existing application wrapper that does not need modified.
-   Test script
-   Your new test added to *tests.py*

Please only submit one test per e-mail, and begin the subject line with [QA PATCH].

#### Official Test Machine Configuration

The official tests are run on the official test machines in the official lab :), which is located at Novell in Provo. Thus, this information is probably only useful to Novell employees.

The test machines are actually virtual machines (running on VMware Workstation) and are hosted on the physical machines in Provo. Here is a list of the test machines and the physical machines on which they are hosted:

|Platform|Address|VMware Host|
|:-------|:------|:----------|
|openSUSE 11 32-bit|suse32v0.sled.lab.novell.com|d755a.sled.lab.novell.com|
|openSUSE 11 64-bit|suse64v0.sled.lab.novell.com|d755b.sled.lab.novell.com|
|Ubuntu 8.04 32-bit|ubuntu32v0.sled.lab.novell.com|d755c.sled.lab.novell.com|
|Ubuntu 8.04 64-bit|ubuntu32v0.sled.lab.novell.com|d755d.sled.lab.novell.com|
|Fedora 9 32-bit|fedora32v0.sled.lab.novell.com|d755e.sled.lab.novell.com|
|Fedora 9 64-bit|fedora64v0.sled.lab.novell.com|d755f.sled.lab.novell.com|

All of the test machines have a VNC server installed. The host machines have [NX Server](http://www.nomachine.com) installed, which can be connected to using [NX Client](http://www.nomachine.com/download.php); VMware could be running in the background. Running *vmware* will open the backgrounded session. Both the test machines and the VMware hosts have a user *a11y*. For more login details contact a [QA hacker]({{ site.github.url }}/Accessibility:_Team "Accessibility: Team").

Each official test machine has a *tests* directory and a *logs* directory. *TEST\_DIR* in *machines.py* is set to the *tests* directory and *LOG\_DIR* in *machines.py* is set to the *logs* directory.

These directories are, in truth, mounted directories on uiaqa.sled.lab.novell.com.

|Directory|CIFS Share Path|Description|
|:--------|:--------------|:----------|
|*/var/qa/code/test*|*//uiaqa.sled.lab.novell.com/test*|The uia2atk test code is checked out at this location|
|*/var/qa/logs*|*//uiaqa.sled.lab.novell.com/logs*|QA logs, which can be accessed from [http://uiaqa.sled.lab.novell.com/logs/](http://uiaqa.sled.lab.novell.com/logs/)|

*//uiaqa.sled.lab.novell.com/test* is mounted by *TEST\_DIR* and *//uiaqa.sled.lab.novell.com/logs* is mounted by *LOG\_DIR*. As the above table states, the test code (*uia2atk/test*) is checked out at */var/qa/code/test*. This means that the test code can be updated on all test machines by simply running *svn up* at */var/qa/code/test* on *uiaqa.sled.lab.novell.com*. The QA logs for our project are stored in */var/qa/logs,* which is also pointed to by [http://uiaqa.sled.lab.novell.com/logs](http://uiaqa.sled.lab.novell.com/logs). This is where all the "official" logs are stored when our tests are run on the official test machines.

#### QA Architecture Diagram

This diagram summarizes how WinForms testing is performed using Strongwind and the UI Automation test harness.

[![Qa arch.png]({{ site.github.url }}/archived/images/7/75/Qa_arch.png)]({{ site.github.url }}/archived/images/7/75/Qa_arch.png)

### Example Sample Application

Our team does not test a specific application. Instead, our developers are writing code to make sure that Mono WinForms applications are accessible. This means that we can writer our testing against whatever application(s) we wish. The approach we take is to create small and simple "sample applications." Our sample applications can be found in our code repository in the *test/samples* directory.

At this point you should [check out the uia2atk code]({{ site.github.url }}/Accessibility:_Getting_Started_With_Development#getting-the-code "Accessibility: Getting Started With Development") if you haven't already.

After you have checked out the uia2atk code, you can find several sample applications in uia2atk/test/samples. For this example, we will use uia2atk/test/samples/gtk/gtktutorial.py.

Take a moment to run the gtktutorial and familiarize yourself with the it; start to think of how you could write its application wrapper. You will notice that the main window (or frame) has two buttons. The first button opens a tree view window with several parents and children. The second button opens a window with check boxes and a quit button, just like the application from the [Strongwind Basics]({{ site.github.url }}/Accessibility:_Strongwind_Basics) tutorial.

### Example Application Wrapper

As usual, we will begin by writing the application wrapper for our testable application. In this case our testable application will be *gtktutorial.py*. We will begin by writing our \_\_init.py\_\_ file which describes how to open the testable application and then returns an object of it. After completing the \_\_init\_\_.py piece of the application wrapper we will code the second piece (gtktutorialframe.py), which describes how we can interact with the widgets of the testable application.

#### \_\_init\_\_.py

This \_\_init\_\_.py file is very similar to previous ones we have created, and it has the same function: launch the testable application and return an object of it. We begin just like we have in other *\_\_init\_\_.py* examples:

``` python
from strongwind import *
 
from os.path import exists
from sys import path
 
def launchTreeView(exe=None):
    """Launch gtktreeview with accessibility enabled and return a TreeView
    object.  Log an error and return None if something goes wrong"""
```

There is one part, however, that is unique to our UIA QA team. This code is shown below. The purpose of this portion of code is the same as in other examples: make sure we can find the sample application and that it exists. The difference is that now we find the sample application based on where the test file is being run.

path[0] is using sys.path[0], which is "the directory containing the script that was used to invoke the Python interpreter."

So if we execute a test from /home/a11y/uia2atk/test/testers, we know to look for the sample app in ../samples (i.e., /home/a11y/uia2atk/test/samples).

``` python
    if exe is None:
        # make sure we can find the sample application
        harness_dir = path[0]
        i = harness_dir.rfind("/")
        uiaqa_path = harness_dir[:i]
        exe = '%s/samples/gtktreeview.py' % uiaqa_path
        if not exists(exe):
          raise IOError, "Could not find file %s" % exe
```

The remainder of the *\_\_init\_\_.py* code is the same as always:

``` python
    args = [exe]
 
    (app, subproc) = cache.launchApplication(args=args)
 
    treeview = GtkTreeView(app, subproc)
    cache.addApplication(treeview)
 
    treeview.gtkTreeViewFrame.app = treeview
 
    return treeview
 
# class to represent the application
class GtkTreeView(accessibles.Application):
    def __init__(self, accessible, subproc=None):
        'Get a reference to the Tree View window'
        super(GtkTreeView, self).__init__(accessible, subproc)
        self.findFrame(re.compile('^Tree View'), logName='Gtk Tree View')
```

#### gtktutorialframe.py

The second portion of the application wrapper (*gtktutoriaframe.py*) is no different than previous examples. The code below is aggressively documented:

``` python
import sys
import os
 
from strongwind import *
from gtktreeview import *
 
 
# class to represent the main window.
class GtkTreeViewFrame(accessibles.Frame):
 
    # constants
    # the available widgets on the window
    COLUMN_ZERO = "Column 0"
    PARENT_ONE = "parent 0"
    PARENT_TWO = "parent 1"
    PARENT_TREE = "parent 2"
    PARENT_FOUR = "parent 3"
 
    # the ordering of table cell names we expect when we call the
    # findAllTableCells method
    ASCENDING = ('parent 0', 'parent 1', 'parent 2', 'parent 3',
                 'child 0 of parent 0', 'child 1 of parent 0',
                 'child 2 of parent 0', 'child 0 of parent 1',
                 'child 1 of parent 1', 'child 2 of parent 1',
                 'child 0 of parent 2', 'child 1 of parent 2',
                 'child 2 of parent 2', 'child 0 of parent 3',
                 'child 1 of parent 3', 'child 2 of parent 3')
    DESCENDING = ('parent 3', 'parent 2', 'parent 1', 'parent 0',
                  'child 2 of parent 3', 'child 1 of parent 3',
                  'child 0 of parent 3', 'child 2 of parent 2',
                  'child 1 of parent 2', 'child 0 of parent 2',
                  'child 2 of parent 1', 'child 1 of parent 1',
                  'child 0 of parent 1', 'child 2 of parent 0',
                  'child 1 of parent 0', 'child 0 of parent 0')
 
    # Use the constructor to find some of the accessibles we will be testing
    # and store an object for each accessible in a variable that can be used
    # from the test script.
    def __init__(self, accessible):
        super(GtkTreeViewFrame, self).__init__(accessible)
        self.column0 = self.findTableColumnHeader(self.COLUMN_ZERO)
        self.parent0 = self.findTableCell(self.PARENT_ONE)
        self.parent1 = self.findTableCell(self.PARENT_TWO)
        self.parent2 = self.findTableCell(self.PARENT_TREE)
        self.parent3 = self.findTableCell(self.PARENT_FOUR)
 
    # expand accessible by performing an "expand or contract" action.
    # this method will also contract the accessible if used out of order
    def expand(self, parent):
        procedurelogger.action('expand %s.' % parent)
        parent.expandOrContract()
 
    # contract accessible by performing an "expand or contract" action.
    # this method will also expand the accessible if used out of order
    def contract(self, parent):
        procedurelogger.action('contract %s.' % parent)
        parent.expandOrContract()
 
    # perform a click action for TableColumnHeader
    def tchClick (self, thc):
        procedurelogger.action('click %s.' % thc)
        thc.click()
 
    # assert that the accessible has the "contracted" state after performing
    # the "expand or contract" action.  states can be found on the "status" list
    # on the "interface viewer" tab in Accerciser.
    def assertContracted(self, accessible):
        'Raise exception if accessible does not match the given result'   
        procedurelogger.expectedResult('%s is %s.' % (accessible, "contracted"))
        def resultMatches():
            return not accessible.expanded
 
        assert retryUntilTrue(resultMatches)
 
    # assert that the accessible has the "expanded" state after performing
    # the "expand or contract" action.
    def assertExpanded(self, accessible):
        'Raise exception if accessible does not match the given result'   
        procedurelogger.expectedResult('%s is %s.' % (accessible, "expanded"))
        def resultMatches():
            return accessible.expanded
 
        assert retryUntilTrue(resultMatches)
 
    # assert that the sorting of the TreeView is ascending by comparing the 
    # order in which the table cells are found to the order we expect them
    # to be in (self.ASCENDING).
    def assertAscending(self):
        'Raise exception if the sorting of the tree view is not ascending'   
        procedurelogger.expectedResult('TreeView sorting is ascending')
        self.table_cells = self.findAllTableCells(None, checkShowing=False)
        tcs = [table_cell.name for table_cell in  self.table_cells]
 
        def resultMatches():
            self.table_cells = self.findAllTableCells(None, checkShowing=False)
            return tuple(tcs) == self.ASCENDING
 
        assert retryUntilTrue(resultMatches)
 
    # assert that the sorting of the TreeView is descending by comparing the 
    # order in which the table cells are found to the order we expect them
    # to be in (self.DESCENDING).
    def assertDescending(self):
        'Raise exception if the sorting of the tree view is not descending'   
        procedurelogger.expectedResult('TreeView sorting is descending')
        self.table_cells = self.findAllTableCells(None, checkShowing=False)
        tcs = [table_cell.name for table_cell in  self.table_cells]
 
        def resultMatches():
            self.table_cells = self.findAllTableCells(None, checkShowing=False)
            return tuple(tcs) == self.DESCENDING
 
        assert retryUntilTrue(resultMatches)
```

### Example Test Script

The test script is also no different than previous examples. The code below is aggressively documented and should be fairly easy to follow:

``` python
from strongwind import *
from gtktreeview import *
from sys import argv
from os import path
 
app_path = None 
try:
  app_path = argv[1]
except IndexError:
  pass #expected
 
# open the treeview sample application
try:
  app = launchTreeView(app_path)
except IOError, msg:
  print "ERROR:  %s" % msg
  exit(2)
 
# make sure we got the app back
if app is None:
  exit(4)
 
# just an alias to make things shorter
tvFrame = app.gtkTreeViewFrame
 
#expand parent 0
tvFrame.expand(tvFrame.parent0)
sleep(config.SHORT_DELAY)
tvFrame.assertExpanded(tvFrame.parent0)
 
#contract parent0
tvFrame.contract(tvFrame.parent0)
sleep(config.SHORT_DELAY)
tvFrame.assertContracted(tvFrame.parent0)
 
#expand parent 1
tvFrame.expand(tvFrame.parent1)
sleep(config.SHORT_DELAY)
tvFrame.assertExpanded(tvFrame.parent1)
 
#contract parent1
tvFrame.contract(tvFrame.parent1)
sleep(config.SHORT_DELAY)
tvFrame.assertContracted(tvFrame.parent1)
 
#expand parent 2
tvFrame.expand(tvFrame.parent2)
sleep(config.SHORT_DELAY)
tvFrame.assertExpanded(tvFrame.parent2)
 
#contract parent2
tvFrame.contract(tvFrame.parent2)
sleep(config.SHORT_DELAY)
tvFrame.assertContracted(tvFrame.parent2)
 
#expand parent 3
tvFrame.expand(tvFrame.parent3)
sleep(config.SHORT_DELAY)
tvFrame.assertExpanded(tvFrame.parent3)
 
#contract parent3
tvFrame.contract(tvFrame.parent3)
sleep(config.SHORT_DELAY)
tvFrame.assertContracted(tvFrame.parent3)
 
# we should also make sure that clicking on the table header column reorders
# the tree view
 
# evidently, in Gtk the first click just enables ordering
tvFrame.tchClick(tvFrame.column0)
sleep(config.SHORT_DELAY)
# the treeview should still be ascending at this point
tvFrame.assertAscending()
 
# next time we click the sorting should change to descending
tvFrame.tchClick(tvFrame.column0)
sleep(config.SHORT_DELAY)
tvFrame.assertDescending()
 
# and now the sorting should go back to ascending
tvFrame.tchClick(tvFrame.column0)
sleep(config.SHORT_DELAY)
tvFrame.assertAscending()
 
print "INFO:  Log written to: %s" % config.OUTPUT_DIR
 
# close the app using Strongwind's altF4 method (from accessibles.py).
# this is the standard way of closing an application that doesn't have a
# clickable "quit" option., 
tvFrame.altF4(tvFrame)
```

Orca
----

### Requirements

It is recommended that you use a Virtual Machine (VM) for testing. You should take VM snapshots before and after you have it set up for testing Orca so you can easily revert if something goes wrong later.

-   [GNOME](http://www.gnome.org)
-   [Python](http://www.python.org)
-   Enable "Assistive Technologies" from the GNOME Control Center
-   pyatspi (packaged with [AT-SPI](http://ftp.gnome.org/pub/GNOME/sources/at-spi))
-   [uia2atk code]({{ site.github.url }}/Accessibility:_Getting_Started_With_Development#getting-the-code "Accessibility: Getting Started With Development"). The QA-related code is in the test directory. There are short README files in the test directory and each of its subdirectories. Read these README files if you are confused about the files and directories you are seeing. The code can also be checked out anonymously (using subversion) by running *svn co [svn://anonsvn.mono-project.com/source/trunk/uia2atk](svn://anonsvn.mono-project.com/source/trunk/uia2atk)*.
-   Install intltool \>=0.40.0 ([http://ftp.acc.umu.se/pub/GNOME/sources/intltool/0.40/intltool-0.40.3.tar.gz](http://ftp.acc.umu.se/pub/GNOME/sources/intltool/0.40/intltool-0.40.3.tar.gz)).
-   Install Orca revision 4277 (version 2.24.00???) from source (svn co -r 4277 [http://svn.gnome.org/svn/orca/trunk](http://svn.gnome.org/svn/orca/trunk) orca) so you can follow along with the examples. We must check out the code fron svn because the test code is in the svn trunk but it not in the tarballs or source packages. Additionally, we want to make sure we use the same revision on all test machines so we do not get varying test results.
-   Set *orca.debug.debugLevel = orca.debug.LEVEL\_INFO* in your \~/.orca/user-settings.py file. This is explained in [Writing Orca Tests](http://live.gnome.org/Orca/RegressionTesting/WritingTests), which is mentioned below and should be read prior to writing tests for Orca.
-   Install [Accerciser](http://live.gnome.org/Accerciser) from source. [Here](http://bgmerrell.blogspot.com/2008/07/buildling-accerciser-from-source-on.html) are some instructions to do this easily.
-   Install Macaroon by running *configure*, *make*, and *make install* in *accerciser/macaroon*.
-   Add the *uia2atk/test/samples/winforms* (explained later) directory to PATH. You can do this by running *export PATH=/home/a11y/code/uia2atk/test/samples/winforms:\$PATH*. Add it to your profile script (e.g., /etc/profile.local in openSUSE) and log out for universal and permanent affect.

### Testing

Orca already has its own test harness that the Orca team uses to perform regression tests on Orca itself. We will use their harness to execute tests on our own sample WinForms applications to ensure that they are accessible. The documents linked below will help you get familiar with Orca testing. Read them first.

-   [Orca Regression Testing](http://live.gnome.org/Orca/RegressionTesting)
-   [Writing Orca Tests](http://live.gnome.org/Orca/RegressionTesting/WritingTests)

In the *uia2atk/test* directory we have created a directory named *keystrokes*. This is where the Orca test scripts for our WinForms sample applications will reside.

It is fairly simple to use Orca's test harness to execute our test scripts. Logs are stored in a directory whose name is of the form YY-MM-DD\_HH:MM:SS (e.g., 2006-11-29\_20:21:41)

The code below will execute all our test scripts inside the the *uia2atk/test/keystrokes/gtk* directory. To execute all our WinForms test scripts, that path *uia2atk/test/keystrokes/winforms* would be used instead.

Results (as explained in the [Orca Regression Testing](http://live.gnome.org/Orca/RegressionTesting) document) will be stored in the current/working directory unless otherwise specific with the -r option.

``` bash
cd /home/a11y/code/orca/test/harness; ./runall.sh \
-k /home/a11y/code/uia2atk/test/keystrokes/gtk > runall.out 2>&1
```

**Important:** Each directory name inside of the *uia2atk/test/keystrokes/gtk* and *uia2atk/test/keystrokes/winforms* directory is used to execute the application to be tested. Because of this, each directory in the *uia2atk/test/keystrokes/gtk* and *uia2atk/test/keystrokes/winforms* directories should have the same name as the sample application that will be tested. Thus, the keystroke test scripts for that sample application are then stored in the directory that has the same name as the sample application that will be tested by that test script. This is required because Orca runs each application to be tested by issuing the name of each directory in *uia2atk/test/keystrokes/gtk* or *uia2atk/test/keystrokes/winforms* as a command. That is, the ***directory*** *uia2atk/test/keystrokes/gtk/gtktutorial.py* means that Orca will executed the command *gtktutorial.py* when the runall.sh is used and the *uia2atk/test/keystrokes/gtk* is passed as the keystrokes directory argument (-k). This is why we needed to add *uia2atk/test/samples* to PATH (as discussed in the Requirements section).

Additionally, the following code can be used to execute a single Orca tests. Logs are stored in the current/working directory.

``` bash
cd /home/a11y/code/orca/test/harness; ./runone.sh \
/home/a11y/code/uia2atk/test/keystrokes/gtk/gtktutorial/gtktutorial_example_1.py \
/home/a11y/code/uia2atk/test/samples/gtk/gtktutorial.py 0 > runone.out 2>&1
```

For the sake of completeness, it should be noted that Orca's runone.sh script does not require that each directory in the *uia2atk/test/keystrokes/gtk* *uia2atk/test/keystrokes/winforms* directory have the same name as the sample application that will be tested. This is because the application to be tested is specified explicitly. However, we should always give each directory in *uia2atk/test/keystrokes/gtk* and *uia2atk/test/keystrokes/winforms* the name of the sample application to be tested, so runall.sh always runs successfully.

In the above commands, the test output, which is what we are interested to see test results, is redirected using the "\>" character. This is optional. On the official test machines we redirect the test output to the appropriate directory, so it can be viewed easily after the test has been run.

As explained in the [Orca Regression Testing](http://live.gnome.org/Orca/RegressionTesting) document, the 0 that follows gtktutorial.py means that Orca is not running at the time the test is run. Therefore, using the above command, Orca will be started and the test will run. Replacing the 0 with a 1 will execute the test if Orca is already running, however, there are some Orca peculiarities (related to settings) that make this approach more difficult. Using 0 should be fine for all of our tests.

### Test Writing

Gtk applications are already accessible in Linux. Our approach to testing WinForms via Orca will be to:

1.  Create a Gtk application
2.  Create a WinForms application that mirrors the Gtk application. That is, create a WinForms application that uses the same controls (or at least controls that are very similar and have the same accessible roles), text, title, etc., as the Gtk application
3.  Create a keystrokes test (e.g., uia2atk/test/keystrokes/gtk/gtktutorial/gtktutorial\_example\_1.py) for the Gtk application.
4.  Use the keystrokes test to test the WinForms application to ensure that the WinForms application is accessible in the same way that the Gtk application is accessible.

Two directories have been created for this purpose:

**uia2atk/test/keystrokes/gtk:** keystroke tests for Gtk applications
 **uia2atk/test/keystrokes/winforms:** keystroke tests for WinForms applications that mirror the Gtk applications.

Of course, when we run our tests, we will only run the WinForms keystroke tests. We are only saving the Gtk keystroke tests for references, comparison, and examples.

Moonlight
=========

Create Moonlight Sample
-----------------------

We will use Microsoft Visual Studio Silverlight Tools to create test samples in C\#, The steps are:

1.  New a Project with "Silverlight" type, select "Silverlight Application", give project Name to be "control's name + sample" (ButtonSample as example).
2.  Select "Add a new ASP.NET Web project to the solution to host Silverlight", click "OK" button, "ButtonSample" and "ButtonSample.Web" will be created, we will draw page in Page.xaml and write managed code in Page.xaml.cs.
3.  After build Solution, ButtonSample.xap will be created under Bin/Debug, run TestPage.html, Silverlight application is running on web browser [![Silverlight sample.jpg]({{ site.github.url }}/archived/images/c/c7/Silverlight_sample.jpg)]({{ site.github.url }}/archived/images/c/c7/Silverlight_sample.jpg)

Example of create Canvas and Button sample:
 Page.xaml

``` python
<UserControl x:Class="DiggSample.Page"
    xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" 
    xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" 
    Width="400" Height="300">
    <Canvas x:Name="Canvas1" Width="300" Height="300"  Background="Blue">
 
        <Canvas x:Name="Canvas2" Width="260" Height="150" Canvas.Left="20"
 Canvas.Top="20" Background="Chartreuse">
            <Button x:Name="Button1" Content="Button 1" Width="100" Height="50" 
Canvas.Left ="50" Canvas.ZIndex="1" Click="MyButton_Click">
            </Button>
            <Button x:Name="Button2" Content="Button 2" Width="100" Height="50" 
Canvas.Left ="50" Canvas.Top="100"></Button>
        </Canvas>
 
        <Button x:Name="Button3" Content="Button 3" Width="100" Height="50"
 Canvas.Left ="70" Canvas.Top="200"></Button>
    </Canvas>
</UserControl>
```

 Page.xaml.cs

``` python
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
 
namespace DiggSample
{
    public partial class Page : UserControl
    {
        public Page()
        {
            InitializeComponent();
        }
        //give click action to change Button1's content
        void MyButton_Click(object sender, RoutedEventArgs e)
        {
            Button1.Content = "Pushed!";
        }
    }
}
```

 More details plase see [Creating Your First Silverlight Application](http://msdn.microsoft.com/en-us/library/cc838218%28VS.95%29.aspx)

Build Test Environment
----------------------

### Install Mono

-   SVN download Mono and Mcs from svn+ssh://\<username\>@mono-cvs.ximian.com/source/branches/mono-2-6/
-   Build and install Mono
-   SVN download Moon from [svn://anonsvn.mono-project.com/source/trunk/moon](svn://anonsvn.mono-project.com/source/trunk/moon)

### mxap to compile Silverlight samples

-   Build and install Moon
-   Run "mxap" on the sample's folder, assign "--application-name" argument to the class's name, for example: "mxap --application-name=ButtonSample", \*.xap and \*.html will be created
-   You also can run 'make' and 'make clean' on the sample's folder to compile samples

### Manage Firefox

-   Download Firefox from [http://151.155.248.179:8010/job/moonatkbridge\_trunk\_firefox/](http://151.155.248.179:8010/job/moonatkbridge_trunk_firefox/) that is 3.6 version
-   Extract to /var/lib/hudson/workspace/
-   Run "./configure" that will install firefox to /usr/local/

### Install MoonAtkBridge to Make accessible

-   Install moonlight extension from [http://151.155.248.179:8010/job/moonatkbridge\_trunk\_xpi/lastSuccessfulBuild/artifact/moon/plugin/install/novell-moonlight.xpi](http://151.155.248.179:8010/job/moonatkbridge_trunk_xpi/lastSuccessfulBuild/artifact/moon/plugin/install/novell-moonlight.xpi)
-   Install moonlight-a11y extension from [http://151.155.248.179:8010/job/moonatkbridge\_trunk\_xpi/lastSuccessfulBuild/artifact/uia2atk/MoonAtkBridge/novell-moonlight-a11y.xpi](http://151.155.248.179:8010/job/moonatkbridge_trunk_xpi/lastSuccessfulBuild/artifact/uia2atk/MoonAtkBridge/novell-moonlight-a11y.xpi)
-   Run silverlight sample \*.html by /usr/local/bin/firefox
-   Run accerciser, on the left treeview, you may see Sliverlight elements under "Sliverlight Control" are accessibled

UIAutomation Client API
=======================

White
-----

### Introduction

White supports all rich client applications, It is .NET based and hence you wouldn't have use proprietary scripting language. You can use your favourite .NET language, IDE and tools for developing tests/automation programs. White provides consistent object oriented API for all kinds of applications. Also it hides all the complexity of Microsoft's UIAutomation library and windows messages.
 White is a thin wrapper of UIAutomationClient API on Windows that is similar to Strongwind wrap pyatspi on Linux that will be posted to Linux. We will use it to write tests for ClientAPI testing against WinForms, Moonlight and Gtk+ applications.

### Example of start White

``` csharp
using System;
using System.Collections.Generic;
using Core;
using Core.UIItems.WindowItems;
using Core.UIItems;
using Core.Factory;
using Core.UIItems.Finders;
using System.Windows.Automation;
using Nunit;
 
namespace WindowsFormsApplication1
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
 
        [STAThread]
        static void Main()
        {
            Application application = Application.Launch("calc.exe");
            Window window = application.GetWindow("calculator", InitializeOption.NoCache);
            Assert.IsNotNull(window);
            Button button = window.Get<Button>("9");
            button.Click();
 
            List<string> btnNames = new List<string>();
 
            for (int i = 0; i < 20; i++)
            {
                SearchCriteria searchCriteria =
                    SearchCriteria.ByControlType(ControlType.Button)
                    .AndIndex(i);
                IUIItem btn = window.Get(searchCriteria);
                btnNames.Add(btn.Name);
                Console.WriteLine(btn.Name);
            }
 
            application.Kill();
        }
    }
}
```

-   use "Application.Launch("app")" to run an application
-   use "Get\<ControlType\>("Name")" to get element
-   use "SearchCriteria" with some identification to get element
-   use Nunit "Assert" to make sure the implementation is correct
-   More deatils you can see [White Project](http://white.codeplex.com/)
-   Here is a wide used guide from Ben Hall's blog [White:Automated UI Testing](http://blog.benhall.me.uk/2008/02/project-white-automated-ui-testing.html/)

UIA Verify
----------

### Introduction

UIA Verify is a test automation framework that features the User Interface Automation Test Library (UIA Test Library) and Visual UI Automation Verify (Visual UIA Verify), the graphical user interface tool. The framework facilitates manual and automated testing of the Microsoft (R) User Interface (UI) Automation Provider implementation of a control or application. The majority of the UIA Verify functionality is provided through a dynamic link library (e.g., UIATestLibrary.dll) that contains the code for testing specific UI Automation functionality and supports logging of the test results.

UIA verify is similar as Accerciser and UISpy that will be ported on Linux, UIA verify and UISpy can get automation properties and control patterns of controls base on UIAutomation Client API, but Accerciser base on AT-SPI API and it can't do this.

We will use UIA Verify to verify Client API by runing its automation test suits on Linux and Windows to make sure the results are the same for each application(WinForms application for example).

### Automation Test Suit

UIA Verify provides three part of test suits which are "Automation Element Tests", "Control Tests", "Pattern Tests". Here is a simple user guide of using Automation test suit of UIA verify application:

-   Download the lastest UIA verify from [UI Automation Verify](http://uiautomationverify.codeplex.com/SourceControl/ListDownloadableCommits.aspx), and extract the zip
-   Run VisualUIAVerify.exe to get [![UIAVerify01.jpg]({{ site.github.url }}/archived/images/d/d2/UIAVerify01.jpg)]({{ site.github.url }}/archived/images/d/d2/UIAVerify01.jpg)
-   Expand and select element or control what you want to test from left side under "Automation Elements Tree"; Select "Tests" or expand it to select test suits what you want to run ; Then, click "Run Selected Test(s)" or "Run Selected Test(s) On Selected Element and All Children Element(s)" on toolbar under "Texts" to run tests [![UIAVerify02.jpg]({{ site.github.url }}/archived/images/e/e1/UIAVerify02.jpg)]({{ site.github.url }}/archived/images/e/e1/UIAVerify02.jpg)
-   After complete running the selected tests, test results is been showing under "Test Results" panel [![UIAVerify03.jpg]({{ site.github.url }}/archived/images/c/c8/UIAVerify03.jpg)]({{ site.github.url }}/archived/images/c/c8/UIAVerify03.jpg)

UIA Client Api Testing How To
-----------------------------

### What is the UI Automaiton?

Microsoft UI Automation is the new accessibility model for Microsoft Windows and is intended to address the needs of assistive technology products and automated testing tools. UI Automation offers many improvements over Microsoft Active Accessibility.

[![Uia1.jpeg]({{ site.github.url }}/archived/images/e/ea/Uia1.jpeg)]({{ site.github.url }}/archived/images/e/ea/Uia1.jpeg)

### What is the uiaclient used for?

In UI Automation, a core service lies between the server (provider) and the client, The core service makes calls to the interfaces implemented by providers, Client applications gain access to this core service by creating a CUIAutomation object. This object supports a set of client interfaces by which we can access the application by uia client, and test every control's pattern works well.

[![Uia.GIF]({{ site.github.url }}/archived/images/8/82/Uia.GIF)]({{ site.github.url }}/archived/images/8/82/Uia.GIF)

### Requirements

-   **C\#**: the client API was limited to managed code.
-   **White assemblies**: Bricks.dll Bricks.RuntimeFramework.dll Castle.Core.dll Castle.DynamicProxy2.dll log4net.dll nunit.framework.dll White.Core.dll Xstream.Core.dll. (these dlls from [white-0.18-bin](http://white.codeplex.com/Release/ProjectReleases.aspx?ReleaseId=16371))
-   **UI Verify 1.0, UISpy v6.0**: the managed ATs tools.
-   **UIA Client code**: git@github.com:raywang/UIAClientAPI.git.
-   **Testable Application**: the following application include all the patterns we want to test. You should locate the testable application (Keepass.exe ,DockPatternProvider.exe ,WindowAndTransformPatternProvider.exe )in the project's **bin/debug/** directory which also include the test script executable program, then if you run the executable program it will launch the testable application.

##### Keepass.exe:

[http://dl.dropbox.com/u/3874045/KeePass-2.09.zip](http://dl.dropbox.com/u/3874045/KeePass-2.09.zip)

##### DockPatternProvider.exe:

svn co [svn://anonsvn.mono-project.com/source/trunk/uia2atk/test/samples/uiaclient/DockProviderTest.cs](svn://anonsvn.mono-project.com/source/trunk/uia2atk/test/samples/uiaclient/DockProviderTest.cs)

##### WindowAndTransformPatternProvider.exe:

svn co [svn://anonsvn.mono-project.com/source/trunk/uia2atk/test/samples/uiaclient/TransformProviderTest.cs](svn://anonsvn.mono-project.com/source/trunk/uia2atk/test/samples/uiaclient/TransformProviderTest.cs)

(you can use the C\# compiler to make the .cs file to a binary.)

Keepass.exe

[![Keepass.png]({{ site.github.url }}/archived/images/c/c9/Keepass.png)]({{ site.github.url }}/archived/images/c/c9/Keepass.png)

DockPatternProvider.exe

[![DockPatternProvider.png]({{ site.github.url }}/archived/images/1/1b/DockPatternProvider.png)]({{ site.github.url }}/archived/images/1/1b/DockPatternProvider.png)

WindowAndTransformPatternProvider.exe

[![TransformPattern.png]({{ site.github.url }}/archived/images/4/4a/TransformPattern.png)]({{ site.github.url }}/archived/images/4/4a/TransformPattern.png)

### QA Architecture Diagram

We need an application accessible the three applications through UI Automation client. Our application wrapper and test scripts 's framework is shown as follows: [![Uiaclient1.png]({{ site.github.url }}/archived/images/1/15/Uiaclient1.png)]({{ site.github.url }}/archived/images/1/15/Uiaclient1.png)

### Example Application Wrapper

#### TestBase.cs

``` c
[TestFixture]
public class TestBase
```

it tells nunit this class include the test code, so this is the program's entry point for the Nunit .

``` c
[SetUp]
    public void Init ()
    {
        ProcedureLogger.Init ();
        LaunchSample ();
        Thread.Sleep (Config.Instance.MediumDelay);
        OnSetup ();
    }
```

[SetUp]:Every test method will share a group of test objects,we will extract their initialized codes into a Setup method and reuse it in all tests. Init (): do some initiation things and launch sample.

``` c
  [TearDown]
    public void Quit ()
    {
        OnQuit ();
    }
        protected virtual void OnQuit ()
    {
            procedureLogger.Action ("Close the application.");
        procedureLogger.Save ();
    }
```

[TearDown]:When the test method is done, it will clean up the resource. OnQuit (): save the screen shot to a xml file.

``` c
        public Window GetWindow (String title)
    {
        var ae = AutomationElement.RootElement.FindFirst(TreeScope.Children, new PropertyCondition (AutomationElementIdentifiers.NameProperty, title));
        return new Window (ae);
    }
```

GetWindow (String title): we find the testwindow by the RootElement(Desktop).

``` c
        protected void Run (System.Action action)
    {
        try {
            action ();
        } catch (Exception ex) {
            HandleException (ex);
            throw;
        }
    }
        public void HandleException (Exception ex)
    {
        procedureLogger.Action ("Error: " + ex.ToString());
        procedureLogger.ExpectedResult ("A Exception has been thrown.");
        procedureLogger.Save ();
    }
```

Run (System.Action action): the Run action is used to run the appointed test method.

#### Config.cs

get the default configuration from config.xml

#### Config.xml

the default configuration saved in a xml file

``` python
<?xml version="1.0" encoding="utf-8" ?>
<Config xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <KeePassPath>keePass-2.09\\KeePass.exe</KeePassPath>
  <DockPatternProviderPath>DockPatternProvider.exe</DockPatternProviderPath>
  <WindowAndTransformPatternProviderPath>WindowAndTransformPatternProvider.exe</WindowAndTransformPatternProviderPath>
  <RetryTimes>20</RetryTimes>
  <RetryInterval>500</RetryInterval>
  <TakeScreenShots>true</TakeScreenShots>
  <OutputDir></OutputDir>
  <ShortDelay>500</ShortDelay>
  <MediumDelay>4000</MediumDelay>
  <LongDelay>10000</LongDelay>
</Config>
```

#### Element.cs

find all controls by ControlType & name & automationId , To promote a AutomationElement to a certain instance of a class, in order to get more specific methods.=

``` c
        //Find a Element by type.  
        public Element FindByType (ControlType type)
    {
        var cond = new PropertyCondition (AutomationElementIdentifiers.ControlTypeProperty, type);
        AutomationElement control = element.FindFirst (TreeScope.Descendants, cond);
        if (control == null)
            return null;
        else
            return Promote (control);
    }
 
        //Find a Element by name.
        protected Element Find (ControlType type, string name)
    {
        return Find (type, name, string.Empty);
    }
 
        //Find a Element by automationId.
        protected Element Find (ControlType type, string name, string automationId)
    {
        AndCondition cond;
 
        if (automationId == string.Empty) {
            cond = new AndCondition (new PropertyCondition (AutomationElementIdentifiers.ControlTypeProperty, type),
                   new PropertyCondition (AutomationElementIdentifiers.NameProperty, name));
            } else if (name == string.Empty) {
            cond = new AndCondition (new PropertyCondition (AutomationElementIdentifiers.ControlTypeProperty, type),
            new PropertyCondition (AutomationElementIdentifiers.AutomationIdProperty, automationId));
            } else {
            cond = new AndCondition (new PropertyCondition (AutomationElementIdentifiers.ControlTypeProperty, type),
                   new PropertyCondition (AutomationElementIdentifiers.NameProperty, name),
                   new PropertyCondition (AutomationElementIdentifiers.AutomationIdProperty, automationId));
            }
 
        for (int i = 0; i < Config.Instance.RetryTimes; i++) {
            AutomationElement control = element.FindFirst (TreeScope.Descendants, cond);
            if (control != null)
                return Promote (control);
 
            Thread.Sleep (Config.Instance.RetryInterval);
            }
 
        //FindAll Element method
        protected T [] FindAll<T> (ControlType type) where T : Element
    {
        for (int i = 0; i < Config.Instance.RetryTimes; i++) {
            var cond = new PropertyCondition (AutomationElementIdentifiers.ControlTypeProperty, type);
            AutomationElementCollection controls = element.FindAll (TreeScope.Descendants, cond);
            if (controls != null)
                return Promote<T> (controls);
 
            Thread.Sleep (Config.Instance.RetryInterval);
        }
        return null;
    }
 
        //Find the control by the control's type and its name
        public Window FindWindow (string name)
    {
        return (Window) Find (ControlType.Window, name);
    }
 
       //To promote a AutomationElement to a certain instance of a class, in order to get more specific methods.
       protected Element Promote (AutomationElement elm)
    {
        if (elm.Current.ControlType == ControlType.Window)
            return new Window (elm);
        else if (elm.Current.ControlType == ControlType.Button)
            return new Button (elm);
        }
```

``` c
//add a Finder property you can find the AutomationElement by it.
        public Finder ByAutomationId (string automationId)
    {
        conditions.Add (new PropertyCondition (AutomationElementIdentifiers.AutomationIdProperty, automationId));
        return this;
    }
```

the usage of find mehtod:

``` c
var itemViewList = newPassDialog.Find<MyList> ("Items View");
var masterPasswdEdit = createMasterKeyWindow.Finder.ByName("Repeat password:").ByAutomationId("m_tbPassword").Find<Edit> ();
```

#### ScrollBar.cs

there are many control, take ScrollBar for example The ScrollBar class wrap its RangeValuePattern's SetValue method and IsReadOnly property.

``` c
        public class ScrollBar : Element
    {
        public ScrollBar (AutomationElement elm)
            : base (elm)
        {
        }
 
        //the RangeValuePattern's method
        public void SetValue (double value)
        {
            RangeValuePattern rp = (RangeValuePattern) element.GetCurrentPattern (RangeValuePattern.Pattern);
            rp.SetValue (value);
        }
 
        //the RangeValuePattern's property
        public bool IsReadOnly{
            get { return (bool) element.GetCurrentPropertyValue (RangeValuePattern.IsReadOnlyProperty); }
        }
         }
```

#### ProcedureLogger.cs

ouput the info to screen and write it into a xml file

#### Utils.cs

Takes a screenshot of the current action.

### Example Test script

#### Keepass.cs

derive from the Testbase class

``` c
[TestFixture]
    public class KeePassTests : TestBase
    {
        Window window = null;
 
        protected override void LaunchSample ()
        {
            string sample = Path.Combine (System.AppDomain.CurrentDomain.BaseDirectory, Config.Instance.KeePassPath);
            procedureLogger.Action ("Launch " + sample);
 
            try {
                Process.Start (sample);
                procedureLogger.ExpectedResult ("The KeePass window appears.");
            } catch (Exception e) {
                Console.WriteLine (e.Message);
                Process.GetCurrentProcess ().Kill ();
            }
        }
 
        protected override void OnSetup ()
        {
            base.OnSetup ();
            window = GetWindow("KeePass Password Safe");
        }
 
        protected override void OnQuit ()
        {
            base.OnQuit ();
            int pid = (int) window.AutomationElement.GetCurrentPropertyValue (AutomationElementIdentifiers.ProcessIdProperty);
            Process.GetProcessById (pid).Kill ();
        }
 
        //TestCase101 Init Sample, create a new account
        [Test]
        public void RunTestCase101 ()
        {
            Run (TestCase101);
        }
 
        private void TestCase101 ()
        {
            //101.1 Click the "New..." button on the toolbar.
            var toolBar = window.Find<ToolBar> ();
            toolBar.Find<Button> ("New...").Click (false);
            procedureLogger.ExpectedResult ("The \"Create New Password Database\" dialog opens.");
            Thread.Sleep(Config.Instance.ShortDelay);
 
            //101.2 Enter "TestCase101" in the "File Name" combo box of the dailog.
            var newPassDialog = window.Find<Window> ("Create New Password Database");
            var fileNameEdit = newPassDialog.Find<Edit> ("File name:");
            fileNameEdit.SetValue ("TestCase101");
            Thread.Sleep (Config.Instance.ShortDelay);
            procedureLogger.ExpectedResult ("\"TestCase101\" entered in the \"File Name\" box.");
            Assert.AreEqual (fileNameEdit.Value, "TestCase101");
            Thread.Sleep(Config.Instance.ShortDelay);
 
            //101.3 Change the view of list to "Extra Large Icons"
            var itemViewList = newPassDialog.Find<MyList> ("Items View");
            if (itemViewList.GetSupportedViews ().Contains<int> (0))
                itemViewList.SetCurrentView (0);
            Thread.Sleep (Config.Instance.ShortDelay);
            procedureLogger.ExpectedResult ("The current view of the dialog is \"Extra Large Icons\"");
            Assert.AreEqual (itemViewList.GetViewName(itemViewList.CurrentView), "Extra Large Icons");
            Thread.Sleep (Config.Instance.ShortDelay);
 
            ...........................
        }
 
        //TestCase102 Organize the group
        [Test]
        public void RunTestCase102 ()
        {
            Run (TestCase102);
        }
 
                private void TestCase102 ()
        {
                     ...........
                }
    }
```

### OUTPUT

The default output directory is bin/debug, but you can Set the output path "D:/temp/ " (for example) in "Project --\>XXXXX Properties" , the project 's output is as follows:

[![Output1.png]({{ site.github.url }}/archived/images/6/62/Output1.png)]({{ site.github.url }}/archived/images/6/62/Output1.png)

If you open the procedures.xml file you can see the test output shown as html page [![Output2.png]({{ site.github.url }}/archived/images/e/e3/Output2.png)]({{ site.github.url }}/archived/images/e/e3/Output2.png)

Logging Bugs
============

General Guidelines
------------------

-   Remember to log bugs for our product under the "Mono" classification and "UI Automation" product.
-   Set the priority after logging the bug. Use your best estimate, it can be changed later.
-   Do a quick search for duplicates before logging your bug if someone else has worked on the control you are testing.
-   Remember to add a comment with a bug reference (see below) where the bug occurs in your test.

Bug References
--------------

Bug references are a very important way to keep track of bugs that we find while writing our automated tests. A bug reference is simply a comment in our test, where the bug occurs, that has the format BUG[0-9][0-9][0-9][0-9][0-9][0-9]. If the bug affect the test to run successfully, remenber to comment that test case out. For example, here is a code snipped showing a valid bug reference together with test code that finds a bug:

``` python
mtbFrame.phone_text.deleteText()
sleep(config.SHORT_DELAY)
# two deletes should not crash the application BUG465467
#mtbFrame.phone_text.deleteText()
#sleep(config.SHORT_DELAY)
```

The purpose of bug references is to allow us to easily find our tests that were affected by the bug. We do this by simply grepping for the bug reference when verifying and closing bugs after that bug has been fixed. This is useful because when the bug has been fixed, we are able to verify that our test runs successfully and uncomment the test case and correct any deficiencies or problems in our tests that existed because of the bug.

Official Test Machine Setup
===========================

Here are some things that should be done to prepare the official Novell test machines for use. These machines should all be virtual machines. We currently use VMware Workstation 6 to host the VMs. This is only required for the machines in a test lab, not your own personal test machine(s).

-   Turn off the screensaver (using gnome-control-center)
-   Auto login for 'a11y' user
-   Add 'a11y' user to the 'wheel' group
-   Enable use of sudo without a password (see /etc/sudoers)
-   Mount uiaqa.sled.lab.novell.com's "logs" and "tests" directories at boot time (see /etc/fstab on a previous test VM) as described in the Strongwind test harness section above
-   Mount uiaqa.sled.lab.novell.com's "strongwind" directory at boot time. (see /etc/fstab on a previous test VM.) This allows us to keep the Strongwind code up-to-date in a single location instead of having to constantly 'svn up' on the test machines. NOTE: We still need to install Strongwind on the test machines after the code is updated.
-   Install Orca specified in the Orca testing requirements above
-   Install Iron Python (IPCE)
-   Configure static IP and DNS
-   Allow passwordless SSH from qa@uiaqa.sled.lab.novell.com (see /home/a11y/.ssh/authorized\_keys on a previous test VM)
-   Disable all automatic updates and automatic update notifications (this can be done from the control panel)
-   Append "xhost +" to the /home/a11y/.profile file.
-   Install a printer (so the print-related controls tests will run properly)
-   Disable Firefox's "resume from crash" feature. This can be done my browsing to about:config and setting the value of browser.sessionstore.resume\_from\_crash to false.
-   *add more...*

After preparing the machine, take a single snapshot. Name the snapshot after the hostname of the machine (e.g., suse32v0).

Csharp Introduction
===================

We will use C\# to write our samples and tests in Moonlight and ClientAPI test, so What we need to do the first is to study C\#.

Here is a link of a [C\# Introduction PDF](http://www.ecma-international.org/activities/Languages/Introduction%20to%20Csharp.pdf), please download and study it if you need.

