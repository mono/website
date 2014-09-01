---
title: "OutputFromConsoleApp"
lastmodified: '2009-05-01'
redirect_from:
  - /OutputFromConsoleApp/
---

OutputFromConsoleApp
====================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#preface">1 Preface</a></li>
<li><a href="#some-code">2 Some Code</a>
<ul>
<li><a href="#a-few-words">2.1 A Few Words</a></li>
</ul></li>
<li><a href="#references">3 References</a></li>
</ul></td>
</tr>
</tbody>
</table>

Preface
=======

It's really useful to able to get some output from a console application, especially on Linux or other UNIX-like system, because there some really powerful command-line tools. Since I didn't find any information how to do this, I'm writing this MiniMini-HOWTO. Let's get some code and explain how it works.

Some Code
=========

``` csharp
// mcs proc.cs
// Outputs the files in the directory where the program is located
 
// defines classes which we're going to use
using System;
using System.Diagnostics;
 
class ProcessOutput {
 
    static void Main () // starting point of the program
    {
        // sets up our process, the first argument is the command
        // and the second holds the arguments passed to the command
        ProcessStartInfo ps = new ProcessStartInfo ("ls", "./");
        ps.UseShellExecute = false;
 
        // we need to redirect the standard output so we read it
        // internally in out program
        ps.RedirectStandardOutput = true;
 
        // starts the process
        using (Process p = Process.Start (ps)) {
 
            // we read the output to a string
            string output = p.StandardOutput.ReadToEnd ();
 
            // waits for the process to exit
            // Must come *after* StandardOutput is "empty"
            // so that we don't deadlock because the intermediate
            // kernel pipe is full.
            p.WaitForExit ();
 
            // finally output the string
            Console.WriteLine (output);
        }
    }
}
```

A Few Words
-----------

There's one thing I want to bring your attention to, look at this call:

``` csharp
p.WaitForExit();
```

This call will cause your application to wait for the process you started to finish. Have in mind, that it will lock up your application. You can avoid this using threads, which will be a subject of another article.

Keep in mind that the process output may be quite large, so calling *p.StandardOutput.ReadToEnd()* is likely a bad idea. In this case you should use *p.StandardOutput.Read()* or *p.StandardOutput.ReadLine()* until you've consumed all output.

References
==========

-   [http:/monodoc/N:System.Diagnostics Documentation]


