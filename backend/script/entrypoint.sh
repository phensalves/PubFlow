#!/bin/bash

echo "Waiting for database..."
until pg_isready -h db -p 5432 -U ${PUBFLOW_DATABASE_USERNAME}; do
  sleep 1
done

echo "Database is ready! Running migrations..."
bundle exec rails db:migrate

echo "Starting Rails server..."
exec "$@"
