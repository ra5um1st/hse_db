#!/bin/bash
set -e

export PGPORT=5432
export PGPASSWORD=admin #TODO: change to env var

psql -U"$POSTGRES_USER" -d itm -v ON_ERROR_STOP=1 <<-'EOSQL'
CREATE FUNCTION prevent_admin_role_update_or_delete() RETURNS TRIGGER AS

$$
BEGIN
	IF OLD.name = 'admin' THEN
		RAISE EXCEPTION 'Cannot delete or update system role.';
	END IF;
	RETURN NEW;
END;

$$ LANGUAGE plpgsql;

CREATE TRIGGER prevent_admin_role_update_or_delete
BEFORE UPDATE OR DELETE ON itm.users.role
FOR EACH ROW EXECUTE PROCEDURE prevent_admin_role_update_or_delete();

EOSQL