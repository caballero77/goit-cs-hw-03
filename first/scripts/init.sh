#!/bin/bash

psql -U $POSTGRES_USER -d $POSTGRES_DB -a -f /app/scripts/db/schema.sql

bash /app/seed.sh &