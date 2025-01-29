#!/bin/bash

# Installing Dependencies
echo "#################################"
echo "Installing packages"
echo "#################################"
sudo yum install wget unzip httpd -y > /dev/null
echo

# Start & Enable Service

echo "#################################"
echo "Start & Enable HTTPD service"
echo "#################################"

sudo systemctl start httpd
sudo systemctl enable httpd
echo

# Creating Temp Directory
echo "#################################"
echo "Starting Artifact Deplyoment"
echo "#################################"
mkdir -p /tmp/webfiles
#cd /tmp/webfiles
echo


wget https://www.tooplate.com/zip-templates/2098_health.zip > /dev/null
unzip 2098_health.zip > /dev/null
sudo cp -r 2098_health/* /var/www/html/
echo

# Bounce Service
echo "#################################"
echo "Restarting HTTPD service"
echo "#################################"
systemctl restart httpd
echo

# Clean up
echo "#################################"
echo "Removing Temporary files"
echo "#################################"
rm -rf /tmp/webfiles > /dev/null
echo

sudo systemctl status httpd
ls /var/www/html