#!/bin/bash

# Set chrome homepage for Redwood 2
# change the url to the url you need (see below, instance and $ID)
# how to save this as executable: "chmod +x TEMP_Sven_SetHomePage.sh"
# then run this file, 
# after that, the Homepage of each terminal should send that machine to the correct experiment page. 

USAGE="usage: TEMP_Sven_SetHomePage.sh [machines]"
# E.g. TEMP_Sven_SetHomePage.sh 2

INSTANCE="exp.zd.ee/gp/play_most_recent/10120230340456/"

MACHINES="1-12"
if [[ -n "$3" ]]
then
	MACHINES="$3"
fi

echo "Setting homepage for machines $MACHINES to $INSTANCE"

SCRIPT="url = '$INSTANCE/\$ID/'; import json; prefs = json.load(open('.config/google-chrome/Default/Preferences')); prefs['homepage'] = url; prefs['session']['urls_to_restore_on_startup'] = [url]; prefs['session']['startup_urls'] = [url]; prefs['session']['restore_on_startup'] = 4; prefs['browser']['window_placement']['maximized'] = True; f = open('.config/google-chrome/Default/Preferences', 'w'); json.dump(prefs, f); f.close();"
dsh -c -m `./machines.py $MACHINES` "ID=\`hostname | sed 's/leeps-linux-//g'\`; python -c \"$SCRIPT\""
