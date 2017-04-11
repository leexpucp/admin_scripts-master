#!/bin/bash

echo "Restarting router at econlab.ucsc.edu..."
echo -n "Password: "
read -s PASSWORD
ssh leeps@econlab.ucsc.edu "echo $PASSWORD | sudo -S service redwood-router restart"

