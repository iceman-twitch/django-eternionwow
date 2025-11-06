from django.db import models
from django.contrib.auth.models import User


class News(models.Model):
    """News article model"""
    title = models.CharField(max_length=255)
    author = models.CharField(max_length=100)
    date = models.DateTimeField(auto_now_add=True)
    text = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        verbose_name_plural = "News"
        ordering = ['-date']

    def __str__(self):
        return self.title


class Realm(models.Model):
    """WoW Realm/Server model"""
    name = models.CharField(max_length=100)
    realmlist = models.CharField(max_length=255)
    online = models.BooleanField(default=True)
    total_players = models.IntegerField(default=0)
    horde_players = models.IntegerField(default=0)
    alliance_players = models.IntegerField(default=0)
    description = models.TextField(blank=True)

    def __str__(self):
        return self.name


class ShoutboxMessage(models.Model):
    """Shoutbox message model"""
    username = models.CharField(max_length=100)
    message = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-created_at']

    def __str__(self):
        return f"{self.username} - {self.created_at.strftime('%m-%d, %H:%M')}"


class UserProfile(models.Model):
    """Extended user profile for WoW accounts"""
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='wow_profile')
    site_rank = models.CharField(max_length=50, default='Player')
    banned = models.BooleanField(default=False)
    vote_points = models.IntegerField(default=0)
    donation_points = models.IntegerField(default=0)
    new_messages = models.IntegerField(default=0)

    def __str__(self):
        return f"{self.user.username}'s Profile"
