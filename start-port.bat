@echo off
REM Eternion WoW Django - Launch on Custom Port
REM Usage: start-port.bat [port]

set MAIN_DIR=%~dp0
set MAIN_DIR=%MAIN_DIR:~0,-1%

set PORT=%1
if "%PORT%"=="" set PORT=8080

if exist "%MAIN_DIR%\env\Scripts\activate.bat" call "%MAIN_DIR%\env\Scripts\activate.bat"

cd /d "%MAIN_DIR%\eternionwow"

echo Starting Eternion WoW Django Server on port %PORT%...
echo Visit: http://127.0.0.1:%PORT%/
echo.

python manage.py runserver %PORT%

if exist "%MAIN_DIR%\env\Scripts\deactivate.bat" call "%MAIN_DIR%\env\Scripts\deactivate.bat"
