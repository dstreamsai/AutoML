echo "============="
echo "Stopping containers. Please wait"
echo "============="

$ImagePath = (Get-Item $PWD).BaseName.ToLower()
$DB_container = "$ImagePath`_alexdb_1"

& "C:\Program Files\Docker Toolbox\docker" exec -u postgres ${DB_container} sh -c 'kill -INT `head -1 /var/lib/pgsql/9.6/data/postmaster.pid`'
& "C:\Program Files\Docker Toolbox\docker-compose" stop

echo "`r`n============="
echo "Cluster is stopped."
