#!/bin/bash
#
# berserck.sh
#
# usage: berserck.sh amount [subjects]
#
# fyi: amount of 100 lasts about 10 seconds (and more if lots of resources are being used)

if [[ -z "$1" ]]
then
	echo 'usage: berserck.sh amount [subjects]'
	exit
fi

AMOUNT=$1
MACHINES=$2

./run_on_machines.sh "\
    export DISPLAY=:0.0;
    for i in {1..$AMOUNT}
        do
        xdotool mousemove \$[\$RANDOM % 900] \$[\$RANDOM % 900]; xdotool click 1;
    done" $MACHINES &
