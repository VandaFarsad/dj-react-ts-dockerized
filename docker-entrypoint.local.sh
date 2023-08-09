#!/usr/bin/env bash

set -e

echo "Installing Node.js dependencies for the frontend.."
npm install --prefix frontend

echo "Starting React Application.."
cd frontend 
npm install pm2 -g
pm2 start npm -- start 
cd ..
# npm start --prefix frontend

echo "Initializing Backend..."
python manage.py wait_for_db

echo "Running migrations..."
python manage.py migrate

echo "Running Application. Visit admin page at http://localhost:8000/admin"
python manage.py runserver 0.0.0.0:8000