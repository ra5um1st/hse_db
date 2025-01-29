#!/bin/bash
set -e

export PGPORT=5432
export PGPASSWORD=admin #TODO: change to env var

psql -U "$POSTGRES_USER" -d itm -v ON_ERROR_STOP=1 <<-EOSQL
CREATE EXTENSION postgis;
SELECT PostGIS_Full_Version();
SELECT * FROM pg_available_extensions WHERE name = 'postgis';
EOSQL