#!/bin/bash
~/Dropbox/test/hotelling/Control.jar &
for machines in 1 2 3 4 5 6
do
dsh -w -m `./machines.py $machines` "ID=\`hostname | sed 's/leeps-linux-//g'\` && DISPLAY=:0 screen -dm java -Dfire.id=\"robo$machines\" -Dfire.ignoreLock -jar ~/Dropbox/test/hotelling/Client.jar"
dsh -w -m `./machines.py $machines` "ID=\`hostname | sed 's/leeps-linux-//g'\` && DISPLAY=:0 screen -dm java -Dfire.id=\"\$ID\" -Dfire.ignoreLock -Dfire.debug -jar Dropbox/test/hotelling/Client.jar"
done
wake.sh
