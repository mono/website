---
title: "Accessibility: Strongwind Basics"
lastmodified: '2010-02-12'
redirect_from:
  - /Accessibility:_Strongwind_Basics/
  - /Accessibility:_Test_Strongwind_Basics/
---

Accessibility: Strongwind Basics
================================

Please read [Getting Started with Strongwind](http://medsphere.org/projects/strongwind/getting_started.html) if you have not already.

This tutorial is not meant to cover all Strongwind features exhaustively. This tutorial is meant to be a decent introduction to enough of Strongwind that the reader can begin writing non-trivial Strongwind tests effectively.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#overview">1 Overview</a></li>
<li><a href="#writing-your-first-script">2 Writing Your First Script</a>
<ul>
<li><a href="#testable-application">2.1 Testable Application</a></li>
<li><a href="#application-wrapper">2.2 Application Wrapper</a>
<ul>
<li><a href="#init-py">2.2.1 __init__.py</a></li>
<li><a href="#gtkcheckbuttonframepy">2.2.2 gtkcheckbuttonframe.py</a></li>
<li><a href="#the-find-functions">2.2.3 the find* functions</a></li>
</ul></li>
<li><a href="#test-script">2.3 Test Script</a></li>
</ul></li>
<li><a href="#running-your-first-script">3 Running Your First Script</a></li>
<li><a href="#tips--tricks">4 Tips &amp; Tricks</a></li>
<li><a href="#what-now">5 What Now?</a></li>
</ul></td>
</tr>
</tbody>
</table>

Overview
--------

Strongwind tests are made up of two basic parts. The first part is an application wrapper. The application wrapper is an abstraction of the application that will be tested. This means that the application wrapper describes the application to be tested. It describes where the application is and what the application contains. The second part is the actual test script. The idea is to make the actual test script as linear and simple as possible. In many cases the application wrapper is used to abstract several calls to Strongwind into a single method that can be called by the test script. The idea is that a single application wrapper can be written for an application and then several tests can be written that use that single application wrapper. If the application ever changes, the application wrapper can be updated and the test scripts should (ideally) remain functional.

For example, suppose you were designing a Strongwind test for an application with two CheckButton widgets. The application wrapper tells Strongwind, "I have a CheckButton application in uia2atk/test/samples/gtk/gtkcheckbutton.py. The application has two buttons, this is how you push them and this is how to check their status." The test script explains, "I want to push this button first, and I expect this to happen." When the test script is executed, it will open gtkcheckbutton.py and execute the test. If, for any step in the test, the expected result does not occur, the Strongwind test fails and a stack trace is printed to the log.

This diagram summarizes how testing is performed using Strongwind.

[![Strongwind arch.png](/archived/images/5/5a/Strongwind_arch.png)](/archived/images/5/5a/Strongwind_arch.png)

Writing Your First Script
-------------------------

### Testable Application

Before proceeding, we need an application accessible application through AT-SPI. Our application wrapper and test scripts will be written for this application. A good way to tell if you can use Strongwind to write automated tests for your application is to use [Accerciser](http://live.gnome.org/Accerciser). Simply run your application and run Accerciser (so both are running at the same time). If your application appears in Accerciser and you are able to navigate through its accessibles. If you are not familiar with Accerciser, [this video](http://www.gnome.org/~eitani/accerciser/screencasts/tour1.ogg) (with audio) might help ([transcript](http://www.gnome.org/~eitani/accerciser/screencasts/tour1.sub)).

As an example, we can use the [checkbutton.py](http://www.pygtk.org/pygtk2tutorial/examples/checkbutton.py) example from the [PyGTK 2.0 Tutorial](http://www.pygtk.org/pygtk2tutorial/).

As you can see below, checkbutton.py is an accessible application: [![checkbutton application in Accerciser](/archived/images/3/35/Checkbutton-accerciser.png)](/archived/images/3/35/Checkbutton-accerciser.png "checkbutton application in Accerciser")

Now we are ready proceed by writing the application wrapper.

### Application Wrapper

As explained above, the application wrapper describes the application to be tested. It creates an abstraction of the application so that efficient test scripts can be written.

For a small application like checkbutton.py, we can easily summarize what our application wrapper will consist of:

The upper check box The lower check box The "Quit" button

Next, we will write a Strongwind application wrapper describing how we can interact with these widgets. At the very least we want to be able to click each one and assert that each click has the result we expect. Each application wrapper normally consists of two files. The first file is *\_\_init\_\_.py*, it describes where the testable application is (in our example the testable explication path can be overridden from the test script) and how to open it. It returns an object of the accessible application to the second file. The second file then describes how we can interact with the widgets of the testable application.

Before proceeding, we want to create a directory in which to store our two application wrapper files. The filename *\_\_init\_\_.py* allows the directory to be imported as a Python module.

#### \_\_init\_\_.py

The first few lines are obvious:

``` python
# descriptive string for pydocs
"""Application wrapper for checkbutton.py"""
 
# import strongwind
from strongwind import *
 
# import any other module's we'll use, should just be ''os'' for this file.
import os
```

Next we create a function that is used to launch the testable application from the test script:

``` python
def launchCheckButton(exe=None):
    """Launch gtkcheckbutton with accessibility enabled and return a CheckButton
    object.  Log an error and return None if something goes wrong"""
 
    # specify the path to the testable application manually if it isn't provide
    # as a function argument
    if exe is None:
        exe = '/home/a11y/uia2atk/samples/gtkcheckbutton.py'
 
    # raise an exception if the path provided does not exist
    if not os.path.exists(exe):
      raise IOError, "%s does not exist" % exe
 
    # see launchApplication in Strongwind's cache.py file to see what is going
    # on here if you need to pass more information (e.g., command-line
    # arguments) to your testable application to start it.
    args = [exe]
    (app, subproc) = cache.launchApplication(args=args)
 
    # get an object of the accessible frame and return it
    checkbutton = GtkCheckButton(app, subproc)
    cache.addApplication(checkbutton)
    checkbutton.gtkCheckButtonFrame.app = checkbutton
    return checkbutton
```

You will notice that this function instantiates an object of a GtkCheckButton class, this class is also defined in *\_\_init\_\_.py*:

``` python
# class to represent the application
class GtkCheckButton(accessibles.Application):
    def __init__(self, accessible, subproc=None):
        'Get a reference to the Check Button window'
        super(GtkCheckButton, self).__init__(accessible, subproc)
        self.findFrame("Check Button")
```

It is **important** to notice this line of code:

``` python
self.findFrame("Check Button")
```

The argument being sent to the *findFrame* method is the name of the accessible. The primary purpose of this code is to find the accessible named "Check Button" that has the "frame" role. In the Accerciser screenshot above, you can see that this search would find the "Check Button" frame.

Once Strongwind finds a matching accessible, it will try to find a class in the application wrapper that corresponds to the accessible. To find the class that corresponds to the accessible, Strongwind will look for a class in the application wrapper with a certain name. By default, the name used in the search query is used to determine the name the class should have. The name used in the search query is transformed (munged) using the steps below. The transformed string is the name of the class that Strongwind will look for in the application wrapper. In summary, the **line of code above actually determines a class we *must* define in the second file of our application wrapper**. It also determines the letter casing (upper case vs. lower case) of the to-be-defined class.

If we had reason to believe that the name of the frame was possibly going to change (which would happen if the developers changed the title of the window), we could consider using a [regular expression](http://docs.python.org/lib/module-re.html) in our search. Suppose the developers changed the title of our testable application's window from "Check Button" to "Check Buttons" or even to "Check Boxes". Using the code below we could avoid any failed searches from these changes because our search would match any accessible with the "frame" role who's name began with "Check".

``` python
self.findFrame(re.compile('^Check'))
```

A new problem arises at this point: If the accessible name changes, the name of our class in the application wrapper will also need to change. This can be avoided, however, by using the *logName* argument in our search:

``` python
self.findFrame(re.compile('^Check'), logName="Gtk Check Button"))
```

or

``` python
self.findFrame("Check Box", logName="Gtk Check Button"))
```

Remember, by default the name used in the search query is used to determine the name of the class we need in our application wrapper. In our code above, we have overridden the default by specifying the *logName* string 'Gtk Check Button'. This means that instead of using the frame name ("Check Button") to determine the class name, we will use "Gtk Check Button" instead. This will be true regardless of the accessible name.

The name of the class is determined by following each of these steps in order:

||Step|Accessible Name Example|logName Example|Extreme Example|
|:--|:---|:----------------------|:--------------|:--------------|
|1|If the *logName* argument is used, use its string value. Otherwise, use the name of the frame.|Check Button|Gtk Check Button|checkButton mainWindow|
|2|Capitalize the first letter in the name if it isn't already|N/A|N/A|CheckButton mainWindow|
|3|Capitalize the first letter following each space if it isn't already ("Button" is already capitalized in this example)|N/A|N/A|CheckButton MainWindow|
|4|Remove any [camel casing](http://en.wikipedia.org/wiki/Camel_case), but leave the first letter of compound words capitalized|N/A|N/A|Checkbutton Mainwindow|
|5|Trim out any whitespace|CheckButton|GtkCheckButton|CheckbuttonMainwindow|
|6|Append "Frame", this will be your class name in your application wrapper|CheckButtonFrame|GtkCheckButtonFrame|CheckbuttonMainwindowFrame|

These steps might seem a little confusing. However, you can simplify the process greatly by choosing a simple, human-readable logName string. For example, "Check Button" becomes "CheckButtonFrame" and "Calculator" becomes "CalculatorFrame". Thus, using *logName* to override the frame name has two benefits. First, if the window titles change in the application you are testing, you don't need to change your class name or file name as long as your regular expression in *findFrame* matches the frame name. Second, you can use a simple *logName* string to simplify the above steps.

If my steps are still confusing, try this script:

``` python
#!/usr/bin/env python
NAME="Gtk Check Button"
x = NAME.split()
for i in range(len(x)):
    x[i] = ''.join((x[i][0], x[i][1:].lower()))
for i in range(len(x)):
    x[i][0].upper()
x = "%s%s" % (''.join(x),"Frame")
print x
```

**The same method is used to determine the filename of our second file, however, one additional step is needed:**

-   Convert the entire string to lowercase

Therefore, our second application wrapper file must be named *gtkcheckbuttonframe.py*.

It is also worth noticing this line:

``` python
checkbutton.gtkCheckButtonFrame.app = checkbutton
```

A complete explanation of why this is needed it not really necessary. It is sufficient to say "you just need it." A better explanation can be found in the *\_\_init.py\_\_* of the example in the Strongwind source code. **Note** that the "gtkCheckButtonFrame" must match the name of "GtkCheckButtonFrame", but with the first character in lowercase.

#### gtkcheckbuttonframe.py

For our example, as explained above, this file must be named gtkcheckbuttonframe.py. Additionally, it must contain a class named *GtkCheckButtonFrame*.

Again, the first line is obvious:

``` python
from strongwind import *
```

Now we define the GtkCheckButtonFrame class. Remember, of course, that this class name will be different for different tests and as dictated by the name of the frame in your testable application or \_\_init\_\_.py.

``` python
# class to represent the main window.
class GtkCheckButtonFrame(accessibles.Frame):
```

A good way to begin the class definition is to specify any constant in your testable application that you will want to use later on. Often, these will be constant strings that can be used to find accessibles based on their names. These names can be found using accerciser; compare the constants below to the Accerciser screenshot above!

``` python
    # constants
    # the available widgets on the window
    CHECK_BUTTON_ONE = "check button 1"
    CHECK_BUTTON_TWO = "check button 2"
    BUTTON_QUIT = "Quit"
 
    # available results for the check boxes
    RESULT_UNCHECKED = "unchecked"
    RESULT_CHECKED = "checked"
    # end constants
```

Next we will create a constructor for the class. We will use the constructor to find some of the accessibles we will be testing and store an object for each accessible in a variable that can be used from the test script. We will find the two check boxes. We do not use the "Quit" button directly from our test script, so we'll worry about it later (we could just as easily worry about it now, though).

``` python
    def __init__(self, accessible):
        super(GtkCheckButtonFrame, self).__init__(accessible)
        self.checkbox1 = self.findCheckBox(self.CHECK_BUTTON_ONE)
        self.checkbox2 = self.findCheckBox(self.CHECK_BUTTON_TWO)
```

Next, we will define some assertion methods. These methods ensure that the actions we perform on the accessibles have the results we expect. An important thing to notice is that Strongwind allows us to determine if an accessible has a specific state by simply doing the following: \<accessible\>.\<state\>. Doing this returns a true or false. This method is used below to see if the accessible passed to the assertChecked and assertUnchecked method has the state "checked." The Accerciser screenshot above shows how to find state information in Accerciser.

``` python
    def assertChecked(self, accessible):
        """Raise exception if the accessible does not match the given result"""
        # log our expected results
        procedurelogger.expectedResult('%s is %s.' % (accessible, "checked"))
 
        # Methods that returns true if the accessible is checked (i.e., has
        # the "checked" state.  Otherwise, it returns false.
        def resultMatches():
            return accessible.checked
 
        # Assert that resultMatches returns true eventually.  retryUntilTrue is
        # a Strongwind function that tries RETRY_TIMES times every
        # RETRY_INTERVAL seconds.  RETRY_TIMES = 20 and RETRY_INTERVAL = 0.5 
        # by default as defined by Strongwind's config.py file.
        assert retryUntilTrue(resultMatches)
 
    def assertUnchecked(self, accessible):
        """Raise exception if the accessible does not match the given result"""
        # log our expected results
        procedurelogger.expectedResult('%s is %s.' % (accessible, "unchecked"))
 
        # Methods that returns false if the accessible is checked (i.e., has
        # the "checked" state.  Otherwise, it returns true.
        def resultMatches():
            return not accessible.checked
 
        assert retryUntilTrue(resultMatches)
```

Next, we define a quit method that can be used to click the "Quit" button and assert that the application has closed. Earlier, it was stated that we would worry about the "Quit" button later. Now is the time for that.

Notice that we both find and perform a "click" action on the quit button in the code below. We get the name of the quit button from the constants we defined above.

Strongwind allows us perform any action supported by an accessible simply by typing \<accessible\>.\<action\>(), similar to how we checked the state of an accessible (using \<accessible\>.\<state\>). Valid actions for an accessible can be found under the "Action" tree on the "Interface Viewer" tab in Accerciser; this is shown in the above screenshot. The above screenshot shows that "click" and "press" are two of the valid actions for an accessible with the "check box" role. There is also a "release" action for accessibles with the "check box" role, but it is not visible in the screenshot. **Important:** If an action is more than one word (e.g., "expand or contract"), then you must transform the action into mixedCase (aka [lowerCamelCase](http://en.wikipedia.org/wiki/Camel_case#Variations_and_synonyms)) when you call the action method. For example, when working with a treeview, a tree cell accessible has the action "expand or contract", to perform this action on the accessible, you would do type \<accessible\>.expandOrContract().

If you try to make an accessible perform an action that it cannot perform, you will get an exception.

 At first, it might be confusing that none of the action methods are defined explicitly in the Strongwind source code. We would expect to find them in Strongwind's *accessibles.py*, but they are not there. The reason for this is that they are defined on-the-fly, meaning they are created dynamically as they are called.

Notice that the *quit* method above called an *assertClosed* method in this (GtkCheckButtonFrame) class. This *assertClosed* method is defined below. Its purpose is to assert that the "Check Button" frame has been closed by the *quit* method above, and to assert that the entire application has exited.

The *assertClosed* method called (twice) below is Strongwind's *assertClosed* method, which simply asserts that windows and applications have been closed. It is defined in *accessibles.py*.

``` python
    def assertClosed(self):
        """ raise exception if the application is still open"""
        # close the checkbutton window (frame)
        super(GtkCheckButtonFrame, self).assertClosed()
 
        # if the checkbutton window closes, the entire app should close.  
        # assert that this is true 
        self.app.assertClosed()
```

#### the find\* functions

The Strongwind approach to finding accessible widgets in your testable application is to use "the find\* functions." The find functions are used to find accessibles by their name (as displayed in the "name" column of Accerciser). As explained in [Getting Started with Strongwind](http://www.medsphere.org/projects/strongwind/getting_started.html), Strongwind's base Accessible class provides find\*() functions for every ATK role. This means that for every role name you see in the "role" column of Accerciser (shown in the above screenshot), you can call find\<RoleNameInCamelCase\>('\<accessible name\>'). Using the above screenshot as a reference we known that we can call *findFrame*, *findCheckBox*, and *findPushButton*. In fact, we used all of these in our application wrapper above!

``` python
# a list of the find* functions we used in our application wrapper
self.checkbox1 = self.findCheckBox(self.CHECK_BUTTON_ONE)
self.app.findPushButton(self.BUTTON_QUIT).click()
self.findFrame(re.compile('^Check'), logName='Gtk Check Button')
```

*Most* find\* functions are defined on-the-fly, similar to the action methods discussed above. Therefore, you won't find most find\* functions defined explicitly in the Strongwind source code. Some find\* functions, however, are unique and are defined explicitly in the source code. Two of the find\* functions defined expliceitly in the source code are *findFrame* and *findDialog* (which is also found in *accessibles.py*), which are unique because they are used to find windows and dialog boxes respectively. Windows and dialog boxes are great candidates for application wrappers, so when we use *findFrame* and *findDialog* we can create a class, which describes the window or dialog we are finding. In fact, we have already done this! Above, we explained that when using *findFrame(re.compile('\^Check'), logName='Gtk Check Button')* we needed to create a class named GtkCheckButton (based on the *logName* string) since we were created a wrapper for that frame. Well, *findDialog* also allows us to do the same thing for an accessible with the role "dialog". That means that if our testable application had a second button that opened a new dialog, we could easily create a wrapper for that dialog by creating a new class and using the naming rules explained under the \_\_init\_\_.py heading.

The keen observer will also notice *findAlert* is in *accesibles.py*. *findAlert* does not act like *findDialog* and *findFrame*, however. *findAlert* is unique because alerts typically have no name, so we have to search for them by their content. Other find\* functions search according to the name of the accessible, not the content.

In addition to the find\* functions, findAll\* functions also exist. They are used just like the find\* functions (there are no special cases like findDialog, findFrame, and findAlert), except they return a list of accessibles that match the search.

The find\* and findAll\* functions have several other parameters aside from name of the accessible for which we are searching. These parameters allow us to alter the default search the default behavior of the find\* and findAll\* functions.

|Parameter|Type|Default|Determines|
|:--------|:---|:------|:---------|
|recursive|bool|True|whether or not to search recursively|
|checkShowing|bool|True|whether or not to include *only* widgets that are showing|
|raiseException|bool|True|whether to return None or to raise an exception if the search returns no results|

Consider a window with several widgets and a scroll bar. As you scroll through the window, some accessibles come into view and others will go out of view. The accessibles that come into view will have the *showing* state and the accessibles that go out of view will not. We must be careful when discussing the *showing* state, because there is also a *visible* state! The *visible* state is much different than the *showing* state, however. It refers to accessibles that are either showing or **would be *showing*** if they came into view; developers can hide widgets so they are not *visible* and thus could never be *showing*. [http://library.gnome.org/devel/atk/unstable/atk-AtkState.html](http://library.gnome.org/devel/atk/unstable/atk-AtkState.html) describes both of these states in detail (see ATK\_STATE\_VISIBLE and ATK\_STATE\_SHOWING); this information is a little beyond the scope of this tutorial. Just remember that an accessible is *showing* if the user can actually see the widget when looking at the GUI at a given point in time.

**Search Tips:** Passing *None* instead of an accessible's name to a find\* or findAll\* function will find accessibles no matter what name they have. Passing "" to find\* or findAll\* will find accessibles with blank names. Thus, passing the argument *None* to a find\* function will match an accessible named "foo" or "", but the argument "" will match an accessible named "" and not "foo". Regular expressions can also be used when using the find\* and findAll\* functions. For exampe, regular expressions could be used to match multiple accessibles (using findAll\*) or to find accessibles who's names might change slightly.

### Test Script

After all this work, the good news is that the test script becomes relatively easy. You will notice that there are no classes or functions; the test is very linear (running top to bottom). You may name this file anything you wish. Let's follow the format used in Strongwind's example directory and name it *gtkcheckbutton\_basic\_ops.py*.

Once again, the first few lines are obvious.

``` python
#!/usr/bin/env python
 
# The docstring below  is used in the generated log file
"""
Test accessibility of checkbutton widget
"""
 
# imports
from strongwind import *
from gtkcheckbutton import *
from sys import argv
from os import path
 
# declare the ''app_path'' variable (to be used later) and initialize it to ''None''
app_path = None
```

This next portion of code is optional because of the way we designed the *launchCheckButton* method in *\_\_init\_\_.py*. It only needs to be included if you would like to have the option of specifying the path to the testable application when running the test script (e.g., *./gtkcheckbutton\_basic\_ops.py /home/a11y/uia2atk/samples/gtkcheckbutton.py*). If this portion is not included, the path specified explicitly in *\_\_init\_\_.py* will always be used.

``` python
try:
  app_path = argv[1]
except IndexError:
  pass #expected
```

Next, we launch the testable application. We also make sure that the launchCheckButton method returns an object like it was supposed to.

``` python
# open the checkbutton sample application
try:
  app = launchCheckButton(app_path)
except IOError, msg:
  print "ERROR:  %s" % msg
  exit(2)
 
# make sure we got the app back
if app is None:
  exit(4)
```

Now we can finally begin testing! Because of all the work we put into the application wrapper, testing should be relatively easy! The test below will click the first check box twice, the second check box twice, and then click the quit button. At each step we check to ensure that the action we perform has the results we expect. (Remember, the *quit* method in gtkcheckbuttonframe.py checks our results too.)

``` python
# just an alias to make things shorter, so we can type cbFrame.checkbox1.click()
# instead of app.gtkCheckButtonFrame.checkbox1.click()
cbFrame = app.gtkCheckButtonFrame
 
# perform a "click" action on checkbox1.  checkbox1 is defined in the
# application wrapper (gtkcheckbuttonframe.py)
cbFrame.checkbox1.click()
# need a short delay between clicking the check box and asserting that the
# check box has been clicked.  this just gives the GUI time to update before
# we assert that it should be changed.
sleep(config.SHORT_DELAY)
# assert that checkbox1 has been clicked/checked.
cbFrame.assertChecked(cbFrame.checkbox1)
 
# perform a "click" action a second time, this should uncheck the checkbox.
cbFrame.checkbox1.click()
sleep(config.SHORT_DELAY)
# assert that checkbox1 has been clicked a second time, i.e., unchecked
cbFrame.assertUnchecked(cbFrame.checkbox1)
 
# do the same thing to checkbox2
cbFrame.checkbox2.click()
sleep(config.SHORT_DELAY)
cbFrame.assertChecked(cbFrame.checkbox2)
 
cbFrame.checkbox2.click()
sleep(config.SHORT_DELAY)
cbFrame.assertUnchecked(cbFrame.checkbox2)
 
# call the application wrapper's quit method (defined in gtkcheckbuttonframe.py)
cbFrame.quit()
```

Finally, we print the location of the logs Strongwind generated for us. Logging is discussed further in the next section, [Running Your First Script](/Accessibility:_Strongwind_Basics#Running_Your_First_Script).

``` python
# tell the user where to find the log
print "INFO:  Log written to: %s" % config.OUTPUT_DIR
```

Running Your First Script
-------------------------

Now that we have finished writing our test script and our application wrapper for our testable application we can execute our test and watch it run!

``` bash
/home/a11y/code/uia2atk/test/testers/gtk/gtkcheckbutton_basic_ops.py
```

Strongwind will log your actions and expected results to the terminal. It will also display any of its own logging information and let you know that it is taking screenshots as it goes. One of the great things about Strongwind is its beautiful and customizable logs. Strongwind takes a screenshot for each action, and expected results can be manually verified when necessary. By default the logs are stored in OUTPUT\_DIR, which is /tmp/strongwind by default. This default can be changed by modifying the OUTPUT\_DIR variable in Strongwind's *config.py*. Before viewing the log, copy all the files from Strongwind's resources directory to your OUTPUT\_DIR; this simply copies over some images and style sheets needed to make the log look pretty--of course, this can all be automated later.

``` bash
cp ~/code/strongwind/resources/* /tmp/strongwind/
```

Then, using your favorite browser, browse to procedures.xml in OUTPUT\_DIR to see the log! [Here](http://www.medsphere.org/projects/strongwind/sample_output/gcalctool-basic-ops/procedures.xml) is the log from Strongwind's gnome-calculator example test.

Tips & Tricks
-------------

-   Using a Python interactive interpreter can be very helpful when trying to debug your problems. I like to test my application wrappers by importing them and calling their methods from the interpreter. You will want to call watchdog.stop(), however, or the watchdog will likely timeout when you're trying to work. You can also increase the WATCHDOG\_TIMEOUT in Strongwind's *config.py*.
-   If you want to debug a test script at a certain point, it's often useful to import pdb and then call pdb.set\_trace() at the point you wish to start debugging. This basically preserves everything and drops you at an interactive python prompt where you can use strongwind function calls to poke and prod at the app (Thanks Jonathan Tai)

 Have your own tip or trick? Add it here or talk to one of the [QA hackers](/Accessibility:_Team "Accessibility: Team") on IRC!

What Now?
---------

Write tests! If you are interested in writing tests for the UIA Mono Accessibility team, read the UIAQA [Testing Howto](/Accessibility:_Testing_Howto "Accessibility: Testing Howto").

