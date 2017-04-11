#!/bin/bash
if [[ -z "$1" ]]
then
	machines="1-12"
else
	machines=$1
fi
if [[ -z "$2" ]]
then
	channel="1"
else
	channel=$2
fi
dsh -w -m `./machines.py $machines` "ID=\`hostname | sed 's/leeps-linux-//g'\` && cd ~/Dropbox/zTree/ztree$channel && DISPLAY=:0 screen -dm wine zleaf.exe /name \$ID /size 1280x800 /language en /channel $channel && sleep 5"
