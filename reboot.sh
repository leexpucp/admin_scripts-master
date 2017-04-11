#!/bin/bash

# reboot.sh

## USE this script to reboot the machines. This should ALWAYS be used instead of down.sh (nonrecoverable). 

if [[ -z "$1" ]]
then
  machines="1-14"
else
  machines=$1
fi

./run_on_machines.sh "sudo reboot" $machines
