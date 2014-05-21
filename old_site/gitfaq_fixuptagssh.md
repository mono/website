---
layout: obsolete
title: "GitFAQ/fixup-tags.sh"
lastmodified: '2010-07-24'
permalink: /old_site/GitFAQ/fixup-tags.sh/
redirect_from:
  - /GitFAQ/fixup-tags.sh/
---

GitFAQ/fixup-tags.sh
====================

**You don't need to run this on the mono/, moon/, and monodevelop/ trees. It's already been run on those trees. You'll just need to refresh your tags.**

The following shell script will generate the list of tags which share the same name as a remote branch, and offer an alternative name. The output is actually a shell script that you can edit and run to actually perform the changes.

``` bash
cd /path/to/checkout
bash ~/bin/fixup-tags.sh > fixer-upper
 
# edit the set of tag renames
vi fixer-upper
 
# dry run that lists the set of git commands executed
sh fixer-upper
 
# once you're satisfied, you can say
RUN_GIT=git sh fixer-upper
```

And here's the script `fixup-tags.sh`:

``` bash
#! /bin/bash
 
cat <<\EOF
#! /bin/bash
 
set -e
 
: ${RUN_GIT:=echo git}
 
new_tags=
old_tags=
rename_tag()
{
    $RUN_GIT tag $2 refs/tags/$1 && {
    old_tags="$old_tags refs/tags/$1"
    new_tags="$new_tags refs/tags/$2"
    }
}
EOF
 
git for-each-ref refs/remotes/origin/ |
while read sha type branch; do 
    j=${branch##refs/remotes/origin/}
    git rev-parse --verify "refs/tags/$j" > /dev/null 2>&1 || continue
 
    k=$(echo $j | tr '/' '-' | sed -e 's,\([0-9]\)-,\1.,g')
    if test "$j" = "$k"; then
    echo "rename_tag $j tag-$j"
    else
    echo "rename_tag $j $k"
    fi
done
 
cat <<\EOF
test -z "$new_tags" || $RUN_GIT push origin $new_tags
test -z "$old_tags" || $RUN_GIT push origin --delete $old_tags
 
for i in $old_tags; do
  $RUN_GIT tag -d ${i##refs/tags/}
done
EOF
```

