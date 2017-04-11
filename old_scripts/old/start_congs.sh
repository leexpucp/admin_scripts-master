#!/bin/sh
scp ~/code/CONGv2.0/trunk/dist/Client.jar subjects@leeps:
dsh -f machines -c "cd Subjects && DISPLAY=:0 java -jar Client.jar"
