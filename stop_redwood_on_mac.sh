#!/bin/bash

# stop_redwood_on_mac.sh

# usage stop_redwood_on_mac.sh [machines]

MACHINES=$1
./run_on_machines.sh "pkill \"Google Chrome\"" $MACHINES &
