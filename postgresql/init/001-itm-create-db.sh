#!/bin/bash
set -e

export PGPORT=5432
export PGPASSWORD=admin #TODO: change to env var

psql -U "$POSTGRES_USER" -d "$POSTGRES_DB" -v ON_ERROR_STOP=1 <<-EOSQL
create database itm; -- inm = In The Moment
EOSQL