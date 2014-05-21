---
layout: obsolete
title: "Git Submodule Maintenance"
lastmodified: '2012-04-05'
permalink: /old_site/Git_Submodule_Maintenance/
redirect_from:
  - /Git_Submodule_Maintenance/
---

Git Submodule Maintenance
=========================

One way of doing work on submodules is described in [GitHub help on submodules](http://help.github.com/submodules/), however the workflow described below is preferred for Mono.

<table>
<col width="100%" />
<tbody>
<tr class="odd">
<td align="left"><h2>Table of contents</h2>
<ul>
<li><a href="#git-submodules-in-mono">1 Git submodules in Mono</a>
<ul>
<li><a href="#adding-a-submodule">1.1 Adding a submodule</a></li>
</ul></li>
<li><a href="#submodule-repository-of-origin-maintenance">2 Submodule repository of origin maintenance</a></li>
<li><a href="#submodule-maintenance-in-mono-repository">3 Submodule maintenance in Mono repository</a></li>
<li><a href="#submodule-modifications-workflow">4 Submodule modifications workflow</a></li>
</ul></td>
</tr>
</tbody>
</table>

### Git submodules in Mono

These instructions are for developers working on code in this repository. End users do not need to be concerned with the procedures described below. The description applies to each of the submodules used by mono. To list the submodules in use run:

       git submodule

#### Adding a submodule

If you have write access to the submodule repository do your work on it in a separate location, do not ever do any work in the mono copy of the submodule.

All submodules should reside under the external/ directory off the top level Mono directory. If you want to add a new submodule, issue the following command from the Mono topmost directory:

      git submodule add REPOSITORY_URL external/MODULE_NAME

After that commit and push the changes to .gitmodule and the submodule itself.

### Submodule repository of origin maintenance

The submodule repository of origin (at the REPOSITORY\_URL above) must always be modified outside the Mono directory. The repository may be a fork or clone of yet another GIT repository, either on github or elsewhere. If this is the case, you must configure your clone of it by adding a remote reference to the upstream repository:

       git remote add upstream UPSTREAM_URL

When there exist upstream changes you need to merge, the following command needs to be used:

       git fetch upstream/master

followed by

       git merge upstream/BRANCH_NAME

and as soon as all the possible confilits are resolved, push the freshly integrated changes back to our repository

       git push origin/BRANCH_NAME

### Submodule maintenance in Mono repository

When the submodule repository of origin is ready to be used by Mono, you need to go to the top level directory of Mono repository clone and make sure the submodules are checked out and up to date:

       git submodule init
       git submodule update --recursive

Then in order to integrate changes from the submodule repository of origin:

       cd external/MODULE_NAME
       git pull

you can, of course, use a a specific commit in the 'git pull' above instead of the default HEAD. When the changes are checked out, commit the changes to the Mono repository:

       cd ../..
       git add external/MODULE_NAME
       git commit -m "Module MODULE_NAME updated"
       git push

It is **extremely** important not to end the `external/MODULE_NAME` reference above with a / since that will make git remove the submodule reference and commit all its contents as normal files to Mono directory. It is also required that you **always** push the submodule changes **before** any and all work requiring the changes is done in the Mono repository.

Submodule modifications workflow
--------------------------------

If you work both on the submodule itself and Mono, here's a workflow you need to follow in order to maintain a healthy relationship between Mono and the submodule.

Let's assume the following directory hierarchy:

       |vc
       |----FOO_LIBRARY [your clone of FOO_LIBRARY repository]
       |----Mono
       |-------external
       \----------FOO_LIBRARY [submodule copy of FOO_LIBRARY repository]

We have two scenarios to consider when working with FOO\_LIBRARY:

-   it is a fork of some upstream repository
-   it is the orignal repository

What follows is a workflow which covers both cases above. The only difference is the first step - in the former case you pull changes from upstream, in the latter you make your own changes. You can, of course, combine the two. One thing to keep in mind is that if the submodule is a fork it is a good idea to keep your commits as finely grained as possible. That will make merging easier when you pull changes from the submodule's upstream.

FOO\_LIBRARY upstream has made changes to their repository and you need those changes integrated in Mono. For brevity let's assume you make no further changes to the upstream code.

Let's assume our current directory is `vc` in the hierarchy above.

-   Pull upstream changes from upstream **master** branch

<!-- -->

      cd FOO_LIBRARY
      git checkout master
      git fetch upstream/master
      git merge upstream/master

-   Resolve merge conflicts, if any
-   Push merged changes to our clone of FOO\_LIBRARY

<!-- -->

      git push origin/master

-   Test changes with Mono

<!-- -->

      cd ../Mono
      git pull
      git submodule update --init --recursive
      rsync -a --delete-after ../FOO_LIBRARY external/FOO_LIBRARY
      ./configure
      make

-   Run all necessary tests in Mono
-   Reset submodule to its original state

<!-- -->

      rm -rf external/FOO_LIBRARY
      git submodule update --init --recursive

-   Update submodule with changes in FOO\_LIBRARY repository

<!-- -->

      cd external/FOO_LIBRARY
      git pull

-   Update Mono reference to the new submodule commit

<!-- -->

      cd ../../
      git add external/FOO_LIBRARY
      git commit -m "FOO_LIBRARY submodule updated"
      git push

-   Do other work which depends on the new code in FOO\_LIBRARY


