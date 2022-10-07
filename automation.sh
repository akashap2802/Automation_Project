#!/bin/bash
timestamp=$(date '+%d%m%Y-%H%M%S')
myname="Amit_kashyap"
s3_bucket="upgrad-amitkashyap"

# package updates
sudo apt update -y

echo "############## All packages are up to date ################"

# apache installation

appstat=$(dpkg -s apache2 | grep Status)

if [[ $appstat == *"installed"* ]]; then
   echo "Apache2 is already installed"
   else echo "Apache2 is not currently installed, proceeding with installation by executing 'sudo apt-get install apache2' command"
   sudo apt-get install apache2	
   
fi

servstat=$(sudo service apache2 status)

if [[ $servstat == *"active (running)"* ]]; then
  echo "Apache2 is already running"
  else echo "Apache2 is not running, Restarting Apache2 by executing 'sudo service apache2 start' command"
  sudo service apache2 start
  echo "Apache2 restarted successfully"
  sudo update-rc.d apache2 defaults
  
fi

  sudo update-rc.d apache2 defaults
  echo "verified Apache2 service is enabled"

# Log file archival using TAR and uploading the tar file to S3 bucket

tar -czvf /tmp/${myname}-httpd-logs-${timestamp}.tar  --exclude="./" --exclude="../"  /var/log/apache2/
aws s3 \
cp /tmp/${myname}-httpd-logs-${timestamp}.tar \
s3://${s3_bucket}/${myname}-httpd-logs-${timestamp}.tar
