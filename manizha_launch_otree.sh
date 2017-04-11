#!/bin/bash
#
# launch_otree.sh
#
# usage: launch_otree.sh [machines]

MACHINES=$1
ADDRESS="https://econexp.herokuapp.com"

echo "opening otree at $ADDRESS on machines $MACHINES"

./run_on_machines.sh "ID=\`hostname | sed 's/leeps-//g'\`; \
					 DISPLAY=:0 google-chrome --kiosk --disable-background-timer-throttling $ADDRESS/room/econlab/?participant_label=PC\$ID 2>/dev/null" \
					 $MACHINES &
