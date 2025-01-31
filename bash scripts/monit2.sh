#!/bin/bash

echo "////////////////////////////"
date
#ls /var/run/httpd/httpd.pid &> /dev/null

if [ -f /var/run/httpd/httpd.pid ]
then
        echo "HTTPD process is running"
else
        echo "HTTPD process is NOT running"
        echo "Starting Process"
        systemctl start httpd
        if [ $? -eq 0 ]
        then
                echo "Process started successfuly"
        else
                echo"Process starting Failed, call admin"
        fi
fi
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo