---
layout: obsolete
title: "Moonlight Test Harness"
permalink: /old_site/Moonlight_Test_Harness/
redirect_from:
  - /Moonlight_Test_Harness/
---

Moonlight Test Harness
======================

The Developer Regression Test List (drtlist)
--------------------------------------------

Tests are specified in an XML file called a drtlist. The drtlist should contain a \<DRTList\> root element and each test should be specified with the \<Test\> element. The following attributes can be set on a test. Any other attributes will be ignored.

<table>
<col width="50%" />
<col width="50%" />
<tbody>
<tr class="odd">
<td align="left">id</td>
<td align="left">A readable name to identify the test</td>
</tr>
<tr class="even">
<td align="left">inputFile</td>
<td align="left">Mandatory: The test file, either a .xaml or .htm(l) file</td>
</tr>
<tr class="odd">
<td align="left">masterFile masterFile10 or masterFile11</td>
<td align="left">Mandatory: The master image that the result file will be compared to. If the test does not need an image comparison use &quot;None&quot; as the value for masterFile. Only one of masterFile, masterFile10 and masterFile11 should be specified. In the future, multiple master files will be allowed to test multiple versions of Moonlight.
<p>Master files can be either PNGs or TIFFs. PNGs should be used for simgle image capture tests and TIFFs should be used when multiple images are captured. Each capture will be saved as another layer in the TIFF.</p></td>
</tr>
<tr class="even">
<td align="left">codebehind</td>
<td align="left">A C# codebehind file can be specified for the the 2.0 tests in the format
<pre class="c" style="font-family:monospace;"><code>[, dll name]. For example codebehind=&quot;nested-canvas.cs&quot; or codebehind=&quot;nested-canvas.cs, mylib.dll&quot;
|- valign=&quot;top&quot;
|categories
| A comma separated list of categories that the test is a member of.  Categories are explained further in the Running Tests section.
|- valign=&quot;top&quot;
|expectedError
|The ErrorType of ErrorArgs passed to the error handler when an error is encountered in the test.  If the error does not occur, or the error is of the wrong type the test will fail.  This attribute will only work for xaml tests, since the error handling functionality is built into the html template generated for the .xaml tests.
|- valign=&quot;top&quot;
|knownFailure
|Tests the implement a feature that is known to be broken or not implemented should be marked as a known failure.  Marking tests as a known failure makes it easier to differentiate between failures that are regression and failures that are known.
|- valign=&quot;top&quot;
|failureReason
|Failure reasons should be given for all knownFailures.  This allows people triaging tests to easily understand why tests are failing.
|- valign=&quot;top&quot;
|ignore
|Tests that may hang or crash the test harness should be marked as ignore.  These tests will not be run during a test run.
|- valign=&quot;top&quot;
|ignoreReason
|Tests that are marked as ignored should have a reason assigned to them.
|- valign=&quot;top&quot;
|captureSpecifier
|A capture specifier is normally used for taking multiple screenshots.  The capture specifier is a compacted method of setting the captureInterval maxImagesToCapture and initialDelay.
|- valign=&quot;top&quot;
|captureInterval
|When taking multiple screenshots the captureInterval is the time to wait inbetween captures.
|- valign=&quot;top&quot;
|maxImagesToCapture
|The total number of screenshots that should be captured.
|- valign=&quot;top&quot;
|initialDelay
|The time to wait before beginning image capture.
|- valign=&quot;top&quot;
|captureWidth
|The width of the image to capture.
|- valign=&quot;top&quot;
|captureHeight
|The height of the image to capture.
|- valign=&quot;top&quot;
|imageCompareTolerance
|The tolerance for image comparisons can be overriden with this attribute.  The default tolerance is two percent. To make the comparison 1% you would use imageCompareTolerance=&quot;0.01&quot;.
|- valign=&quot;top&quot;
|xspExecDir
|Some tests may want to have xsp running in the background.  For example tests that attempt to connect to special web handlers or need to interact with an aspx page.  The xspExecDirectory is the directory that xsp should be run from.
|- valign=&quot;top&quot;
|remote
|Some tests may reside on remote file systems / on the web. This flag (valid value is &#39;True&#39;) tells the test harness that it shouldn&#39;t try to modify the test to make it run correctly, nor try to resolve any paths, prepend current directory, etc, which would otherwise be done.
|}
 
== How to run tests ==
 
If you are running the test harness from the moon/test directory there are a couple of make targets you can use:
 
{| border=&quot;1&quot;
|- valign=&quot;top&quot;
|make run-tests
|This will run all of the tests in moon/test/xaml/drtlist.xml that are not marked as ignore or knownFailure.
|- valign=&quot;top&quot;
|make run-all-tests
|This will run all of the tests in moon/test/xaml/drtlist.xml that are not marked as ignore.
|- valign=&quot;top&quot;
|make list-known-failures
|This will list all of the tests marked as knownFailure in moon/test/xaml/drtlist.xml and their reason for failing.
|- valign=&quot;top&quot;
|make run-drtlist
|This will run the drtlist specified in the environment variable DRTLIST, otherwise it&#39;ll work as &#39;make run-tests&#39;
|- valign=&quot;top&quot;
|make run-valgrind
|This will run the drtlist specified in the environment variable DRTLIST with valgrind, otherwise it&#39;ll work as &#39;make run-tests&#39;
|- valign=&quot;top&quot;
|make run-gdb
|This will run the drtlist specified in the environment variable DRTLIST with gdb, otherwise it&#39;ll work as &#39;make run-tests&#39;
|}
 
 
If you are running the test harness outside of the make targets, these options are available to you:
 
{| border=&quot;1&quot;
|-
| -v, -verbose
|Increase the verbosity level.
|- valign=&quot;top&quot;
| --fixture=, -fixtures=
|Specify one or a list of fixtures to run.
|-
| -categories=
|Specify one or a list of categories to run.
|- valign=&quot;top&quot;
| -drtlist=
|Specify the path to the drtlist.  If the drtlist is not specified, the test runner will attempt to load drtlist.xml from the current directory.
|- valign=&quot;top&quot;
| -agviewer=
|Specify the path to the agviewer binary.  If the agviewer binary is not specified, the harness will attempt to find agviewer by searching recursively down from the current directory and using the PATH environment variable.
|- valign=&quot;top&quot;
| -no-console-report
|Disable reporting results to the terminal
|- 
| -html-report, -generate-html-report
|Create an HTML report for the test run
|-
| -run-known-failures
|Run tests marked as known failures
|-
| -list-known-failures
|List tests marked as known failure and their reason for failing.
|-
| -compare-to-moon
|Compare to the moon master files instead of the master files specified in the 
drtlist.
|-
| -valgrind
|Execute moonlight with valgrind. Valgrind will be executed with --tool=memcheck, unless MOONLIGHT_VALGRIND_OPTIONS is set, in which case it will be executed with that value.
|-
| -gdb
|Execute moonlight with gdb. There is currently no way to pass options to gdb. If -valgrind is specified, this flag is ignored.
|-
| -generate-master-files    
|Generate master files to be used with the compare-to-moon option.
|}
 
 
There are two ways of running a subset of the drtlist.xml tests.  You can use categories or specify the tests you would like to use:
 
=== Categories ===
 
Test categories are specified in the drtlist.xml with the categories=&quot;&lt;cat one&gt;,&lt;cat two&gt;,&lt;cat three&gt;,....&quot; attribute.  If a test was both a text test and a brushes test, it&#39;s XML would look like this:
 
     &lt;Test id=&quot;MyTest&quot;
          inputFile=&quot;MyTest.xaml&quot;
          masterFile=&quot;MyTestMaster.png&quot;
          categories=&quot;text,brushes&quot;
      /&gt;
 
Category names are case sensitive strings. A new category can be created by adding it&#39;s name to the categories attribute. Currently these categories are used in our tests:
 
* text
* animation
* brushes
* parser
 
There are two ways of running category tests.  If you are using the make targets mentioned above, the easiest way is to specify the categories with the MOON_DRT_CATEGORIES=&lt;cat name&gt;,&lt;cat name&gt;,... environment variable.  To run the text and animation tests using this variable your command line would look like this:
 
    $ MOON_DRT_CATEGORIES=text,animation make run-tests
 
If you are not using the make targets you can specify the categories you would like to run on the command line with the -categories flag:
 
    $ mono test-runner.exe -categories=text,animation
 
You can also exclude categories, if you want to run all tests except text and brushes tests, you could do:
 
    $ MOON_DRT_EXCLUDE_CATEGORIES=text,brushes make run-tests
 
 
=== Specifying tests ===
 
If you would like to limit a test run to just a single test, or a small set of tests, that aren&#39;t in the same category, you can specify the tests to run.  If you are using the make targets listed above, the easiest way to specify a single or set of tests to run is with the MOON_DRT_FIXTURE=&lt;test id&gt; and MOON_DRT_FIXTURES=&lt;test id&gt;,&lt;test id&gt;,&lt;test id&gt;,... environment variables.  To run tests 2 and 5 using this method your command line would look like this:
 
     $ MOON_DRT_FIXTURES=2,5 make run-tests
 
If you aren&#39;t using the make targets you can specify the tests on the command line with the -fixture or -fixtures flags:
 
     $ mono test-runner.exe -fixtures=2,5
 
Id&#39;s are specified in the drtlist.xml with the id attribute:
 
     &lt;Test id=&quot;2&quot;
          inputFile=&quot;MyTest.xaml&quot;
          masterFile=&quot;MyTestMaster.png&quot;
          categories=&quot;text,brushes&quot;
     /&gt;
 
You can also specify a different drtlist.xml, this will run the drtlist in media/video/drtlist.xml:
 
     $ DRTLIST=media/video/drtlist.xml make run-drtlist
 
=== Using Xvfb ===
When running the test suite, you may be interested in using Xvfb. Xvfb is a virtual buffer that can be used for screen captures instead of your screen. This allows you to continue working while the test suite is running in the back ground. 
Setup the virtual buffer like so:
&lt;pre&gt;
     $ Xvfb -fp /usr/share/fonts/misc -ac -screen 0 1024x1024x24 -nolisten tcp :3
&lt;/pre&gt;
Then in another terminal, run the test suite and redirect the display to the virtual buffer.
&lt;pre&gt;
     $ DISPLAY=:3 make run-tests
&lt;/pre&gt;
 
== While the tests are running ==
 
Depending on the verbosity level and the reporting options, test results will print out on the console as they are completed.  The following legend is for the default verbose level and reporting options:
 
{| border=&quot;1&quot;
|-
|.
|The test passed
|-
|F
|The test failed
|-
|K
|The test was marked as a known failure.
|-
|I
|The test was ignored, either because the master file couldn&#39;t be found, or because it was marked as ignore in the drtlist.
|}
 
If you would like to abort a test run, press the Escape key while a test is running.  This will signal the test harness to stop the run once this test has completed.  If you press the escape key again, it will cause the currently running test to abort.
 
== When the test has finished ==
 
Generally any test will shutdown the browser when it has finished (the test harness waits for the browser to shut down before executing the next test). However, there may be times when you don&#39;t want the browser to shut down when the test has finished (to inspect state, you have other tabs open, etc). In this case you can use the MOONLIGHT_SHOCKER_DONT_DIE flag, which will prevent the browser from shutting down:
 
    $ MOONLIGHT_SHOCKER_DONT_DIE=1 make run-tests
 
== Reading test output ==
 
By default the tests will output a summary of the test run on stdout. The verbosity level will effect the amount of data in the summary.  The verbosity levels are:
 
#Show data from the test plugin
#Show data printed to stderr during the test run
#Show data printed to stdout during the test run
 
If the -html-report option is used (our make targets use this option) there will also be an html_report/ directory created with an html report and all of the master files, result files and image comparison files.   Multiple image capture which are normally saved as tiffs will be converted into a png mosaic of all of the layers of the tiff.</code></pre></td>
</tr>
</tbody>
</table>



