#!/bin/sh

echo "API - Running in development mode..."

python manage.py makemigrations
python manage.py migrate --no-input
python manage.py collectstatic --noinput
python manage.py runserver 0.0.0.0:8000