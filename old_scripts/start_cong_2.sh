#!/bin/bash
if [[ -z "$1" ]]
then
	machines="1-12"
else
	machines=$1
fi
dsh -w -m `./machines.py $machines` "ID=\`hostname | sed 's/leeps-linux-//g'\` && DISPLAY=:0 screen -dm java -Dfire.id=\"\$ID\" -Dfire.ignoreLock -Dfire.debug -jar Dropbox/Cong2.1/trunk/dist/Client.jar"
