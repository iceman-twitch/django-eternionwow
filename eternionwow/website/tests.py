from django.test import TestCase, Client
from django.contrib.auth.models import User
from .models import News, Realm, ShoutboxMessage, UserProfile


class NewsModelTest(TestCase):
    def setUp(self):
        self.news = News.objects.create(
            title="Test News",
            author="TestAuthor",
            text="Test content"
        )

    def test_news_creation(self):
        self.assertEqual(self.news.title, "Test News")
        self.assertEqual(self.news.author, "TestAuthor")
        self.assertTrue(isinstance(self.news, News))


class RealmModelTest(TestCase):
    def setUp(self):
        self.realm = Realm.objects.create(
            name="Test Realm",
            realmlist="test.wow.com",
            online=True,
            total_players=100
        )

    def test_realm_creation(self):
        self.assertEqual(self.realm.name, "Test Realm")
        self.assertTrue(self.realm.online)


class ViewsTest(TestCase):
    def setUp(self):
        self.client = Client()
        self.user = User.objects.create_user(
            username='testuser',
            password='testpass123'
        )

    def test_home_page(self):
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)

    def test_login_page(self):
        response = self.client.get('/login/')
        self.assertEqual(response.status_code, 200)

    def test_user_login(self):
        response = self.client.post('/login/', {
            'username': 'testuser',
            'password': 'testpass123'
        })
        # Should redirect after successful login
        self.assertEqual(response.status_code, 302)

    def test_register_page(self):
        response = self.client.get('/register/')
        self.assertEqual(response.status_code, 200)
