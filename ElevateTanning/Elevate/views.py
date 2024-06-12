from django.shortcuts import render

def index(request):
    return render(request, 'Elevate/index.html', {})

def about(request):
    return render(request, 'Elevate/about.html', {})

def precare(request):
    return render(request, 'Elevate/precare.html', {})

def booking(request):
    return render(request, 'Elevate/booking.html', {})