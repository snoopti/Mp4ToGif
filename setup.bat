@echo off
set "name=Mp4ToGif"
set "author=snoopti"

title %name% by %author%
cls

echo --- Welcome to %name%! ---

:check_git
echo.
echo Check if Git is installed...
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo Git is not installed.
    echo [1] Install Git
    echo [2] Git is already installed
    set /p choice=Select option:
    if "%choice%"=="1" goto install_git
    if "%choice%"=="2" goto check_python
    echo Invalid entry, please try again.
    pause >nul
    goto check_git
)

:install_git
echo.
echo Install Git...
call winget install -e --id Git.Git
goto check_python

:check_python
echo.
echo Check if Python is installed...
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo Python is not installed.
    echo [1] Install Python
    echo [2] Python is already installed
    set /p choice=Select option:
    if "%choice%"=="1" goto install_python
    if "%choice%"=="2" goto download_project
    echo Invalid entry, please try again.
    pause >nul
    goto check_python
)

:install_python
echo.
echo Install Python...
call winget install -e --id Python.Python.3.12
goto download_project

:download_project
echo.
echo Download the project...
pause >nul
git clone https://github.com/snoopti/Mp4ToGif
goto delete_files

:delete_files
echo.
echo Delete unnecessary files...
cd /d Mp4ToGif
rmdir /s /q .git
del .gitignore README.md .setup.bat
goto finish

:finish
echo.
echo --- INSTALLATION COMPLETE ---
echo.
echo You have successfully installed %name%.
echo Follow the prompts to continue.
echo.
echo [1] Delete setup file and continue
echo [2] Keep the setup file and proceed
echo.
set /p choice=Select option:
if "%choice%"=="1" goto delete_setup_and_continue
if "%choice%"=="2" goto keep_setup_and_continue

:delete_setup_and_continue
echo.
echo Delete the setup file and proceed...
start start.bat
cd ..
del setup.bat
exit

:keep_setup_and_continue
echo.
echo Keep the setup file and proceed...
start start.bat
exit
