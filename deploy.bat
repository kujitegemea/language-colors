@echo off
powershell -noprofile -executionpolicy bypass -file language-color.ps1

if "%*"=="" (
	echo commit message not specified. stopping push 
	exit /b 0
)
git add .
git commit -m "%*"
git push origin master
