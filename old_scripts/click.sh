#!/bin/bash
#
# click.sh
#
# usage: click.sh x y [subjects]
#

USAGE="usage: click.sh x y [subjects]"

if [[ -z "$1" ]]
then
	echo $USAGE
	exit
fi

if [[ -z "$2" ]]
then
	echo $USAGE
	exit
fi

MX=$1
MY=$2
MACHINES=$3

./run_on_machines.sh "export DISPLAY=:0.0; xdotool mousemove $MX $MY; xdotool click 1" $MACHINES &
