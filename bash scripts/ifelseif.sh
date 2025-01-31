#!/bin/bash

value=$(ip addr show | grep -v LOOPBACK | grep -ic mtu)

if [ $value -eq 1 ]
then
        echo "1 Active Network Adapter"
elif [ $value -gt 1 ]
then
        echo "Found more Network Adapters"
else
        echo " None Active Networks Adapters"
fi