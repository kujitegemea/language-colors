@echo off
powershell -noprofile -executionpolicy bypass -file language-colors.ps1
copy .\language-colors.css .\docs\
copy .\language-colors.js .\docs\
if "%*"=="" (
	echo commit message not specified. stopping push 
	npm test
	exit /b 0
)
git add .
git commit -m "%*"
git push origin master
npm test
