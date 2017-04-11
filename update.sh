#!/bin/sh
echo "`date`: Waking up stations 1-12" > update.log
sudo ./up.sh
echo "`date`: Updating self" >> update.log
sudo apt-get update 2>&1 >>update.log
sudo apt-get -y dist-upgrade -o Dir::Etc::SourceList=/etc/apt/security.sources.list 2>&1 >>update.log
sleep 200 2>&1 >>update.log
echo "`date`: Updating stations 1-16" >> update.log
dsh -c -m `./machines.py 1-16` "sudo apt-get update && sudo apt-get -y dist-upgrade -o Dir::Etc::SourceList=/etc/apt/security.sources.list && sudo shutdown -h now" 2>&1 >>update.log
echo "`date`: Done" >> update.log
