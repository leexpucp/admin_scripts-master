#!/bin/bash
if [[ -z "$1" ]]
then
	machines="1-16"
else
	machines=$1
fi
./run_on_machines.sh "sudo pm-suspend" $machines
