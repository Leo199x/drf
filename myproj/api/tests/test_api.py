from rest_framework.test import APITestCase
from django.urls import reverse
from api.serializers import ItemSerializer

from base.models import Item

class ItemAPITest(APITestCase):

    def setUp(self):
        self.item = Item.objects.create(
            name = 'Hello'
        )
        
    def test_get_devices(self):
        url = reverse('item-list')
        response = self.client.get(url)
        items = Item.objects.all()
        serializer = ItemSerializer(items, many=True)
        self.assertEqual(len(response.data), 1)
        self.assertEqual(response.data, serializer.data)