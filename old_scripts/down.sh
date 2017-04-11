#!/bin/bash

# E.g. for machine 1, this runs "dsh -c -m subjects@192.168.1.101 sudo shutdown -h now"

if [[ -z "$1" ]]
then
	machines="1-14"
else
	machines=$1
fi
dsh -c -m `./machines.py $machines` "sudo shutdown -h now"
