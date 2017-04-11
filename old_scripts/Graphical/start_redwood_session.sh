#!/bin/bash

cd ~/Desktop/Admin

./stop_redwood.sh

INSTANCE_NAME=$(zenity --list --radiolist --title="derp" \
    --column="" --column="Instance" \
    true "local (econlab.ucsc.edu)" \
    false "local (192.168.1.5:8888)" \
    false "AWS (54.193.75.19)")
    false "Campus (128.114.97.45)")

# Redwood 1
if [ "$INSTANCE_NAME" == "local (econlab.ucsc.edu)" ]; then
    INSTANCE="http://econlab.ucsc.edu/redwood/session/"
    SESSION=$(zenity --forms --title="Set Redwood 2 Chrome Homepage" \
        --add-entry="Session ID")
    ./set_chrome_homepage2.sh ${INSTANCE}${SESSION}
    
else

    # Redwood 2
    if [ "$INSTANCE_NAME" == "local (192.168.1.5:8888)" ]; then
        INSTANCE="192.168.1.5:8888"
    fi

    if [ "$INSTANCE_NAME" == "AWS (54.193.75.19)" ]; then
        INSTANCE="54.193.75.19/redwood"
    fi

    if [ "$INSTANCE_NAME" == "Campus (128.114.97.45)" ]; then
        INSTANCE="128.114.97.45/redwood"
    fi

    zenity --forms --title="Set Redwood 2 Chrome Homepage" \
        --add-entry="Session ID" \
    | xargs ./set_redwood2_chrome_homepage.sh $INSTANCE

fi

./start_redwood.sh