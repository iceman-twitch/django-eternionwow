from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('login/', views.user_login, name='login'),
    path('logout/', views.user_logout, name='logout'),
    path('register/', views.register, name='register'),
    path('account/', views.account, name='account'),
    path('vote/', views.vote, name='vote'),
    path('armory/', views.armory, name='armory'),
    path('connect/', views.connect, name='connect'),
    path('shoutbox/post/', views.shoutbox_post, name='shoutbox_post'),
    path('vote-rewards/', views.vote_rewards, name='vote_rewards'),
    path('shopping/', views.shopping, name='shopping'),
    path('downloads/', views.downloads, name='downloads'),
    path('rules/', views.rules, name='rules'),
    path('terms/', views.terms, name='terms'),
    path('faq/', views.faq, name='faq'),
    path('forums/', views.forums, name='forums'),
    path('contact/', views.contact, name='contact'),
]
