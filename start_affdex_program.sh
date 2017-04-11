#!/bin/bash

# Used for running the affdex program
# Usage: ./start_affdex_program "<--draw=0 --draw=1> <--cfps= and --pfps= number of fps>" <Machine Number>

./run_on_machines.sh "ID=\`hostname | sed 's/leeps-//g'\`; DISPLAY=:0 $HOME/affdexProgram/build/opencv-webcam-demo/opencv-webcam-demo $1 --computerNum=\$ID" $2
