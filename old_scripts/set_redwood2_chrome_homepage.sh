#!/bin/bash

# Set chrome homepage for Redwood 2
# change the url to the url you need (see below, instance and $ID)
# how to save this as executable: "chmod +x set_redwood2_chrome_homepage.sh"
# then run this file, 
# after that, the Homepage of each terminal should send that machine to the correct experiment page. 

USAGE="usage: set_redwood2_chrome_homepage.sh address session_id [machines]"
#set_redwood2_chrome_homepage.sh 54.193.75.19/redwood 2
# e.g with campus, " set_redwood2_chrome_homepage.sh 128.114.97.45/redwood 14  " for redwood2 on-campus, session14, all machines. 

# AWS is 54.193.75.19
if [[ -n "$1" ]]
then
	ADDRESS="$1"
else
	echo $USAGE
	exit
fi

if [[ -n "$2" ]]
then
	SESSION="$2"
else
	echo $USAGE
	exit
fi

INSTANCE="http://$ADDRESS/session/$SESSION"

MACHINES="1-12"
if [[ -n "$3" ]]
then
	MACHINES="$3"
fi

echo "Setting homepage for machines $MACHINES to $INSTANCE"

SCRIPT="url = '$INSTANCE/subject/\$ID/'; import json; prefs = json.load(open('.config/google-chrome/Default/Preferences')); prefs['homepage'] = url; prefs['session']['urls_to_restore_on_startup'] = [url]; prefs['session']['startup_urls'] = [url]; prefs['session']['restore_on_startup'] = 4; prefs['browser']['window_placement']['maximized'] = True; f = open('.config/google-chrome/Default/Preferences', 'w'); json.dump(prefs, f); f.close();"
dsh -c -m `./machines.py $MACHINES` "ID=\`hostname | sed 's/leeps-linux-//g'\`; python -c \"$SCRIPT\""
