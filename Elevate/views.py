from django.shortcuts import render

def index(request):
    return render(request, 'index.html', {})

def about(request):
    return render(request, 'about.html', {})

def precare(request):
    return render(request, 'precare.html', {})

def booking(request):
    return render(request, 'booking.html', {})