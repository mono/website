---
layout: obsolete
title: "Accessibility: GitSVN: Workflow"
permalink: /old_site/Accessibility:_GitSVN:_Workflow/
redirect_from:
  - /Accessibility:_GitSVN:_Workflow/
---

Accessibility: GitSVN: Workflow
===============================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#Daily_Workflow_With_git-svn">1 Daily Workflow With git-svn</a>
<ul>
<li><a href="#Setup">1.1 Setup</a></li>
<li><a href="#Getting_Stuff_Done_with_Feature_Branches_.28aka_Topic_Branches.29">1.2 Getting Stuff Done with Feature Branches (aka Topic Branches)</a></li>
<li><a href="#Understanding_The_Staging_Area_.28aka_The_Index.29_and_git_status.2Fadd.2Fcommit">1.3 Understanding The Staging Area (aka The Index) and git status/add/commit</a>
<ul>
<li><a href="#What_have_I_done.3F_How_to_effectively_visualize_your_changes">1.3.1 What have I done? How to effectively visualize your changes</a>
<ul>
<li><a href="#git_diff">1.3.1.1 git diff</a></li>
<li><a href="#gitk_and_git_gui">1.3.1.2 gitk and git gui</a></li>
</ul></li>
</ul></li>
<li><a href="#Get_Feedback_With_Reviewboard">1.4 Get Feedback With Reviewboard</a>
<ul>
<li><a href="#Posting_Reviews_for_SVN_Branches">1.4.1 Posting Reviews for SVN Branches</a></li>
</ul></li>
<li><a href="#Sharing_Patches_With_SVN_Users">1.5 Sharing Patches With SVN Users</a></li>
<li><a href="#Merging_Your_Feature_Branch_Back_In_Preparation_For_a_Commit_to_SVN">1.6 Merging Your Feature Branch Back In Preparation For a Commit to SVN</a></li>
<li><a href="#Updating_ChangeLog_Files_and_Committing_to_SVN">1.7 Updating ChangeLog Files and Committing to SVN</a>
<ul>
<li><a href="#Set_up_environment_variables">1.7.1 Set up environment variables</a></li>
<li><a href="#ChangeLog_Wrangling">1.7.2 ChangeLog Wrangling</a></li>
<li><a href="#Preparing_a_Commit_Message">1.7.3 Preparing a Commit Message</a></li>
<li><a href="#Committing_Your_Change_to_git">1.7.4 Committing Your Change to git</a>
<ul>
<li><a href="#Using_git_gui">1.7.4.1 Using git gui</a></li>
<li><a href="#Using_the_command_line">1.7.4.2 Using the command line</a></li>
</ul></li>
<li><a href="#For_those_.22oh_crap.22_moments:_undoing_a_git_commit">1.7.5 For those &quot;oh crap&quot; moments: undoing a git commit</a></li>
<li><a href="#DCommitting_Your_Change_to_SVN">1.7.6 DCommitting Your Change to SVN</a></li>
</ul></li>
<li><a href="#Appendix_A:_Branches_of_branches_of_branches_of_branches_.28why_git-cherry-pick_is_your_friend.29">1.8 Appendix A: Branches of branches of branches of branches (why git-cherry-pick is your friend)</a>
<ul>
<li><a href="#When_to_use_git-cherry-pick">1.8.1 When to use git-cherry-pick</a>
<ul>
<li><a href="#Grabbing_latest_updates_from_parent_feature_branch">1.8.1.1 Grabbing latest updates from parent feature branch</a></li>
<li><a href="#Resuming_work_on_feature2_after_feature1_has_been_merged_and_committed_to_SVN">1.8.1.2 Resuming work on feature2 after feature1 has been merged and committed to SVN</a></li>
</ul></li>
</ul></li>
<li><a href="#Helpful_Resources">1.9 Helpful Resources</a></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Daily Workflow With git-svn
===========================

Setup
-----

Before reading this guide, make sure you set up your git repository according to the [Getting Started instructions]({{site.github.url}}/old_site/Accessibility:_GitSVN#Getting_Started "Accessibility: GitSVN").

Your git "master" branch will be associated with the remote git-svn/trunk branch that maps to SVN trunk. If you need to you can create a local branch for each SVN remote branch like this:

    git branch 1.0 git-svn/branches/1.0
    git branch post-1.0-research git-svn/branches/post-1.0-research

You should only ever commit to SVN (git svn dcommit) from your local "master", "1.0", and "post-1.0-research" branches.

Most of this documentation is written assuming you are working with a branch of "master". If instead you are working on a different SVN branch, just replace "master" with the name of your local branch of the remote SVN branch (for example, "git branch myfeature 1.0", not "git branch myfeature master" or "git branch myfeature git-svn/branches/1.0").

**Note:** The latest versions of our cl, clm, and post-review scripts can be found in the 'tools' directory in uia2atk SVN trunk.

Getting Stuff Done with Feature Branches (aka Topic Branches)
-------------------------------------------------------------

For various reasons you should do all of your actual work on feature branches (sometimes called "topic" branches), which you will most likely delete after merging them back to "master" or "1.0" so that you can commit to SVN.

Let's start a new feature for SVN trunk:

    git checkout -b myfeature master

This command creates a new branch called "myfeature" from the master branch, then switches our working copy to the new branch. It is equivalent to these commands:

    git branch myfeature master
    git checkout myfeature

You can see all of your local branches with the \`git branch\` command. Use the -a option if you want to see remote branches, too. The branch you are currently using will be preceded by a "\*".

So now, you go about your work as usual. Periodically, ensure that you have the latest code from SVN:

    git svn rebase

Understanding The Staging Area (aka The Index) and git status/add/commit
------------------------------------------------------------------------

In SVN, modified files show up in \`svn status\` output with a big "M", and you know that if you \`svn commit\` those modifications will be sent to the server.

Git does not work this way. In git, you have your working copy much like in SVN, but modified files do not get committed unless they are in the "staging area" (sometimes referred to as the "index"). You add a modification to the staging area the same way you add a new previously-untracked file: with \`git add\`.

Let's look at an example. Modify some files and then run \`git status\`:

    # On branch myfeature
    # Changed but not updated:
    #   (use "git add <file>..." to update what will be committed)
    #   (use "git checkout -- <file>..." to discard changes in working directory)
    #
    #   modified:   AUTHORS
    #   modified:   README
    #
    # Untracked files:
    #   (use "git add <file>..." to include in what will be committed)
    #
    #   .gitignore~
    #   ChangeLog~

The text is self-explanatory as you become more comfortable with git. We have modified two tracked files, AUTHORS and README. These modifications are \*not\* going to be committed if we run \`git commit\`, because they are not in the staging area. Let's follow the instructions and add one of them with \`git add README\`, then run \`git status\` again:

    # On branch myfeature
    # Changes to be committed:
    #   (use "git reset HEAD <file>..." to unstage)
    #
    #   modified:   README
    #
    # Changed but not updated:
    #   (use "git add <file>..." to update what will be committed)
    #   (use "git checkout -- <file>..." to discard changes in working directory)
    #
    #   modified:   AUTHORS
    #
    # Untracked files:
    #   (use "git add <file>..." to include in what will be committed)
    #
    #   .gitignore~
    #   ChangeLog~

Now we see that README has moved to the staging area ("Changes to be committed"). If we were to run \`git commit\` now, only the changes to README would be committed.

If running \`git add \<yetanotherfile\>\` seems tedious to you, there are other ways to use the command. Try \`git add --patch\`. You can interactively decide what changes you want to stage, and the really neat thing is that you can choose to stage some modifications in a file, but not others **in the same file**.

This \`git add\` thing may seem like an unnecessary extra step, and staging some modifications from a changed file but not others may seem like crack, but consider that one of the strengths of git is the ability to commit frequently. With git, you may find yourself committing almost as frequently as you save. You don't have to worry about using a nice log message or even breaking the build, because these commits are all local to you, and you will clean everything up before you commit it to SVN.

Whenever you feel like committing some staged changes in your feature branch, do so with:

    git commit -m "My message"

### What have I done? How to effectively visualize your changes

#### git diff

The github folks have done a wonderful job of explaining in simple terms how to use git diff to see unstaged changes, staged changes, all changes since your last commit, and all changes from the original branch. Please read this great little guide: [http://learn.github.com/p/diff.html](http://learn.github.com/p/diff.html)

#### gitk and git gui

TODO: Use gitk to visualize committed changes (total repository history). \`gitk --all\` to show all branches, \`gitk \<somefile\>\` to view just that file's history. It can also show blames/annotations. Basically, gitk is a super-fast replacement for viewvc. I recommend everyone keep an up-to-date git repository even if they prefer to use SVN for day-to-day work, just for the ability to run gitk.

TODO: Use git gui to visualize uncommitted changes. You can use this as a commit gui, which is explained later.

Get Feedback With Reviewboard
-----------------------------

Make sure you are familiar with our [code review policy]({{site.github.url}}/old_site/Accessibility:_Reviews "Accessibility: Reviews").

When you're ready for a review, make sure all of your changes are committed in the feature branch, then run \`[post-review]({{site.github.url}}/old_site/Accessibility:_Reviews#Submitting_Review_Requests "Accessibility: Reviews")\` from the feature branch. For git, only committed changes will be included in the Reviewboard diff.

If you experience any errors when running post-review, please send them to Brad or Sandy. It would be especially helpful if you could reproduce with the "-d" (debug) option.

### Posting Reviews for SVN Branches

We have added a custom option to post-review, "--gitsvnparent", which you can use if you are posting a review for one of our SVN branches. For example, if you have SVN remote branch "git-svn/branches/1.0", with associated local branch "1.0", and feature branch "my-1.0-fix", then if you have committed your fix in "my-1.0-fix", you can run \`post-review --gitsvnparent=1.0\` from your feature branch.

Please note that "--gistsvnparent" is not supported by upstream Reviewboard, but [we are working with them](http://code.google.com/p/reviewboard/issues/detail?id=999) to get this feature (or an equivalent) in. Therefore these instructions might change in the future.

Sharing Patches With SVN Users
------------------------------

You may notice that the diffs create by \`git diff\` do not apply correctly in an SVN checkout. To make an SVN-style diff, use the --no-prefix option.

Merging Your Feature Branch Back In Preparation For a Commit to SVN
-------------------------------------------------------------------

So by now, you have committed all of your desired changes in your feature branch, and you have had those changes reviewed. You are ready to commit to SVN. Because we want your change to appear as **one commit** in SVN, we merge in all of the changes at once with the --squash option:

    git checkout master
    git svn rebase
    git merge --squash myfeature

Now all of the changes you made on your feature branch have been applied to your working copy in master, and are staged for commit. It is now time to update your ChangeLog files, commit everything (to git) in a nice SVN-style commit, and then dcommit up to SVN.

Updating ChangeLog Files and Committing to SVN
----------------------------------------------

Sadly, MonoDevelop has no git support, so the process of updating ChangeLog files and generating commit messages is slightly less automated. However, we do have two scripts from Brad (with updates for git from Sandy) that make the process quite nice: cl and clm (found in uia2atk/tools/ in master).

### Set up environment variables

cl requires some environment variables to be set. I recommend adding the following lines to your \~/.bashrc file:

    export CHANGE_LOG_NAME="Joe Awesome"
    export CHANGE_LOG_EMAIL_ADDRESS="jawesome@novell.com"

### ChangeLog Wrangling

The only really manual part of the process is finding each ChangeLog on your own (if you have a way to automate please share!). For each ChangeLog file, do the following:

-   cd to the ChangeLog file's parent directory.
-   Open the ChangeLog file in vim.
-   Type Shift+o to insert at line 0.
-   Type escape, then ":r!cl" to execute the cl script. You may need to delete a blank line inserted at the top.
-   Type "i" to return to edit mode.
-   This should insert a nice template for editing your ChangeLog. If for some reason you have modifications that are not tracked by git, you will see big "WARNING" lines. Please either stage the modifications with \`git add\`, or remove the relevant lines from your ChangeLog template.
-   When you are finished, save your changes by typing escape, then "ZZ".
-   To stage your ChangeLog file modifications, don't forget to \`git add ChangeLog\`.

If you do not like vim, you can replace all but the last step with just copying the output of \`cl\` into your favorite text editor. Just make sure to run \`cl\` from the same directory as the ChangeLog.

### Preparing a Commit Message

When you have finished updating all of your ChangeLog files, you can run \`clm\` from the root of your git repo to see what your commit message will look like (the leading "\#" characters are there so you can quickly quit your editor to abort a commit; you will delete them when you actually commit). If anything seems to be missing, then you probably forgot to \`git add\` one of your ChangeLog modifications.

### Committing Your Change to git

You will now use clm to help you make a SVN-style commit into your git repo, in preparation for dcommitting to SVN. Remember, you can only run clm from the root of your git repo.

#### Using git gui

If you would like a convenient way to view all your diffs before you hit the "commit" button, you should try \`git gui\`. Copy the output of clm and paste it into the Commit Message box in git gui. You can click on files in the Staged Changes list to see the diffs that are going to be committed. When you are ready to commit to git, delete the leading "\#" in each line of your commit message, and click the Commit button.

#### Using the command line

*NOTE*: clm updated on April 9th, please make sure you are using the latest version.

From the root of your git repo:

-   Run \`git commit\`
-   In the vim prompt, type escape then ":r!clm"
-   Uncomment lines that you want to appear in the commit message by deleting the leading "\#" (delete any extra blank lines, too)
-   Type escape then "ZZ" to save your message, exit vim, and complete the commit

### For those "oh crap" moments: undoing a git commit

Uh oh, you accidentally made a commit to the wrong git branch! Or, you realized at the last minute that this change you were about to dcommit to SVN is not correct. Or you accidentally did a git-style commit directly to master, because you forgot to checkout your feature branch. Let's fix that!

In the resources section you'll find a great little article on how to undo all sorts of changes in git (staged, unstaged, committed, etc). The summary for undoing a recent commit is that you find the commit hash of the commit that you \*want\* to be at the top with:

    git log --pretty=oneline

Then you reset your repository to go back to that commit:

    git reset --hard 43a5e690  #Use the first 8 characters of the desired hash

Any commit that was listed above this one is now completely gone.  :-)

**IMPORTANT**: Never use this to undo commits that are already in SVN! You will break everything if you do.

### DCommitting Your Change to SVN

Now that your change has been committed to git (and you can verify it using \`git log\` or gitk, as you like), it is time to dcommit to SVN.

    git svn rebase  #Just to be sure :-)
    git svn dcommit

Congratulations! You committed to SVN from git!

If you like, you may now delete your feature branch:

    git branch -D myfeature

Appendix A: Branches of branches of branches of branches (why git-cherry-pick is your friend)
---------------------------------------------------------------------------------------------

You may find yourself in a situation where you are waiting for review of feature1, but need to start working on feature2, which depends on feature1. So you do something like this:

    git checkout -b feature1+2 feature1

Here are some fun facts about this arrangement:

-   In gitk --all, you'll see that both feature1 and feature1+2 are branched directly off of trunk, with identical commits (feature1+2 does not appear to be branched off of feature1 as you might expect).
-   If, during the course of review, you make updates to feature1, a simple \`git merge\` is probably not going to work to get those changes into feature1+2.
-   Once you have squash-merged feature1 into master, and committed to trunk, your feature1 and feature1+2 branches will break if you try to \`git svn rebase\` in them.

How do we resolve this seemingly hopeless situation? The answer is to use git-cherry-pick.

"Cherry-picking" means copying a single commit from one branch into your current branch. Now I will explain the best way to use it in some common situations.

### When to use git-cherry-pick

#### Grabbing latest updates from parent feature branch

You have branched feature1+2 from feature1, which is going through the review process. You have recently committed changes to feature1 which you want in feature1+2. You should:

-   Make sure you have no uncommitted changes in feature1 or feature1+2
-   \`git svn rebase\` in feature1 and feature1+2
-   git checkout feature1+2
-   gitk --all
-   Find the commits you want in the feature1 branch, right-click, and select "Cherry-pick this commit"

#### Resuming work on feature2 after feature1 has been merged and committed to SVN

You branched feature1+2 from feature1, and now feature1 has been reviewed, merged into master, and committed to SVN. The problem now is that because we use squashed merges, the history of master and of feature1+2 will conflict (because many commits from feature1 were squashed into one commit in master). Here is one way to fix the problem:

-   git checkout master
-   git svn rebase
-   git checkout -b feature2 (we are creating a brand new branch!)
-   gitk --all
-   Find the feature2-related commits in the older feature1+2 branch, right-click, and select "Cherry-pick this commit"
-   \`git diff feature1+2 feature2\` to verify that everything in the new feature2 branch looks correct (only changes should be ChangeLog files from the commit to master before dcommitting to SVN).
-   git branch -D feature1+2

Helpful Resources
-----------------

-   [http://www.viget.com/extend/effectively-using-git-with-subversion/](http://www.viget.com/extend/effectively-using-git-with-subversion/) - An easy-to-understand git-svn workflow.
-   [http://book.git-scm.com/index.html](http://book.git-scm.com/index.html) - The git community book
-   [http://learn.github.com/p/diff.html](http://learn.github.com/p/diff.html) - An easy-to-understand explanation of how to use \`git diff\` when dealing with untracked, unstaged, or uncommitted changes
-   [http://learn.github.com/p/undoing.html](http://learn.github.com/p/undoing.html) - Undoing changes is a little more complicated than a simple \`svn revert\`.
-   [http://learn.github.com/p/git-svn.html](http://learn.github.com/p/git-svn.html) - A page that explains git-svn simply, in case you feel like you don't quite have your head wrapped around the concept yet.
-   [http://www.gitready.com/](http://www.gitready.com/) - A great set of articles on beginner, intermediate, and advanced features of git.
-   [http://git.or.cz/course/svn.html](http://git.or.cz/course/svn.html) - See the git equivalent of common svn commands


