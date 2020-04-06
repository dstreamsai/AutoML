# ALEX AutoML
Automated Learning Engine X (ALEX) by Datastreams AI facilitates automate machine learning for tabular data (classification and regression)


## How to install AutoML Engine from Docker images
## Install Docker environment

Install an appropriate version of the Docker Engine for your OS. For Linux Install the docker-compose script using pip.
	
	pip install docker-compose

## Get ALEX

Clone this repository or download a zip archive and then unzip it to any local folder.

## Windows steps

Run Docker Quick Terminal (run Docker-Toolbox or Docker-Desktop) as Administrator and wait until the Docker engine is ready.

**Note:**
Running of the PowerShell scripts is deprecated by Windows Security Policy by default. So run PowerShell.exe as administrator and execute the scripts

Open PowerShell.exe as Administrator. Change directory to the cloned repository path (e.g. C:\Docker\alex):

	cd C:\Docker\alex\AutoML

To start the cluster run 'start.ps1' script: 

	powershell.exe -noprofile -executionpolicy bypass -file .\Windows\start.ps1

Wait for this output:

	Cluster is up. You can access Alex GUI from the link below:
	https://<ip-address>/LinkWorkbench


To stop the cluster run 'stop.ps1' script:

    powershell.exe -noprofile -executionpolicy bypass -file .\Windows\stop.ps1
	
Wait for this output:

	Cluster is stopped

## Linux steps

Change directory to the cloned repository path (e.g. /opt/alex)

	cd /opt/alex/AutoML

**Note:**
Add your current user to the 'docker' group to be able to run 'docker' commands or put sudo before all 'docker' commands.

To start the cluster run 'start.sh' script:
	
	chmod +x Linux/start.sh
	./Linux/start.sh

Wait for this output:
	
	Cluster is up. You can access Alex GUI from the link below:
	https://<ip-address>/LinkWorkbench


To stop the cluster run 'stop.sh' script:

	chmod +x Linux/stop.sh
	./Linux/stop.sh

Wait for this output:
	
	Cluster is stopped


## MacOS steps

Change directory to the cloned repository path (e.g. /opt/alex)

    cd /opt/alex/AutoML
	
To start the cluster run 'start.sh' script:

    chmod +x MacOS/start.sh
	./MacOS/start.sh
	
Wait for this output:
	
	Cluster is up. You can access Alex GUI from the link below:
	https://<ip-address>/LinkWorkbench


To stop the cluster run 'stop.sh' script:

    chmod +x MacOS/stop.sh
	./MacOS/stop.sh

Wait for this output:
	
	Cluster is stopped


## How to use ALEX AutoML Engine

Use 'alex' as a login and password to access the Web interface of ALEX. Please find short instruction at [ALEX AI Project How To.docx](https://github.com/dstreamsai/AutoML/blob/master/ALEX%20AI%20Project%20How%20To.docx)
In this trial version of the AutoML Engine it is possible to upload CSV file with the following limitations: the file size must be less than 100 MBytes, the number of rows must be less than 100000, the number of columns must be less than 4500.
Use your own CSV data file to upload to ALEX AutoML Engine or use any dataset from any opensource projects like Kaggle or OpenML.

## Hardware Requirements

**Minimal**
- 64-bit dual core 2Ghz CPU
- 4 GB RAM
- At least 15 GB of free hard disk space

***

**Recommended**
- 64-bit quad core CPU
- 8 GB RAM
- At least 15 GB of free hard disk space

## Troubleshooting

There are rare situations when containers cannot be restored correctly after hard shutdown or another type of container hard stop. 
In case a container entered undetermined state and restart doesn't help it is recommended to re-create the setup using the commands below.

**For Linux\MacOS:**

	cd /opt/alex/AutoML
	docker-compose kill
	docker-compose rm

Confirm removing of the containers and when containers are removed run the 'start.sh' script for your OS (from Linux/ or MacOS/ folders).

**For Windows:**

	cd C:\Docker\alex\AutoML
	docker-compose.exe stop
	docker-compose.exe rm

Confirm removing of the containers and when containers are removed run the 'start.ps1' script (use the full command from Windows steps above). 	