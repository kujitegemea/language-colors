@echo off
powershell -noprofile -executionpolicy bypass -file language-color.ps1
copy .\language-color.css .\docs\
if "%*"=="" (
	echo commit message not specified. stopping push 
	npm test
	exit /b 0
)
git add .
git commit -m "%*"
git push origin master
npm test
