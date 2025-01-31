#!/bin/bash

# Variable Declaration
PACKAGE="httpd wget unzip"
SVC="httpd"
#URL='https://www.tooplate.com/zip-templates/2098_health.zip'
#ART_NAME='2098_health'
TEMPDIR="/tmp/webfiles"

# Installing Dependencies
echo "#################################"
echo "Installing packages"
echo "#################################"
sudo yum install $PACKAGE -y > /dev/null
echo

# Start & Enable Service

echo "#################################"
echo "Start & Enable HTTPD service"
echo "#################################"

sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

# Creating Temp Directory
echo "#################################"
echo "Starting Artifact Deplyoment"
echo "#################################"
mkdir -p $TEMPDIR
cd $TEMPDIR
echo


wget $1 > /dev/null
unzip $2.zip > /dev/null
sudo cp -r $2/* /var/www/html/
echo

# Bounce Service
echo "#################################"
echo "Restarting HTTPD service"
echo "#################################"
systemctl restart $SVC
echo

# Clean up
echo "#################################"
echo "Removing Temporary files"
echo "#################################"
rm -rf $TEMPDIR > /dev/null
echo

sudo systemctl status $SVC
ls /var/www/html

#In cmd to run use ./5_args_websetup.sh https://www.tooplate.com/zip-templates/2091_ziggy.zip 2091_ziggy
#$1 = link to template
#$2= filename from download url
