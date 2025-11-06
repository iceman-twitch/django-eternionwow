@echo off
REM Eternion WoW Django - Database Setup
REM This creates the database tables

echo ========================================
echo   Database Setup - Create Tables
echo ========================================
echo.

set MAIN_DIR=%~dp0
set MAIN_DIR=%MAIN_DIR:~0,-1%

REM Activate virtual environment
if exist "%MAIN_DIR%\env\Scripts\activate.bat" (
    echo Activating virtual environment...
    call "%MAIN_DIR%\env\Scripts\activate.bat"
)

REM Change to Django project directory
cd /d "%MAIN_DIR%\eternionwow"

echo.
echo Step 1: Creating migration files...
python manage.py makemigrations
if errorlevel 1 (
    echo Error creating migrations!
    pause
    exit /b 1
)

echo.
echo Step 2: Applying migrations to database...
python manage.py migrate
if errorlevel 1 (
    echo Error applying migrations!
    pause
    exit /b 1
)

echo.
echo ========================================
echo   Database setup complete!
echo ========================================
echo.
echo Database tables created successfully!
echo.
echo Optional: Create admin user with: python manage.py createsuperuser
echo Start server with: start.bat
echo.
pause
