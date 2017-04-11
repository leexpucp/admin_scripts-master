#!/bin/sh
dsh -c -f $1 "ID=\`hostname | sed 's/leeps-linux-//g'\` && DISPLAY=:0 screen -dm java -Dfire.id=\"\$ID\" -jar Dropbox/CFB-Flip.jar"
