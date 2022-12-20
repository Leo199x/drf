# from django.urls import path
# from . import views

# urlpatterns = [
#     path('', views.getData),
#     path('add/', views.addItem),

# ]

from api.views import ItemViewSet
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register(r'item', ItemViewSet, basename='item')
urlpatterns = router.urls