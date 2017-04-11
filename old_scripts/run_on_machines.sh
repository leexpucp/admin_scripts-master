#!/bin/bash
#
# run_on_machines.sh
#
# usage: run_on_machines.sh command [machines]
#

cmd=$1

if [[ -z "$2" ]]
then
	machines="1-12"
else
	machines=$2
fi

dsh -c -m `./machines.py $machines` "$cmd"
