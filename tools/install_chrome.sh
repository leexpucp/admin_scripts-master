#!/bin/bash

./run_on_machines.sh "curl -O https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg" 4-8
./run_on_machines.sh "hdiutil attach googlechrome.dmg" 4-8
./run_on_machines.sh "sudo cp -r /Volumes/Google\ Chrome/Google\ Chrome.app /Applications/" 4-8
