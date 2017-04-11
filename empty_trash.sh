#!/bin/bash
if [[ -z "$1" ]]
then
	machines="1-12"
else
	machines=$1
fi
dsh -c -m `./machines.py $machines` "rm -rf /home/leeps/.local/share/Trash/info/*"
dsh -c -m `./machines.py $machines` "rm -rf /home/leeps/.local/share/Trash/files/*"
