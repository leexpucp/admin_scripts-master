#!/bin/bash
if [[ -z "$1" ]]
then
	machines="1-12"
else
	machines=$1
fi
dsh -c -m `./machines.py $machines` "killall -9 java"

echo ......ConG is Dead. It was Beauty that killed the beast. 
