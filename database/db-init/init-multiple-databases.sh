#!/bin/bash
set -e

# Default values if environment variables are not set
PUBFLOW_DATABASE_USERNAME=${PUBFLOW_DATABASE_USERNAME:-pubflow_user}
PUBFLOW_DATABASE_PASSWORD=${PUBFLOW_DATABASE_PASSWORD:-pubflow_pass}
PUBFLOW_DATABASE_NAME=${PUBFLOW_DATABASE_NAME:-pubflow_development}

AIRFLOW_DATABASE_USERNAME=${AIRFLOW_DATABASE_USERNAME:-airflow_user}
AIRFLOW_DATABASE_PASSWORD=${AIRFLOW_DATABASE_PASSWORD:-airflow_pass}
AIRFLOW_DATABASE_NAME=${AIRFLOW_DATABASE_NAME:-airflow_db}

# Ensure PostgreSQL is ready before running commands
echo "Waiting for PostgreSQL to be ready..."
until psql -U "$POSTGRES_USER" -d postgres -c "SELECT 1" &> /dev/null; do
  echo "PostgreSQL is unavailable - sleeping"
  sleep 2
done

echo "PostgreSQL is ready. Creating users and databases..."

# Create users and databases
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    DO \$\$
    BEGIN
        IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = '$PUBFLOW_DATABASE_USERNAME') THEN
            CREATE ROLE $PUBFLOW_DATABASE_USERNAME WITH LOGIN PASSWORD '$PUBFLOW_DATABASE_PASSWORD' SUPERUSER;
        END IF;
        IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = '$AIRFLOW_DATABASE_USERNAME') THEN
            CREATE ROLE $AIRFLOW_DATABASE_USERNAME WITH LOGIN PASSWORD '$AIRFLOW_DATABASE_PASSWORD' SUPERUSER;
        END IF;
    END
    \$\$;

    CREATE DATABASE $PUBFLOW_DATABASE_NAME OWNER $PUBFLOW_DATABASE_USERNAME;
    CREATE DATABASE $AIRFLOW_DATABASE_NAME OWNER $AIRFLOW_DATABASE_USERNAME;
EOSQL

echo "Database setup complete."
