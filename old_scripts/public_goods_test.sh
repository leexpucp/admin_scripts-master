#!/bin/bash
for i in 1 2 3 4
do
dsh -w -m `./machines.py $i` "ID=\`hostname | sed 's/leeps-		linux-//g'\` && DISPLAY=:0 screen -dm java -Dfire.id=\"\$ID\" -Dfire.ignoreLock -Dfire.debug -jar Dropbox/Client.jar"
done
