---
title: "Accessibility: Scrum"
lastmodified: '2008-09-16'
redirect_from:
  - /Accessibility%3A_Scrum/
---

Accessibility: Scrum
====================

[Scrum](http://en.wikipedia.org/wiki/Scrum_(development)) is a lightweight Agile development process that is intended to make a project easier to track, and easier to develop for by defining periods (iterations) with a fixed amount of work and a fixed amount of time. A great 5 minute overview is [available](http://www.softhouse.se/Uploades/Scrum_eng_webb.pdf) for those who haven't worked with Scrum before.

Some of its key points are:

Daily Scrum Meetings
--------------------

Traditionally, Scrum meetings are performed in person or over the phone, but given the significant geographical and timezone differences between members of the Mono Accessibility Team, we will try performing these "meetings" via e-mails to the mono-a11y mailing list.

Scrum emails in our team should be sent out at the end of your day (whatever time that may be) and should answer the following questions:

1.  What have you done since your last update?
2.  What do you plan to do between now and your next update?
3.  Is there anything preventing you from doing what you have planned?

These emails should be short and to the point, and shouldn't take longer than 5 minutes to prepare. Here's an example:

    From: Brad Taylor <btaylor@n.com>
    To: mono-a11y@f.n.c
    Subject: Scrum Update for Sept 15

    1. What have you done since your last update?

    I continued working on the FooProvider for FooWidget, and also worked with Jane
    to debug some issues with IBarProvider that she was seeing.

    2. What do you plan to do between now and your next update?

    I will finish up FooProvider, and start working on the events for BazProvider.

    3. Is there anything preventing you from doing what you planned?

    I'm having hardware troubles on my laptop, but I'm working with Bob to get them
    resolved.

Tracking Work
-------------

**NOTE**: Unfortunately, Bugzilla only supports tracking hours for one discipline, so for the time being, only developers will be asked to track hours in Bugzilla.

In order to understand how much work remains, we will be estimating and tracking the actual hours on the work we do. At the same time, we will merge the two work-tracking methods (Bugzilla and the Wiki) into Novell Bugzilla to simplify our process.

Our Bugzilla product contains a few fields that will help us keep track of our time when estimating:

-   When starting work on an issue, verify that the **Orig. Est.** field is filled in. If not, provide an estimate on the issue before you begin work. Estimates should be rounded to the whole hour, and should include time for creating unit tests.
-   At the end of each day, update the **Hours Worked** field on all of the issues you're currently working on.
-   When you are finished with an issue, make sure the **Hours Worked** field is accurate.

Note that it's alright and perfectly normal in the beginning for the actual hours worked to be different than the estimated hours. Producing this data and comparing the estimate versus actual over time will help us become better at estimating.

Iterations
----------

Similar to the iterations that the team currently creates, Scrum iterations are typically longer (2 weeks - 4 weeks). In our team, I'd like us to try out 2 week long iterations to reduce the project management overhead, and take a bit of the strain off the team members.

The Scrum Master traditionally assigns out enough work to keep each team member busy during the iteration. For our iterations, we'll assume that (on average) team members get 6 hours out of 8 to work on their tasks. This will give us 60 hours per person per iteration.

During the course of the iteration, the progress is traditionally tracked using a [Burn-down](http://en.wikipedia.org/wiki/Burn_down_chart) chart which has time on the X axis, and number of hours remaining on the Y axis.
