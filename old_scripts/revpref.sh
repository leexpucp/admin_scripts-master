#!/bin/bash
#
# revpref.sh
#
# usage: revpref.sh [subjects]

if [[ -z "$1" ]]
then
	AMOUNT=1
else
	AMOUNT=$1
fi

MACHINES=$2

./run_on_machines.sh " export DISPLAY=:0.0;
  xdotool mousemove 500 730;
  for i in {1..$AMOUNT}
	  do
	  xdotool click 1;
		sleep 10;
	done"
	$MACHINES &
