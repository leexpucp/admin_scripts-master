#!/bin/bash
#
# testvm.sh
# Used to test heatmap interaction for Visual Markets
# usage:

MACHINES=$1

./run_on_machines.sh " export DISPLAY=:0.0;
  for i in {1..MACHINES}
	  do
			if [ $((i % 2)) -eq 0]; then
			xdotool mousemove \$[\$RANDOM % 500 + 750] 700;
		else
		  xdotool mousemove 750 \$[\$RANDOM % 500 + 150];	
		fi
	done
" $MACHINES &
