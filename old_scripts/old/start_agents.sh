#!/bin/bash
for id in {1..6}
do
	dsh -w -f $1 "ID=\`hostname | sed 's/leeps-linux-//g'\` && DISPLAY=:0 screen -dm java -Dfire.id=\"Agent\$ID-$id\" -Dfire.ignoreLock -Dfire.debug -jar Dropbox/Client.jar"
done
