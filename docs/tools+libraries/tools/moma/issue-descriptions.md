---
title: MoMA - Issue Descriptions
redirect_from:
  - /MoMA_-_Issue_Descriptions/
---

There are 4 types of issues that MoMA will detect and report. Here is a description of each, as well as what to do to resolve each type.

Missing Methods
---------------

This is the most severe type of issue. These methods are methods that are not implemented in Mono is any way, not even as stubs. If you try to compile your application that uses these methods with Mono, you will get an error like:

myfile.cs(22,16): error CS0117: 'xxxxxxxxxxxxxxxxx' does not contain a definition for 'xxxxxxxxxxxxxxx'

If you compile your application with MS's compiler, your application will run on Mono until it tries to use the missing method. It will then exit the whole application with an error like:

System.MissingMethodException: Method not found: xxxxxxxxxxxxxxxxxxx

**What to do:**

These method calls must be worked around and removed from your application before you can compile or run on Mono.

Alternatively, you can implement the function yourself in Mono and submit it for inclusion in future version of Mono.

MonoTodo
--------

Methods marked with [MonoTodo] may or may not cause problems for your application. Sometimes a method may be marked with this to remind a developer that some small part is not implemented or to clean it up later. Other times, the method may not be implemented at all and simply will not perform any function. This is generally done to make an application compile and run, even if it missing some functionality.

The detail report may list a specific reason why the method is marked with [MonoTodo]. Going forward, it has been requested that any developer who uses [MonoTodo] provide a reason that can be used for this report. However, numerous pre-existing tags do not have this reason.

**What to do:**

These can probably be ignored in your initial porting. Your application should still run without crashing, however there may be missing functionality. Missing functionality can be fixed by working around Mono's unfinished method, implementing the method yourself, or waiting until the method is completed in Mono.

NotImplementedException
-----------------------

These can be tricky to determine if they are a problem or not. In many cases the methods are not implemented at all, and simply throw a NotImplementedException as soon as they are called. In other cases, the method may only throw the exception under certain circumstances, while most calls work as expected. We would be very interested in any feedback about these issues. If certain methods provide a lot of false positives, we need to come up with a solution to discount them.

**What to do:**

These are pretty much like MonoTodo's. It's a gamble as to whether they will cause you problems or not. Your application will compile just fine under Mono with these issues, and you will need to test your application to see if you need to work around these calls.

P/Invokes
---------

P/Invokes (platform invokes) are used to call functions that are written in unmanaged languages, often times provided by the platform itself (user32.dll, shell32.dll). However, these can also be calls into your own unmanaged libraries. Mono can handle these calls when the unmanaged library is available for the platform you are using, however many times the whole purpose of using Mono is to run on many platforms.

**What to do:**

The long answer is available here: [Interop\_with\_Native\_Libraries](/docs/advanced/pinvoke/).

The summary:

If you are calling something that is provided by your platform (usually the win32 API), you will have to find a way to accomplish the same functionality on all your target platforms. This could mean replacing your unmanaged call with a managed equivalent, or it can mean detecting what platform you are running on and calling the Win32/\*nix/OSX/etc. equivalent.

([http://pinvoke.net](http://pinvoke.net) can sometimes help you find the managed equivalent to Win32 API calls.)

If you are calling into your own native library, then it depends on the cross-platform capabilities of your library. If your native library will work on all your target platforms, then your application should be fine. If not, you can make your native library cross-platform compatible, do the operation in managed code, or work around it by detecting what platform you are running on.

The native library that is being called is listed in the last column on MoMA's detail report.

To find out at runtime which platform your application is running on, see: [FAQ:\_Technical\#How\_to\_detect\_the\_execution\_platform\_.3F](/docs/faq/technical/#how-to-detect-the-execution-platform-3f)

