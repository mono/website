---
title: "Accessibility: Reviews"
lastmodified: '2009-06-10'
redirect_from:
  - /Accessibility:_Reviews/
---

Accessibility: Reviews
======================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#accessibility-team-code-reviews">1 Accessibility Team Code Reviews</a>
<ul>
<li><a href="#review-policies">1.1 Review Policies</a></li>
<li><a href="#submitting-review-requests">1.2 Submitting Review Requests</a>
<ul>
<li><a href="#posting-review-request-drafts">1.2.1 Posting Review Request Drafts</a></li>
<li><a href="#publishing-review-requests">1.2.2 Publishing Review Requests</a>
<ul>
<li><a href="#summary">1.2.2.1 Summary</a></li>
<li><a href="#description">1.2.2.2 Description</a></li>
<li><a href="#bugs">1.2.2.3 Bugs</a></li>
<li><a href="#branch">1.2.2.4 Branch</a></li>
<li><a href="#reviewers">1.2.2.5 Reviewers</a>
<ul>
<li><a href="#groups">1.2.2.5.1 Groups</a></li>
<li><a href="#people">1.2.2.5.2 People</a></li>
</ul></li>
</ul></li>
</ul></li>
<li><a href="#the-review-process">1.3 The Review Process</a>
<ul>
<li><a href="#publishing-reviews">1.3.1 Publishing Reviews</a></li>
<li><a href="#replying-to-reviews">1.3.2 Replying to Reviews</a></li>
</ul></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Accessibility Team Code Reviews
===============================

Starting with Phase 2, the Mono Accessibility team uses [Reviewboard](http://www.review-board.org) to handle all code reviews. Reviews are hosted at [http://reviews.mono-a11y.org](http://reviews.mono-a11y.org) , and anybody can make an account there.

Review Policies
---------------

-   All new code must be reviewed before it is committed.
-   Each review must receive two "Ship It" approvals before the patch is committed.
-   Do not include ChangeLog files in your diff.

Submitting Review Requests
--------------------------

### Posting Review Request Drafts

Please place the "post-review" script from uia2atk/tools somewhere in your path. This script has [excellent documentation](http://review-board.org/docs/manual/dev/users/tools/post-review/) for its many features. The simplest use is to call it from within your SVN checkout or git repository.

For Subversion, post-review will post the equivalent of \`svn diff\`. For git (as described in [our git workflow instructions]({{ site.github.url }}/Accessibility:_GitSVN:_Workflow#get-feedback-with-reviewboard "Accessibility: GitSVN: Workflow")), it will post the diff between everything you've committed on your feature branch, and the source SVN branch (trunk, 1.0, etc).

The first time you run \`post-review\`, you will be prompted for your Reviewboard username and password, but your credentials will be cached after that.

If you experience any errors when running post-review, please send them to Brad or Sandy. It would be especially helpful if you could reproduce with the "-d" (debug) option.

Part of the output of \`post-review\` should be a URL for your review draft. You will need to visit that URL and complete your review before publishing it.

    [mono] ~/mono-svn/uia2atk-1.0 @ post-review 
    Review request #72 posted.

    http://reviews.mono-a11y.org/r/72

### Publishing Review Requests

After visiting the Reviewboard URL, you should see at the top a message that says "This review request is not yet public. Be sure to publish when finished." First, double-check that your diff looks correct by clicking the "View Diff" tab. **NOTE: You cannot add comments to your diff at this time; you have to wait until after you have published the review request.** Then, make sure to fill in rest of the review information before publishing it:

#### Summary

A brief explanation of the purpose of your diff.

#### Description

Should contain text similar to a SVN commit message, with perhaps a bit more detail to help the reviewer (if you think it's necessary).

#### Bugs

In most cases there should be one or more bug numbers associated with your diff. Enter them in the form "12345", and they will automatically become links back to Novell Bugzilla. If for some reason your review is about a bug in another bugzilla, leave this blank and include an appropriate link in the description.

#### Branch

Leave this blank, unless the review is meant for a branch like 1.0.

#### Reviewers

##### Groups

Normally, you should select one of "client-dev" for work exclusive to the Client team, "moonlight-dev" for work exclusive to the Moonlight team, or "dev" for work that affects everybody.

##### People

You would normally leave this blank, unless somebody not in the specified group(s) asked to be included in the review.

When you have completed all of the required information, click the "Publish" button.

The Review Process
------------------

### Publishing Reviews

Designated reviewers should receive a "Review Request" email when a review is published. In addition, morbo should announce the new review in \#mono-a11y.

To comment on somebody's diff, follow the link and click the "View Diff" tab. You can add a comment on any line of the diff by clicking on the line number on the "New Change" side. A text box will appear, and you can enter a comment and click Save. You'll see a little bubble over the line number on the far left side, with a number in it representing how many comments that line has. Click to view those comments or edit your own.

After adding any comments, select the "Review" tab. If you have made comments on the diff, you will see those on the page that appears. There should also be text areas above and below your diff comments, if you need to add a summary. Check the "Ship It" check box if you think it is ready to commit, otherwise do not check that box.

When your review is complete (note that you can Save and come back later, or completely Discard your review), click the "Publish Review" button. This should send an email notification to the relevant people.

### Replying to Reviews

This process may go back and forth a few times. Anyone may leave comments on anybody else's review. The submitter can update their diff like so (in this example, the review number is 42):

    post-review -r 42

Note that after updating your review in this way, you must visit the review page and Publish the change.

Once two reviewers have checked the "Ship It" box, the original submitter may commit the diff. After committing, the original submitter should select the "Close" tab, then "Submitted".

