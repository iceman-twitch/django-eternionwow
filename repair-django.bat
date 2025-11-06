@echo off
REM Eternion WoW Django - Repair Django Installation
REM This fixes broken Django installation

echo ========================================
echo   Repair Django Installation
echo ========================================
echo.

set MAIN_DIR=%~dp0
set MAIN_DIR=%MAIN_DIR:~0,-1%

REM Activate virtual environment
if exist "%MAIN_DIR%\env\Scripts\activate.bat" (
    echo Activating virtual environment...
    call "%MAIN_DIR%\env\Scripts\activate.bat"
) else (
    echo Error: Virtual environment not found!
    echo Please run env.bat first
    pause
    exit /b 1
)

echo.
echo Step 1: Uninstalling Django...
pip uninstall -y Django

echo.
echo Step 2: Clearing pip cache...
pip cache purge

echo.
echo Step 3: Reinstalling Django...
pip install --no-cache-dir Django==4.2.16

echo.
echo Step 4: Verifying installation...
python -c "import django; print(f'Django version: {django.get_version()}')"
if errorlevel 1 (
    echo.
    echo Error: Django still not working!
    echo Try deleting the env folder and running env.bat again
    pause
    exit /b 1
)

echo.
echo Step 5: Installing other requirements...
pip install --no-cache-dir -r requirements.txt

echo.
echo ========================================
echo   Repair Complete!
echo ========================================
echo.
echo Django has been reinstalled successfully.
echo You can now run setup-db.bat to set up the database.
echo.
pause
