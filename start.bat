@echo off
set "name=Mp4ToGif"
set "author=snoopti"

title %name% by %author%
cls
echo.
echo Add an .mp4 file in "%name%/files/" that you want to convert!
echo.
echo Press any button to start...
echo.
pause >nul
cls
call main.py