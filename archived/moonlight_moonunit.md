---
layout: obsolete
title: "Moonlight/moon-unit"
lastmodified: '2010-07-05'
permalink: /archived/Moonlight/moon-unit/
redirect_from:
  - /Moonlight/moon-unit/
---

Moonlight/moon-unit
===================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#the-task">1 The Task</a></li>
<li><a href="#how-to-do-it">2 How To Do It</a></li>
<li><a href="#how-to-report-it">3 How To Report It</a></li>
<li><a href="#results">4 Results</a></li>
</ul></td>
</tr>
</tbody>
</table>

The Task
--------

Our moon-unit testsuite was originally written against Silverlight 2. It now needs to be updated so that the tests accurately reflect the behaviour of Silverlight 4. This isn't particularly difficult but is time consuming.

How To Do It
------------

Simplest thing to do is open each test file and modify it so that the set of tests in that file are executed first. For example if I open Grid.cs the file starts with

    namespace MoonTest.System.Windows.Controls
    {
        [TestClass]
        public partial class GridTest : SilverlightTest
        {
            // Tests go here
        }
    }

To make this run first just subclass the test and prepend the name with underscores

    namespace MoonTest.System.Windows.Controls
    {
        [TestClass]
        public partial class ___GridTest : GridTest {
            // Now all the normal grid tests will execute first
        }

        [TestClass]
        public partial class GridTest : SilverlightTest {
            // Tests go here
        }
    }

This means you don't have to wait for 1000's of tests to run before reaching your chosen block of tests.

How To Report It
----------------

As you start working on a directory, add the directory name here. When you've completed the directory, also add it here. For example if i were working on moon-unit/System.Windows.Controls/\*, I would add "System.Windows.Controls" here.

Results
-------

    System.Windows - Done
    System.Windows.Controls - Done
    System.Windows.Controls.Primitives - Done
    System.Windows.Data - Done

