#!/bin/bash
#
# ./gandalf.sh
#
# usage: gandalf.sh [machines]
#


if [[ -z "$1" ]]
then
echo '## Invalid Syntax ##'
    exit
fi

MACHINES=$1 

URL="https://www.youtube.com/embed/h_pKuOIM4qk?autoplay=1"

echo "opening Gandalf on $MACHINES"

./run_on_machines.sh "ID=\`hostname | sed 's/leeps-//g'\`; DISPLAY=:0 google-chrome --kiosk --disable-background-timer-throttling --incognito $URL 2>/dev/null " $1 &
