---
title: MoMA
redirect_from:
  - /MoMA/
  - /Moma/
  - /MoMa/
  - /docs/tools+libraries/tools/moma/
---

{% include note.html type='alert' message='MoMA is not updated with data for the latest Mono releases and there are no current plans to do so.' %}

[![Moma2p1.png](/archived/images/5/53/Moma2p1.png)](/archived/images/5/53/Moma2p1.png)

Mono Migration Analyzer

The Mono Migration Analyzer (MoMA) tool helps you identify issues you may have when porting your .Net application to Mono. While Mono aims to be binary compatible with .Net, MoMA helps pinpoint platform specific calls (P/Invoke) and areas that are not yet supported by the Mono project.

While MoMA can help show potential issues, there are many complex factors that cannot be covered by a simple tool. MoMA may fail to point out areas that will cause problems, and may point out areas which will not actually be an issue.

[![Momadownload.png](/archived/images/c/ce/Momadownload.png)](http://www.go-mono.com/archive/moma/Moma2-8.zip)

Other Resources
---------------

-   [Guide: Using MoMA](/docs/tools+libraries/tools/moma/using-moma-guide/)
-   [Guide: Fixing issues MoMA finds](/docs/tools+libraries/tools/moma/issue-descriptions/)
-   [Guide: Run MoMA from command line (automated builds, etc.)](/docs/tools+libraries/tools/moma/command-line-moma/)
-   [Submitted Reports](http://www.go-mono.com/momareports/)
-   [MoMA GIT](https://github.com/mono/moma)
-   [File MoMA bugs](https://bugzilla.novell.com/enter_bug.cgi?alias=&assigned_to=&blocked=&bug_file_loc=http%3A%2F%2F&bug_severity=Normal&bug_status=NEW&cf_foundby=---&cf_nts_priority=&cf_nts_support_num=&cf_partnerid=&comment=Description%20of%20Problem%3A%0D%0A%0D%0A%0D%0ASteps%20to%20reproduce%20the%20problem%3A%0D%0A1.%20%0D%0A2.%20%0D%0A%0D%0A%0D%0AActual%20Results%3A%0D%0A%0D%0A%0D%0AExpected%20Results%3A%0D%0A%0D%0A%0D%0AHow%20often%20does%20this%20happen%3F%20%0D%0A%0D%0A%0D%0AAdditional%20Information%3A%0D%0A%0D%0A%0D%0A&component=MOMA&contenttypeentry=&contenttypemethod=autodetect&contenttypeselection=text%2Fplain&data=&deadline=&dependson=&description=&estimated_time=0.0&flag_type-2=X&form_name=enter_bug&keywords=&maketemplate=Remember%20values%20as%20bookmarkable%20template&op_sys=Other&priority=P5%20-%20None&product=Mono%3A%20Tools%20&qa_contact=&rep_platform=Other&short_desc=&version=unspecified)

Previous Releases
-----------------

The current version of MoMA scans for compatibility with Mono 2.8. If you need to scan against an older version of Mono, you can download these definition files and place them in your Definitions folder.

-   [Mono 2.6](http://www.go-mono.com/archive/moma/defs/2.6-defs.zip)
-   [Mono 2.4](http://www.go-mono.com/archive/moma/defs/2.4-defs.zip)
-   [Mono 2.2](http://www.go-mono.com/archive/moma/defs/2.2-defs.zip)
-   [Mono 2.0](http://www.go-mono.com/archive/moma/defs/2.0-defs.zip)
-   [Mono 1.9](http://www.go-mono.com/archive/moma/defs/1.9-defs.zip)
-   [Mono 1.2.6](http://www.go-mono.com/archive/moma/defs/1.2.6.1-defs.zip)
-   [Mono 1.2.5](http://www.go-mono.com/archive/moma/defs/1.2.5-defs.zip)
-   [Mono 1.2.4](http://www.go-mono.com/archive/moma/defs/1.2.4-defs.zip)
-   [Mono 1.2.3](http://www.go-mono.com/archive/moma/defs/1.2.3-defs.zip)
-   [Mono 1.2.2](http://www.go-mono.com/archive/moma/defs/1.2.2-defs.zip)

As of version 1.2.6, MoMA will not report missing functionality in Design namespaces. These classes are only used when creating an application using a designer such as Visual Studio. They are not used to run your application.

