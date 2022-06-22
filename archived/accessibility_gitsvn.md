---
title: "Accessibility: GitSVN"
lastmodified: '2009-03-29'
redirect_from:
  - /Accessibility%3A_GitSVN/
---

Accessibility: GitSVN
=====================

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#using-git-with-the-uia2atk-svn-module">1 Using git with the uia2atk SVN module</a>
<ul>
<li><a href="#why-use-git-svn">1.1 Why use git-svn?</a></li>
<li><a href="#getting-started">1.2 Getting Started</a>
<ul>
<li><a href="#starting-from-a-bootstrap-repo-recommended">1.2.1 Starting from a bootstrap repo (recommended)</a></li>
</ul></li>
<li><a href="#daily-use">1.3 Daily use</a></li>
<li><a href="#maintaining-the-gitorious-repository">1.4 Maintaining the gitorious repository</a>
<ul>
<li><a href="#create-the-git-repostory-from-scratch-takes-hours">1.4.1 Create the git repostory from scratch (takes hours)</a></li>
<li><a href="#pushing-to-gitorious">1.4.2 Pushing to gitorious</a></li>
</ul></li>
</ul></li>
</ul></td>
</tr>
</tbody>
</table>

Using git with the uia2atk SVN module
=====================================

Why use git-svn?
----------------

Use of git-svn is not a requirement at all, but it can help with a lot of common development tasks that are time-consuming with SVN and ViewVC.

-   Complete repository history locally, works offline, can check history **instantly**.
-   Use git-bisect to rapidly track down the commit that caused a bug you are investigating.
-   Local branching and git-stash are much easier to use when working on separate tasks simultaneously (especially if merging is involved) while waiting for review, compared to generating/applying SVN patches.
-   You can choose to stage and commit only a few of several changes made to one file.

Getting Started
---------------

### Starting from a bootstrap repo (recommended)

There is now a bootstrap git repository at [gitorious.org](http://gitorious.org/projects/uia2atk). The quickest way to get started is to clone that repository, and then get any recent svn updates. First you'll create a new git repository and configure it to work with Mono SVN:

    mkdir uia2atk-git
    cd uia2atk-git
    git svn init svn+ssh://<user>@mono-cvs.ximian.com/source
    #The "git config" commands below are really just another way of editing your .git/config file
    git config svn-remote.svn.fetch trunk/uia2atk:refs/remotes/git-svn/trunk
    git config svn-remote.svn.branches branches/uia2atk/*:refs/remotes/git-svn/branches/*
    git config svn-remote.svn.tags tags/uia2atk/*:refs/remotes/git-svn/tags/*
    git config reviewboard.url http://reviews.mono-a11y.org

Now that you have a repository set up, you can "fetch" the bootstrap repository, and configure it to match up git-svn "remotes" (branches and tags) correctly:

    git fetch git://gitorious.org/uia2atk/mainline.git refs/heads/master:refs/remotes/git-svn/trunk refs/heads/branches/*:refs/remotes/git-svn/branches/* refs/tags/*:refs/remotes/git-svn/tags/*
    git reset --hard git-svn/trunk

Finally, you'll want to take in any changes since the bootstrap repository was created:

    git checkout master
    git svn rebase
    git checkout git-svn/branches/1.0
    git svn rebase
    git checkout git-svn/branches/post-1.0-research
    git svn rebase

(You can actually update everything with one command with \`**git svn rebase --all**\`, but in my testing this takes **90 minutes** on the first run. I believe git-svn is verifying that every single commit in SVN has a mapping in git. The benefit of "--all" is that it also finds new SVN branches and tags. Also, it only takes a few seconds to run after that first long run.)

You are now all set to use your new git-svn repository!

Daily use
---------

For each remote SVN branch you are working on, you will need a corresponding local branch to actually do your SVN commits in. For trunk, the local branch is "master", and is already set up for you. To set up a local branch (1.0) of SVN's 1.0 branch (git-svn/branches/1.0), you can do this:

    git branch 1.0 git-svn/branches/1.0
    git checkout 1.0 #If you want to start working in it

In these local branches ("master" and "1.0" in this case), every commit you make will eventually be mirrored in SVN when you run \`git svn dcommit\`. For that reason and others, you will actually do all of your work in feature branches, and merge them back when it is time to commit to SVN.

This is all documented in our [git-svn daily workflow](/Accessibility:_GitSVN:_Workflow). Please read it very carefully, as it explains how to update, edit, handle reviews, and commit.

Maintaining the gitorious repository
------------------------------------

Only one person on the team needs to care about this stuff, as everybody else can just fetch from gitorious and follow the above instructions.

### Create the git repostory from scratch (takes hours)

If for some reason you need to create a git-svn repository from scratch, this is what I did:

    git svn clone svn+ssh://<user>@mono-cvs.ximian.com/source -T trunk/uia2atk -b branches/uia2atk -t tags/uia2atk
    mv source uia2atk-git
    cd uia2atk-git
    git reset --hard remotes/trunk

### Pushing to gitorious

You cannot push remote branches directly; you must push only local branches. Assuming you have local branches for each SVN remote (for example, "1.0" and "post-1.0-research", "tags/1.1"):

    git push origin master 1.0:branches/1.0 post-1.0-research:branches/post-1.0-research tags/1.1

If you need to delete a branch from gitorious:

    git push origin :myobsoletebranch

Please remember that this gitorious repository is intended as a bootstrap repo for mirroring uia2atk from SVN. Do not push personal git branches to this repository.
