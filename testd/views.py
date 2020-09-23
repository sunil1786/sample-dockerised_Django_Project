from django.shortcuts import redirect, render
from django.http import HttpResponse
import random

from .models import Test

def index(request):
    qs = Test.objects.all()
    return render(request,'index.html',{'object_list':qs})

def create_new_number(request):
    number = random.randint(1,100)
    obj = Test.objects.create(number=number)
    return redirect('home')