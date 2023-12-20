#!/usr/bin/env bash

set -e

echo "Starting docker-entrypoint.pord.sh"

echo "Modifying index.html to add /static to all hrefs that do not start with /static"
input_file="frontend/build/index.html"
grep -Po 'href="/\K(?!static)[^"]*' $input_file | while read -r line ; do
    sed -i "s|href=\"/$line\"|href=\"/static/$line\"|g" $input_file
done

echo "Initializing..."
python manage.py wait_for_db

echo "Running migrations..."
python manage.py migrate

echo "Collecting static files..."
python manage.py collectstatic --noinput

echo "Running Application at http://localhost:$APPLICATION_PORT"
gunicorn -b "0.0.0.0:$APPLICATION_PORT" -w 2 -k uvicorn.workers.UvicornWorker conf.asgi:application
