#!/bin/bash
 
cd /home/leeps/Dropbox/zTree/ztree-stable
rm -f *.gsf
rm -f *.eec
 
cd /home/leeps/Dropbox/Admin
 
NUM_LEAFS=17
COUNTER=1
while [ $COUNTER -lt $NUM_LEAFS ];
do 
    ./run_on_machines.sh "ID=\`hostname | sed 's/leeps-//g'\`; ~/Dropbox/zTree/control/startzTree.sh" $COUNTER
    sleep .5
    let COUNTER=COUNTER+1
done
