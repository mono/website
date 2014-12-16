git checkout gh-pages
git branch -D pullrequest
git pull
git checkout -b pullrequest gh-pages
git pull https://github.com/%1/website.git gh-pages
git status | grep "both modified" | cut -c19- > .conflicts
cat .conflicts
FOR /F %%p IN ('cat .conflicts') DO "C:\Program Files (x86)\Notepad++\notepad++.exe" %%p
git add .
git commit -m "Fix conflicts"
