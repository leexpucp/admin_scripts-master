#!/bin/bash
#
# run_on_machines.sh
#
# usage: run_on_machines.sh command [machines]
#

cmd=$1

if [[ -z "$2" ]]
then
	machines="1-16"
else
	machines=$2
fi

dsh -c -M -m `./machines.py $machines` "$cmd"
