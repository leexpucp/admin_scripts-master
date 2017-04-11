#!/bin/sh
dsh -f machines -c "cd Desktop && DISPLAY=:0 java -jar Client.jar"
