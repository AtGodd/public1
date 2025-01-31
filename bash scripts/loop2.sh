#!/bin/bash

MYUSERS="alpha beta charlie"

for usr in $MYUSERS
do
        echo "Adding User $usr"
        useradd $usr
        id $usr
        echo "@@@@@@@@@@@@@@@@"
done
