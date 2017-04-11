#!/bin/bash

# change the url to the url you need (see below, instance and $ID)
# how to save this as executable: "chmod +x set_chrome_homepage2.sh"
# then run this file, 
# after that, the Homepage of each terminal should send that machine to the correct experiment page. 


INSTANCE="http://econlab.ucsc.edu/redwood/session/35"
if [[ -n "$1" ]]
then
	INSTANCE="$1"
fi
SCRIPT="url = '$INSTANCE/Subject-\$ID@leeps.ucsc.edu'; import json; prefs = json.load(open('.config/google-chrome/Default/Preferences')); prefs['homepage'] = url; prefs['session']['startup_urls'] = [url]; prefs['session']['urls_to_restore_on_startup'] = [url]; prefs['session']['restore_on_startup'] = 4; prefs['browser']['window_placement']['maximized'] = True; f = open('.config/google-chrome/Default/Preferences', 'w'); json.dump(prefs, f); f.close();"
dsh -c -m `./machines.py 1-12` "ID=\`hostname | sed 's/leeps-linux-//g'\`; python -c \"$SCRIPT\""
