---
layout: obsolete
title: "MoMA"
lastmodified: '2013-01-23'
permalink: /old_site/MoMA/
redirect_from:
  - /MoMA/
  - /Moma/
  - /MoMa/
---

MoMA
====

[![]({{site.github.url}}/old_site/images/5/53/Moma2p1.png)]({{site.github.url}}/old_site/images/5/53/Moma2p1.png)

[![](/skins/common/images/magnify-clip.png)]({{site.github.url}}/old_site/images/5/53/Moma2p1.png "Enlarge")

Mono Migration Analyzer

The Mono Migration Analyzer (MoMA) tool helps you identify issues you may have when porting your .Net application to Mono. While Mono aims to be binary compatible with .Net, MoMA helps pinpoint platform specific calls (P/Invoke) and areas that are not yet supported by the Mono project.

While MoMA can help show potential issues, there are many complex factors that cannot be covered by a simple tool. MoMA may fail to point out areas that will cause problems, and may point out areas which will not actually be an issue.

[![Momadownload.png]({{site.github.url}}/old_site/images/c/ce/Momadownload.png)](http://www.go-mono.com/archive/moma/Moma2-8.zip)

Other Resources
---------------

-   [Guide: Using MoMA]({{site.github.url}}/old_site/Using_MoMA_Guide "Using MoMA Guide")
-   [Guide: Fixing issues MoMA finds]({{site.github.url}}/old_site/MoMA_-_Issue_Descriptions "MoMA - Issue Descriptions")
-   [Guide: Run MoMA from command line (automated builds, etc.)]({{site.github.url}}/old_site/Command_Line_MoMA "Command Line MoMA")
-   [Submitted Reports](http://www.go-mono.com/momareports/)
-   [MoMA SVN](http://anonsvn.mono-project.com/viewvc/trunk/moma/)
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

