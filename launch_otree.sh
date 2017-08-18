#!/bin/bash
#
# launch_otree.sh
#
# usage: launch_otree.sh [machines]

MACHINES=$1
ADDRESS="192.168.46.20:8000"

echo "opening otree at $ADDRESS on machines $MACHINES"

./run_on_machines.sh "ID=\`hostname | sed 's/leex-//g'\`; \
					 DISPLAY=:0 google-chrome --kiosk --start-maximized --disable-background-timer-throttling --incognito $ADDRESS/room/EconoLab/?participant_label=\$ID 2>/dev/null" \
					 $MACHINES &
