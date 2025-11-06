# Setup script for Eternion WoW Django website
# Run this after installing dependencies

Write-Host "==================================" -ForegroundColor Cyan
Write-Host "Eternion WoW Django Setup" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# Check if virtual environment is activated
if (-not $env:VIRTUAL_ENV) {
    Write-Host "Warning: No virtual environment detected!" -ForegroundColor Yellow
    Write-Host "It's recommended to use a virtual environment." -ForegroundColor Yellow
    Write-Host "Create one with: python -m venv venv" -ForegroundColor Yellow
    Write-Host "Activate with: .\venv\Scripts\Activate.ps1" -ForegroundColor Yellow
    Write-Host ""
    $continue = Read-Host "Continue without virtual environment? (y/n)"
    if ($continue -ne "y") {
        exit
    }
}

Write-Host "Step 1: Running migrations..." -ForegroundColor Green
python manage.py makemigrations
python manage.py migrate

Write-Host ""
Write-Host "Step 2: Creating superuser..." -ForegroundColor Green
Write-Host "Please enter admin credentials:" -ForegroundColor Yellow
python manage.py createsuperuser

Write-Host ""
Write-Host "Step 3: Would you like to load sample data? (y/n)" -ForegroundColor Green
$loadData = Read-Host
if ($loadData -eq "y") {
    Write-Host "Loading sample realm and news..." -ForegroundColor Cyan
    python manage.py shell -c "
from website.models import Realm, News
from datetime import datetime

# Create sample realm
if not Realm.objects.exists():
    Realm.objects.create(
        name='Eternion WoW',
        realmlist='eternion-wow.com',
        online=True,
        total_players=150,
        horde_players=80,
        alliance_players=70,
        description='Main WotLK 3.3.5a server'
    )
    print('Sample realm created!')

# Create sample news
if not News.objects.exists():
    News.objects.create(
        title='Welcome to Eternion WoW!',
        author='Admin',
        text='<p>Welcome to our newly relaunched server! We are excited to bring you an amazing World of Warcraft experience.</p><p>Join us today and start your adventure!</p>'
    )
    News.objects.create(
        title='Server Updates',
        author='Admin',
        text='<p>Check here regularly for server updates and patch notes.</p>'
    )
    print('Sample news created!')
"
}

Write-Host ""
Write-Host "==================================" -ForegroundColor Cyan
Write-Host "Setup Complete!" -ForegroundColor Green
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "To start the development server, run:" -ForegroundColor Yellow
Write-Host "  python manage.py runserver" -ForegroundColor White
Write-Host ""
Write-Host "Then visit:" -ForegroundColor Yellow
Write-Host "  Website: http://127.0.0.1:8000/" -ForegroundColor White
Write-Host "  Admin:   http://127.0.0.1:8000/admin/" -ForegroundColor White
Write-Host ""
Write-Host "Happy coding!" -ForegroundColor Cyan
