git fetch origin gh-pages
git rebase origin/gh-pages
git checkout gh-pages
git pull
git rebase pullrequest
rem git merge --no-ff mono-gh-pages
git push origin gh-pages