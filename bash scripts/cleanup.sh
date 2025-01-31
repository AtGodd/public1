#!/bin/bash

sudo systemctl stop http
sudo rm -rf /var/www/html/*
sudo yum remove httpd wget unzip -y