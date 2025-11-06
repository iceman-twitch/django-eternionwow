@echo off
REM Eternion WoW Django - Port Diagnostic and Fix Tool

echo ========================================
echo   Port Diagnostic Tool
echo ========================================
echo.

echo Checking what's using port 8000...
echo.
netstat -ano | findstr :8000
echo.

if errorlevel 1 (
    echo Port 8000 is FREE but might be blocked by firewall
    echo.
    echo Possible solutions:
    echo 1. Run this command as Administrator
    echo 2. Allow Python through Windows Firewall
    echo 3. Use a different port: start-port.bat 8080
    echo.
    pause
    exit /b 0
)

echo.
echo Port 8000 is IN USE by the process above
echo.
echo Would you like to kill the process? (y/N)
set /p "kill=Enter choice: "

if /i not "%kill%"=="y" (
    echo.
    echo Use start-port.bat 8080 to run on a different port
    pause
    exit /b 0
)

echo.
echo Enter the PID (Process ID) to kill:
set /p "pid=PID: "

taskkill /PID %pid% /F
if errorlevel 1 (
    echo Failed to kill process. Try running as Administrator.
) else (
    echo Process killed successfully!
    echo You can now run start.bat
)

echo.
pause
