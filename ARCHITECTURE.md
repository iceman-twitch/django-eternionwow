# Eternion WoW Django - Architecture Overview

## System Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                         USER BROWSER                             │
│                    http://127.0.0.1:8000/                       │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                      DJANGO WEB SERVER                           │
│                     (manage.py runserver)                        │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                         URL ROUTING                              │
│                    eternionwow/urls.py                          │
│                         website/urls.py                         │
├─────────────────────────────────────────────────────────────────┤
│  /              → home()                                        │
│  /login/        → user_login()                                  │
│  /register/     → register()                                    │
│  /account/      → account()                                     │
│  /vote/         → vote()                                        │
│  /armory/       → armory()                                      │
│  /connect/      → connect()                                     │
│  /admin/        → Django Admin                                  │
└────────────────────────────┬────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────┐
│                      VIEWS (website/views.py)                    │
│                      Business Logic Layer                        │
├─────────────────────────────────────────────────────────────────┤
│  • Process HTTP requests                                        │
│  • Authenticate users                                           │
│  • Query database                                               │
│  • Prepare data for templates                                   │
│  • Return HTTP responses                                        │
└───────────┬──────────────────────────────┬──────────────────────┘
            │                              │
            ▼                              ▼
┌─────────────────────────┐   ┌──────────────────────────────────┐
│   MODELS (models.py)    │   │   TEMPLATES (templates/)         │
│   Database Layer        │   │   Presentation Layer             │
├─────────────────────────┤   ├──────────────────────────────────┤
│                         │   │                                  │
│  • News                 │   │  • base.html (master layout)     │
│  • Realm                │   │  • home.html                     │
│  • ShoutboxMessage      │   │  • login.html                    │
│  • UserProfile          │   │  • register.html                 │
│                         │   │  • account.html                  │
│  Django ORM handles:    │   │  • vote.html                     │
│  - SQL generation       │   │  • armory.html                   │
│  - Migrations           │   │  • connect.html                  │
│  - Validation           │   │                                  │
│                         │   │  Template inheritance:           │
│                         │   │  All pages extend base.html      │
└────────┬────────────────┘   └──────────────┬───────────────────┘
         │                                   │
         ▼                                   ▼
┌─────────────────────────┐   ┌──────────────────────────────────┐
│   DATABASE              │   │   STATIC FILES                   │
│   (db.sqlite3)          │   │   (static/)                      │
├─────────────────────────┤   ├──────────────────────────────────┤
│                         │   │                                  │
│  Tables:                │   │  • css/style.css                 │
│  • website_news         │   │  • js/jquery.js                  │
│  • website_realm        │   │  • js/interface.js               │
│  • website_shoutbox     │   │  • images/logo.png               │
│  • website_userprofile  │   │  • images/slider-*.jpg           │
│  • auth_user            │   │  • images/background.jpg         │
│  • django_session       │   │                                  │
│                         │   │  Served directly by Django       │
└─────────────────────────┘   └──────────────────────────────────┘
```

## Request Flow Example

### User visits homepage (/)

```
1. Browser → Request: GET /
              ↓
2. Django URL Router (urls.py)
   → Matches: path('', views.home)
              ↓
3. View Function (views.py::home)
   → Fetches data:
     • news_list = News.objects.all()
     • realms = Realm.objects.all()
     • shoutbox_messages = ShoutboxMessage.objects.all()
              ↓
4. Database Query (via ORM)
   → SELECT * FROM website_news
   → SELECT * FROM website_realm
   → SELECT * FROM website_shoutboxmessage
              ↓
5. Template Rendering
   → Loads: templates/website/home.html
   → Extends: templates/base.html
   → Inserts data into {{ variables }}
              ↓
6. HTTP Response
   → Returns: HTML + CSS + JS
              ↓
7. Browser ← Displays webpage
```

## Data Flow Diagram

```
┌──────────────┐
│    User      │
└──────┬───────┘
       │
       │ 1. Submits Login Form
       ▼
┌──────────────────────────┐
│  View: user_login()      │
│  (website/views.py)      │
└──────┬───────────────────┘
       │
       │ 2. Calls authenticate()
       ▼
┌──────────────────────────┐
│  Django Auth System      │
└──────┬───────────────────┘
       │
       │ 3. Queries User table
       ▼
┌──────────────────────────┐
│  Database                │
│  (auth_user table)       │
└──────┬───────────────────┘
       │
       │ 4. Returns User object
       ▼
┌──────────────────────────┐
│  View: user_login()      │
└──────┬───────────────────┘
       │
       │ 5. Creates session
       │ 6. Redirects to home
       ▼
┌──────────────────────────┐
│  User sees homepage      │
│  (logged in)             │
└──────────────────────────┘
```

## Django MTV Pattern

### Model-Template-View Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                          REQUEST                             │
└──────────────────────────┬──────────────────────────────────┘
                           │
                           ▼
                    ┌──────────────┐
                    │   URL Conf   │
                    │   (urls.py)  │
                    └──────┬───────┘
                           │
                           ▼
           ┌───────────────────────────────┐
           │          VIEW                 │
           │      (views.py)               │
           │  • Process request            │
           │  • Business logic             │
           │  • Coordinate Model/Template  │
           └───────┬───────────────┬───────┘
                   │               │
         ┌─────────▼──────┐       │
         │     MODEL      │       │
         │   (models.py)  │       │
         │  • Data layer  │       │
         │  • Database    │       │
         └─────────┬──────┘       │
                   │               │
                   │    Data       │
                   └───────────────┤
                                   │
                         ┌─────────▼─────────┐
                         │    TEMPLATE       │
                         │  (*.html files)   │
                         │  • Presentation   │
                         │  • HTML structure │
                         └─────────┬─────────┘
                                   │
                                   ▼
                         ┌───────────────────┐
                         │     RESPONSE      │
                         │   (HTML page)     │
                         └───────────────────┘
```

## File Structure Flow

```
eternionwow/
│
├── manage.py ◄────────────── Entry point for Django commands
│
├── eternionwow/
│   ├── settings.py ◄──────── Global configuration
│   │                          • Database settings
│   │                          • Installed apps
│   │                          • Security settings
│   │
│   └── urls.py ◄──────────── Root URL routing
│       │
│       └─► include('website.urls')
│
├── website/
│   ├── models.py ◄─────────── Database models
│   │   │
│   │   ├─► News
│   │   ├─► Realm
│   │   ├─► ShoutboxMessage
│   │   └─► UserProfile
│   │
│   ├── views.py ◄──────────── Business logic
│   │   │
│   │   ├─► home()
│   │   ├─► user_login()
│   │   ├─► register()
│   │   ├─► account()
│   │   └─► ...
│   │
│   ├── urls.py ◄───────────── App URL routing
│   │   │
│   │   └─► Maps URLs to views
│   │
│   └── admin.py ◄──────────── Admin interface config
│       │
│       └─► Register models for admin panel
│
├── templates/
│   ├── base.html ◄─────────── Master template
│   │   │
│   │   └─► Extended by all pages
│   │
│   └── website/
│       ├─► home.html
│       ├─► login.html
│       └─► ...
│
└── static/
    ├── css/ ◄──────────────── Stylesheets
    ├── js/ ◄───────────────── JavaScript
    └── images/ ◄───────────── Images
```

## Component Interaction

```
┌────────────────────────────────────────────────────────────────┐
│                      Admin Panel (/admin/)                      │
├────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐        │
│  │  Manage News │  │ Manage Realms│  │ Manage Users │        │
│  └──────┬───────┘  └──────┬───────┘  └──────┬───────┘        │
│         │                  │                  │                 │
│         └──────────────────┼──────────────────┘                │
│                            │                                    │
│                            ▼                                    │
│                   ┌─────────────────┐                          │
│                   │   Models (ORM)  │                          │
│                   └────────┬────────┘                          │
│                            │                                    │
│                            ▼                                    │
│                   ┌─────────────────┐                          │
│                   │    Database     │                          │
│                   └─────────────────┘                          │
│                            ▲                                    │
│                            │                                    │
│         ┌──────────────────┼──────────────────┐                │
│         │                  │                  │                │
│  ┌──────▼───────┐  ┌──────▼───────┐  ┌──────▼───────┐        │
│  │  Homepage    │  │ User Account │  │   Shoutbox   │        │
│  │   (views)    │  │   (views)    │  │   (views)    │        │
│  └──────────────┘  └──────────────┘  └──────────────┘        │
│                                                                 │
└────────────────────────────────────────────────────────────────┘
```

## Authentication Flow

```
┌──────────────────────────────────────────────────────────────┐
│                     User Authentication                       │
└──────────────────────────────────────────────────────────────┘

Registration Flow:
User fills form → register() view → Validate data → Create User
                                                    → Create UserProfile
                                                    → Redirect to login

Login Flow:
User fills form → user_login() view → authenticate() → Valid?
                                          │              │
                                          │              ├─Yes→ login()
                                          │              │      Create session
                                          │              │      Redirect to home
                                          │              │
                                          │              └─No──→ Show error
                                          │
Session Management:
Every request → SessionMiddleware → Check session → Attach user to request
                                                   → Views can access request.user

Protected Pages:
Request to /account/ → @login_required decorator → User logged in?
                                                    │
                                                    ├─Yes→ Show page
                                                    └─No──→ Redirect to login
```

## Database Schema Relationships

```
┌─────────────────┐          ┌──────────────────┐
│   auth_user     │          │  UserProfile     │
├─────────────────┤          ├──────────────────┤
│ id (PK)         │◄─────────┤ user_id (FK)     │
│ username        │ 1     1  │ site_rank        │
│ email           │          │ banned           │
│ password        │          │ vote_points      │
└─────────────────┘          │ donation_points  │
                             └──────────────────┘

┌──────────────────┐         ┌──────────────────┐
│   News           │         │   Realm          │
├──────────────────┤         ├──────────────────┤
│ id (PK)          │         │ id (PK)          │
│ title            │         │ name             │
│ author           │         │ realmlist        │
│ date             │         │ online           │
│ text             │         │ total_players    │
└──────────────────┘         │ horde_players    │
                             │ alliance_players │
┌──────────────────┐         └──────────────────┘
│ ShoutboxMessage  │
├──────────────────┤
│ id (PK)          │
│ username         │
│ message          │
│ created_at       │
└──────────────────┘
```

---

## Key Concepts

### 1. **URL Routing**
URLs map to view functions, no file extensions needed

### 2. **Views**
Python functions that handle requests and return responses

### 3. **Models**
Python classes that define database structure

### 4. **Templates**
HTML files with Django template language ({{ }}, {% %})

### 5. **ORM**
Object-Relational Mapping - write Python instead of SQL

### 6. **Admin**
Automatic admin interface for managing content

### 7. **Middleware**
Process requests/responses globally (sessions, auth, CSRF)

### 8. **Static Files**
CSS, JS, images served by Django during development

---

This architecture provides:
- **Separation of concerns** (MVC pattern)
- **Security** (built-in protection)
- **Scalability** (easy to extend)
- **Maintainability** (clear structure)
