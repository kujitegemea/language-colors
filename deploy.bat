@echo off
powershell -noprofile -executionpolicy bypass -file language-color.ps1

if "%*"=="" (
	echo commit message not specified. stopping push 
	exit /b 0
)
REM git add .
REM git commit -m "%*"
REM git push origin master
