#!/bin/bash
#
# launch_otree.sh
#
# usage: launch_otree.sh [machines]
 
MACHINES=$1
ADDRESS="128.114.96.151:8001"
 
echo "opening otree at $ADDRESS on machines $MACHINES"
 
./run_on_machines.sh "ID=\`hostname | sed 's/leeps-//g'\`; \
                     DISPLAY=:0 google-chrome --kiosk --disable-background-timer-throttling $ADDRESS/room/leeps/?participant_label=LEEPS_\$ID 2>/dev/null" \
                     $MACHINES &