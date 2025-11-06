@echo off
REM Eternion WoW Django - Quick Launch (No Checks)
REM This is a faster version that skips checks

set MAIN_DIR=%~dp0
set MAIN_DIR=%MAIN_DIR:~0,-1%

if exist "%MAIN_DIR%\env\Scripts\activate.bat" call "%MAIN_DIR%\env\Scripts\activate.bat"

cd /d "%MAIN_DIR%\eternionwow"

echo Starting Eternion WoW Django Server...
echo Visit: http://127.0.0.1:8000/
echo.

python manage.py runserver

if exist "%MAIN_DIR%\env\Scripts\deactivate.bat" call "%MAIN_DIR%\env\Scripts\deactivate.bat"
