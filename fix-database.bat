@echo off
REM Quick fix - Create migrations and migrate

cd /d "%~dp0eternionwow"

if exist "..\env\Scripts\activate.bat" (
    call ..\env\Scripts\activate.bat
)

echo Creating migrations...
python manage.py makemigrations website

echo.
echo Applying migrations...
python manage.py migrate

echo.
echo Done! Press any key to exit...
pause
