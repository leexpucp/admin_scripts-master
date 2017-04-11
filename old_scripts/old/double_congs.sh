#!/bin/sh
dsh -w -f $1 "ID=\`hostname | sed 's/leeps-linux-//g'\` && DISPLAY=:0 screen -dm java -Dfire.id=\"\$ID\" -Dfire.ignoreLock -jar Dropbox/Client.jar"
dsh -w -f $1 "ID=\`hostname | sed 's/leeps-linux-//g'\` && DISPLAY=:0 screen -dm java -Dfire.id=\"\$ID-2\" -Dfire.ignoreLock -jar Dropbox/Client.jar"
dsh -w -f $1 "ID=\`hostname | sed 's/leeps-linux-//g'\` && DISPLAY=:0 screen -dm java -Dfire.id=\"\$ID-3\" -Dfire.ignoreLock -jar Dropbox/Client.jar"
