# 🎮 Eternion WoW - Django Project

**A modern Django-based website for your Eternion WoW private server**

Converted from the original PHP source files with all features preserved and enhanced!

---

## 🚀 Quick Start

```powershell
cd eternionwow
pip install -r requirements.txt
.\setup.ps1
python manage.py runserver
```

Then visit: **http://127.0.0.1:8000/**

---

## 📚 Documentation

- **[PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)** - Complete overview of what was built
- **[QUICKSTART.md](eternionwow/QUICKSTART.md)** - Fast setup guide (< 5 minutes)
- **[README.md](eternionwow/README.md)** - Full documentation and reference
- **[MIGRATION_GUIDE.md](MIGRATION_GUIDE.md)** - PHP to Django migration guide

---

## 📁 Project Structure

```
django-eternionwow/
├── 📄 PROJECT_SUMMARY.md      ← START HERE for overview
├── 📄 MIGRATION_GUIDE.md      ← For PHP developers
│
├── 📁 eternionwow/            ← Main Django project
│   ├── 📄 manage.py
│   ├── 📄 requirements.txt
│   ├── 📄 setup.ps1          ← Automated setup script
│   ├── 📄 README.md          ← Full documentation
│   ├── 📄 QUICKSTART.md      ← Quick start guide
│   │
│   ├── 📁 eternionwow/       ← Project configuration
│   │   ├── settings.py
│   │   ├── urls.py
│   │   └── ...
│   │
│   ├── 📁 website/           ← Main app (models, views, etc.)
│   │   ├── models.py
│   │   ├── views.py
│   │   ├── urls.py
│   │   ├── admin.py
│   │   └── tests.py
│   │
│   ├── 📁 templates/         ← HTML templates
│   │   ├── base.html
│   │   └── website/
│   │       ├── home.html
│   │       ├── login.html
│   │       ├── register.html
│   │       └── ...
│   │
│   └── 📁 static/            ← CSS, JS, Images
│       ├── css/style.css
│       ├── js/
│       └── images/
│
├── 📁 source/                ← Original PHP files (preserved)
│   └── eternion/
│       ├── index.php
│       ├── style.css
│       └── ...
│
└── 📁 misc/                  ← Original archived website
```

---

## ✨ Features

### Core Functionality
- ✅ **Homepage** with news feed
- ✅ **User Authentication** (Login, Register, Logout)
- ✅ **Account Management** (Profile, points, status)
- ✅ **Realm Status** (Server info, player counts)
- ✅ **Shoutbox** (Community messaging)
- ✅ **Vote System** (Vote tracking and rewards)
- ✅ **Armory** (Character search interface)
- ✅ **Connect Guide** (Server connection instructions)

### Django Enhancements
- ✅ **Admin Panel** (/admin/) - Manage all content
- ✅ **Security** - CSRF, SQL injection prevention, password hashing
- ✅ **Database Abstraction** - Easy MySQL or SQLite
- ✅ **Session Management** - Professional user sessions
- ✅ **Template Inheritance** - Efficient HTML structure
- ✅ **ORM** - No raw SQL needed

---

## 🎯 What's Included

### From Your Original Source
- ✅ All CSS styling (iTemplat.es Crusader theme)
- ✅ All JavaScript functionality
- ✅ All images (logo, sliders, backgrounds)
- ✅ Same visual design and layout
- ✅ All original features

### New Django Features
- ✅ Professional admin interface
- ✅ Modern security best practices
- ✅ Better code organization (MVC pattern)
- ✅ Database migrations
- ✅ Unit testing framework
- ✅ Easy deployment options

---

## 🛠️ Setup Options

### Option 1: Automated Setup (Recommended)
```powershell
cd eternionwow
pip install -r requirements.txt
.\setup.ps1
```

### Option 2: Manual Setup
```powershell
cd eternionwow
pip install -r requirements.txt
python manage.py makemigrations
python manage.py migrate
python manage.py createsuperuser
python manage.py runserver
```

---

## 📖 Next Steps

1. **Read [PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)** for complete overview
2. **Run the setup** using one of the options above
3. **Access admin panel** at http://127.0.0.1:8000/admin/
4. **Add content** (news, realms, etc.)
5. **Customize** templates and styles as needed
6. **Deploy** to production when ready

---

## 🔍 Key Files

| File | Purpose |
|------|---------|
| `eternionwow/settings.py` | Configuration (database, apps, security) |
| `website/models.py` | Database structure (News, Realm, etc.) |
| `website/views.py` | Page logic and functionality |
| `templates/base.html` | Master page layout |
| `static/css/style.css` | Website styling |

---

## 💡 Tips

- Use the **admin panel** (/admin/) to manage content easily
- Check **QUICKSTART.md** for fastest setup
- See **MIGRATION_GUIDE.md** if you're familiar with PHP version
- All original assets preserved in `source/` folder

---

## 📊 Technology Stack

- **Backend:** Python 3.8+ with Django 4.2
- **Database:** SQLite (dev) / MySQL (production)
- **Frontend:** HTML5, CSS3, JavaScript (jQuery)
- **Theme:** iTemplat.es Crusader Style 2

---

## 🆘 Need Help?

1. Check the documentation files (PROJECT_SUMMARY.md, README.md)
2. Run tests: `python manage.py test`
3. Check Django docs: https://docs.djangoproject.com/

---

## 🎉 You're Ready!

Your Eternion WoW website has been successfully converted to Django!

**Everything you need is in the `eternionwow/` folder.**

Start with [PROJECT_SUMMARY.md](PROJECT_SUMMARY.md) or jump right in with the Quick Start commands above.

Happy coding! 🚀

---

*Built with Django | Based on your PHP source files*  
*Design by iTemplat.es™ | Eternion WoW™ © 2024*
