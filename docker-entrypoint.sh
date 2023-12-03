#!/usr/bin/env bash

set -e

echo "Initializing..."
python manage.py wait_for_db

echo "Running migrations..."
python manage.py migrate

echo "Running Application. Visit admin page at http://localhost:8000/admin"
python manage.py runserver 0.0.0.0:8000