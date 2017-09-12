#!/bin/bash
if [[ -z "$1" ]]
then
	machines="1-17"
else
	machines=$1
fi
./run_on_machines.sh "sudo pm-suspend" $machines
