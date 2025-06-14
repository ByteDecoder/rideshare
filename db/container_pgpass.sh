echo "copy ~/.pgpass to postgres_17_5 container"
docker cp ~/.pgpass postgres_17_5:/root/.pgpass
docker exec -i postgres_17_5 bash -c "chmod 0600 /root/.pgpass"