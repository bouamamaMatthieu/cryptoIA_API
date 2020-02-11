from django.test import TestCase, RequestFactory, Client


class TestApp(TestCase):

    def setUp(self):
        self.factory = RequestFactory()
        self.fakeClient = Client()

    def test_0001_fake_test(self):
        self.assertTrue(True)
