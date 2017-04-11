#!/bin/bash
if [[ -z "$1" ]]
then
	machines="1-16"
else
	machines=$1
fi
wakeonlan `./macs.py $machines`
sleep 5 
./wake.sh
