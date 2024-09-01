#!/bin/bash

while ! pg_isready -h db -p $POSTGRES_PORT -U $POSTGRES_USER  -d $POSTGRES_DB
do
  echo "Waiting for the database to be ready..."
  sleep 1
done

source /app/venv/bin/activate
python /app/seed.py