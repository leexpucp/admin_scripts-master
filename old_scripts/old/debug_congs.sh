#!/bin/bash
MACHINES=machines
if [ $# -eq 1 ]
then
  echo ${1}
  MACHINES=${1}
fi
dsh -f ${MACHINES} -c "cd Desktop && DISPLAY=:0 java -Dfire.client.debug -Dfire.id=\`hostname\` -jar Client.jar"
