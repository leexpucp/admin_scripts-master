#!/bin/sh
dsh -c -f $1 "ID=\`hostname | sed 's/leeps-linux-//g'\` && DISPLAY=:0 screen -dm java -jar Dropbox/CFB.jar"
