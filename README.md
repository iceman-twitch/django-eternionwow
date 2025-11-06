# 🎮 Eternion WoW - Django Website

A modern, secure Django-based website for your Eternion WoW private server, converted from the original PHP version with all features preserved and enhanced!

[![Django](https://img.shields.io/badge/Django-4.2+-green.svg)](https://www.djangoproject.com/)
[![Python](https://img.shields.io/badge/Python-3.8+-blue.svg)](https://www.python.org/)
[![License](https://img.shields.io/badge/License-Custom-red.svg)](LICENSE)

---

## 🚀 Quick Start

**New to this project? Start here:**

👉 **[START_HERE.md](START_HERE.md)** - Complete overview and getting started guide

### Fast Setup (3 Commands)

```powershell
cd eternionwow
pip install -r requirements.txt
.\setup.ps1
```

Then visit: http://127.0.0.1:8000/

---

## 📚 Documentation

### Essential Reading
- **[📖 START_HERE.md](START_HERE.md)** - Complete project overview (recommended first read)
- **[⚡ QUICKSTART.md](eternionwow/QUICKSTART.md)** - 5-minute setup guide
- **[📋 PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)** - Detailed feature list and structure
- **[📚 Documentation Index](DOCUMENTATION_INDEX.md)** - Navigation guide to all docs

### Technical Documentation
- **[🏗️ ARCHITECTURE.md](ARCHITECTURE.md)** - System architecture and design patterns
- **[🔄 MIGRATION_GUIDE.md](MIGRATION_GUIDE.md)** - PHP to Django migration guide
- **[🚢 DEPLOYMENT_CHECKLIST.md](DEPLOYMENT_CHECKLIST.md)** - Production deployment guide
- **[📖 Full README](eternionwow/README.md)** - Complete project documentation

---

## ✨ Features

### What's Included

✅ **Homepage** with news feed and announcements  
✅ **User System** - Registration, login, account management  
✅ **Realm Status** - Server info with player counts  
✅ **Shoutbox** - Community messaging system  
✅ **Vote System** - Track votes and reward points  
✅ **Armory** - Character search interface  
✅ **Admin Panel** - Professional content management  
✅ **All Original Assets** - CSS, JS, images preserved  

### Django Enhancements

🔒 **Security** - CSRF protection, SQL injection prevention, secure sessions  
⚡ **Performance** - Database optimization, caching support  
🎨 **Modern Code** - MVC pattern, clean architecture  
🛠️ **Developer Tools** - Admin interface, ORM, migrations  
📱 **Scalable** - Easy to extend and maintain  

---

## 📁 Project Structure

```
django-eternionwow/
│
├── 📚 Documentation/
│   ├── START_HERE.md              ← Begin here!
│   ├── PROJECT_SUMMARY.md         ← Features & overview
│   ├── ARCHITECTURE.md            ← Technical design
│   ├── MIGRATION_GUIDE.md         ← PHP to Django
│   ├── DEPLOYMENT_CHECKLIST.md    ← Production guide
│   └── DOCUMENTATION_INDEX.md     ← Doc navigation
│
├── 🎮 eternionwow/                ← Main Django project
│   ├── manage.py                  ← Django CLI
│   ├── requirements.txt           ← Dependencies
│   ├── setup.ps1                  ← Setup script
│   ├── README.md                  ← Full documentation
│   │
│   ├── eternionwow/               ← Project settings
│   ├── website/                   ← Main application
│   ├── templates/                 ← HTML templates
│   └── static/                    ← CSS, JS, Images
│
└── 📦 source/                     ← Original PHP files
```

---

## 🎯 Getting Started

### For First-Time Users

1. **Read** [START_HERE.md](START_HERE.md)
2. **Setup** using [QUICKSTART.md](eternionwow/QUICKSTART.md)
3. **Explore** the admin panel at `/admin/`
4. **Customize** as needed

### For PHP Developers

1. **Read** [MIGRATION_GUIDE.md](MIGRATION_GUIDE.md) - Understand PHP to Django
2. **Review** [ARCHITECTURE.md](ARCHITECTURE.md) - Learn the structure
3. **Compare** with original files in `source/eternion/`

### For Deployment

1. **Follow** [DEPLOYMENT_CHECKLIST.md](DEPLOYMENT_CHECKLIST.md)
2. **Configure** production settings
3. **Test** thoroughly before going live

---

## 🛠️ Technology Stack

- **Backend:** Django 4.2+ (Python 3.8+)
- **Database:** SQLite (dev) / MySQL (production)
- **Frontend:** HTML5, CSS3, JavaScript (jQuery)
- **Theme:** iTemplat.es™ Crusader Style 2

---

## 📊 Comparison: PHP vs Django

| Feature | Original PHP | New Django |
|---------|--------------|------------|
| News System | ✅ | ✅ Enhanced |
| User Auth | ✅ Basic | ✅ Professional |
| Admin Panel | ❌ | ✅ **NEW!** |
| Security | Basic | ✅ Enterprise-grade |
| Code Organization | Mixed | ✅ MVC Pattern |
| Database | MySQL | SQLite/MySQL (flexible) |

---

## 🎓 Learning Resources

### Django Documentation
- [Official Django Tutorial](https://docs.djangoproject.com/en/4.2/intro/tutorial01/)
- [Django Documentation](https://docs.djangoproject.com/)

### This Project
- See [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md) for all guides
- Check [ARCHITECTURE.md](ARCHITECTURE.md) for technical details
- Review [eternionwow/README.md](eternionwow/README.md) for API reference

---

## 🚀 Quick Commands

```powershell
# Setup
cd eternionwow
pip install -r requirements.txt
python manage.py migrate
python manage.py createsuperuser

# Development
python manage.py runserver          # Start server
python manage.py shell              # Python shell
python manage.py test               # Run tests

# Production
python manage.py collectstatic      # Collect static files
python manage.py check --deploy     # Check deployment readiness
```

---

## 📝 What Was Converted

From your original PHP source:
- ✅ `index.php` → Django views + templates
- ✅ `news.php` → News model + views
- ✅ `login.php` → Django authentication
- ✅ `style.css` → Static CSS (preserved)
- ✅ `images/*` → Static images (copied)
- ✅ `js/*` → Static JavaScript (copied)

All visual design and functionality preserved!

---

## 🔒 Security Features

- CSRF protection (automatic)
- SQL injection prevention (ORM)
- XSS protection (template escaping)
- Secure password hashing (PBKDF2)
- Session security
- Clickjacking protection

---

## 🆘 Need Help?

1. Check [DOCUMENTATION_INDEX.md](DOCUMENTATION_INDEX.md) for navigation
2. Read [START_HERE.md](START_HERE.md) for overview
3. See troubleshooting in [eternionwow/README.md](eternionwow/README.md)
4. Review [Django documentation](https://docs.djangoproject.com/)

---

## 📄 License

Based on iTemplat.es™ Crusader Style 2 theme  
Eternion WoW™ © 2024

---

## 🎉 Ready to Begin?

👉 **Start with [START_HERE.md](START_HERE.md)**

Or jump right in:
```powershell
cd eternionwow
.\setup.ps1
```

---

**Built with ❤️ using Django**  
*Converting your WoW server website from PHP to modern Python*
