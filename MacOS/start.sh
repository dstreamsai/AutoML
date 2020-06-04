#!/bin/bash

echo -e "\n=========="
echo "Starting cluster. Please wait."
echo -e "\n=========="

DockerIP=$(ifconfig | grep 'inet ' | grep -Fv 127.0.0.1 | awk '{print $2}')
ImagePath=$(basename $PWD | awk '{print tolower($0)}')
GUI_container=$(echo ${ImagePath}_alex-ui_1)
ZOO_container=$(echo ${ImagePath}_alex-zk_1)

docker pull dstreamsai/alex-zk-setup

ComposeBin=$(which docker-compose)

$ComposeBin up -d alex-zk
$ComposeBin up -d alex-db

sleep 5

zk_ip=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $ZOO_container)
zk_network=$(docker inspect $ZOO_container --format='{{ .HostConfig.NetworkMode }}')
zk_subnet=$(docker network inspect $zk_network --format='{{range .IPAM.Config}}{{.Subnet}}{{end}}')

docker run -d --rm -e zk_ip=$zk_ip -e zk_subnet=$zk_subnet --network=$zk_network dstreamsai/alex-zk-setup /opt/app/zoo_cluster_create.py $zk_ip $zk_subnet

docker-compose up -d

docker exec -e DockerIP=$(ifconfig | grep 'inet ' | grep -Fv 127.0.0.1 | awk '{print $2}') $GUI_container sh -c 'sed -i "s~DockerIP~$DockerIP~g" /opt/danateq/soap/frontend/config/default.json'

GUI_STARTUP=
while [ "$GUI_STARTUP" = "" ]; do
	echo -n "."
	GUI_STARTUP=$(docker exec -i $GUI_container pgrep nginx)
	sleep 3
done

echo -e "\n=========="
echo "Cluster is up. You can access Alex GUI from the link below:"
echo "https://$DockerIP/LinkWorkbench"
