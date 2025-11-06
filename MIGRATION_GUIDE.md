# Migration from PHP to Django - Developer Guide

## Overview

This document explains how the original PHP website was converted to Django, helping you understand the new structure if you were familiar with the PHP version.

## File Mapping

### PHP → Django Equivalents

| Original PHP File | Django Equivalent | Purpose |
|------------------|-------------------|---------|
| `index.php` | `templates/website/home.html` + `views.py::home()` | Homepage |
| `login.php` | `templates/website/login.html` + `views.py::user_login()` | Login page |
| `connect.php` | `eternionwow/settings.py::DATABASES` | Database config |
| `news.php` | `models.py::News` + `views.py::home()` | News display |
| `style.css` | `static/css/style.css` | CSS (unchanged) |
| `images/*` | `static/images/*` | Images (copied) |
| `js/*` | `static/js/*` | JavaScript (copied) |

## Concept Mapping

### PHP Concepts → Django Concepts

#### 1. Database Queries

**PHP (Original):**
```php
$sql = "SELECT title, author, date, text FROM news";
$result = $conn->query($sql);
while($row = $result->fetch_assoc()) {
    echo $row["title"];
}
```

**Django (New):**
```python
# In views.py
news_list = News.objects.all()

# In template
{% for news in news_list %}
    {{ news.title }}
{% endfor %}
```

#### 2. User Authentication

**PHP (Original):**
```php
// Manual session handling
session_start();
if (isset($_SESSION['username'])) {
    // User is logged in
}
```

**Django (New):**
```python
# Built-in authentication
if request.user.is_authenticated:
    # User is logged in
    username = request.user.username
```

#### 3. HTML Templates

**PHP (Original):**
```php
<!DOCTYPE html>
<html>
<body>
    <?php echo $title; ?>
</body>
</html>
```

**Django (New):**
```django
<!DOCTYPE html>
<html>
<body>
    {{ title }}
</body>
</html>
```

#### 4. Form Handling

**PHP (Original):**
```php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    // Process form
}
```

**Django (New):**
```python
def view(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        # Process form
```

## Architecture Comparison

### PHP Structure
```
eternion/
├── index.php          (Homepage + logic)
├── login.php          (Login + logic)
├── news.php           (News display logic)
├── connect.php        (Database config)
├── style.css          (Styles)
├── images/            (Assets)
└── js/                (Scripts)
```

### Django Structure (MVC Pattern)
```
eternionwow/
├── website/
│   ├── models.py      (Database Models - "M")
│   ├── views.py       (Business Logic - "C")
│   └── urls.py        (URL Routing)
├── templates/
│   └── website/       (HTML Templates - "V")
├── static/
│   ├── css/           (Styles)
│   ├── images/        (Assets)
│   └── js/            (Scripts)
└── eternionwow/
    └── settings.py    (Configuration)
```

## Key Differences

### 1. Separation of Concerns

**PHP:** HTML, PHP logic, and SQL mixed in same file
```php
<?php
$sql = "SELECT * FROM news";
?>
<html>
<body>
    <?php while($row = $result->fetch_assoc()) { ?>
        <h1><?php echo $row['title']; ?></h1>
    <?php } ?>
</body>
</html>
```

**Django:** Separated into Models, Views, Templates
```python
# models.py - Data layer
class News(models.Model):
    title = models.CharField(max_length=255)

# views.py - Logic layer
def home(request):
    news = News.objects.all()
    return render(request, 'home.html', {'news': news})

# home.html - Presentation layer
{% for item in news %}
    <h1>{{ item.title }}</h1>
{% endfor %}
```

### 2. Database Operations

**PHP:** Raw SQL queries
```php
$sql = "INSERT INTO news (title, author, text) VALUES ('$title', '$author', '$text')";
mysqli_query($conn, $sql);
```

**Django:** ORM (Object-Relational Mapping)
```python
News.objects.create(title=title, author=author, text=text)
```

### 3. Security

**PHP:** Manual security measures
```php
$username = mysqli_real_escape_string($conn, $_POST['username']);
```

**Django:** Built-in security
- CSRF protection (automatic)
- SQL injection prevention (ORM)
- XSS protection (template escaping)
- Password hashing (automatic)

### 4. Sessions

**PHP:** Manual session management
```php
session_start();
$_SESSION['username'] = $username;
```

**Django:** Automatic session handling
```python
request.session['key'] = value  # Automatic security
```

## Database Schema

### Original PHP Tables (Inferred)
```sql
CREATE TABLE news (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(100),
    date DATETIME,
    text TEXT
);
```

### Django Models
```python
class News(models.Model):
    title = models.CharField(max_length=255)
    author = models.CharField(max_length=100)
    date = models.DateTimeField(auto_now_add=True)
    text = models.TextField()
```

Django automatically:
- Creates the `id` field
- Handles datetime formatting
- Generates SQL for migrations
- Provides admin interface

## URL Routing

### PHP
```
index.php              → Homepage
login.php              → Login
?page=vote             → Vote page
?page=account          → Account page
```

### Django
```python
# urls.py
urlpatterns = [
    path('', views.home, name='home'),
    path('login/', views.user_login, name='login'),
    path('vote/', views.vote, name='vote'),
    path('account/', views.account, name='account'),
]
```

Benefits:
- Clean URLs (no .php extension)
- Named URLs (use `{% url 'home' %}` in templates)
- Better organization

## Admin Interface

### PHP
❌ No built-in admin
- Had to manually create admin pages
- Manual CRUD operations

### Django
✅ Automatic admin interface
```python
# admin.py
@admin.register(News)
class NewsAdmin(admin.ModelAdmin):
    list_display = ('title', 'author', 'date')
```

Access at: `/admin/`

## Environment Configuration

### PHP
```php
// connect.php
$mysql_s = "localhost";
$mysql_u = "root";
$mysql_p = "";
$mysql_db = "eternion";
```

### Django
```python
# settings.py
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'eternion',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': 'localhost',
    }
}
```

## Common Tasks Translation

### Adding a New Page

**PHP Approach:**
1. Create `newpage.php`
2. Write HTML + PHP logic
3. Add to menu manually

**Django Approach:**
1. Add function to `views.py`
```python
def newpage(request):
    return render(request, 'website/newpage.html')
```
2. Add URL to `urls.py`
```python
path('newpage/', views.newpage, name='newpage'),
```
3. Create `templates/website/newpage.html`
4. Link in menu: `{% url 'newpage' %}`

### Database Query

**PHP:**
```php
$sql = "SELECT * FROM news WHERE author = '$author'";
$result = mysqli_query($conn, $sql);
```

**Django:**
```python
news = News.objects.filter(author=author)
```

### Form Processing

**PHP:**
```php
if (isset($_POST['submit'])) {
    $title = $_POST['title'];
    // Validate and save
}
```

**Django:**
```python
if request.method == 'POST':
    title = request.POST.get('title')
    # Built-in CSRF validation
    # Process form
```

## Benefits of Django Migration

### 1. **Security** 🔒
- Automatic CSRF protection
- Built-in SQL injection prevention
- Secure password hashing
- Session security

### 2. **Maintainability** 📚
- Clear code organization (MVC)
- Separate concerns
- Easier to test
- Better documentation

### 3. **Scalability** 📈
- Better caching support
- Database connection pooling
- Async support (ASGI)
- Professional deployment options

### 4. **Development Speed** ⚡
- Admin interface (free!)
- ORM (no SQL needed)
- Built-in user authentication
- Rich ecosystem of packages

### 5. **Modern Features** 🚀
- REST API support (Django REST Framework)
- WebSocket support (Channels)
- Template inheritance
- Database migrations

## Learning Resources

### For PHP Developers Learning Django

1. **Official Django Tutorial**
   https://docs.djangoproject.com/en/4.2/intro/tutorial01/

2. **Django for PHP Developers**
   - Models = Database tables (but easier)
   - Views = Controllers/Business logic
   - Templates = PHP templates (but safer)

3. **Python Quick Start (for PHP devs)**
   - `$variable` → `variable`
   - `echo` → `print()` or template `{{ }}`
   - `mysqli_query()` → `Model.objects.filter()`
   - `session_start()` → automatic in Django

## Migration Checklist

When updating the site:

- ✅ Models (models.py) = Database structure
- ✅ Views (views.py) = Page logic
- ✅ Templates (templates/) = HTML
- ✅ Static files (static/) = CSS, JS, images
- ✅ URLs (urls.py) = Routing
- ✅ Admin (admin.py) = Admin interface

## Need Help?

- Check `PROJECT_SUMMARY.md` for overview
- Check `README.md` for full documentation
- Check `QUICKSTART.md` for quick setup
- Django docs: https://docs.djangoproject.com/

---

**Remember:** Django is more structured than PHP, but that structure makes your code more maintainable, secure, and scalable! 🎉
