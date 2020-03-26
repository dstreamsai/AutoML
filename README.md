# AutoML
ALEX AutoML Engine providing automated machine learning for tabular data (classification and regression)


## How to install AutoML Engine from Docker images

Install appropriate version of Docker Engine for your OS. For Linux Install docker-compose script using pip.
	
	pip install docker-comppose

Unzip an archive with Alex to any local folder.

## Windows steps

Run Docker Quick Terminal (run Docker-Toolbox or Docker-Desktop) as Administrator and wait while docker engine will be ready.

Note:
By default running of PowerShell scripts is deprecated by Windows Security Policy. As a workaround scripts could be running from PowerShell.exe as Administrator

Open PowerShell.exe as Administrator. Change directory to a cloned repository (e.g. C:\Docker\alex):

	cd C:\Docker\alex\AutoML

To start the cluster run 'start.ps1' script and wait for further information:

	powershell.exe -noprofile -executionpolicy bypass -file .\Windows\start.ps1

To stop the cluster run 'stop.ps1' script and wait for further information:

    powershell.exe -noprofile -executionpolicy bypass -file .\Windows\stop.ps1

## Linux steps

Change directory to a cloned repository (e.g. /opt/danateq/alex)

	cd /opt/danateq/alex/AutoML

Note:
Add your current user to docker group to be able to run 'docker' commands or use sudo before all 'docker' commands.

To start the cluster run 'start.sh' script:
	
	chmod +x Linux/start.sh
	./Linux/start.sh

To stop the cluster run 'stop.sh' script:

	chmod +x Linux/stop.sh
	./Linux/stop.sh

## MacOS steps

Change directory to a cloned repository (e.g. /opt/danateq/alex)

    cd /opt/danateq/alex/AutoML
	
To start the cluster run 'start_MacOS.sh' script:

    chmod +x MacOS/start_MacOS.sh
	./MacOS/start_MacOS.sh

To stop the cluster run 'stop_MacOS.sh' script:

    chmod +x MacOS/stop_MacOS.sh
	./MacOS/stop_MacOS.sh
