#!/bin/bash

cd ~/Dropbox/Admin/;

echo "`date`: Starting up stations 1-12" > update.log
./up.sh 2>&1 >>update.log

echo "`date`: Updating self" >> update.log
sudo apt-get update 2>&1 >>update.log
sudo apt-get -y dist-upgrade -o Dir::Etc::SourceList=/etc/apt/security.sources.list 2>&1 >>update.log

# wait for 4 minutes for machines to fully start up
sleep 240 2>&1 >>update.log

echo "`date`: Updating stations 1-12" >> update.log
./update_terminals.sh 2>&1 >>update.log

echo "`date`: Shutting down stations 1-12" >> update.log
./down.sh 2>&1 >>update.log

# wait for 4 minutes for machines to fully shut down
sleep 240 2>&1 >>update.log

echo "`date`: Done" >> update.log
