from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('about', views.about, name='about'),
    path('precare', views.precare, name='precare'),
    path('booking', views.booking, name='booking')
]