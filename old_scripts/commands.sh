#!/bin/bash
# Turn screens off
function off {
	echo "DISPLAY=:0 xset dpms force off"
}
# Turn screens on
function on {
	echo "DISPLAY=:0 xset dpms force on"
}
# Wake screens up
function wake {
  echo "DISPLAY=:0 xdotool click 1"
	#echo "DISPLAY=:0 gnome-screensaver-command -d"
}
# Put screens to sleep
function sleep {
	echo "DISPLAY=:0 gnome-screensaver-command -a"
}
if [[ ${1} == "" ]]
then
	echo "off, on, wake, sleep"
else
	echo `${1}`
fi
