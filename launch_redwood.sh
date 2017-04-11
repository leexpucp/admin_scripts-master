#!/bin/bash
#
# launch_redwood.sh
#
# usage: launch_redwood.sh instance session [machines]
#

USAGE="
usage: launch_redwood.sh instance session [machines]\n
\n
Where 'instance' is one of (listed in instances.ini):\n
    - macmini\n
    - campus\n
    - workstation\n
\n
Example: launch_redwood.sh macmini 12 1-8\n
    This launches session 12 on the Mac Mini for machines 1 through 8.\n
\n
Example: launch_redwood.sh aws 6\n
    This launches session 6 on the AWS instance for all the machines.\n

"

if [[ -z "$2" ]]
then
echo '## Invalid Syntax ##'
    echo -e $USAGE
    exit
fi

ADDRESS=$(awk -F "=" "/$1/ {print \$2}" instances.ini)
SESSION=$2
MACHINES=$3

URL="$ADDRESS/session/$SESSION/subject/\$ID/"
if [[ "$1" == "macmini" ]]
then
    URL="$ADDRESS/session/$SESSION/Subject-\$ID@leeps.ucsc.edu"
fi
echo "Address for $1 is $ADDRESS"
echo "Session is $SESSION"
echo "opening $URL on $MACHINES"

./run_on_machines.sh "ID=\`hostname | sed 's/leeps-//g'\`; DISPLAY=:0 google-chrome --kiosk --disable-background-timer-throttling --incognito $URL 2>/dev/null" $3 &
