@echo off
powershell -noprofile -executionpolicy bypass -file language-color.ps1

if "%*"=="" (
	echo you need to specify your specify commit message. Example: 
	echo deploy This is the commit message
	exit /b 0
)
git add .
git commit -m "%*"
git push origin master