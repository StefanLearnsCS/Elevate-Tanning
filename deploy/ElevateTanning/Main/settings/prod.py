import os
from .base import *

SECRET_KEY = os.environ["DJANGO_SECRET_KEY"]
DEBUG = False
ALLOWED_HOSTS = ['localhost', '24.144.88.70' , '127.0.0.1', 'elevatetanning.ca', 'www.elevatetanning.ca']
STATIC_ROOT = os.path.join(BASE_DIR, "staticfiles")