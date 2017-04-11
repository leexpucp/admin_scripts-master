#!/bin/bash
#
# launch_otree.sh
#
# usage: launch_otree.sh [machines]

MACHINES=$1
ADDRESS="192.168.1.15:8000"

echo "opening otree at $ADDRESS on machines $MACHINES"

./run_on_machines.sh "ID=\`hostname | sed 's/leeps-//g'\`; \
					 DISPLAY=:0 google-chrome --disable-background-timer-throttling $ADDRESS/room/leeps/?participant_label=LEEPS_\$ID 2>/dev/null" \
					 $MACHINES &
