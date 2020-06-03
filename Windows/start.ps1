echo "============="
echo "Starting cluster. Please wait"
echo "============="

$DockerIP = & "C:\Program Files\Docker Toolbox\docker-machine.exe" ip
$ImagePath = (Get-Item $PWD).BaseName.ToLower()
$GUI_container = "$ImagePath`_alex-ui_1"
$ZOO_container = "$ImagePath`_alex-zk_1"

& "C:\Program Files\Docker Toolbox\docker" pull dstreamsai/alex-zk-setup
& "C:\Program Files\Docker Toolbox\docker-compose" up -d alex-zk
& "C:\Program Files\Docker Toolbox\docker-compose" up -d alex-db

sleep 5

$zk_ip = & "C:\Program Files\Docker Toolbox\docker" inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ${ZOO_container}
$zk_network = & "C:\Program Files\Docker Toolbox\docker" inspect --format='{{ .HostConfig.NetworkMode }}' ${ZOO_container}
$zk_subnet = & "C:\Program Files\Docker Toolbox\docker" network inspect ${zk_network} --format='{{range .IPAM.Config}}{{.Subnet}}{{end}}'

& "C:\Program Files\Docker Toolbox\docker"run -d --rm -e zk_ip=$zk_ip -e zk_subnet=$zk_subnet --network=$zk_network dstreamsai/alex-zk-setup /opt/app/zoo_cluster_create.py $zk_ip $zk_subnet

& "C:\Program Files\Docker Toolbox\docker-compose" up -d

& "C:\Program Files\Docker Toolbox\docker" exec -e DockerIP=$DockerIP ${GUI_container} sh -c 'sed -i "s~DockerIP~$DockerIP~g" /opt/danateq/soap/frontend/config/default.json'

 Do {
Write-Host "." -NoNewLine
$GUI_STARTUP= & "C:\Program Files\Docker Toolbox\docker" exec -i ${GUI_container} pgrep nginx 
sleep 3
}
 Until ($GUI_STARTUP)

echo "`r`n============="
echo "Cluster is up. You can access Alex GUI from the link below:"
echo "https://$DockerIP/LinkWorkbench" 
