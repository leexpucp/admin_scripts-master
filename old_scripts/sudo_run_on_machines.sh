#!/bin/bash
#
# run_on_machines.sh
#
# usage: run_on_machines.sh command [machines]
#

cmd=$1

if [[ -z "$2" ]]
then
	machines="1-12"
else
	machines=$2
fi

for machine in `./machines.py $machines | xargs -d, -L1 echo`;
do
	ssh -t $machine "$cmd"
done
