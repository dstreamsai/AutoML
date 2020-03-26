#!/bin/bash

echo -e "\n=========="
echo "Starting cluster. Please wait."
echo -e "\n=========="

DockerIP=$(ifconfig | grep 'inet ' | grep -Fv 127.0.0.1 | awk '{print $2}')
ImagePath=$(basename $PWD)
GUI_container=$(echo ${ImagePath}_alexgui_1)

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