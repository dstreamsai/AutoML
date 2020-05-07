# ALEX AutoML
Automated Learning Engine X (ALEX) by Datastreams AI facilitates automated machine learning for tabular data (classification and regression)


## How to install AutoML Engine from Docker images
## Install Docker environment

###### Windows	
 
Docker Desktop for Windows is the Community version of Docker for Microsoft Windows. Please see details at https://docs.docker.com/docker-for-windows/install/

Docker Toolbox provides a way to use Docker on Windows systems that do not meet minimal system requirements for the Docker Desktop for Windows app. Please see details at https://docs.docker.com/toolbox/toolbox_install_windows/

###### MacOS

Docker Desktop for Mac is the Community version of Docker for Mac. You can download Docker Desktop for Mac from Docker Hub. Please see details at https://docs.docker.com/docker-for-mac/install/ 
 
Docker Toolbox provides a way to use Docker on older Macs that do not meet minimal system requirements for Docker Desktop for Mac. Please see details at https://docs.docker.com/toolbox/toolbox_install_mac/

###### Linux

Docker Engine is available on a variety of Linux platforms. Please see details at https://docs.docker.com/engine/install/#server  
Install Docker Compose tool. Please see details at https://docs.docker.com/compose/install/

## Get ALEX

Clone repository with Alex or download a zip archive and then unzip it to a local folder. A path to this folder will be used in the next steps.  

Using **git** tool: 
	
	git clone https://github.com/dstreamsai/AutoML.git
	
Zip **archive** can be downloaded from the menu above or using the direct link below:
	
	https://github.com/dstreamsai/AutoML/archive/master.zip

## Windows steps

In case of Docker Desktop installed run **Docker Desktop** application. When the whale icon in the status bar stays steady, Docker Desktop is up-and-running.
 
In case of Docker Toolbox installed run **Docker Quickstart Terminal** as Administrator. The terminal does several things to set up Docker Toolbox for you. When it is done, the terminal displays the $ prompt.  

**Note:**
Running of the PowerShell scripts is deprecated by Windows Security Policy by default. So run PowerShell.exe as Administrator and then execute the scripts.

Open PowerShell.exe as Administrator. Change directory to the directory with Alex (e.g. C:\Docker\alex):

	cd C:\Docker\alex\AutoML

To start the cluster run 'start.ps1' script from Windows folder using the command below: 

	powershell.exe -noprofile -executionpolicy bypass -file .\Windows\start.ps1

Wait for this output:

	Cluster is up. You can access Alex GUI from the link below:
	https://<ip-address>/LinkWorkbench


To stop the cluster run 'stop.ps1' script from Windows folder:

    powershell.exe -noprofile -executionpolicy bypass -file .\Windows\stop.ps1
	
Wait for this output:

	Cluster is stopped

## Linux steps

Change directory to the directory with Alex (e.g. /opt/alex)

	cd /opt/alex/AutoML

To start the cluster run 'start.sh' script from Linux folder:
	
	chmod +x Linux/start.sh
	sudo ./Linux/start.sh

Wait for this output:
	
	Cluster is up. You can access Alex GUI from the link below:
	https://<ip-address>/LinkWorkbench


To stop the cluster run 'stop.sh' script from Linux folder:

	chmod +x Linux/stop.sh
	sudo ./Linux/stop.sh

Wait for this output:
	
	Cluster is stopped


## MacOS steps

Change directory to the directory with Alex (e.g. /Users/<user>/Desktop/alex/AutoML)

    cd /Users/<user>/Desktop/alex/AutoML
	
To start the cluster run 'start.sh' script from MacOS folder:

    chmod +x MacOS/start.sh
	./MacOS/start.sh
	
Wait for this output:
	
	Cluster is up. You can access Alex GUI from the link below:
	https://<ip-address>/LinkWorkbench


To stop the cluster run 'stop.sh' script from MacOS folder:

    chmod +x MacOS/stop.sh
	./MacOS/stop.sh

Wait for this output:
	
	Cluster is stopped


## How to use ALEX AutoML Engine

Use the following credentials to access the Web interface of ALEX. 
- **Login**: alex
- **Password**: alex

Please find short instruction at [ALEX AI Project How To.docx](https://github.com/dstreamsai/AutoML/raw/master/ALEX%20AI%20Project%20How%20To.docx)

## Hardware Requirements

**Minimal**
- 64-bit dual core CPU
- 4 GB RAM
- At least 15 GB of free hard disk space

***

**Recommended**
- 64-bit quad core CPU
- 8 GB RAM
- At least 15 GB of free hard disk space

## Trial copy limitations

In this trial version of the AutoML Engine it is possible to upload CSV file with the following limitations: the file size must be less than 100 MBytes, the number of rows must be less than 100000, the number of columns must be less than 4500.

A user should also consider the following:
- It is not recommended to restart/shutdown the containers when training process is ongoing.  A DB data may be corrupted. 
- Improper shutdown procedure may corrupt data in the containers. Please use the scripts provided for containers' start/stop. 

Please see Troubleshooting section for resolution steps.

## Troubleshooting

There are rare situations when containers cannot be restored correctly after hard shutdown or another type of container hard stop. 
In case a container entered undetermined state and restart doesn't help it is recommended to re-create the setup using the commands below.

**WARNING**
	
	All created projects will be removed after the steps below

**For Linux\MacOS:**

	cd /opt/alex/AutoML (for Linux)
	cd /Users/<user>/Desktop/alex/AutoML (for MacOS)
	docker-compose kill
	docker-compose rm

Confirm removing of the containers and when containers are removed run the 'start.sh' script for your OS (from ./Linux or ./MacOS folders).

**For Windows:**

	cd C:\Docker\alex\AutoML
	docker-compose.exe stop
	docker-compose.exe rm

Confirm removing of the containers and when containers are removed run the 'start.ps1' script (use the full command from Windows steps above). 	