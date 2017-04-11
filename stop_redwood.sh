#!/bin/bash
#
# stop_redwood.sh
#
# usage: stop_redwood.sh [machines]
#

MACHINES=$1
./run_on_machines.sh "killall /opt/google/chrome/chrome &>/dev/null" $MACHINES &
