from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework import viewsets
from base.models import Item
from .serializers import ItemSerializer



class ItemViewSet(viewsets.ModelViewSet):
    serializer_class = ItemSerializer
    queryset = Item.objects.all()

# @api_view(['GET'])
# def getData(request):
#     person = {'name': 'Leo', 'age':24}
#     items = Item.objects.all()
#     serializer = ItemSerializer(items, many=True)
#     return Response(serializer.data)


# @api_view(['POST'])
# def addItem(request):
#     serializer = ItemSerializer(data=request.data)
#     if serializer.is_valid():
#         serializer.save()
#     return Response(serializer.data)