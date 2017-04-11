#!/bin/bash

if [[ -z $1 ]]
then
	echo "clearing chrome cache on all machines"
else
	echo "clearing chrome cache on machines $1"
fi

./run_on_machines.sh "rm -rf ~/.cache/google-chrome" $1 &
