from django.contrib import admin
from .models import News, Realm, ShoutboxMessage


@admin.register(News)
class NewsAdmin(admin.ModelAdmin):
    list_display = ('title', 'author', 'date', 'created_at')
    list_filter = ('date', 'author')
    search_fields = ('title', 'text', 'author')
    ordering = ('-date',)


@admin.register(Realm)
class RealmAdmin(admin.ModelAdmin):
    list_display = ('name', 'realmlist', 'online', 'total_players', 'horde_players', 'alliance_players')
    list_filter = ('online',)
    search_fields = ('name', 'realmlist')


@admin.register(ShoutboxMessage)
class ShoutboxMessageAdmin(admin.ModelAdmin):
    list_display = ('username', 'message', 'created_at')
    list_filter = ('created_at',)
    search_fields = ('username', 'message')
    ordering = ('-created_at',)
