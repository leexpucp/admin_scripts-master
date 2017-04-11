#!/bin/bash
if [[ -z "$1" ]]
then
	machines="1-12"
else
	machines=$1
fi
dsh -w -m `./machines.py $machines` "DISPLAY=:0 screen -dm java -jar Dropbox/Client.jar"
