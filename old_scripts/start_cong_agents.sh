#!/bin/bash
if [[ -z "$1" ]]
then
	machines="1-12"
else
	machines=$1
fi
dsh -w -m `./machines.py $machines` "ID=\`hostname | sed 's/leeps-linux-//g'\` && DISPLAY=:0 screen -dm java -Dfire.id=\"robo$machines\" -Dfire.ignoreLock -jar ~/Dropbox/Client.jar"


# Note: you need to start machines individually!
