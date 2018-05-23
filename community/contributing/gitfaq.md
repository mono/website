---
title: GitFAQ
redirect_from:
  - /GitFAQ/
  - /GitSVN/
---

Availability
============

Mono is using GitHub's [Organizations](https://github.com/blog/674-introducing-organizations) functionality which allows us to keep all of the Mono modules that used to be hosted on our Subversion repository as repositories of the **mono** organization on GitHub.

The Mono organization is available at [https://github.com/mono](https://github.com/mono)

Windows Users
=============

To get started with Git on Windows, you can follow GitHub's [tutorial on Git on Windows](http://help.github.com/win-git-installation/)

Workflow
========

Since "git push" can have unintended consequences, only core developers will be given "git push" access to the repositories at GitHub.

Contributors are encouraged to fork their trees on GitHub and send a "pull request" to the maintainer of a given module.

We might have missed some core contributors on the first batch that granted push access to the Mono repositories. If we missed you, please contact us to get this fixed.

All git commands support a "-n" option, which will do a dry run of the command. When doing "git push", do try "-n" first to make sure what's getting pushed is correct.

For quick recipe to checkout, make your changes, and commit them, this [introduction](http://nakedstartup.com/2010/04/simple-daily-git-workflow/) is also useful.

Workflow 1: Working on master
-----------------------------

After cloning, when working directly on the master branch, the workflow is pretty simple: commit your changes, update your local master with the latest changes from the remote repo, then push your commits.

``` bash
git commit
git pull --rebase
make check     # ensure that the newly pulled commits didn't cause trouble
git push
```

The `git push` will fail if you're not up-to-date: for instance, if there was some commit activity during your `make check`. You might have to repeat the `git pull --rebase && make check && git push` cycle a couple of times if there is a lot of simultaneous commit activity.

**Note:** If you use `git pull` without `--rebase`, and there have been commits on the repository since you last pulled, you might end up with an extra commit that says:

``` bash
Merge branch 'master' of git@github.com:/mono/repo
```

This is a merge commit, and our policy is to avoid these for pushes with a small number of commits, especially for single commit pushes. So use `git pull --rebase`, and remember to make sure you're not pushing merge commits (check this [FAQ entry](/community/contributing/gitfaq/#how-do-i-know-whats-going-to-be-pushed))

Workflow 2: Use 'master' as integration branch
----------------------------------------------

If you have multiple small pieces that you're working on simultaneously, you can use a few local branches to maintain them independently, and switch among them when you want to switch mental context. Since it is an useful mode of operation, it might make sense to use this workflow even if you have only one thing you're working on, so that you're comfortable with the workflow.

To work on a local branch based off the `master` branch:

``` bash
git checkout -b work-on-topic master
```

This creates a branch called 'work-on-topic' which sprouts from the `master` branch, and checks it out automatically.

In this branch, apply all the commits you want. You can periodically ensure that it is off the latest `master` by doing:

``` bash
# refresh master
git checkout master
git pull
 
# checkout your branch and rebase to get the new commits
git rebase master work-on-topic
```

When you're ready to push it out to the world:

``` bash
# refresh master
git checkout master
git pull
 
# checkout your branch and rebase to get the new commits
git rebase master work-on-topic
 
# build and test again to make sure everything is correct
make check
 
# merge topic branch
git checkout master
git merge work-on-topic
git push
 
# delete the branch now that we're not working on it (optional)
git branch -d work-on-topic
```

If `git push` fails, it's because your master is not up to date. Refresh it with `git pull --rebase`, do `make check` and then you can try `git push` again.

Branches are useful to isolate several pieces of work, so you can have some changes on one branch that relate to a certain feature, other changes on another branch for another feature, while master is left clean and pristine, just updated with the latest commits from upstream and used, in this workflow, when you're ready to push your changes.

Once you're working on branches instead of master, always update the branches by first going into master and updating it with git pull, then going into your branch and doing git rebase master, as detailed above. This is important to make sure no merge commits appear on your commit history. If, when you're ready to push, master is more up to date than your branch, don't forget to rebase your branch before merging into master and pushing, to avoid merge commits.

 It is easy to extend the workflow to merge our changes onto multiple integration branches (backporting).

### Backports

Suppose you decide that your changes in the current branch need to be applied to an older maintenance branch, `mono-2-6`. There are multiple ways to achieve this. However, in the spirit of the rest of this workflow, we describe a merge-avoiding workflow for backports. We can create a parallel backport branch with:

``` bash
git checkout -b backport-work-on-topic work-on-topic
git rebase --onto mono-2-6 master
```

This creates a clone, `backport-work-on-topic`, of the original set of commits on `work-on-topic`, but rebased to be on `mono-2-6`, i.e., a backport. Note that this cloned branch is independent of the original branch, and any additional changes to `work-on-topic` need to be separately applied to `backport-work-on-topic`.

Note also, that this is meaningful only *before* `work-on-topic` has been merged into `master`. A bit more manual work is involved after it's been merged, since our merge-avoiding workflow hides the branch-point of the branch. You might just need to count up the number of commits introduced in `work-on-topic` and, say you have 5 commits, use `work-on-topic~5` instead of `master` in the command above. Or, you can use `git cherry-pick`.

Workflow 3: Long-term projects
------------------------------

Suppose you're embarking on a long-term project, like working on a new GC, new IR, or other major re-architecture of the code. In such a case, it is detrimental to productivity to always keep up-to-date on the latest changes in the tree, unless we want some crucial bug-fixes. This workflow, like workflow 2, uses branches.

``` bash
# start at a tag, since it is a well-tested base,
# rather than at some random point in history
git checkout -b long-lived-topic mono-2.8.0
```

You then work on the `long-lived-topic` and add commits to your heart's content.

Once you're ready to integrate to 'master' and push it out to the world, you do the following at a quiet time on the tree:

``` bash
git checkout master && git pull
 
git merge long-lived-topic
make check
 
git push
```

If the push failed, it's not a quiet time: throw away the merge with: `git reset --hard HEAD^`

This procedure will create merge commits, so if you do this, make sure you're merging a large enough feature that it merits having a full merge commit: i.e., has more than a few commits, is a visible feature which merits a release note, and/or has significant testing which would be lost if you rebase.

### Maintaining the branch: Throwaway merges

Often, you want to verify that your branch is easily merge-able into the current development branch, without actually committing it. You can use a throwaway merge, described below. It helps to have git configuration variable 'rerere.enabled = true' for this step.

``` bash
git checkout long-lived-topic
git merge master
 
# at this point you've resolved any conflicts, and 'git rerere' has recorded
# your conflict resolution decisions.  We can throw away the merge since it
# would clutter history.  'git rerere' already has the relevent information
# from the merge attempt.
 
# throw away the merge
git reset --hard HEAD^
```

If you actually wanted a bugfix from 'master', just skip the last step, while keeping in mind that you also get tons more changes along with the bugfix. IOW, if you choose to keep this merge, it becomes a sync point and a major event in the history of this branch. All future merges will use this as the reference point. So, it's suggested that you keep merges only if 'master' is in a well tested state.

### Publishing the long-lived topic: Public Forks on Github

If you want to publish the long-lived topic without integrating it into 'master', you should use a personal fork.

This process is fairly efficient on Github. Go to the repository webpage and create a fork in your personal workspace. For instance, you take an origin repository `git://github.com/mono/mono.git` and fork it into `git@github.com:myrepos/mono.git` by going to `https://github.com/mono/mono` and clicking on the button marked "Fork".

You can add your personal fork as an additional remote with

``` bash
git remote add myrepos git@github.com:myrepos/mono.git
```

(You can write to your personal fork, even if you can't write to the origin repository)

now, publish your long-lived-topic to this using

``` bash
git push myrepos long-lived-topic
```

If you don't expect anyone else to be writing to 'myrepos', you don't need to pull from 'myrepos' at all; you just need to repeat the above `git push` at appropriate times to publish further snapshots. So, this has fairly small impact on your day-to-day workflow.

On the other hand, if you have collaborators on your published branch, including yourself on another machine, you can use workflows 1 and 2 to manage this branch.

Frequently Asked Questions
==========================

I don't see a mcs module
------------------------

The mcs module is now part of the mono module.

My commits are not linked to my GitHub Account
----------------------------------------------

If your commits to Mono are not linked from your GitHub account, you probably have not registered a public email address with GitHub.

Use `git show <commit-id>` on a commit which you know belongs to you. Now, the e-mail id in the "author" field is the one that GitHub uses to identify committers. So, you need to add that e-mail id as an alternative address to your GitHub account, and eventually your commits will be linked to you.

What tool was used to convert from SVN to GIT?
----------------------------------------------

We used a [heavily-modified version](http://gitorious.org/~harinath/svn2git/rrh-svn2git) of the KDE project's svn2git. Most of the modifications were to improve the fidelity of the import, and some more were to introduce a fairly convenient incremental import mode. The tool does a fair job of handling all the varied branch-handling haps and mishaps in the mono SVN tree.

How can I tell GIT to push from my tracking branch ?
----------------------------------------------------

Add this to `.git/.config`:

``` bash
[push]
        default = tracking
```

Now when you push (without arguments) while on a tracking branch, your tracking branch will be pushed to the appropriate branch on the remote.

I.e. if you have

``` bash
git checkout master-2.6 origin/mono-2-6
```

then if you are on master-2.6,

``` bash
git push
```

will push to mono-2-6 at origin.

I get an ambiguous warning when checking out a branch
-----------------------------------------------------

When you try to checkout a local branch, you get a

``` bash
warning: refname 'branch-name' is ambiguous
```

This can happen if you've created a local branch with the same name as a remote tag. Git should be checking out your local branch, but instead it's trying to checkout the tag, and it gets confused.

The initial import of several trees were problematic, since they contained identically named branches and tags. We have since addressed a lot of these issues, by renaming away the tags.

If you cloned the repos before Jul 23, you'll need to refresh your tags (assuming you don't want to reclone the repos).

``` bash
# careful!!! dangerous if you have any _local_ tags
# This deletes all tags on your local checkout
git tag | xargs -n1 git tag -d
 
# now refresh tags from the remote
git fetch origin --tags
```

In general, when creating tags, be careful not to have names that conflict with existing (local or remote) branches.

After forking the official repo and cloning my fork, the branch I want to check out doesn't seem to exist
---------------------------------------------------------------------------------------------------------

A `git clone` only sets up one local branch, `master`, which tracks the origin repository. If you try to checkout any of the other branches, you might get

``` bash
$ git checkout mono-2-6
error: pathspec 'mono-2-6' did not match any file(s) known to git.
```

You need to set up a local tracking branch, with:

``` bash
git checkout -t origin/mono-2-6
```

This sets up a local tracking branch `mono-2-6` that tracks the `mono-2-6` branch of the remote `origin`. More importantly, since we spell out `mono-2-6` only once, we won't have accidental spelling errors confusing us at a later time.

When merging between branches, there are frequent conflicts in the ChangeLog files
----------------------------------------------------------------------------------

Use [this](http://git.savannah.gnu.org/gitweb/?p=gnulib.git;a=blob;f=lib/git-merge-changelog.c) ChangeLog merger.

Useful git config settings
--------------------------

Git reads settings from \~/.gitconfig. Some useful ones are:

``` bash
[rerere]
    enabled = true
```

Activate recording of resolved conflicts, so that identical conflict hunks can be resolved automatically, should they be encountered again.

``` bash
[rerere]
    autoupdate = true
```

Files that have conflicts cleanly resolved via rerere are automatically marked as resolved.

``` bash
[push]
    default = tracking
```

When working in a local branch that tracks a remote one, you can send your changes to the remote branch by just doing **git push** with no arguments. Only the changes on the current branch will be pushed.

I am on Windows and each commit changes file mode on Unix to executable
-----------------------------------------------------------------------

Please add the following to either your Mono repository's .git/config or your global git configuration file:

``` bash
[core]
    fileMode = false
```

When I commit, my commit "repeats" commits of other people
----------------------------------------------------------

There's nothing to worry -- you don't need to do anything, there's nothing to "fix" on that commit. 'git' probably created a merge commit when it found that independent commits occurred on the repository while you were working on the current commit/push. In fact, it's the Github UI for displaying merges that misleads us to think that there are "repeats", and make us worry about unintended changes.

There's no information loss, and no duplication of work. Using a better UI, like 'gitk' or the Github "Network" view, will help better illustrate the non-linear commit history around such a merge.

Of course, in the longer term, a lot of such (mostly unnecessary) non-linearity is distracting. So, we discourage merges that involve very few commits. Just use workflows 1 or 2 above to avoid seeing unintended or unnecessary merges.

How do I know what's going to be pushed?
----------------------------------------

This will give you a log of all the changes scheduled to be pushed.

``` bash
git push -n 2>&1|tail -1|awk {'print $1;'}|xargs git log
```

If the result is an xargs error message (xargs: unmatched single quote), then git push -n failed, and you should check the error message. This usually happens because upstream has been changed and your local copy is out of synch, so make sure you do

``` bash
git pull --rebase
```

before trying to push again.

I can't checkout the required submodules because the git:// protocol is blocked by a firewall
---------------------------------------------------------------------------------------------

You can replace `git://` with `https://` globally in your user preference:

``` bash
git config --global url."https://".insteadOf git://
```

Source: [http://stackoverflow.com/questions/4891527/git-protocol-blocked-by-company-how-can-i-get-around-that/10729634#10729634](http://stackoverflow.com/questions/4891527/git-protocol-blocked-by-company-how-can-i-get-around-that/10729634#10729634)

Links
=====

-   [Git community book](http://book.git-scm.com/)
-   [Git User's manual](http://www.kernel.org/pub/software/scm/git/docs/user-manual.html)
-   [Git - SVN Crash Course](http://git.or.cz/course/svn.html)


