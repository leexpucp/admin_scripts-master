#!/bin/sh
dsh -w -f machines "cd ~/Subjects/redwood/examples/Ss_pricing && DISPLAY=:0 screen -dm python client.py"
