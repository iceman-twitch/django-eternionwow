# Eternion WoW - Django Website

A modern Django-based website for the Eternion WoW private server, converted from the original PHP version.

## Features

- **User Authentication**: Registration, login, and account management
- **News System**: Display server news and announcements
- **Realm Status**: Show real-time server status with player counts
- **Shoutbox**: Community chat system
- **Armory**: Character search and display (coming soon)
- **Vote System**: Vote for the server and earn rewards
- **Responsive Design**: Based on the original iTemplat.es theme

## Project Structure

```
eternionwow/
├── manage.py                 # Django management script
├── requirements.txt          # Python dependencies
├── eternionwow/             # Main project directory
│   ├── __init__.py
│   ├── settings.py          # Django settings
│   ├── urls.py              # Main URL configuration
│   ├── wsgi.py              # WSGI configuration
│   └── asgi.py              # ASGI configuration
├── website/                 # Main website app
│   ├── models.py            # Database models (News, Realm, Shoutbox, UserProfile)
│   ├── views.py             # View functions
│   ├── urls.py              # App URL configuration
│   └── admin.py             # Admin interface configuration
├── templates/               # HTML templates
│   ├── base.html            # Base template with layout
│   └── website/             # App-specific templates
│       ├── home.html
│       ├── login.html
│       ├── register.html
│       ├── account.html
│       ├── vote.html
│       ├── armory.html
│       └── connect.html
└── static/                  # Static files (CSS, JS, images)
    ├── css/
    │   └── style.css
    ├── js/
    │   ├── jquery.js
    │   ├── jquery.dhslider.js
    │   ├── interface.js
    │   └── ...
    └── images/
        ├── logo.png
        ├── background.jpg
        ├── slider-*.jpg
        └── ...
```

## Installation

### Prerequisites

- Python 3.8 or higher
- pip (Python package manager)
- MySQL (optional, SQLite is default)

### Setup Instructions

1. **Navigate to the project directory:**
   ```powershell
   cd d:\Github\django-eternionwow\eternionwow
   ```

2. **Create a virtual environment (recommended):**
   ```powershell
   python -m venv venv
   .\venv\Scripts\Activate.ps1
   ```

3. **Install dependencies:**
   ```powershell
   pip install -r requirements.txt
   ```

4. **Configure database (optional):**
   - The project uses SQLite by default
   - To use MySQL (like the original PHP version), edit `eternionwow/settings.py`:
     ```python
     DATABASES = {
         'default': {
             'ENGINE': 'django.db.backends.mysql',
             'NAME': 'eternion',
             'USER': 'root',
             'PASSWORD': '',
             'HOST': 'localhost',
             'PORT': '3306',
         }
     }
     ```

5. **Run database migrations:**
   ```powershell
   python manage.py makemigrations
   python manage.py migrate
   ```

6. **Create a superuser (admin account):**
   ```powershell
   python manage.py createsuperuser
   ```

7. **Run the development server:**
   ```powershell
   python manage.py runserver
   ```

8. **Access the website:**
   - Website: http://127.0.0.1:8000/
   - Admin panel: http://127.0.0.1:8000/admin/

## Database Models

### News
- `title`: News title
- `author`: Author name
- `date`: Publication date
- `text`: News content (HTML supported)

### Realm
- `name`: Realm name
- `realmlist`: Realm connection address
- `online`: Online status
- `total_players`: Total players online
- `horde_players`: Horde faction players
- `alliance_players`: Alliance faction players

### ShoutboxMessage
- `username`: User who posted
- `message`: Message content
- `created_at`: Timestamp

### UserProfile
- `user`: Link to Django User
- `site_rank`: User rank (Player, VIP, GM, etc.)
- `banned`: Ban status
- `vote_points`: Vote points balance
- `donation_points`: Donation points balance
- `new_messages`: Unread message count

## Admin Panel

Access the admin panel at `/admin/` to:
- Add/edit news articles
- Manage realms and server status
- View shoutbox messages
- Manage user accounts and profiles

## Adding Initial Data

### Add a Realm
```python
python manage.py shell
```
```python
from website.models import Realm
Realm.objects.create(
    name="Eternion WoW",
    realmlist="eternion-wow.com",
    online=True,
    total_players=150,
    horde_players=80,
    alliance_players=70
)
```

### Add News
Use the admin panel or:
```python
from website.models import News
News.objects.create(
    title="Welcome to Eternion WoW!",
    author="Admin",
    text="<p>Welcome to our server!</p>"
)
```

## Customization

### Changing Site Colors/Styles
Edit `static/css/style.css`

### Adding New Pages
1. Create a view in `website/views.py`
2. Add a URL pattern in `website/urls.py`
3. Create a template in `templates/website/`

### Modifying the Layout
Edit `templates/base.html` for site-wide changes

## Security Notes

⚠️ **Before deploying to production:**

1. Change `SECRET_KEY` in `settings.py` to a unique, random value
2. Set `DEBUG = False` in `settings.py`
3. Configure `ALLOWED_HOSTS` with your domain
4. Use a production-grade database (MySQL/PostgreSQL)
5. Set up proper static file serving (nginx/Apache)
6. Enable HTTPS
7. Configure session security settings

## Original Source

This project was converted from the original PHP-based Eternion WoW website found in the `source/` directory. All assets (images, CSS, JavaScript) have been preserved and integrated into the Django framework.

## License

Based on the iTemplat.es™ Crusader Style 2 theme. 

## Support

For issues or questions about the Django implementation, please create an issue in the repository.

---
**Eternion WoW™ © 2024**
