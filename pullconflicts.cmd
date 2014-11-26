git checkout gh-pages
git branch -d mono-gh-pages
git pull
git checkout -b mono-gh-pages gh-pages
git pull https://github.com/mono/website.git gh-pages
git status | grep "both modified" | cut -c19- | sed -e 's/\//\\/g' > .conflicts
cat .conflicts
FOR /F %%p IN ('cat .conflicts') DO "C:\Program Files (x86)\Notepad++\notepad++.exe" %%p
