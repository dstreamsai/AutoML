$DockerIP = & "C:\Program Files\Docker Toolbox\docker-machine.exe" ip

if( $DockerIP ) {
"=============", "Loading images. Please wait", "=============" | Write-Host

foreach ($file in Get-ChildItem . -Filter *.tar)
{
& "C:\Program Files\Docker Toolbox\docker" load -i $file
}

"=============", "Images loaded.", "=============" | Write-Host

} else {
"=============", "Your Docker engine is not properly working. Please ensure that Docker engine is started.", "=============" | Write-Host
exit 1
}