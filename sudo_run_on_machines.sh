#!/bin/bash
#
# sudo_run_on_machines.sh
#
# usage: sudo_run_on_machines.sh command [machines]
#

cmd=$1

if [[ -z "$2" ]]
then
	machines="1-16"
else
	machines=$2
fi

dsh -c -M -m `./machines.py $machines` "sudo $cmd"
