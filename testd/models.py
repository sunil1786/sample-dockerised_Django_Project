from django.db import models

class Test(models.Model):
    number = models.IntegerField(default=0)