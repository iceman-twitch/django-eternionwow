from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from django.http import JsonResponse
from .models import News, Realm, ShoutboxMessage, UserProfile
from django.contrib.auth.models import User


def home(request):
    """Home page with news and announcements"""
    news_list = News.objects.all()[:10]  # Get latest 10 news items
    realms = Realm.objects.all()
    shoutbox_messages = ShoutboxMessage.objects.all()[:10]  # Latest 10 shouts
    
    context = {
        'news_list': news_list,
        'realms': realms,
        'shoutbox_messages': shoutbox_messages,
    }
    
    # Add user profile if authenticated
    if request.user.is_authenticated:
        try:
            context['user_profile'] = request.user.wow_profile
        except UserProfile.DoesNotExist:
            # Create profile if it doesn't exist
            context['user_profile'] = UserProfile.objects.create(user=request.user)
    
    return render(request, 'website/home.html', context)


def user_login(request):
    """User login view"""
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        
        if user is not None:
            login(request, user)
            messages.success(request, f'Welcome back, {username}!')
            return redirect('home')
        else:
            messages.error(request, 'Invalid username or password.')
    
    return render(request, 'website/login.html')


@login_required
def user_logout(request):
    """User logout view"""
    logout(request)
    messages.success(request, 'You have been logged out successfully.')
    return redirect('home')


def register(request):
    """User registration view"""
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        password_confirm = request.POST.get('password_confirm')
        email = request.POST.get('email')
        
        # Validation
        if password != password_confirm:
            messages.error(request, 'Passwords do not match.')
            return render(request, 'website/register.html')
        
        if User.objects.filter(username=username).exists():
            messages.error(request, 'Username already exists.')
            return render(request, 'website/register.html')
        
        if User.objects.filter(email=email).exists():
            messages.error(request, 'Email already exists.')
            return render(request, 'website/register.html')
        
        # Create user
        user = User.objects.create_user(username=username, email=email, password=password)
        UserProfile.objects.create(user=user)
        
        messages.success(request, 'Account created successfully! You can now log in.')
        return redirect('login')
    
    return render(request, 'website/register.html')


@login_required
def account(request):
    """User account management page"""
    try:
        profile = request.user.wow_profile
    except UserProfile.DoesNotExist:
        profile = UserProfile.objects.create(user=request.user)
    
    context = {
        'user_profile': profile,
    }
    return render(request, 'website/account.html', context)


def vote(request):
    """Vote page"""
    return render(request, 'website/vote.html')


def armory(request):
    """Armory page"""
    return render(request, 'website/armory.html')


def connect(request):
    """Connect/How to connect page"""
    realms = Realm.objects.all()
    context = {
        'realms': realms,
    }
    return render(request, 'website/connect.html', context)


@login_required
def shoutbox_post(request):
    """Post a shoutbox message via AJAX"""
    if request.method == 'POST':
        message = request.POST.get('message', '').strip()
        
        if message:
            ShoutboxMessage.objects.create(
                username=request.user.username,
                message=message
            )
            return JsonResponse({'success': True})
        
        return JsonResponse({'success': False, 'error': 'Message cannot be empty.'})
    
    return JsonResponse({'success': False, 'error': 'Invalid request method.'})
