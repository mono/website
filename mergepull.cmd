git checkout gh-pages
@if errorlevel 1 goto :END
git merge --no-ff pullrequest
@if errorlevel 1 goto :END
git push origin gh-pages
@if errorlevel 1 goto :END
git branch -D pullrequest
@goto :ENDEND
:END
@echo Failed!!!
:ENDEND