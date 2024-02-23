@echo off
set "name=Mp4ToGif"
set "author=snoopti"

title %name% by %author%
cls
goto step1

:step1
cls
echo.
echo --- STEP 1 ---
echo.
echo You need Git to continue
echo [1] install Git
echo [2] Git is already installed
echo.
set /p choice=Select option:
if "%choice%"=="1" goto install-git
if "%choice%"=="2" goto step2
echo.
echo Invalid choice, press any button..
echo.
pause >nul
goto step1
:install-git
echo.
call winget install -e --id Git.Git
goto step2

:step2
cls
echo.
echo --- STEP 2 ---
echo.
echo You need Python to continue
echo [1] install Python
echo [2] Python is already installed
echo.
set /p choice=Select option:
if "%choice%"=="1" goto install-python
if "%choice%"=="2" goto step3
echo.
echo Invalid choice, press any button..
echo.
pause >nul
goto step2
:install-python
echo.
call winget install -e --id Python.Python.3.12
goto step3

:step3
cls
echo.
echo --- STEP 3 ---
echo.
echo Press any button to download project files
echo.
pause >nul
git clone https://github.com/snoopti/Mp4ToGif
goto step4

:step4
cls
echo.
echo --- STEP 4 ---
echo.
echo Press any button to delete old files
echo.
pause >nul
cd Mp4ToGif
rmdir /s /q .git
del .gitignore README.md .setup.bat
goto end

:end
cls
echo.
echo --- READY ---
echo.
echo Du hast %name% erfolgreich installiert, befolge nun weitere schritte um zu wissen wie man es benutzt...
echo.
echo continue...
pause >nul
echo.
echo Step1: Put your .mp4 in the "files" folder that you want to convert to a .gif file.
echo.
echo continue...
pause >nul
echo. Step2: Du kannst jetzt die Setup-Datei löschen und die "start.bat" starten, um den Konvertierungsprozess zu starten.
echo.
echo What do you want to do now?
echo [1] Delete Setup.bat and continue
echo [2] Hold Setup.bat and continue
echo.
set /p choice=Select option:
if "%choice%"=="1" goto end-1
if "%choice%"=="2" goto end-2

:end-1
start start.bat
cd ..
del setup.bat
exit

:end-2
start start.bat
exit