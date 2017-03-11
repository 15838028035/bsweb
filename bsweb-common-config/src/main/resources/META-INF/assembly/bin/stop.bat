@echo off
setlocal enabledelayedexpansion
for /f "delims=  tokens=1" %%i in ('netstat -aon ^| findstr "20880"') do (
set a=%%i
goto js
)
:js
taskkill /F /pid "!a:~71,5!"
pause>nul