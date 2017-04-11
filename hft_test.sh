#!/bin/bash
#
# hft_test.sh
#
# usage: ./hft_test.sh input_csv_address machine
#
# runs the hft game commands specified in the input csv downloaded from 'input_csv_address' on 'machine'
#
# input csvs have a row for each desired command
# each row has three columns: a timestamp in ms, a command and an argument
# the usable commands are OUT, SNIPE, MAKER, SPEED_ON, SPEED_OFF and SPREAD
# only the SPREAD command uses the third argument column, which contains the new desired spread
#
# written by Morgan Grant
# mlgrant@ucsc.edu

ADDRESS=$1
MACHINE=$2
FILENAME=input.csv

# I can't comment inside the string, so I'll just describe what it's doing here
# export is required to make xdotool work. I don't know why. I got it from berserck.sh
# start holds the start time for the script. the date | cut expression gets the current time in ms
# wget downloads the input csv from dropbox
# the first while loop reads each row of the csv into a variable for each col (TIMESTAMP, CMD and ARG)
# then it calculates how long it needs to wait for the next event to occur
# the case expression just chooses the appropriate xdotool command for each input command
# only spread uses the third arg column
# lastly it removes the downloaded csv and alerts that the script is done

./run_on_machines.sh "\
	export DISPLAY=:0.0
	START=\$(date +%s%N | cut -b1-13)
	wget -O $FILENAME $ADDRESS
	cat $FILENAME
	while IFS=, read TIMESTAMP CMD ARG
	do
		SLEEP_TIME_MS=\$(( START + TIMESTAMP - \$(date +%s%N | cut -b1-13) ))
		echo \$SLEEP_TIME_MS
		sleep \$(echo \"scale=2;\$SLEEP_TIME_MS/1000\" | bc)
		case \$CMD in
			OUT)
				xdotool mousemove 131 632 click 1
				;;
			SNIPE)
				xdotool mousemove 183 633 click 1
				;;
			MAKER)
				xdotool mousemove 259 633 click 1
				;;
			FAST)
				xdotool mousemove 156 531 click 1
				;;
			SLOW)
				xdotool mousemove 210 532 click 1
				;;
			SPREAD)
				xdotool mousemove 371 485 click --repeat 2 1 type \$ARG
				xdotool key Return
				;;
		esac
	done < $FILENAME
	rm $FILENAME
	zenity --info --timeout=5 --text=\"Script Complete\"
	echo \"machine $MACHINE script complete\"" $MACHINE &
