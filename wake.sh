#!/bin/bash
if [[ -z "$1" ]]
then
	machines="1-16"
else
	machines=$1
fi
dsh -c -m `./machines.py $machines` "`./commands.sh on`; `./commands.sh wake`"

