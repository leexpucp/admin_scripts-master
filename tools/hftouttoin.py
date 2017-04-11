#!/usr/bin/python
# converts HFT output files into HFT input files so tests can be replayed
# written by Morgan Grant - gramorgan@gmail.com

import sys, csv

USAGE = "usage: ./hftouttoin.py outputfile"

if len(sys.argv) != 2:
	print USAGE
	sys.exit(1)

with open(sys.argv[1], 'rb') as outputcsv:
	outputreader = csv.reader(outputcsv)
	header = outputreader.next()

	num_players = 0

	while header[num_players * 5 + 1] == 'status_p' + str(num_players + 1):
		num_players += 1

	inputstrings = ["" for i in range(num_players)]
	
	last_row = outputreader.next()

	for row in outputreader:
		for player in range(num_players):
			if row[player * 5 + 1] != last_row[player * 5 + 1]:
				inputstrings[player] += row[0] + ',' + row[player * 5 + 1] + '\n'

			if row[player * 5 + 2] != last_row[player * 5 + 2] and row[player * 5 + 2] != "NA":
				inputstrings[player] += row[0] + ',SPREAD,' + row[player * 5 + 2] + '\n'

			if row[player * 5 + 3] != last_row[player * 5 + 3]:
				if row[player * 5 + 3] == "YES":
					inputstrings[player] += row[0] + ",FAST\n"
				else:
					inputstrings[player] += row[0] + ",SLOW\n"

		last_row = row

	for player in range(num_players):
		with open("input_p" + str(player + 1) + ".csv", 'w') as f:
			f.write(inputstrings[player])