#!/usr/bin/env python
import sys
import re

try:
	specs = sys.argv[1].split(',')
	machines = []
	for spec in specs:
		if '-' in spec:
			pair = spec.split('-')
			if len(pair) != 2:
				sys.stderr.write('range requires exactly 2 numbers: %s\n' % (spec,))
				sys.exit(1)
			machines += range(int(pair[0]), int(pair[1])+1)
		elif '13' in spec:
			machines.append(spec)
		else:
			machines.append(int(spec))
except ValueError:
	sys.stderr.write('invalid machine spec: %s\n' % spec)

for i, machine in enumerate(machines):
	if type(machine) == int and machine >= 1 and machine <= 12:
		sys.stdout.write('subjects@192.168.1.1%02.d' % (machine,))
		if i != len(machines) - 1:
			sys.stdout.write(',')
	elif '13' in machine:
		count = int(re.match('13x([0-9]+)', machine).groups()[0])
		for i in range(count):
			sys.stdout.write('leeps@192.168.1.5')
			if i != count-1:
				sys.stdout.write(',')
		if i != len(machines) - 1:
			sys.stdout.write(',')
	else:
		sys.stderr.write('machine %s out of range\n' % (str(machine),))
