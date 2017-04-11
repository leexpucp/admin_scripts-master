#!/bin/bash
#
# xdotool-subjects.sh
#
# usage: xdotool-subjects.sh script [subjects]
#
# Runs an xdotool script on the specified subject machines.
# This can be used to automate experiment testing to avoid
# walking around the lab and playing for all of the subjects.
#
# The xdotool script command documentation:
# http://www.semicomplete.com/projects/xdotool/xdotool.xhtml
#

USAGE="usage: xdotool-subjects.sh script [subjects]"

if [[ -z "$1" ]]; then
    echo $USAGE
    exit
fi

SCRIPT=$1
MACHINES=$2

if [ "$SCRIPT" == "-" ]; then
    read SCRIPT_CONTENTS
else
    SCRIPT_CONTENTS=`cat $SCRIPT`
fi

#echo $SCRIPT_CONTENTS
./run_on_machines.sh "export DISPLAY=:0.0; echo '$SCRIPT_CONTENTS' | xdotool -;" $MACHINES &
