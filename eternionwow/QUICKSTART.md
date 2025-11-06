# Quick Start Guide - Eternion WoW Django

## Quick Setup (3 steps)

1. **Install Django and dependencies:**
   ```powershell
   cd d:\Github\django-eternionwow\eternionwow
   pip install -r requirements.txt
   ```

2. **Run the setup script:**
   ```powershell
   .\setup.ps1
   ```
   Or manually:
   ```powershell
   python manage.py makemigrations
   python manage.py migrate
   python manage.py createsuperuser
   ```

3. **Start the server:**
   ```powershell
   python manage.py runserver
   ```

Visit http://127.0.0.1:8000/ to see your site!

## What's Included

✅ **Complete Django website** converted from your PHP source
✅ **User authentication** - Login, register, account management
✅ **News system** - Post and display server news
✅ **Realm status** - Show server statistics
✅ **Shoutbox** - Community messaging
✅ **All original assets** - CSS, JS, images from your source files
✅ **Admin panel** - Easy content management at /admin/

## Next Steps

1. **Add content via admin panel** (http://127.0.0.1:8000/admin/)
   - Create news posts
   - Add realm information
   - Manage users

2. **Customize the site:**
   - Edit `static/css/style.css` for styling
   - Modify templates in `templates/website/`
   - Add features in `website/views.py`

3. **For production deployment:**
   - See the "Security Notes" section in README.md
   - Configure MySQL database in settings.py
   - Set up a proper web server (nginx + gunicorn)

## Troubleshooting

**Import errors about Django?**
Make sure you installed requirements: `pip install -r requirements.txt`

**Static files not loading?**
Run: `python manage.py collectstatic`

**Database errors?**
Delete `db.sqlite3` and run migrations again

## Features Comparison

| Feature | Original PHP | New Django |
|---------|-------------|------------|
| News | ✅ | ✅ |
| Login/Register | ✅ | ✅ |
| Realm Status | ✅ | ✅ |
| Shoutbox | ✅ | ✅ |
| Account Management | ✅ | ✅ |
| Admin Panel | ❌ | ✅ (Django Admin) |
| Security | Basic | Modern (CSRF, Sessions, etc.) |
| Database | MySQL | SQLite/MySQL |

Enjoy your new Django-powered Eternion WoW website! 🎮
