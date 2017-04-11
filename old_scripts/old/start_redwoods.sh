#!/bin/sh
dsh -w -f machines "NAME=\`hostname | sed 's/leeps-linux-//g'\` && cd ~/Subjects/redwood/examples/clown && DISPLAY=:0 screen -dm python client.py --name \$NAME --email fubar@example.com --host '192.168.1.4'"
