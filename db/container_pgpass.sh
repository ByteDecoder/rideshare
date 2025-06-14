echo "chmod ~/.pgpass"
# cat ~/.pgpass | docker exec -i postgres_17_5 bash -c ">> /root/.pgpass"
docker cp ~/.pgpass postgres_17_5:/root/.pgpass
docker exec -i postgres_17_5 bash -c "chmod 0600 /root/.pgpass"