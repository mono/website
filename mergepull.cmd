git fetch origin gh-pages
@if errorlevel 1 goto :END
git rebase origin/gh-pages
@if errorlevel 1 goto :END
git checkout gh-pages
@if errorlevel 1 goto :END
git pull
@if errorlevel 1 goto :END
git rebase pullrequest
@if errorlevel 1 goto :END
git push origin gh-pages
@if errorlevel 1 goto :END
@goto :ENDEND
:END
@echo Failed!!!
:ENDEND