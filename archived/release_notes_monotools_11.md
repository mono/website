---
title: "Release Notes MonoTools 1.1"
lastmodified: '2010-03-31'
redirect_from:
  - /Release_Notes_MonoTools_1.1/
---

Release Notes MonoTools 1.1
===========================

Version 1.1 of Mono Tools for Visual Studio contains several of the most requested features, as well as many bugfixes.

Mono Tools for Visual Studio 1.1 has a Release Candidate version for VS2010 RC available [here](http://go-mono.com/monovs-download/latest/monotools-1.1.5462.vsix).

(If IE changes the extension to .zip, you will need to change it back to .vsix to install.)

### Automatically Detect Future Updates

MonoTools can now automatically check for new versions, and notify you when a new version is available.

Automatic checking can be enabled or disabled in the Mono options page. A link to manually check is available as well.

[Monotools1-1-b.png](/archived/images/c/c4/Monotools1-1-b.png)

### Smarter Remote File Copying

MonoTools now checks the target server to see if files have changed since the last run. This can result in significantly less time to deploy if most of your content files have not changed between runs.

### Preview of Visual Studio 2010 Support

We are shipping a preview of MonoTools that supports [Visual Studio 2010 RC](http://msdn.microsoft.com/en-us/vstudio/dd582936.aspx). This preview should be feature complete, and everything should work exactly like it does in VS2008. Please [Download Mono Tools for Visual Studio 1.1 Release Candidate](http://go-mono.com/monovs-download/latest/monotools-1.1.5462.vsix) for VS2010 RC and let us know if you find any [bugs](/Bugs)! (Please note: If IE changes the extension to .zip, you will need to change it back to .vsix to install.)

[Monotools1-1-a.png](/archived/images/a/a8/Monotools1-1-a.png)

### Easier Packaging of Precompiled Web Applications

Previously if you wanted to make an RPM out of a precompiled web app, you needed to use VS's Publish feature to make a copy locally and package that. Now there is an option on the packaging files tab that will do this for you.

Note this creates a snapshot copy. If you later make changes and want to package those instead, you will need to choose this option again.

[Monotools1-1-c.png](/archived/images/f/ff/Monotools1-1-c.png)

### Bugfixes and Enhancements

There are also many bugfixes and small enhancements that should provide a better experience when using MonoTools.
