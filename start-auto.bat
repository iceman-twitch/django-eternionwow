@echo off
REM Eternion WoW Django - Start with Auto Port Selection
REM This will try multiple ports automatically

set MAIN_DIR=%~dp0
set MAIN_DIR=%MAIN_DIR:~0,-1%

if exist "%MAIN_DIR%\env\Scripts\activate.bat" (
    call "%MAIN_DIR%\env\Scripts\activate.bat"
)

cd /d "%MAIN_DIR%\eternionwow"

echo ========================================
echo   Eternion WoW - Auto Port Server
echo ========================================
echo.

REM Try port 8000
echo Trying port 8000...
python manage.py runserver 8000 2>nul
if not errorlevel 1 goto end

REM Try port 8080
echo Port 8000 in use, trying port 8080...
python manage.py runserver 8080 2>nul
if not errorlevel 1 goto end

REM Try port 8888
echo Port 8080 in use, trying port 8888...
python manage.py runserver 8888 2>nul
if not errorlevel 1 goto end

REM Try port 3000
echo Port 8888 in use, trying port 3000...
python manage.py runserver 3000 2>nul
if not errorlevel 1 goto end

echo.
echo All common ports are in use or blocked!
echo Please specify a custom port with: start-port.bat [port]
pause
exit /b 1

:end
if exist "%MAIN_DIR%\env\Scripts\deactivate.bat" call "%MAIN_DIR%\env\Scripts\deactivate.bat"
