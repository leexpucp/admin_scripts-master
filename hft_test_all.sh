#!/bin/bash
#
# hft_test_all.sh
#
# runs hft_test.sh on computers 1-4 in lab with input data from Dropbox/High-Frequency-Trading/Test Input
#
# to use, make sure the redwood admin page is open on the right monitor in fullscreen, then run the script
# it automatically clicks the start button to make sure the inputs and outputs are as closely synchronized as possible
#
# By Morgan Grant
# mlgrant@ucsc.edu

INPUT_P1="https://www.dropbox.com/s/dk0k6h8e3vyqp6q/inputP1_July18th.csv?dl=1"
INPUT_P2="https://www.dropbox.com/s/e9otx9kd2p8lsa6/inputP2_July18th.csv?dl=1"
INPUT_P3="https://www.dropbox.com/s/nq263580fd7hjpb/inputP3_July18th.csv?dl=1"
INPUT_P4="https://www.dropbox.com/s/a0j8syhamoclpa5/inputP4_July18th.csv?dl=1"

xdotool mousemove 2305 422 click 1

sleep .4

./hft_test.sh $INPUT_P1 1 &
./hft_test.sh $INPUT_P2 2 &
./hft_test.sh $INPUT_P3 3 &
./hft_test.sh $INPUT_P4 4 &