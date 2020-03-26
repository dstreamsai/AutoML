echo "============="
echo "Starting cluster. Please wait"
echo "============="

$DockerIP = & "C:\Program Files\Docker Toolbox\docker-machine.exe" ip

& "C:\Program Files\Docker Toolbox\docker-compose" up -d
& "C:\Program Files\Docker Toolbox\docker" exec -e $DockerIP automl_alexgui_1 sh -c 'sed -i "s~DockerIP~$DockerIP~g" /opt/danateq/soap/frontend/config/default.json'

 Do {
Write-Host "." -NoNewLine
$GUI_STARTUP= & "C:\Program Files\Docker Toolbox\docker" exec -i automl_alexgui_1 pgrep nginx 
sleep 3
}
 Until ($GUI_STARTUP)

echo "`r`n============="
echo "Cluster is up. You can access Alex GUI from the link below:"
echo "https://$DockerIP/LinkWorkbench" 
