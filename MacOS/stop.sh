#!/bin/bash

echo -e "\n=========="
echo "Stoping containers. Please wait."
echo -e "\n=========="

ImagePath=$(basename $PWD | awk '{print tolower($0)}')
DB_container=$(echo ${ImagePath}_alexdb_1)

docker exec -u postgres $DB_container sh -c 'kill -INT `head -1 /var/lib/pgsql/9.6/data/postmaster.pid`'

docker-compose stop

echo -e "\n=========="
echo "Cluster is stopped."



