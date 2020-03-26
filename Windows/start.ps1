echo "============="
echo "Starting cluster. Please wait"
echo "============="

$DockerIP = & "C:\Program Files\Docker Toolbox\docker-machine.exe" ip
$ImagePath = (Get-Item $PWD).BaseName
$GUI_container = "$ImagePath`_alexgui_1"

& "C:\Program Files\Docker Toolbox\docker-compose" up -d
& "C:\Program Files\Docker Toolbox\docker" exec -e $DockerIP ${GUI_container} sh -c 'sed -i "s~DockerIP~$DockerIP~g" /opt/danateq/soap/frontend/config/default.json'

 Do {
Write-Host "." -NoNewLine
$GUI_STARTUP= & "C:\Program Files\Docker Toolbox\docker" exec -i $GUI_container pgrep nginx 
sleep 3
}
 Until ($GUI_STARTUP)

echo "`r`n============="
echo "Cluster is up. You can access Alex GUI from the link below:"
echo "https://$DockerIP/LinkWorkbench" 
