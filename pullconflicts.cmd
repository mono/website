set WHERE=%1 
git checkout gh-pages
git branch -D %WHERE%-gh-pages
git pull
git checkout -b %WHERE%-gh-pages gh-pages
git pull https://github.com/%WHERE%/website.git gh-pages
git status | grep "both modified" | cut -c19- > .conflicts
cat .conflicts
FOR /F %%p IN ('cat .conflicts') DO "C:\Program Files (x86)\Notepad++\notepad++.exe" %%p
git add .
git commit -m "Fix conflicts"
