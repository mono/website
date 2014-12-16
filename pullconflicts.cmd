@if [%1]==[] goto :FAIL
git checkout gh-pages
@if errorlevel 1 goto :END
git branch -D pullrequest
git pull
@if errorlevel 1 goto :END
git checkout -b pullrequest gh-pages
@if errorlevel 1 goto :END
git pull https://github.com/%1/website.git gh-pages
@if errorlevel 1 goto :END
git status | grep "both modified" | cut -c19- > .conflicts
@if errorlevel 1 goto :END
cat .conflicts
FOR /F %%p IN ('cat .conflicts') DO "C:\Program Files (x86)\Notepad++\notepad++.exe" %%p
@if errorlevel 1 goto :END
git add .
@if errorlevel 1 goto :END
git commit -m "Fix conflicts"
@goto :ENDEND
:FAIL
@echo You need to pass the PR github account to make the pull
@goto :ENDEND
:END
@echo Failed!!!
:ENDEND
