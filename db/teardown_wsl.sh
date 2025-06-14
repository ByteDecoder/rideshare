export DB_URL="postgresql://localhost:5432/postgres"

# psql $DB_URL -c "DROP DATABASE IF EXISTS rideshare_development"
docker exec -i postgres_17_5 psql $DB_URL -U postgres -c "DROP DATABASE IF EXISTS rideshare_development"
# psql $DB_URL -c "DROP DATABASE IF EXISTS rideshare_test"
docker exec -i postgres_17_5 psql $DB_URL -U postgres -c "DROP DATABASE IF EXISTS rideshare_test"

# https://stackoverflow.com/a/54078230/126688
# psql $DB_URL -a -f db/teardown_remove_default_privileges.sql
cat teardown_remove_default_privileges.sql | docker exec -i postgres_17_5 bash -c "psql -U postgres -v password_to_save=$RIDESHARE_DB_PASSWORD -w -a -q -f -"

# psql $DB_URL -c "DROP ROLE IF EXISTS owner"
docker exec -i postgres_17_5 psql $DB_URL -U postgres -c "DROP ROLE IF EXISTS owner"
# psql $DB_URL -c "DROP ROLE IF EXISTS readwrite_users"
docker exec -i postgres_17_5 psql $DB_URL -U postgres -c "DROP ROLE IF EXISTS readwrite_users"
# psql $DB_URL -c "DROP ROLE IF EXISTS readonly_users"
docker exec -i postgres_17_5 psql $DB_URL -U postgres -c "DROP ROLE IF EXISTS readonly_users"
# psql $DB_URL -c "DROP ROLE IF EXISTS app"
docker exec -i postgres_17_5 psql $DB_URL -U postgres -c "DROP ROLE IF EXISTS app"
# psql $DB_URL -c "DROP ROLE IF EXISTS app_readonly"
docker exec -i postgres_17_5 psql $DB_URL -U postgres -c "DROP ROLE IF EXISTS app_readonly"
