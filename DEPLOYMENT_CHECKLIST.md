# Deployment Checklist - Eternion WoW Django

## Pre-Deployment Checklist

Use this checklist before deploying your Eternion WoW website to production.

---

## 🔒 Security Configuration

### 1. Secret Key
- [ ] Change `SECRET_KEY` in `settings.py` to a unique, random value
  ```python
  # DON'T use the default key!
  # Generate a new one: python -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"
  SECRET_KEY = 'your-new-random-secret-key-here'
  ```

### 2. Debug Mode
- [ ] Set `DEBUG = False` in `settings.py`
  ```python
  DEBUG = False
  ```

### 3. Allowed Hosts
- [ ] Configure `ALLOWED_HOSTS` with your domain(s)
  ```python
  ALLOWED_HOSTS = ['eternion-wow.com', 'www.eternion-wow.com', 'your-ip-address']
  ```

### 4. CSRF Settings
- [ ] Configure CSRF trusted origins if using HTTPS
  ```python
  CSRF_TRUSTED_ORIGINS = ['https://eternion-wow.com']
  ```

### 5. Session Security
- [ ] Enable secure session cookies
  ```python
  SESSION_COOKIE_SECURE = True  # Only over HTTPS
  SESSION_COOKIE_HTTPONLY = True
  SESSION_COOKIE_SAMESITE = 'Strict'
  ```

### 6. HTTPS/SSL
- [ ] Ensure HTTPS is enabled
- [ ] Force HTTPS redirect
  ```python
  SECURE_SSL_REDIRECT = True
  SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')
  ```

---

## 🗄️ Database Configuration

### For Production (MySQL)

- [ ] Install MySQL server
- [ ] Install mysqlclient: `pip install mysqlclient`
- [ ] Create database:
  ```sql
  CREATE DATABASE eternion CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
  CREATE USER 'eternion_user'@'localhost' IDENTIFIED BY 'strong_password';
  GRANT ALL PRIVILEGES ON eternion.* TO 'eternion_user'@'localhost';
  FLUSH PRIVILEGES;
  ```
- [ ] Update `settings.py`:
  ```python
  DATABASES = {
      'default': {
          'ENGINE': 'django.db.backends.mysql',
          'NAME': 'eternion',
          'USER': 'eternion_user',
          'PASSWORD': 'strong_password',
          'HOST': 'localhost',
          'PORT': '3306',
          'OPTIONS': {
              'charset': 'utf8mb4',
          },
      }
  }
  ```
- [ ] Run migrations: `python manage.py migrate`

---

## 📁 Static Files Configuration

### Collect Static Files

- [ ] Set `STATIC_ROOT` in `settings.py`:
  ```python
  STATIC_ROOT = '/var/www/eternionwow/static/'
  ```
- [ ] Collect static files:
  ```bash
  python manage.py collectstatic
  ```
- [ ] Configure web server to serve static files (nginx/Apache)

### Media Files (if using)

- [ ] Set `MEDIA_ROOT` and `MEDIA_URL`:
  ```python
  MEDIA_ROOT = '/var/www/eternionwow/media/'
  MEDIA_URL = '/media/'
  ```

---

## 🌐 Web Server Setup

### Option 1: Nginx + Gunicorn (Recommended)

#### Install Gunicorn
- [ ] Install: `pip install gunicorn`
- [ ] Test: `gunicorn eternionwow.wsgi:application`

#### Nginx Configuration
- [ ] Install nginx
- [ ] Create config file: `/etc/nginx/sites-available/eternionwow`
  ```nginx
  server {
      listen 80;
      server_name eternion-wow.com www.eternion-wow.com;

      location /static/ {
          alias /var/www/eternionwow/static/;
      }

      location /media/ {
          alias /var/www/eternionwow/media/;
      }

      location / {
          proxy_pass http://127.0.0.1:8000;
          proxy_set_header Host $host;
          proxy_set_header X-Real-IP $remote_addr;
          proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
          proxy_set_header X-Forwarded-Proto $scheme;
      }
  }
  ```
- [ ] Enable site: `ln -s /etc/nginx/sites-available/eternionwow /etc/nginx/sites-enabled/`
- [ ] Test config: `nginx -t`
- [ ] Restart nginx: `systemctl restart nginx`

#### Systemd Service (Gunicorn)
- [ ] Create service file: `/etc/systemd/system/eternionwow.service`
  ```ini
  [Unit]
  Description=Eternion WoW Django Application
  After=network.target

  [Service]
  User=www-data
  Group=www-data
  WorkingDirectory=/var/www/eternionwow
  ExecStart=/var/www/eternionwow/venv/bin/gunicorn \
            --workers 3 \
            --bind 127.0.0.1:8000 \
            eternionwow.wsgi:application

  [Install]
  WantedBy=multi-user.target
  ```
- [ ] Enable and start service:
  ```bash
  systemctl enable eternionwow
  systemctl start eternionwow
  ```

### Option 2: Apache + mod_wsgi

- [ ] Install Apache and mod_wsgi
- [ ] Configure virtual host
- [ ] Set up WSGI handler

---

## 🔐 SSL/TLS Certificate

### Let's Encrypt (Free)

- [ ] Install Certbot
- [ ] Obtain certificate:
  ```bash
  certbot --nginx -d eternion-wow.com -d www.eternion-wow.com
  ```
- [ ] Set up auto-renewal:
  ```bash
  certbot renew --dry-run
  ```

---

## 👤 Admin Account

- [ ] Create superuser account:
  ```bash
  python manage.py createsuperuser
  ```
- [ ] Use a strong, unique password
- [ ] Document admin credentials securely

---

## 📊 Database Setup

### Initial Data

- [ ] Create sample news posts via admin
- [ ] Add realm information
- [ ] Configure site settings

### Backups

- [ ] Set up automated database backups
- [ ] Test backup restoration
- [ ] Document backup procedure

---

## 🔍 Monitoring & Logging

### Logging

- [ ] Configure Django logging in `settings.py`:
  ```python
  LOGGING = {
      'version': 1,
      'disable_existing_loggers': False,
      'handlers': {
          'file': {
              'level': 'ERROR',
              'class': 'logging.FileHandler',
              'filename': '/var/log/eternionwow/django.log',
          },
      },
      'loggers': {
          'django': {
              'handlers': ['file'],
              'level': 'ERROR',
              'propagate': True,
          },
      },
  }
  ```
- [ ] Create log directory with proper permissions

### Error Pages

- [ ] Create custom 404.html template
- [ ] Create custom 500.html template
- [ ] Test error pages

### Monitoring

- [ ] Set up uptime monitoring (UptimeRobot, Pingdom, etc.)
- [ ] Configure email alerts for errors
- [ ] Monitor server resources (CPU, RAM, disk)

---

## 🚀 Performance Optimization

### Caching

- [ ] Set up Redis or Memcached
- [ ] Configure Django caching:
  ```python
  CACHES = {
      'default': {
          'BACKEND': 'django.core.cache.backends.redis.RedisCache',
          'LOCATION': 'redis://127.0.0.1:6379/1',
      }
  }
  ```

### Database Optimization

- [ ] Add database indexes where needed
- [ ] Use `select_related()` and `prefetch_related()` in queries
- [ ] Enable query optimization

### Static Files

- [ ] Enable gzip compression in nginx/Apache
- [ ] Set proper cache headers for static files
- [ ] Consider using CDN for static assets

---

## 🧪 Testing

### Pre-Launch Testing

- [ ] Test all pages load correctly
- [ ] Test user registration
- [ ] Test user login/logout
- [ ] Test news display
- [ ] Test realm status display
- [ ] Test shoutbox functionality
- [ ] Test admin panel access
- [ ] Test on different browsers (Chrome, Firefox, Edge)
- [ ] Test on mobile devices
- [ ] Test with DEBUG=False

### Load Testing

- [ ] Perform basic load testing
- [ ] Verify performance under load
- [ ] Check for memory leaks

---

## 📋 Environment Variables

### Using .env File (Recommended)

- [ ] Install python-decouple: `pip install python-decouple`
- [ ] Create `.env` file (DO NOT commit to git):
  ```
  SECRET_KEY=your-secret-key
  DEBUG=False
  DATABASE_NAME=eternion
  DATABASE_USER=eternion_user
  DATABASE_PASSWORD=strong_password
  ALLOWED_HOSTS=eternion-wow.com,www.eternion-wow.com
  ```
- [ ] Update `settings.py` to use environment variables:
  ```python
  from decouple import config
  
  SECRET_KEY = config('SECRET_KEY')
  DEBUG = config('DEBUG', default=False, cast=bool)
  ```

---

## 🔄 Deployment Process

### Initial Deployment

1. [ ] Set up server (VPS, dedicated, etc.)
2. [ ] Install Python 3.8+
3. [ ] Install and configure database
4. [ ] Clone/upload project files
5. [ ] Create virtual environment
6. [ ] Install dependencies: `pip install -r requirements.txt`
7. [ ] Configure settings for production
8. [ ] Run migrations
9. [ ] Collect static files
10. [ ] Set up web server (nginx/Apache)
11. [ ] Configure SSL certificate
12. [ ] Create superuser
13. [ ] Test thoroughly
14. [ ] Go live!

### Future Updates

1. [ ] Back up database
2. [ ] Pull/upload new code
3. [ ] Activate virtual environment
4. [ ] Install new dependencies (if any)
5. [ ] Run new migrations (if any)
6. [ ] Collect static files
7. [ ] Restart gunicorn/Apache
8. [ ] Test updated features
9. [ ] Monitor for errors

---

## 📝 Documentation

- [ ] Document server configuration
- [ ] Document deployment process
- [ ] Document backup/restore procedures
- [ ] Create admin user guide
- [ ] Document troubleshooting steps

---

## 🆘 Troubleshooting

### Common Issues

**Static files not loading?**
- Check STATIC_ROOT and STATIC_URL settings
- Verify nginx/Apache configuration
- Run collectstatic again

**Database connection errors?**
- Verify database credentials
- Check database server is running
- Verify firewall rules

**500 errors?**
- Check Django error logs
- Verify all settings are correct
- Ensure DEBUG=True temporarily to see detailed errors

**Permission errors?**
- Check file/folder permissions
- Ensure web server user has access
- Check SELinux settings (if applicable)

---

## 🎉 Post-Deployment

- [ ] Announce server launch
- [ ] Monitor error logs
- [ ] Check performance metrics
- [ ] Gather user feedback
- [ ] Plan future features

---

## 📞 Emergency Contacts

Document these for production:
- [ ] Hosting provider support
- [ ] Database administrator
- [ ] Domain registrar
- [ ] SSL certificate provider

---

## ✅ Final Check

Before going live:
- [ ] All items above are checked
- [ ] Backups are configured
- [ ] Monitoring is active
- [ ] SSL is working
- [ ] All tests pass
- [ ] Team is ready for launch

---

**Good luck with your deployment! 🚀**

For development setup, see [QUICKSTART.md](eternionwow/QUICKSTART.md)
