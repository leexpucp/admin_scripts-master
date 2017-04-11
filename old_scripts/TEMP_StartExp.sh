#!/bin/bash
 "chmod +x TEMP_StartExp.sh"
 
 
if [[ -z "$1" ]]
then
	machines="1-12"
else
	machines=$1
fi
dsh -c -m `./machines.py $machines` "DISPLAY=:0 google-chrome --kiosk 2>/dev/null" &
