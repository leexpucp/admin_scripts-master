#!/bin/bash
if [[ -z "$1" ]]
then
	machines="1-12"
else
	machines=$1
fi
wakeonlan `./macs.py $machines`
