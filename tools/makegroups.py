#!/usr/bin/python
# generates random groups for redwood experiments
# yeah this is way overkill but I'm super bored
# written by Morgan Grant - gramorgan@gmail.com

import sys
from random import shuffle

USAGE = "usage: ./makegroups.py num_periods [num_groups [group_size]]"

if "-h" in sys.argv or "--help" in sys.argv:
	print USAGE
	sys.exit(0)

if len(sys.argv) < 2 or len (sys.argv) > 4:
	print USAGE
	sys.exit(1)

group_size = 4
if len(sys.argv) == 4:
	try:
		group_size = int(sys.argv[3])
	except ValueError:
		sys.stderr.write("invalid group size: " + sys.argv[3] + "\ncontinuing with default value " + str(group_size) + '\n')

num_groups = 4
if len(sys.argv) >= 3:
	try:
		num_groups = int(sys.argv[2])
	except ValueError:
		sys.stderr.write("invalid number of groups: " + sys.argv[2] + "\ncontinuing with default value " + str(num_groups) + '\n')

try:
	num_periods = int(sys.argv[1])
except ValueError:
	sys.stderr.write("invalid number of periods: " + sys.argv[1] + '\n')
	sys.exit(1)

for period in range(num_periods):
	players = range(1, group_size * num_groups + 1)
	shuffle(players)

	output = "\"[["

	for group in range(num_groups):
		for player in range(group_size):
			output += str(players.pop())

			if player != group_size - 1:
				output += ","

		if group != num_groups - 1:
			output += "],["

	output += "]]\""
	print output
