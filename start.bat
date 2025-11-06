@echo off
REM Eternion WoW Django - Launch Script
REM This batch file starts the Django development server

echo ========================================
echo    Eternion WoW - Django Web Server
echo ========================================
echo.

REM Save the main directory
set MAIN_DIR=%~dp0
set MAIN_DIR=%MAIN_DIR:~0,-1%

REM Check if virtual environment exists in main folder
if exist "%MAIN_DIR%\env\Scripts\activate.bat" (
    echo Activating virtual environment...
    call "%MAIN_DIR%\env\Scripts\activate.bat"
) else (
    echo Warning: Virtual environment not found!
    echo Run env.bat to create one
    echo.
)

REM Change to the Django project directory
cd /d "%MAIN_DIR%\eternionwow"

REM Check if Django is installed
python -c "import django" 2>nul
if errorlevel 1 (
    echo Error: Django is not installed!
    echo Please run env.bat first to set up the environment
    echo Or manually: pip install -r requirements.txt
    echo.
    pause
    exit /b 1
)

REM Show Django version
echo Django version:
python -c "import django; print(django.get_version())"
echo.

REM Check if database exists
if not exist "db.sqlite3" (
    echo ========================================
    echo   Database Not Found!
    echo ========================================
    echo.
    echo Setting up database automatically...
    echo.
    python manage.py makemigrations
    python manage.py migrate
    echo.
    echo Database created successfully!
    echo.
)

echo Starting Django development server...
echo.
echo Website will be available at:
echo   http://127.0.0.1:8000/
echo.
echo Admin panel available at:
echo   http://127.0.0.1:8000/admin/
echo.
echo Press Ctrl+C to stop the server
echo ========================================
echo.

REM Start the Django development server
echo Attempting to start on port 8000...
python manage.py runserver 0.0.0.0:8000
if errorlevel 1 (
    echo.
    echo ========================================
    echo   ERROR: Could not start on port 8000!
    echo ========================================
    echo.
    echo Possible causes:
    echo   1. Port 8000 is already in use
    echo   2. Windows Firewall is blocking Python
    echo   3. Antivirus is blocking the connection
    echo.
    echo Solutions:
    echo   1. Run: fix-port.bat (to diagnose/fix)
    echo   2. Run: start-port.bat 8080 (use different port)
    echo   3. Run as Administrator
    echo.
    pause
    exit /b 1
)

REM Deactivate virtual environment when server stops
if exist "%MAIN_DIR%\env\Scripts\deactivate.bat" (
    call "%MAIN_DIR%\env\Scripts\deactivate.bat"
)

REM If server stops, pause to see any error messages
if errorlevel 1 (
    echo.
    echo Server stopped with an error!
    pause
)
