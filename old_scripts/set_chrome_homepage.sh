#!/bin/bash
INSTANCE="http://econlab.ucsc.edu/redwood/session/41"
if [[ -n "$1" ]]
then
	INSTANCE="$1"
fi
SCRIPT="url = 'http://econlab.ucsc.edu/redwood/session/$INSTANCE/Subject-\$ID@leeps.ucsc.edu'; import json; prefs = json.load(open('.config/google-chrome/Default/Preferences')); prefs['session']['homepage'] = url; prefs['startup_urls'] = [url]; prefs['session']['urls_to_restore_on_startup'] = [url]; prefs['session']['restore_on_startup'] = 4; prefs['browser']['window_placement']['maximized'] = True; f = open('.config/google-chrome/Default/Preferences', 'w'); json.dump(prefs, f); f.close();"
dsh -c -m `./machines.py 1-12` "ID=\`hostname | sed 's/leeps-linux-//g'\`; python -c \"$SCRIPT\""
