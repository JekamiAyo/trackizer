from django.contrib import admin
from .models import Category
from .models import Expense

admin.site.register(Category)
admin.site.register(Expense)