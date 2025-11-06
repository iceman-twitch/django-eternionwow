@echo off
REM Eternion WoW Django - Environment Setup
REM This batch file creates virtual environment and installs all dependencies

echo ========================================
echo   Eternion WoW - Environment Setup
echo ========================================
echo.

REM Stay in main directory
cd /d "%~dp0"

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo Error: Python is not installed or not in PATH!
    echo Please install Python 3.8 or higher from https://www.python.org/
    echo.
    pause
    exit /b 1
)

echo Python found:
python --version
echo.
echo Note: Django 4.2 requires Python 3.8 or higher
echo If you have an older Python version, Django will still try to install
echo.

REM Check if virtual environment already exists
if exist "env" (
    echo Virtual environment already exists!
    echo.
    set /p "recreate=Do you want to recreate it? (y/N): "
    if /i not "%recreate%"=="y" (
        echo Skipping env creation...
        goto install_deps
    )
    echo Removing existing virtual environment...
    rmdir /s /q env
    echo.
)

REM Create virtual environment
echo Creating virtual environment...
python -m venv env
if errorlevel 1 (
    echo Error: Failed to create virtual environment!
    echo.
    pause
    exit /b 1
)
echo Virtual environment created successfully!
echo.

:install_deps
REM Activate virtual environment
echo Activating virtual environment...
call env\Scripts\activate.bat
if errorlevel 1 (
    echo Error: Failed to activate virtual environment!
    echo.
    pause
    exit /b 1
)
echo.

REM Upgrade pip
echo Upgrading pip...
python -m pip install --upgrade pip
echo.

REM Install requirements
echo Installing Django and dependencies...
echo This may take a few minutes...
echo.
pip install -r requirements.txt
if errorlevel 1 (
    echo.
    echo Error: Failed to install dependencies!
    echo Please check requirements.txt and try again.
    echo.
    pause
    exit /b 1
)
echo.

echo ========================================
echo   Installation Complete!
echo ========================================
echo.
echo Next steps:
echo   1. Run migrations: python manage.py migrate
echo   2. Create superuser: python manage.py createsuperuser
echo   3. Start server: python manage.py runserver
echo.
echo Or simply run setup.ps1 for automated setup!
echo Or use start.bat to launch the server!
echo.
echo Virtual environment is activated.
echo To deactivate, type: deactivate
echo.
pause
