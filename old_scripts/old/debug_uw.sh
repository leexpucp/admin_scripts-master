#!/bin/bash
MACHINES=machines
if [ $# -eq 1 ]
then
  echo ${1}
  MACHINES=${1}
fi
scp ~/code/Underwater/dist/Client.jar subjects@leeps:UW.jar
dsh -f ${MACHINES} -c "cd Subjects && DISPLAY=:0 java -Dfire.client.debug -Dfire.id=\`hostname\` -jar UW.jar"
