---
layout: obsolete
title: "GitSVN:create-repo.sh"
lastmodified: '2009-11-21'
permalink: /archived/GitSVN:create-repo.sh/
redirect_from:
  - /GitSVN:create-repo.sh/
---

GitSVN:create-repo.sh
=====================

    if [ $# -lt 2 ]; then
        echo "Usage: create-repo.sh <mono|mcs> <svn account>"
        exit 1
    fi
    REPO=$1
    SVN=$2
    mkdir $REPO && \
    cd $REPO && \
    git init && \
    git svn init svn+ssh://$SVN@$REPO-cvs.ximian.com/source && \
    git config svn-remote.svn.fetch trunk/$REPO:refs/remotes/git-svn/trunk && \
    git config svn-remote.svn.branches branches/*/$REPO:refs/remotes/git-svn/branches/* && \
    git config svn-remote.svn.tags tags/*/$REPO:refs/remotes/git-svn/tags/* && \
    git fetch git://repo.or.cz/$REPO.git refs/heads/master:refs/remotes/git-svn/trunk refs/heads/branches/*:refs/remotes/git-svn/branches/* refs/tags/*:refs/remotes/git-svn/tags/* && \
    git reset --hard git-svn/trunk && \
    git svn rebase

