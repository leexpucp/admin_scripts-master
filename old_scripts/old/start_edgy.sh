#!/bin/sh
dsh -w -f $1 "ID=\`hostname | sed 's/leeps-linux-//g'\` && cd Desktop && DISPLAY=:0 screen -dm java -DtraderKey=\"\$ID\" -Dredis.host=192.168.1.2 -jar Edgeworks.jar"
